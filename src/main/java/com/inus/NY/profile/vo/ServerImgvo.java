package com.inus.NY.profile.vo;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import org.apache.tomcat.util.codec.binary.Base64;

public class ServerImgvo {
	private String  channelCode;
	private byte[]  insertchannelImg;
	private byte[]  channelImg;
	
	
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	public byte[] getInsertchannelImg() {
		return insertchannelImg;
	}
	public void setInsertchannelImg(byte[] insertchannelImg) {
		this.insertchannelImg = insertchannelImg;
	}

	public String getChannelImg() throws UnsupportedEncodingException {
		byte[] channelimgenc01 = channelImg;
		byte[] channelimgenc02 = Base64.encodeBase64(channelimgenc01);
		String channelimgOut = new String(channelimgenc02, "UTF-8");
		
		return channelimgOut;
	}
	public void setChannelImg(byte[] channelImg) {
		this.channelImg = channelImg;
	}
	
	@Override
	public String toString() {
		return "ServerImgvo [channelCode=" + channelCode + ", insertchannelImg=" + Arrays.toString(insertchannelImg)
				+ ", channelImg=" + Arrays.toString(channelImg) + "]";
	}
	

}
