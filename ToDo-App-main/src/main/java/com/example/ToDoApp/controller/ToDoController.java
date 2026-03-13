package com.example.ToDoApp.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;
import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.service.ToDoService;




@Controller
public class ToDoController {

	@Autowired
	private ToDoService service;

	@GetMapping({"/", "viewToDoList"})
	public String viewAllToDoItems(Model model,
	        @ModelAttribute("message") String message,
	        HttpSession session,
	        @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
	        @RequestParam(value = "page", required = false, defaultValue = "0") int page) {

	    if (session.getAttribute("loggedInUser") == null) {
	        return "redirect:/login";
	    }

	    int size = 10; // 10 records per page
	    Page<ToDo> pageResult = service.getPaginatedItems(keyword, page, size);
	    List<ToDo> list = pageResult.getContent();

	 // Full DB count — page relate இல்ல!
	    List<ToDo> allItems = service.getAllToDoItems();

	    long totalStudents = allItems.size();
	    long completed = allItems.stream()
	        .filter(t -> "Completed".equals(t.getStatus())).count();
	    long incomplete = allItems.stream()
	        .filter(t -> "Incomplete".equals(t.getStatus())).count();

	    model.addAttribute("list", list);
	    model.addAttribute("totalStudents", totalStudents);
	    model.addAttribute("completed", completed);
	    model.addAttribute("incomplete", incomplete);
	    model.addAttribute("message", message);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", pageResult.getTotalPages());

	    return "ViewToDoList";
	}
	
	

	@GetMapping("/updateToDoStatus/{id}")
	public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		
		if (service.updateStatus(id)) {
			redirectAttributes.addFlashAttribute("message", "Update Success");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Update Failure");
		return "redirect:/viewToDoList";
	}

	@GetMapping("/addToDoItem")
	public String addToDoItem(Model model) {
		model.addAttribute("todo", new ToDo());
		
		return "AddToDoItem";
	}

