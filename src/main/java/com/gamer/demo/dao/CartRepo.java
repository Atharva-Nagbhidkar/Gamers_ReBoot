package com.gamer.demo.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.gamer.demo.model.Cart;

public interface CartRepo extends JpaRepository<Cart, Long>{
	void deleteByUsername(String username);
	List<Cart> findByUsername(String username);
	Cart findByUsernameAndGame(String username, String game);
	}
