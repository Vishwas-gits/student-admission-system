package com.example.ToDoApp.service;

import org.springframework.data.domain.Pageable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.repo.IToDoRepo;

@Service
public class ToDoService {
	
	@Autowired
	IToDoRepo repo;
	
	public List<ToDo> searchByName(String keyword) {
	    return repo.findByTitleContainingIgnoreCase(keyword);
	}

	public List<ToDo> getAllToDoItems() {
		ArrayList<ToDo> todoList = new ArrayList<>();
		repo.findAll().forEach(todo -> todoList.add(todo));
		
		return todoList;
	}
	
	public ToDo getToDoItemById(Long id) {
		return repo.findById(id).get();
	}
	
	public boolean updateStatus(Long id) {
	    ToDo todo = getToDoItemById(id);
	    
	    // Toggle — Completed ஆ இருந்தா Incomplete, இல்லன்னா Completed
	    if ("Completed".equals(todo.getStatus())) {
	        todo.setStatus("Incomplete");
	    } else {
	        todo.setStatus("Completed");
	    }
	    
	    return saveOrUpdateToDoItem(todo);
	}
	
	public boolean saveOrUpdateToDoItem(ToDo todo) {
		ToDo updatedObj = repo.save(todo);
		
		if (getToDoItemById(updatedObj.getId()) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean deleteToDoItem(Long id) {
		repo.deleteById(id);
		
		if (repo.findById(id).isEmpty()) {
			return true;
		}
		
		return false;
	}
	
	public Page<ToDo> getPaginatedItems(String keyword, int page, int size) {
	    Pageable pageable = PageRequest.of(page, size);
	    if (keyword == null || keyword.isEmpty()) {
	        return repo.findAll(pageable);
	    }
	    return repo.findByTitleContainingIgnoreCase(keyword, pageable);
	}
	
}