	@PostMapping("/saveToDoItem")
	public String saveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Save Success");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Save Failure");
		return "redirect:/addToDoItem";
	}
	
	@GetMapping("/editToDoItem/{id}")
	public String editToDoItem(@PathVariable Long id, Model model) {
		model.addAttribute("todo", service.getToDoItemById(id));
		
		return "EditToDoItem";
	}

	@PostMapping("/editSaveToDoItem")
	public String editSaveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Edit Success");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Edit Failure");
		return "redirect:/editToDoItem/" + todo.getId();
	}
	
	@GetMapping("/deleteToDoItem/{id}")
	public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (service.deleteToDoItem(id)) {
			redirectAttributes.addFlashAttribute("message", "Delete Success");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Delete Failure");
		return "redirect:/viewToDoList";
	}
	
	@GetMapping("/exportPDF")
	public void exportPDF(HttpServletResponse response, HttpSession session) throws Exception {

	    if (session.getAttribute("loggedInUser") == null) {
	        response.sendRedirect("/login");
	        return;
	    }

	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition",
	        "attachment; filename=StudentAdmissionReport.pdf");

	    List<ToDo> list = service.getAllToDoItems();

	    Document document = new Document(PageSize.A4.rotate());
	    PdfWriter.getInstance(document, response.getOutputStream());
	    document.open();

	    // ===== TITLE =====
	    Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD,
	        new BaseColor(13, 31, 60));
	    Paragraph title = new Paragraph("Student Admission Report", titleFont);
	    title.setAlignment(Element.ALIGN_CENTER);
	    title.setSpacingAfter(8);
	    document.add(title);

	    // ===== DATE =====
	    Font dateFont = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL,
	        new BaseColor(107, 122, 153));
	    Paragraph date = new Paragraph("Generated on: " +
	        java.time.LocalDate.now().toString(), dateFont);
	    date.setAlignment(Element.ALIGN_CENTER);
	    date.setSpacingAfter(20);
	    document.add(date);

	    // ===== TABLE — 8 columns =====
	    PdfPTable table = new PdfPTable(8);
	    table.setWidthPercentage(100);
	    table.setWidths(new float[]{1f, 2.5f, 1.8f, 1.5f, 2.5f, 1.8f, 3f, 1.8f});
	    table.setSpacingBefore(10);

	    Font headerFont = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD,
	        BaseColor.WHITE);
	    BaseColor headerBg = new BaseColor(13, 31, 60);

	    // Headers
	    String[] headers = {
	        "Adm. No", "Student Name", "Date of Birth",
	        "Gender", "Course", "Joining Date", "Address", "Status"
	    };
	    for (String h : headers) {
	        PdfPCell cell = new PdfPCell(new Phrase(h, headerFont));
	        cell.setBackgroundColor(headerBg);
	        cell.setPadding(8);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell.setBorderColor(new BaseColor(200, 151, 58));
	        table.addCell(cell);
	    }

	    // Row fonts
	    Font rowFont = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL,
	        new BaseColor(13, 31, 60));
	    BaseColor evenBg = new BaseColor(238, 241, 251);
	    BaseColor completedColor = new BaseColor(29, 122, 95);
	    BaseColor incompleteColor = new BaseColor(168, 48, 42);

	    int i = 0;
	    for (ToDo todo : list) {
	        BaseColor rowBg = (i % 2 == 0) ? BaseColor.WHITE : evenBg;

	        // Adm No
	        PdfPCell idCell = new PdfPCell(
	            new Phrase(String.valueOf(todo.getId()), rowFont));
	        idCell.setBackgroundColor(rowBg);
	        idCell.setPadding(7);
	        idCell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(idCell);

	        // Name
	        PdfPCell nameCell = new PdfPCell(
	            new Phrase(todo.getTitle() != null ? todo.getTitle() : "", rowFont));
	        nameCell.setBackgroundColor(rowBg);
	        nameCell.setPadding(7);
	        table.addCell(nameCell);

	        // DOB
	        PdfPCell dobCell = new PdfPCell(
	            new Phrase(todo.getDob() != null ? todo.getDob().toString() : "-", rowFont));
	        dobCell.setBackgroundColor(rowBg);
	        dobCell.setPadding(7);
	        dobCell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(dobCell);

	        // Gender
	        PdfPCell genderCell = new PdfPCell(
	            new Phrase(todo.getGender() != null ? todo.getGender() : "-", rowFont));
	        genderCell.setBackgroundColor(rowBg);
	        genderCell.setPadding(7);
	        genderCell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(genderCell);

	        // Course
	        PdfPCell courseCell = new PdfPCell(
	            new Phrase(todo.getCourse() != null ? todo.getCourse() : "-", rowFont));
	        courseCell.setBackgroundColor(rowBg);
	        courseCell.setPadding(7);
	        table.addCell(courseCell);

	        // Joining Date
	        PdfPCell dateCell = new PdfPCell(
	            new Phrase(todo.getDate() != null ?
	                todo.getDate().toString().substring(0, 10) : "-", rowFont));
	        dateCell.setBackgroundColor(rowBg);
	        dateCell.setPadding(7);
	        dateCell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(dateCell);

	        // Address
	        PdfPCell addressCell = new PdfPCell(
	            new Phrase(todo.getAddress() != null ? todo.getAddress() : "-", rowFont));
	        addressCell.setBackgroundColor(rowBg);
	        addressCell.setPadding(7);
	        table.addCell(addressCell);

	        // Status
	        boolean isCompleted = "Completed".equals(todo.getStatus());
	        Font statusFont = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD,
	            isCompleted ? completedColor : incompleteColor);
	        PdfPCell statusCell = new PdfPCell(
	            new Phrase(todo.getStatus() != null ? todo.getStatus() : "-", statusFont));
	        statusCell.setBackgroundColor(rowBg);
	        statusCell.setPadding(7);
	        statusCell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(statusCell);

	        i++;
	    }

	    document.add(table);

	    // ===== SUMMARY =====
	    long completed = list.stream()
	        .filter(t -> "Completed".equals(t.getStatus())).count();
	    long incomplete = list.size() - completed;

	    Font summaryFont = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD,
	        new BaseColor(13, 31, 60));
	    Paragraph summary = new Paragraph(
	        "\nTotal: " + list.size() +
	        "   |   Completed: " + completed +
	        "   |   Incomplete: " + incomplete, summaryFont);
	    summary.setAlignment(Element.ALIGN_RIGHT);
	    summary.setSpacingBefore(16);
	    document.add(summary);

	    document.close();
	}
}