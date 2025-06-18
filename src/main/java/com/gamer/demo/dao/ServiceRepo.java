package com.gamer.demo.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import com.gamer.demo.model.Service;

public interface ServiceRepo extends JpaRepository<Service, String>{
	Service findByGame(String game);
	}