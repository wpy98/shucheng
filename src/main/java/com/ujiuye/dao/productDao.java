package com.ujiuye.dao;

import com.ujiuye.bean.Product;

import java.util.List;

public interface productDao {
    public List<Product> findProductByState(int state);
    public Product findProductById(int id);
}
