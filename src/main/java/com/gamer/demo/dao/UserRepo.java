package com.gamer.demo.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import com.gamer.demo.model.Users;

public interface UserRepo extends JpaRepository<Users, String>{
	void deleteByEmail(String email);
	Users findByEmail(String email);
	Users getUserByEmail(String email);
}