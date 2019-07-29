package com.huy.springmvc.dictionary.beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity(name = "words")
public class Word {
    private int id;
    private String word;
    private String wordtype;
    private String meaning;

    public Word(String word, String wordtype, String meaning) {
        super();
        this.word = word;
        this.wordtype = wordtype;
        this.meaning = meaning;
    }

    public Word(int id, String word, String wordtype, String meaning) {
        super();
        this.id = id;
        this.word = word;
        this.wordtype = wordtype;
        this.meaning = meaning;
    }
    public Word() {
        // TODO Auto-generated constructor stub
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @NotBlank
    @NotNull
    @Size(max = 30)
    @Column(name = "word", length = 30, unique = true)
    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    @Basic
    @NotNull
    @NotBlank
    @Size(max=30)
    @Column(name = "wordtype", length = 30)
    public String getWordtype() {
        return wordtype;
    }

    public void setWordtype(String wordtype) {
        this.wordtype = wordtype;
    }

    @Basic
    @NotNull
    @NotBlank
    @Size(max = 1000)
    @Column(name = "meaning", length = 1000)
    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

}
