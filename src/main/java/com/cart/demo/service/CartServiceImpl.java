/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.service;

import com.cart.demo.model.*;
import com.cart.demo.repository.CartRepository;
import com.cart.demo.repository.UserRepository;
import java.lang.String;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author olive
 */
@Service
public class CartServiceImpl implements CartService{
   
   
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private CartRepository cartRepository;
    
    @Override
    public Cart getCart(String name){
        Cart c = userRepository.findByUsername(name).getCart();
        if (c == null){
            c = new Cart();
            User u = userRepository.findByUsername(name);
            c.setProducts(new ArrayList<>());
            c.setUser(u);
            cartRepository.save(c);
            u.setCart(c);
            userRepository.save(u);
        }
        return c;
    }
    @Override
    public void deleteProduct(String name, Product p){
        Cart c = getCart(name);
        List<Product> products = c.getProducts();
        products.remove(p);
        c.setProducts(products);
        cartRepository.save(c);
    }
    @Override
    public void addProduct(String name, Product p){
        Cart c = getCart(name);
        c = cartRepository.findById(c.getId()).get();
        List<Product> products = c.getProducts();
        products.add(p);
        c.setProducts(products);
        cartRepository.save(c);
    }
    @Override
    public void emptyCart(String name, int[] quantities){
        Cart c = getCart(name);
        List<Product> products = c.getProducts();
        for(int i = 0; i < products.size(); i++){
            int tempQ = products.get(i).getQuantity();
            products.get(i).setQuantity(tempQ-quantities[i]);
        }
        c.setProducts(new ArrayList<>());
        cartRepository.save(c);
    }
}
