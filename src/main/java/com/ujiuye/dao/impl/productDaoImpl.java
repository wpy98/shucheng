package com.ujiuye.dao.impl;

import com.ujiuye.bean.Product;
import com.ujiuye.dao.productDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class productDaoImpl implements productDao {

    @Autowired
    private JdbcTemplate jt;

    public JdbcTemplate getJt() {
        return jt;
    }

    public void setJt(JdbcTemplate jt) {
        this.jt = jt;
    }

    @Override
    public List<Product> findProductByState(int state) {
        String sql = "select * from product where pro_state=?";
        List<Product> list  = jt.query(sql, new RowMapper<Product>() {
            @Override
            public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
                Product p = new Product();
                p.setPro_id(rs.getInt("pro_id"));
                p.setPro_name(rs.getString("pro_name"));
                p.setPro_num(rs.getString("pro_num"));
                p.setPro_total_count(rs.getInt("pro_total_count"));
                p.setShop_price(rs.getDouble("shop_price"));
                p.setPro_state(rs.getInt("pro_state"));
                p.setPro_min_img(rs.getString("pro_min_img"));
                p.setPro_max_img(rs.getString("pro_max_img"));
                p.setPro_color(rs.getString("pro_color"));
                p.setMarket_price(rs.getDouble("market_price"));
                return p;
            }
        },state);
        return list;
    }

    @Override
    public Product findProductById(int id) {
        String sql = "select * from product where pro_id=?";
        final Product p = new Product();
        jt.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                p.setPro_id(rs.getInt("pro_id"));
                p.setPro_name(rs.getString("pro_name"));
                p.setPro_num(rs.getString("pro_num"));
                p.setPro_total_count(rs.getInt("pro_total_count"));
                p.setShop_price(rs.getDouble("shop_price"));
                p.setPro_state(rs.getInt("pro_state"));
                p.setPro_min_img(rs.getString("pro_min_img"));
                p.setPro_max_img(rs.getString("pro_max_img"));
                p.setPro_color(rs.getString("pro_color"));
                p.setMarket_price(rs.getDouble("market_price"));
            }
        },id);
        return p;
    }
}
