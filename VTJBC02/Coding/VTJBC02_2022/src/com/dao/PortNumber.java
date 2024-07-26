package com.dao;

import java.util.Random;

public class PortNumber {

	public static String getPort(){
		String num = "0123456789";
		Random rnd = new Random();
		char [] otp = new char[8];
		for(int i = 0; i < otp.length; i++){
			otp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		String p = new String(otp);
		return p;
	}

	public static String getFid() {
		// TODO Auto-generated method stub
		String num = "0123456789";
		Random rnd = new Random();
		char [] otp = new char[6];
		for(int i = 0; i < otp.length; i++){
			otp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		String p = new String(otp);
		return p;
	}

	public static String getKeys() {
		// TODO Auto-generated method stub
		String num = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random rnd = new Random();
		char [] otp = new char[16];
		for(int i = 0; i < otp.length; i++){
			otp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		String p = new String(otp);
		return p;
	}

	public static String getPid() {
		// TODO Auto-generated method stub
		String num = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random rnd = new Random();
		char [] otp = new char[3];
		for(int i = 0; i < otp.length; i++){
			otp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		num = "0123456789";
		char [] sp = new char[5];
		for(int i = 0; i < sp.length; i++){
			sp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		String p = new String(otp);
		String q = new String(sp);
		return p + q;
	}
	
	public static String getUid(String name) {
		// TODO Auto-generated method stub
		String num = "0123456789";
		Random rnd = new Random();
		char [] otp = new char[6];
		for(int i = 0; i < otp.length; i++){
			otp[i] = num.charAt(rnd.nextInt(num.length()));
		}
		String p = new String(otp);
		return name + p;
	}

	public static int getCount(String pid, String mm) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from checkup where pid='"+pid+"' and mid='"+mm+"'";
		int i = Dao.getCount(sql);
		i = i * 10;
		return i;
	}
}
