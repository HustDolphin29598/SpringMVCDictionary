package com.huy.springmvc.dictionary.repositories;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.huy.springmvc.dictionary.beans.User;

@Repository(value = "userRepository")
@Component
public class UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public List<User> findUserByName(String name) {
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("FROM users as u where u.username = :name ");
        query.setParameter("name", name);
        List<User> users = query.getResultList();
        session.close();
        return users;
    }
}
