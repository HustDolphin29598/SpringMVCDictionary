package com.huy.springmvc.dictionary.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huy.springmvc.dictionary.beans.User;
import com.huy.springmvc.dictionary.repositories.UserRepository;

@Service
@Transactional
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    //0 is user
    //1 is admin
    //-1 not found
    public int checkAuth(String userName, String pwd) {
        List<User> users = userRepository.findUserByName(userName);
        if(!users.isEmpty()) {
            if(users.get(0).getPassword().equals(pwd)) {
                if(users.get(0).isAdmin()) return 1;
                else return 0;
            }
        }
        return -1;
    }
}
