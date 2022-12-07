package com.comgen;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comgen.dao.IDao;
import com.comgen.dto.AddrDto;

@Controller
public class WebController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "index")
	
	public String index(HttpServletRequest request, Model model){
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<AddrDto> aDtos = dao.addr_listDao();
		
		aDtos = dao.addr_listDao();
		
		model.addAttribute("addr_list", aDtos);
	
	return "index";
	}

	@RequestMapping(value = "kakao")
	public String kakao(){
	return "kakao";
	}
	
	@RequestMapping(value = "bdata")
	public String bdata(){
	return "bdata";
	}
	
	@RequestMapping(value = "blist")
	public String blist(){
	return "blist";
	}
	
	@RequestMapping(value = "test")
	public String test(HttpServletRequest request, Model model){
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<AddrDto> aDtos = dao.addr_listDao();
		ArrayList<AddrDto> cityDtos = dao.city_listDao();
		ArrayList<AddrDto> guDtos = dao.gu_listDao();
		ArrayList<AddrDto> dongDtos = dao.dong_listDao();
		cityDtos = dao.city_listDao();
		aDtos = dao.addr_listDao();
		guDtos = dao.gu_listDao();
		dongDtos = dao.dong_listDao();
		model.addAttribute("addr_list", aDtos);
		model.addAttribute("city_list", cityDtos);
		model.addAttribute("gu_list", guDtos);
		model.addAttribute("dong_list", dongDtos);
	return "test";
	}
	

@RequestMapping(value = "addr")
public String addr(HttpServletRequest request, Model model){
	IDao dao = sqlSession.getMapper(IDao.class);
	ArrayList<AddrDto> aDtos = dao.addr_listDao();
	ArrayList<AddrDto> cityDtos = dao.city_listDao();
	ArrayList<AddrDto> guDtos = dao.gu_listDao();
	ArrayList<AddrDto> dongDtos = dao.dong_listDao();
	cityDtos = dao.city_listDao();
	aDtos = dao.addr_listDao();
	guDtos = dao.gu_listDao();
	dongDtos = dao.dong_listDao();
	model.addAttribute("addr_list", aDtos);
	model.addAttribute("city_list", cityDtos);
	model.addAttribute("gu_list", guDtos);
	model.addAttribute("dong_list", dongDtos);
return "addr";
}

}
