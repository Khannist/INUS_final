package com.inus.NY.profile.vo;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import org.apache.tomcat.util.codec.binary.Base64;

public class PostingImgvo {

	private int  inus_boardNum;
	private byte[]  insertboardImg;
	private byte[]  boardImg;
	
	
	public int getInus_boardNum() {
		return inus_boardNum;
	}
	public void setInus_boardNum(int inus_boardNum) {
		this.inus_boardNum = inus_boardNum;
	}
	public byte[] getInsertboardImg() {
		return insertboardImg;
	}
	public void setInsertboardImg(byte[] insertboardImg) {
		this.insertboardImg = insertboardImg;
	}
	public String getBoardImg() throws UnsupportedEncodingException {
		byte[] boardImgenc01 = boardImg;
		byte[] boardImgenc02 = Base64.encodeBase64(boardImgenc01);
		String boardImgOut = new String(boardImgenc02, "UTF-8");
		
		return boardImgOut;
	}
	public void setBoardImg(byte[] boardImg) {
		this.boardImg = boardImg;
	}

	
	@Override
	public String toString() {
		return "PostingImgvo [inus_boardNum=" + inus_boardNum + ", insertboardImg=" + Arrays.toString(insertboardImg)
				+ ", boardImg=" + Arrays.toString(boardImg) + "]";
	}
	
	
	
	
	
}
