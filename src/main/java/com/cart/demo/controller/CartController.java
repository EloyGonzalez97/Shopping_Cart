/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.controller;

import com.cart.demo.model.Product;
import com.cart.demo.service.CartService;
import com.cart.demo.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private ProductService productService;
    
    private double subtotal = 0;
    
    private int[] quantities;
    
    @GetMapping("/{name}/cart")
    public String getCart(Model model, @PathVariable (value = "name") String name){
        subtotal = 0;
        model.addAttribute("cart", cartService.getCart(name));
        return "cart";
    }
    @PostMapping("/{name}/cart/{id}")
    public String deleteProductInCart(Model model, @PathVariable (value = "name") String name, @PathVariable Long id){
        cartService.deleteProduct(name, productService.findById(id));
        return "redirect:/{name}/cart";
    }
    @PostMapping("/{name}/cart")
    @ResponseBody
    public String getQuantities(Model model, @RequestBody int[] listQ, @PathVariable (value = "name") String name){
        List<Product> product = cartService.getCart(name).getProducts();
        quantities = listQ.clone();
        for(int i = 0; i < listQ.length; i++){
            subtotal += listQ[i] * product.get(i).getPrice();
        }
        model.addAttribute("subtotal", subtotal);
        return "redirect:/{name}/checkout";
    }
    @GetMapping("/{name}/checkout")
    public String getCheckout(Model model, @PathVariable (value = "name") String name){
       
        if(subtotal == 0){
            return "redirect:/{name}/cart";
        }
        model.addAttribute("subtotal", subtotal);
        return "checkout";
    }
    @PostMapping("/{name}/checkout")
    public String finishCheckout(Model model, @PathVariable (value = "name") String name){
        subtotal = 0;
        cartService.emptyCart(name, quantities);
        return "redirect:/{name}/cart";
    }
}
