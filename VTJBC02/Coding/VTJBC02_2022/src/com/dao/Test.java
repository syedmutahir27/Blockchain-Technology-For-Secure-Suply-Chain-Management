package com.dao;


import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;

public class Test {

	public static String encryption(String text, String key) {
		String ekey = "";
		try {
			// Create key and cipher
			Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES");
			// encrypt the text
			cipher.init(Cipher.ENCRYPT_MODE, aesKey);
			byte[] encrypted = cipher.doFinal(text.getBytes());
			System.err.println(new String(encrypted));
			ekey = new String(encrypted);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ekey;
	}

	public static String decryption(String text, String key){
		String ekey = "";
		try {
			// Create key and cipher
			Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES");
			// encrypt the text
			cipher.init(Cipher.ENCRYPT_MODE, aesKey);
			byte[] encrypted = cipher.doFinal(text.getBytes());
			System.err.println(new String(encrypted));
			ekey = new String(encrypted);
			// decrypt the text
			cipher.init(Cipher.DECRYPT_MODE, aesKey);
			String decrypted = new String(cipher.doFinal(encrypted));
			System.err.println(decrypted);
			ekey = decrypted;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ekey;
	}
	
}
