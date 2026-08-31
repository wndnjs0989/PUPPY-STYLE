package com.springboot.Pilotproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
    private int mno;
    private String mid;
    private String mpasswd;
    private String mname;
    private String mtel;
    private String mbirth;
    private String mprofile;
    private String mzip;
    private String memail;
    private String mmemo;
    private String mgender;
    private String mhobby;
    private Date mdate;
    private String mauthority;
}
