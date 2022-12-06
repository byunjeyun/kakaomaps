package com.comgen.dao;

import java.util.ArrayList;

import com.comgen.dto.AddrDto;


public interface IDao {

	public ArrayList<AddrDto> addr_listDao();//리스트 가져오기
	public ArrayList<AddrDto> city_listDao();//리스트 가져오기
	public ArrayList<AddrDto> gu_listDao();//리스트 가져오기
	public ArrayList<AddrDto> dong_listDao();//리스트 가져오기
	
}
