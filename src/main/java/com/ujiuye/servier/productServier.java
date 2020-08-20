package com.ujiuye.servier;

import com.ujiuye.bean.Product;

import java.util.List;

public interface productServier {
    public List<Product> findProduct(int state);
    public Product findProductById(int id);
}
