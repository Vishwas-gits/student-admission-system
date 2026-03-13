package com.example.ToDoApp.repo;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;


import com.example.ToDoApp.model.ToDo;

@Repository
public interface IToDoRepo extends JpaRepository<ToDo, Long>{
	
	 List<ToDo> findByTitleContainingIgnoreCase(String keyword);
	 
	 Page<ToDo> findByTitleContainingIgnoreCase(String keyword, Pageable pageable);

}
