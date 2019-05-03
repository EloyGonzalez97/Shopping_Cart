/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.service;

import com.cart.demo.model.Product;
import java.util.List;

public interface ProductService {
    
    Product findById(Long id);
    List<Product> findAll();
    List<Product> findAllByUsername(String name);
    void editProduct(Long id, Product temp);
    void save(Product product);
    void delete(Product product);
}
