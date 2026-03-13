package com.example.ToDoApp.controller;

import jakarta.servlet.http.HttpSession;

import com.example.ToDoApp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ToDoApp.repo.IUserRepo;

@Controller
public class LoginController {
	
	  @Autowired
	  private IUserRepo userRepo; 

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

    	  User user = userRepo.findByUsername(username);

          if (user != null && user.getPassword().equals(password)) {
              session.setAttribute("loggedInUser", username);
              return "redirect:/viewToDoList";
          } else {
              model.addAttribute("error", "Invalid Username or Password!");
              return "login";
          }
      }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", 
            "Logged out successfully!");
        return "login";
    }
}
