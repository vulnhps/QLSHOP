/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HoaiVu
 */
public class Product {
    private long product_id;
    private long category_id;
    private String product_name;
    private double product_price;
    private String product_img;
    private String product_des;
    
    public Product(){}

    public Product(long product_id, long category_id, String product_name, double product_price, String product_img, String product_des) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_img = product_img;
        this.product_des = product_des;
    }

  

    public long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(long product_id) {
        this.product_id = product_id;
    }

    public long getCategory_id() {
        return category_id;
    }

    public void setCategory_id(long category_id) {
        this.category_id = category_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public String getProduct_img() {
        return product_img;
    }

    public void setProduct_img(String product_img) {
        this.product_img = product_img;
    }

    public String getProduct_des() {
        return product_des;
    }

    public void setProduct_des(String product_des) {
        this.product_des = product_des;
    }
    
    
}
