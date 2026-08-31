package com.springboot.Pilotproject.dto;

import lombok.Data;

@Data
public class CartDTO {
	 private long pnum;
	    private int cartcount;
	    private String pname;
	    private long pdecimal;
	    private String pimage;
	    private String psize;
}
