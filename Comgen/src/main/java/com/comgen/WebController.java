package com.comgen;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.comgen.dao.IDao;
import com.comgen.dto.FactDto;
import com.comgen.dto.ManagerDto;
import com.comgen.dto.RequestDto;


@RestController
public class WebController {

	@ Autowired
	private SqlSession sqlSession;
	private IDao dao;
	
    @GetMapping(value = "/requests", produces = "application/json")
    @ResponseBody // 추가
    public Map<String, Object> getRequestList(@RequestParam(required = false) String managernm, @RequestParam(required = false) String factnm, @RequestParam(required = false) String sdate,  @RequestParam(required = false) String edate) {

        IDao dao = sqlSession.getMapper(IDao.class);

        List<RequestDto> aDtos = dao.managerlistDao(managernm, factnm, sdate, edate);
        List<RequestDto> fDtos = dao.F_listDao();
		List<FactDto> nDtos = dao.factlistDao();
		List<ManagerDto> mDtos = dao.mlistDao();
        Map<String, Object> response = new HashMap<>();
        response.put("request_list", aDtos);
        response.put("fact_list", fDtos);
        response.put("f_list", nDtos);
        response.put("m_list", mDtos);
        return response;
    }

//	public Map<String, Object> getData(@RequestParam(required = false) String managernm, @RequestParam(required = false) String factnm, @RequestParam(required = false) String sdate, @RequestParam(required = false) String edate) {
//
//	    IDao dao = sqlSession.getMapper(IDao.class);
//
//        List<RequestDto> aDtos = dao.managerlistDao(managernm, factnm, sdate, edate);
//        List<RequestDto> fDtos = dao.F_listDao();
//		List<FactDto> nDtos = dao.factlistDao();
//		List<ManagerDto> mDtos = dao.mlistDao();
//        Map<String, Object> response = new HashMap<>();
//        response.put("request_list", aDtos);
//        response.put("fact_list", fDtos);
//        response.put("f_list", nDtos);
//        response.put("m_list", mDtos);
//        return response;
//	}
//	
	
//    @PostMapping("/update")
//    public void updateRequest(@RequestBody RequestDto requestData) {
//        System.out.println("factnm: " + requestData.getFactnm());
//        IDao dao = sqlSession.getMapper(IDao.class);
//        dao.r_inputDao(requestData.getFactnm(), requestData.getRequestgr(), requestData.getRequesternm(),
//            requestData.getRequestdate(), requestData.getRequestcomment(), requestData.getManagernm(),
//            requestData.getResultstat(), requestData.getEnddate(), requestData.getNote());
//    }
    
//    @PostMapping("/update")
//    public void updateRequest(@RequestBody Map<String, Object> requestData) {
//
//    	
//        IDao dao = sqlSession.getMapper(IDao.class);
//    	
//
//    	String factnm = requestData.get("factnm") != null ? requestData.get("factnm").toString() : "";
//    	String requestgr = requestData.get("requestgr") != null ? requestData.get("requestgr").toString() : "";
//    	String requesternm = requestData.get("requesternm") != null ? requestData.get("requesternm").toString() : "";
//    	String requestdate = requestData.get("requestdate") != null ? requestData.get("requestdate").toString() : "";
//    	String requestcomment = requestData.get("requestcomment") != null ? requestData.get("requestcomment").toString() : "";
//    	String managernm = requestData.get("managernm") != null ? requestData.get("managernm").toString() : "";
//    	String resultstat = requestData.get("resultstat") != null ? requestData.get("resultstat").toString() : "";
//    	String enddate = requestData.get("enddate") != null ? requestData.get("enddate").toString() : "";
//    	String note = requestData.get("note") != null ? requestData.get("note").toString() : "";
//        
//    	dao.r_inputDao(
//    			   factnm,
//    	            requestgr,
//    	            requesternm,
//    	            requestdate,
//    	            requestcomment,
//    	            managernm,
//    	            resultstat,
//    	            enddate,
//    	            note
//        );
//        
//    }	

    
    @PostMapping("/update")
    public void updateRequest(@RequestBody Map<String, Object> requestData) {
        IDao dao = sqlSession.getMapper(IDao.class);
        List<Map<String, Object>> requestList = (List<Map<String, Object>>) requestData.get("requestList");
        
        for (Map<String, Object> row : requestList) {
            String factnm = row.get("factnm") != null ? row.get("factnm").toString() : "";
            String requestgr = row.get("requestgr") != null ? row.get("requestgr").toString() : "";
            String requesternm = row.get("requesternm") != null ? row.get("requesternm").toString() : "";
            String requestdate = row.get("requestdate") != null ? row.get("requestdate").toString() : "";
            String requestcomment = row.get("requestcomment") != null ? row.get("requestcomment").toString() : "";
            String managernm = row.get("managernm") != null ? row.get("managernm").toString() : "";
            String resultstat = row.get("resultstat") != null ? row.get("resultstat").toString() : "";
            String enddate = row.get("enddate") != null ? row.get("enddate").toString() : "";
            String note = row.get("note") != null ? row.get("note").toString() : "";
            
            dao.r_inputDao(factnm, requestgr, requesternm, requestdate, requestcomment, managernm, resultstat, enddate, note);
        }
    }
    
    
//	    @PostMapping("/requests")
//	    public ResponseEntity<RequestDto> createRequest(@RequestBody RequestDto requestDto) {
//	    IDao dao = sqlSession.getMapper(IDao.class);
//	    dao.r_inputDao(requestDto);
//	    return ResponseEntity.ok(requestDto);
//	    }
		
	 
	 
	
	@RequestMapping(value = "/")
	
