package com.huy.springmvc.dictionary.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huy.springmvc.dictionary.beans.User;
import com.huy.springmvc.dictionary.services.UserService;

@Controller
public class UserController {
    
    @Autowired
    private UserService userService;
    
    
    @RequestMapping("/")
    public String getFirstPage() {
        
        return "redirect:login";
    }
    
    @GetMapping("/login")
    public String getLogin(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }
    
    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int result = userService.checkAuth(user.getUsername(), user.getPassword());
        if(result != -1) {
            if(result == 0) {
                session.setAttribute("isAdmin", false);
                return "lookup";
            } else {
                session.setAttribute("isAdmin", true);
                return "lookup";
            }
        } else {
            model.addAttribute("message", "Invalid username or password");
            return "login";
        }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        System.out.println("tweeeeeeee");
        HttpSession session = request.getSession();
        session.removeAttribute("isAdmin");
        return "redirect:/login";
    }
}
