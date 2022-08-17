package com.inus.NY.profile.vo;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.util.Arrays;

import org.apache.tomcat.util.codec.binary.Base64;

import lombok.Data;


public class profileImgvo {
	private String userid;
	private byte[]  insertuserimg;
	private byte[]  userimg;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public byte[] getInsertuserimg() {
		return insertuserimg;
	}
	public void setInsertuserimg(byte[] insertuserimg) {
		this.insertuserimg = insertuserimg;
	}
	
	public String getUserimg() throws UnsupportedEncodingException {
		byte[] userimgenc01 = userimg;
		byte[] userimgenc02 = Base64.encodeBase64(userimgenc01);
		String userimgOut = new String(userimgenc02, "UTF-8");
		
		return userimgOut;
	}
	
	
	public void setUserimg(byte[] userimg) {
		this.userimg = userimg;
	}
	
	@Override
	public String toString() {
		return "profileImgvo [userid=" + userid + ", insertuserimg=" + Arrays.toString(insertuserimg) + ", userimg="
				+ Arrays.toString(userimg) + "]";
	}
}