	public String index(HttpServletRequest request, Model model){
				
		
		String managernm = request.getParameter("managernm");
		String factnm = request.getParameter("factnm");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		IDao dao = sqlSession.getMapper(IDao.class);

		ArrayList<RequestDto> aDtos = null;
		ArrayList<RequestDto> fDtos = dao.F_listDao();
		ArrayList<FactDto> nDtos = dao.factlistDao();
		ArrayList<ManagerDto> mDtos = dao.mlistDao();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("managernm", managernm);
		paramMap.put("factnm", factnm);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);

		aDtos = dao.managerlistDao(managernm, factnm, sdate, edate);

		model.addAttribute("request_list", aDtos);
		model.addAttribute("fact_list", fDtos);
		model.addAttribute("nfact_list", nDtos);
		model.addAttribute("manager_list", mDtos);
		return "index";
	}
	
	@RequestMapping(value = "index")
	
	public String index1(HttpServletRequest request, Model model){

		
		String managernm = request.getParameter("managernm");
		String factnm = request.getParameter("factnm");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		IDao dao = sqlSession.getMapper(IDao.class);

		ArrayList<RequestDto> aDtos = null;
		ArrayList<RequestDto> fDtos = dao.F_listDao();
		ArrayList<FactDto> nDtos = dao.factlistDao();
		ArrayList<ManagerDto> mDtos = dao.mlistDao();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("managernm", managernm);
		paramMap.put("factnm", factnm);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);

		aDtos = dao.managerlistDao(managernm, factnm, sdate, edate);

		model.addAttribute("request_list", aDtos);
		model.addAttribute("fact_list", fDtos);
		model.addAttribute("nfact_list", nDtos);
		model.addAttribute("manager_list", mDtos);
		return "index";

	}
	
	@RequestMapping(value="/input")
	public String input(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<RequestDto> fDtos = dao.F_listDao();
		ArrayList<FactDto> nDtos = dao.factlistDao();
		
		model.addAttribute("nfact_list", nDtos);
		model.addAttribute("fact_list", fDtos);
	return "input";
	}
	
	@RequestMapping(value ="/inputOk")
	public String b_inputOk(HttpServletRequest request, Model model) {
		
		String factnm = request.getParameter("factnm");
		String requestgr = request.getParameter("requestgr");
		String requesternm = request.getParameter("requesternm");
		String requestdate = request.getParameter("requestdate");
		String requestcomment = request.getParameter("requestcomment");
		String managernm = request.getParameter("managernm");
		String resultstat = request.getParameter("resultstat");
		String enddate = request.getParameter("enddate");
		String note = request.getParameter("note");
		
		
//		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		    long diff = 0;
//		    try {
//		        Date endDate = sdf.parse(enddate);
//		        Date requestDate = sdf.parse(requestdate);
//		        diff = endDate.getTime() - requestDate.getTime();
//		    } catch (ParseException e) {
//		        e.printStackTrace();
//		    }
//		    long days = diff / (24 * 60 * 60 * 1000);
//
//		 // 시간 계산
//		    long hours = (diff / (60 * 60 * 1000)) % 24;
//		  String processingtime = days + "day " + hours + "hours";
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.r_inputDao(factnm, requestgr, requesternm, requestdate, requestcomment, managernm, resultstat, enddate, note);
			
		return "redirect:index";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model) {

		String managernm = request.getParameter("managernm");
		String factnm = request.getParameter("factnm");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<RequestDto> aDtos = null;
		ArrayList<RequestDto> fDtos = dao.F_listDao();
		ArrayList<FactDto> nDtos = dao.factlistDao();
		
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("managernm", managernm);
	    paramMap.put("factnm", factnm);
		aDtos = dao.managerlistDao(managernm, factnm, sdate, edate);
		model.addAttribute("request_list", aDtos);
		model.addAttribute("fact_list", fDtos);
		model.addAttribute("nfact_list", nDtos);
	return "delete";

	}
	
	@RequestMapping(value = "/deleteOk")
	public String deleteOk(HttpServletRequest request, Model model) {

		String requestno = request.getParameter("requestno");
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.deleteDao(requestno);
		return "redirect:index";	
		
	
	}
	
	@RequestMapping(value = "/updateOk")
	public String update(HttpServletRequest request, Model model) {

	    String factnm = request.getParameter("factnm");
	    String requestgr = request.getParameter("requestgr");
	    String requesternm = request.getParameter("requesternm");
	    String requestdate = request.getParameter("requestdate");
	    String requestcomment = request.getParameter("requestcomment");
	    String managernm = request.getParameter("managernm");
	    String resultstat = request.getParameter("resultstat");
	    String enddate = request.getParameter("enddate");
	    String note = request.getParameter("note");
	    String requestno = request.getParameter("requestno");

//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		long diff = 0;
//		try {
//			Date endDate = sdf.parse(enddate);
//			Date requestDate = sdf.parse(requestdate);
//			diff = endDate.getTime() - requestDate.getTime();
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		long days = diff / (24 * 60 * 60 * 1000);
//
//		// 시간 계산
//		long hours = (diff / (60 * 60 * 1000)) % 24;
//		String processingtime = days + "day " + hours + "hours";


	    IDao dao = sqlSession.getMapper(IDao.class);
	    dao.updateDao(factnm, requestgr, requestdate, requesternm, requestcomment, managernm, resultstat, enddate, note, requestno);

		model.addAttribute("message", "수정이 완료되었습니다.");
	    return "redirect:delete";
	}
	
	
	@RequestMapping(value="/finput")
	public String finput(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<RequestDto> fDtos = dao.F_listDao();
		model.addAttribute("fact_list", fDtos);
	return "finput";
	}
	
	
	@RequestMapping(value ="/finputOk")
	public String finputOk(HttpServletRequest request, Model model) {
		String factcd = request.getParameter("factcd");
		String factnm = request.getParameter("factnm");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkNm = dao.nmcheckDao(factnm);
		
		if(checkNm != 1) {
			dao.fact_inputDao(factnm);
			model.addAttribute("message", "사업장정보가 저장되었습니다.");
			model.addAttribute("factcd", factcd);
			model.addAttribute("factnm", factnm);
			
		} else { 
			model.addAttribute("message", "이미 존재하는 사업장 입니다.");
		}
	
	return "finput";
	}
	   
	
	
}
