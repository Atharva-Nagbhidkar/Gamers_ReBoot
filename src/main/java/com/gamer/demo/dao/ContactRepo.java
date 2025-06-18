package com.gamer.demo.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import com.gamer.demo.model.Contact;

public interface ContactRepo extends JpaRepository<Contact, Long>{}
