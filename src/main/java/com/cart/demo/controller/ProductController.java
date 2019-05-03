/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.controller;

import com.cart.demo.model.Product;
import com.cart.demo.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private UserService userService;
    
    private boolean error = false;
    
    @PostMapping("/products/{name}/{id}")
    public String addProduct(@PathVariable (value = "name") String name, @PathVariable Long id, String error) {
        
        Product p = productService.findById(id);
        List<Product> products = cartService.getCart(name).getProducts();
        if(p.getQuantity() == 0){
            this.error = true;
            return "redirect:/products/{id}";
        }
        if(products.contains(p)){
            return "redirect:/{name}/cart";
        }
        
        cartService.addProduct(name, productService.findById(id));
        return "redirect:/{name}/cart";
    }
    @GetMapping("/products")
    public String products(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);

        return "products";
    }
    @GetMapping("/products/{id}")
    public String getProduct(Model model, @PathVariable Long id) {
        Product p = productService.findById(id);
        model.addAttribute("product", p);
        if(this.error == true){
            model.addAttribute("error", "Out of stock.");
            this.error = false;
        }
        return "product";
    }
    @GetMapping("/{name}/manage")
    public String manageProducts(Model model, @PathVariable (value = "name") String name) {
        List<Product> products = productService.findAllByUsername(name);
        model.addAttribute("products", products);

        return "manage";
    }
    @GetMapping("/{name}/manage/{id}")
    public String manageProduct(Model model,@PathVariable (value = "name") String name, @PathVariable Long id) {
        Product p = productService.findById(id);
        model.addAttribute("product", p);
        return "manageProduct";
    }
    @PostMapping("/{name}/manage/{id}")
    public String deleteProduct(Model model, @PathVariable (value = "name") String name,  @PathVariable Long id) {
        productService.delete(productService.findById(id));
        List<Product> products = productService.findAllByUsername(name);
        model.addAttribute("products", products);
        return "redirect:/{name}/manage";
    }
    @GetMapping("/{name}/create")
    public String createProduct(Model model){
        model.addAttribute("productForm", new Product());
        return "createProduct";
    }
    @PostMapping("/{name}/create")
    public String create(@ModelAttribute("productForm") Product productForm, @PathVariable (value = "name") String name) {
        if(productForm.getName().isEmpty() || productForm.getPrice() == 0){
            return "createProduct";
        }
        productForm.setUser(userService.findByUsername(name));
        productService.save(productForm);
        return "redirect:/{name}/manage";
    }
}
