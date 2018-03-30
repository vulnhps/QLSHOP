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
public class Cart {
    private HashMap<Long , Item> cartItems;
    private long cartID;
    public Cart(){
    cartItems = new HashMap<>();
    cartID = System.currentTimeMillis();
    }

    public Cart(HashMap<Long, Item> cartItems , long cartID) {
        this.cartItems = cartItems;
        this.cartID = cartID;
    }

    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }
    

    
    // phương thức thêm sản phẩm vào giỏ hàng
    public void addSanPham(Long key , Item item){
        boolean bln = cartItems.containsKey(key);
        if(bln){
            int sl = item.getQuantity();
            item.setQuantity(sl += 1);
            cartItems.put(key, item);
        }else{
            cartItems.put(key, item);
        }
    }

    
    public void subSP(Long key , Item item) {
         boolean check = cartItems.containsKey(key);
        if(check){
            
            int sl = item.getQuantity();
            item.setQuantity(sl -1 );
            if(sl <= 0){
                cartItems.remove(key);
            }else{
                cartItems.remove(key);
                cartItems.put(key, item);
            }}}

        
        // Phương thức xóa sản phẩm ở giỏ hàng
    public void removeSanPham(Long key) {
        boolean check = cartItems.containsKey(key);
        if(check){
            cartItems.remove(key);
        }
    }
    
    //Phương thức tính tổng sản phẩm có trong giỏ hàng
    public int countItem(){
        return cartItems.size();
    }
      
  
    public double totalCart() {
        double count = 0;
        // count = price * quantity
        for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getProduct_price() * list.getValue().getQuantity();
        }
        return count;
    }
    
   
    
    }
    
