package com.huy.springmvc.dictionary.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huy.springmvc.dictionary.beans.Word;
import com.huy.springmvc.dictionary.services.WordService;

@Controller
public class WordController {

    @Autowired
    private WordService wordService;

    @RequestMapping("/test")
    public String getFirstPage() {

        return "login";
    }

    @RequestMapping("/search")
    public String searchWord(@RequestParam(value = "word", required = false) String name, Model model,
            @RequestParam(value = "type", required = false) String type ,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object attribute = session.getAttribute("isAdmin");
        if (attribute != null) {
//            if("admin".equals(String.valueOf(attribute))) {
//                session.setAttribute("isAdmin", true);
//            }else {
//                session.setAttribute("isAdmin", false);
////                model.addAttribute("isAdmin", false);
//            }
            model.addAttribute("listWord", wordService.findByWord(name, type));
            return "lookup";
        }
        return "redirect:/login";
    }

    @RequestMapping("/wordlist")
    public String listWord(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object attribute = session.getAttribute("isAdmin");
        if (attribute != null) {
//            if("admin".equals(String.valueOf(attribute))) {
//                session.setAttribute("isAdmin", true);
//            }else {
//                session.setAttribute("isAdmin", false);
////                model.addAttribute("isAdmin", false);
//            }
            model.addAttribute("listWord", wordService.findAll());
            return "lookup";
        }
        return "redirect:/login";
    }

    @RequestMapping("/edit/{id}")
    public String editWord(@PathVariable int id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object attribute = session.getAttribute("isAdmin");
        if (attribute != null) {
//            if("admin".equals(String.valueOf(attribute))) {
//                session.setAttribute("isAdmin", true);
//            }else {
//                session.setAttribute("isAdmin", false);
////                model.addAttribute("isAdmin", false);
//            }
            Word word = wordService.findById(id);
            model.addAttribute("word", word);
            return "edit";
        }
        return "redirect:/login";
    }

    @RequestMapping("/editWord")
    public String doUpdateCustomer(@ModelAttribute("Word") Word word, Model model) {
        wordService.update(word);
        model.addAttribute("listWord", wordService.findAll());
        return "redirect:/wordlist";
    }

    @RequestMapping("/delete/{id}")
    public String doDeleteCustomer(@PathVariable int id, Model model) {
        wordService.delete(id);
        model.addAttribute("listWord", wordService.findAll());
        return "redirect:/wordlist";
    }

    @RequestMapping("/add-word")
    public String insertWord(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object attribute = session.getAttribute("isAdmin");
        if (attribute != null) {
//            if("admin".equals(String.valueOf(attribute))) {
//                session.setAttribute("isAdmin", true);
//            }else {
//                session.setAttribute("isAdmin", false);
////                model.addAttribute("isAdmin", false);
//            }
            model.addAttribute("word", new Word());
            return "add-word";
        }
        return "redirect:/login";

    }

    @RequestMapping("/addWord")
    public String doInsertWord(@ModelAttribute("Word") Word word, Model model) {
        List<Word> words = wordService.findByWord(word.getWord(), word.getWordtype());
        if (words.isEmpty()) {
            wordService.save(word);
            model.addAttribute("listWord", wordService.findAll());
            return "lookup";
        } else {
            model.addAttribute("message","Word already exists");
            return "redirect:/add-word";
        }

    }
}
