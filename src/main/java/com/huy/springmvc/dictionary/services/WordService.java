package com.huy.springmvc.dictionary.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huy.springmvc.dictionary.beans.Word;
import com.huy.springmvc.dictionary.repositories.WordRepository;

@Service
@Transactional
public class WordService {

    @Autowired
    private WordRepository wordRepository;

    public List<Word> findAll() {
        return wordRepository.findAll();
    }

    public void save(final Word word) {
        wordRepository.save(word);
    }

    public void update(final Word word) {
        wordRepository.update(word);
    }

    public Word findById(final int id) {
        return wordRepository.findById(id);
    }

    public List<Word> findByWord(final String word) {
        return wordRepository.findByWord(word);
    }

    public void delete(final int id) {
        Word word = wordRepository.findById(id);
        if (word != null)
            wordRepository.delete(word);
    }
}
