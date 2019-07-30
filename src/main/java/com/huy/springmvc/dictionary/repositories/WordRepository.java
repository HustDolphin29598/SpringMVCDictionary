package com.huy.springmvc.dictionary.repositories;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huy.springmvc.dictionary.beans.Word;

@Repository(value = "wordRepository")
public class WordRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(final Word word) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(word);
    }

    public void update(final Word word) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(word);
    }

    public Word findById(final int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Word.class, id);
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<Word> findByWord(final String word, String type) {
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("FROM words as w where w.word like concat(:word,'%') and w.wordtype like :type");
            query.setParameter("word", word);
            query.setParameter("type", type);
            List<Word> words = query.getResultList();
            session.close();
            return words;
    }

    public void delete(final Word word) {
        Session session = this.sessionFactory.getCurrentSession();
        session.remove(word);
    }

    public List<Word> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM words", Word.class).getResultList();
    }
}
