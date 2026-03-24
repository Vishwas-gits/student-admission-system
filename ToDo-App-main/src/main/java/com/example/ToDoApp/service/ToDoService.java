package com.example.ToDoApp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ToDoApp.model.ToDo;

@Service
public class ToDoService {

    // 🔥 Dummy data (no DB)
    private List<ToDo> todoList = new ArrayList<>();

    // 🔍 Search
    public List<ToDo> searchByName(String keyword) {
        return new ArrayList<>();
    }

    // 📋 Get all
    public List<ToDo> getAllToDoItems() {
        return todoList;
    }

    // 🔎 Get by ID
    public ToDo getToDoItemById(Long id) {
        return null;
    }

    // 🔄 Update status
    public boolean updateStatus(Long id) {
        return false;
    }

    // 💾 Save / Update
    public boolean saveOrUpdateToDoItem(ToDo todo) {
        todoList.add(todo);
        return true;
    }

    // ❌ Delete
    public boolean deleteToDoItem(Long id) {
        return false;
    }

    // 📄 Pagination (dummy)
    public List<ToDo> getPaginatedItems(String keyword, int page, int size) {
        return new ArrayList<>();
    }
}
