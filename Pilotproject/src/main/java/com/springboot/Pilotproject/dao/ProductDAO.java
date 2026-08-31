package com.springboot.Pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.springboot.Pilotproject.dto.ProductDTO;
@Mapper
public interface ProductDAO {
    // 상품 등록
    int insertProduct(ProductDTO product);
    
    // 모든 상품 목록 조회
    List<ProductDTO> selectAllProducts();
    
    // 상품 단건 조회
    ProductDTO selectProductByPnum(long pnum);
    
    // 상품 수정
    int updateProduct(ProductDTO product);
    
    // 상품 삭제
    int deleteProduct(long pnum);
}
