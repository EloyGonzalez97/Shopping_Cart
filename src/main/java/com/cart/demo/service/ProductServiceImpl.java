/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.service;

import com.cart.demo.model.Product;
import com.cart.demo.repository.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductRepository productRepository;
    
    @Override
    public Product findById(Long id){
        if(productRepository.findById(id).isPresent()){
            return productRepository.findById(id).get();
        }else{
            return null;
        }
    }
    @Override
    public List<Product> findAll(){
        Iterable<Product> it = productRepository.findAll();
        List<Product> p = new ArrayList<>();
        if(it!=null){
            for(Product prod: it){
                p.add(prod);
            }
        }
        return p;
    }
    @Override
    public void editProduct(Long id, Product temp){
        Product p = findById(id);
        p.setName(temp.getName());
        p.setPrice(temp.getPrice());
        p.setQuantity(temp.getQuantity());
        productRepository.save(p);
    }
    @Override
    public List<Product> findAllByUsername(String name){
        List<Product> p = findAll();
        List<Product> fin = new ArrayList<>();
        p.stream().filter((prod) -> (Objects.equals(prod.getUser().getUsername(), name))).forEach((prod) -> {
            fin.add(prod);
        });
        return fin;
    }
    @Override
    public void save(Product product){
        productRepository.save(product);
    }
    @Override
    public void delete(Product product){
        productRepository.delete(product);
    }
}
