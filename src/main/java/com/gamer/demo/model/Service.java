package com.gamer.demo.model;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Service {
	@Id
	private String game;
	private String genre;
	private String price;
	private String publisher;
	private String filename;
	
	
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	@Override
	public String toString() {
		return "service [game=" + game + ", genre=" + genre + ", price=" + price + ", publisher=" + publisher
				+ ", filename=" + filename + "]";
	}
}
