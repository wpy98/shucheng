package com.ujiuye.servier.impl;

import com.ujiuye.bean.Product;
import com.ujiuye.dao.impl.productDaoImpl;
import com.ujiuye.dao.productDao;
import com.ujiuye.servier.productServier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class productServierImpl implements productServier {

    @Autowired
    private productDao pd;

    public productDao getPd() {
        return pd;
    }

    public void setPd(productDao pd) {
        this.pd = pd;
    }

    @Override
    public List<Product> findProduct(int state) {
        return pd.findProductByState(state);
    }

    @Override
    public Product findProductById(int id) {
        return pd.findProductById(id);
    }
}
