package com.mycompany.shopify.dao;

import com.mycompany.shopify.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getEmailAndPassword(String email,String password){
        User user = null;
        
        
        try{
            
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p", password);
            
            user = (User) q.uniqueResult();
            
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
}
