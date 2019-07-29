package com.huy.springmvc.dictionary.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    @RequestMapping("/search/{name}")
    public String searchWord(@PathVariable String name, Model model) {
        model.addAttribute("listWord", wordService.findByWord(name));
        return "lookup";
    }
    
    @RequestMapping("/wordlist")
    public String listWord(Model model) {
        model.addAttribute("listWord", wordService.findAll());
        return "lookup";
    }
    
//    @RequestMapping("/edit/{word}")
//    public String editWord(@PathVariable String name, Model model) {
//        Word word  = wordService.findByWord(name);
//        model.addAttribute("word", word);
//        return "edit";
//    }
    
    @RequestMapping("/delete/{id}")
    public String doDeleteCustomer(@PathVariable int id, Model model) {
      wordService.delete(id);
      model.addAttribute("listWord", wordService.findAll());
      return "lookup";
    }
    
    @RequestMapping("/add-word")
    public String insertWord(Model model) {
        model.addAttribute("word", new Word());
        return "add-word";
    }
    
    @RequestMapping("/addWord")
    public String doInsertWord(@ModelAttribute("Word") Word word, Model model) {
        wordService.save(word);
        model.addAttribute("listWord", wordService.findAll());
        return "lookup";
    }
}
