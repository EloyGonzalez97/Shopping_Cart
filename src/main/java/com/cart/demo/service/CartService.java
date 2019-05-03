/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart.demo.service;

import com.cart.demo.model.*;
import java.lang.String;


public interface CartService {
    Cart getCart(String name);
    void deleteProduct(String name, Product p);
    void addProduct(String name, Product p);
    void emptyCart(String name, int[] quantities);
}
