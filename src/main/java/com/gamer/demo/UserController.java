package com.gamer.demo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.gamer.demo.dao.CartRepo;
import com.gamer.demo.dao.ContactRepo;
import com.gamer.demo.dao.ServiceRepo;
import com.gamer.demo.dao.UserRepo;
import com.gamer.demo.jwt.JwtUtil;
import com.gamer.demo.model.Cart;
import com.gamer.demo.model.Contact;
import com.gamer.demo.model.Service;
import com.gamer.demo.model.Users;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.ui.Model;


@Controller
public class UserController {
	@Autowired
	ContactRepo contactrepo;
	@Autowired
	ServiceRepo servicerepo;
	@Autowired
	UserRepo userrepo;
	@Autowired
	CartRepo cartrepo;
	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private JwtUtil jwtUtil;


	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("Home.jsp");
		List<Service> service = servicerepo.findAll();
		mv.addObject("service", service);
		return mv;
	}
	
	
	@GetMapping("/about")
	public String about() {
		return "About.jsp";
	}
	
	
	@GetMapping("/store")
	public ModelAndView store(HttpSession session) {
	    ModelAndView mv = new ModelAndView("Store.jsp");
	    List<Service> service = servicerepo.findAll();
	    mv.addObject("service", service);
	    return mv;
	}

	
	@GetMapping("/cart")
	public String getCart(Model model, HttpSession session) {
	    String username = (String) session.getAttribute("username");

	    List<Cart> items = cartrepo.findByUsername(username);
	    model.addAttribute("cart", items);

	    double total = items.stream()
	        .mapToDouble(item -> {
	            try {
	                String price = item.getPrice();
	                return (price != null) ? Double.parseDouble(price.replaceAll("[^\\d.]", "")) : 0.0;
	            } catch (NumberFormatException e) {
	                return 0.0;
	            }
	        })
	        .sum();
	    model.addAttribute("totalPrice", total);

	    return "Cart.jsp";
	}

	
	@PostMapping("/cartedit")
	public String addToCart(@RequestParam String game, HttpSession session, RedirectAttributes redirectAttributes) {
		String token = (String) session.getAttribute("jwtToken");
		String username = (String) session.getAttribute("username");
	    Service selectedGame = servicerepo.findByGame(game);

	    if (token != null && jwtUtil.validateToken(token)) {
	        String email = jwtUtil.extractEmail(token);
	        Users loggedInUser = userrepo.findByEmail(email);

	        if (loggedInUser != null) {
	        	Cart existing = cartrepo.findByUsernameAndGame(username, selectedGame.getGame());

	            if (existing != null) {
	                redirectAttributes.addFlashAttribute("toastMessage", "Game already in cart");
	                return "redirect:/cart";
	            }
			    
			    Cart item = new Cart();
			    item.setUsername(username);
			    item.setGame(selectedGame.getGame());
			    item.setGenre(selectedGame.getGenre());
			    item.setPrice(selectedGame.getPrice());
			    item.setPublisher(selectedGame.getPublisher());
			    item.setFilename(selectedGame.getFilename());
		
			    cartrepo.save(item);
			    redirectAttributes.addFlashAttribute("toastMessage", "Game added to cart");
			    return "redirect:/cart";
	        }
	    }
	    redirectAttributes.addFlashAttribute("toastMessage", "You need to login to buy games");
	    return "redirect:/login";
	}

	
	@Transactional
	@GetMapping("/cartdelete")
	public String deleteCartItem(@RequestParam Long id, HttpSession session, RedirectAttributes redirectAttributes) {
	    String username = (String) session.getAttribute("username");
	    Cart cart = cartrepo.findById(id).orElse(null);

	    if (cart != null && cart.getUsername().equals(username)) {
	        cartrepo.deleteById(id);
	        redirectAttributes.addFlashAttribute("toastMessage", "Game removed from cart");
	    }
	    return "redirect:/cart";
	}
	
	
	@GetMapping("/payment")
	public String getPayement(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
	    String token = (String) session.getAttribute("jwtToken");
	    String username = (String) session.getAttribute("username");

	    List<Cart> items = cartrepo.findByUsername(username);

	    double total = items.stream()
	        .mapToDouble(item -> {
	            try {
	                String price = item.getPrice();
	                return (price != null) ? Double.parseDouble(price.replaceAll("[^\\d.]", "")) : 0.0;
	            } catch (NumberFormatException e) {
	                return 0.0;
	            }
	        })
	        .sum();
	    
	    if (token != null && jwtUtil.validateToken(token)) {
	        String email = jwtUtil.extractEmail(token);
	        Users loggedInUser = userrepo.findByEmail(email);

	        if (loggedInUser != null) {
			    model.addAttribute("totalPrice", total);
			    return "Payment.jsp";
	        }
	    }
	    redirectAttributes.addFlashAttribute("toastMessage", "You need to login first");
	    return "redirect:/login";
	}
	@Transactional
	@PostMapping("/payment")
	public String processPayment(@RequestParam String cardNumber, @RequestParam String cardName, @RequestParam String expiry, @RequestParam String cvv, HttpSession session, RedirectAttributes redirectAttributes) {
	    if (cardNumber.equals("4242424242424242") && cvv.equals("257")) {
	        String username = (String) session.getAttribute("username");
	        cartrepo.deleteByUsername(username);
	        return "redirect:/thankyou";
	    }

	    redirectAttributes.addFlashAttribute("toastMessage", "Payment Failed. Invalid card details");
	    return "redirect:/payment";
	}
	
	
	@GetMapping("/contact")
	public String getContact() {
		return "Contact.jsp";
	}
	@PostMapping("/contact")
	public String processContact(Contact contact, HttpSession session, RedirectAttributes redirectAttributes) {
	    String token = (String) session.getAttribute("jwtToken");

	    if (token != null && jwtUtil.validateToken(token)) {
	        String email = jwtUtil.extractEmail(token);
	        Users loggedInUser = userrepo.findByEmail(email);

	        if (loggedInUser != null) {
	            session.setAttribute("loggedInUser", loggedInUser);

	            contact.setEmail(loggedInUser.getEmail());
	            contactrepo.save(contact);
	            redirectAttributes.addFlashAttribute("toastMessage", "Message sent");
	            return "redirect:/contact";
	        }
	    }
	    redirectAttributes.addFlashAttribute("toastMessage", "You need to login to send message");
	    return "redirect:/login";
	}
	
	
	@GetMapping("/register")
    public String getRegistrationForm(Model model) {
        model.addAttribute("user", new Users()); 
        return "Register.jsp";
    }
    @PostMapping("/register")
    public String processRegistration(@ModelAttribute Users user, RedirectAttributes redirectAttributes) {
        user.setIsadmin("False");
        String encryptedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encryptedPassword);
        userrepo.save(user);
        redirectAttributes.addFlashAttribute("toastMessage", "Successfully registered");
        return "redirect:/login";
    }
    
    
	@GetMapping("/login")
	public String getLogin() {
		return "Login.jsp";
	}
	@PostMapping("/login")
	public String processLogin(@RequestParam String email, @RequestParam String password, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
	    Users user = userrepo.findByEmail(email);

	    if (user != null && passwordEncoder.matches(password, user.getPassword())) {
	        String jwtToken = jwtUtil.generateToken(email);
	        session.setAttribute("jwtToken", jwtToken);
	        session.setAttribute("loggedInUser", user);
	        session.setAttribute("username", user.getUsername());
	        redirectAttributes.addFlashAttribute("toastMessage", "Login successful");
	        return "redirect:/";
	    } 
	    
	    else {
	        redirectAttributes.addFlashAttribute("toastMessage", "Incorrect Username or Password");
	        return "redirect:/login";
	    }
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
	    session.invalidate();
	    redirectAttributes.addFlashAttribute("toastMessage", "Logout successful");
	    return "redirect:/";
	}
	
    	
	@GetMapping("/admin")
	public String adminAccess(HttpSession session) {
	    String token = (String) session.getAttribute("jwtToken");
	    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }

	    else if ("true".equalsIgnoreCase(loggedInUser.getIsadmin())) {
	        return "Admin.jsp";
	    } 
	    
	    else {
	        return "Access.jsp";
	    }
	}

	
	@GetMapping("/adminuser")
	public String adminUsers(HttpSession session, Model model) {
	    String token = (String) session.getAttribute("jwtToken");
	    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }

	    else if ("true".equalsIgnoreCase(loggedInUser.getIsadmin())) {
	        List<Users> allUsers = userrepo.findAll();
	        model.addAttribute("users", allUsers);
	        return "AdminUsers.jsp";
	    } 
	    
	    else {
	        return "Access.jsp";
	    }
	}

	
	@GetMapping("/adminedit")
	public String editUser(@RequestParam String email, HttpSession session, Model model) {
	    String token = (String) session.getAttribute("jwtToken");
	    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }

	    else if ("true".equalsIgnoreCase(loggedInUser.getIsadmin())) {
	        Users user = userrepo.findByEmail(email);
	        model.addAttribute("user", user);
	        return "AdminUpdate.jsp";
	    } 
	    
	    else {
	        return "Access.jsp";
	    }
	}
	
	
	@PostMapping("/adminupdate")
	public String updateUser(@ModelAttribute Users updatedUser, HttpSession session, RedirectAttributes redirectAttributes) {
		String token = (String) session.getAttribute("jwtToken");
		Users loggedInUser = (Users) session.getAttribute("loggedInUser");
		Users existingUser = userrepo.findByEmail(updatedUser.getEmail());

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }
	    
	    else if (existingUser != null) {
	        existingUser.setUsername(updatedUser.getUsername());
	        existingUser.setPhone(updatedUser.getPhone());
	        userrepo.save(existingUser);
	    }
	    redirectAttributes.addFlashAttribute("toastMessage", "User updated");
	    return "redirect:/adminuser";
	}
	
	
	@Transactional
	@GetMapping("/admindelete")
	public String deleteUser(@RequestParam String email, HttpSession session, RedirectAttributes redirectAttributes) {
		String token = (String) session.getAttribute("jwtToken");
		Users loggedInUser = (Users) session.getAttribute("loggedInUser");
		
		if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }
		userrepo.deleteByEmail(email);
	    redirectAttributes.addFlashAttribute("toastMessage", "User deleted");
	    return "redirect:/adminuser";
	}
	
	
	@GetMapping("/admincontact")
	public String editContact(HttpSession session, Model model) {
		String token = (String) session.getAttribute("jwtToken");
	    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }

	    if ("true".equals(loggedInUser.getIsadmin())){
	    	List<Contact> contactList = contactrepo.findAll();
	        model.addAttribute("contact", contactList);
	        return "AdminContact.jsp";
	    } 
	    else {
	        return "Access.jsp";
	    }
	}
	    
    
	@Transactional
	@GetMapping("/contactdelete")
	public String deleteContact(@RequestParam Long id, HttpSession session, RedirectAttributes redirectAttributes) {
		String token = (String) session.getAttribute("jwtToken");
	    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	    if (token == null || !jwtUtil.validateToken(token) || loggedInUser == null) {
	        return "Access.jsp";
	    }
		contactrepo.deleteById(id);
	    redirectAttributes.addFlashAttribute("toastMessage", "Message deleted");
	    return "redirect:/admincontact";
	}
	
	
	@GetMapping("/*")
			public String Error() {
		return "Error.jsp";
	}
	
	
	@GetMapping("/thankyou")
	public String thankyou() {
		return "Thankyou.jsp";
	}
	
	
	@GetMapping("/access")
	public String access() {
		return "Access.jsp";
	}
}
