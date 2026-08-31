package com.springboot.Pilotproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
    private long pnum;
    private String pname;
    private long pdecimal;
    private String pquantity;
    private String pmemo;
    private Date pdate;
    private String pfoutseaeons;
    private String psize;
    private String pcolor;
    private String pobject;
    private String pimage;
    private String pcategory;
    private int mno; 
}
