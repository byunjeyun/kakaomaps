package com.comgen.dao;

import java.util.ArrayList;

import com.comgen.dto.ManagerDto;
import org.apache.ibatis.annotations.Param;

import com.comgen.dto.FactDto;
import com.comgen.dto.RequestDto;
import com.comgen.dto.UserDto;



public interface IDao {

	
	//fact_option
		public ArrayList<RequestDto> F_listDao();
				
		public ArrayList<RequestDto> managerlistDao(@Param("managernm") String managernm, @Param("factnm") String factnm, @Param("sdate") String sdate, @Param("edate") String edate);

		public ArrayList<RequestDto> listDao(@Param("managernm") String managernm, @Param("factnm") String factnm);
		
	//request
		public ArrayList<RequestDto> R_listDao();
		
		public void r_inputDao(String factnm, String requestgr , String requesternm, String requestdate, String requestcomment, String managernm, String reusltstat, String  enddate, String note);
		
		public void deleteDao(String requestno);
		
		public void updateDao(String factnm, String requestgr, String requestdate, String requesternm, String requestcomment, String managernm, String reusltstat,  String enddate, String note, String requestno);

	
		
		
		//사업장master		
		public void fact_inputDao(String factnm);

		public int nmcheckDao(String factnm);
		
		public ArrayList<FactDto> factlistDao();

		public void fdeleteDao(String factcd);

		
		//담당자master		
		public void manager_inputDao(String managernm);
	
		public int mcheckDao(String managernm);
	
		public ArrayList<ManagerDto> mlistDao();
	
		public void mdeleteDao(String managercd);


		//회원가입
		
		//login
		public void joinDao(String userid, String userpw, String email);
		
		public int checkIdDao(String userid);
		
		public int checkPwDao(String userid, String userpw);
		
		public UserDto loginInfoDao(String userid);
		
		public ArrayList<UserDto> user_listDao();
		
		public void infouser(String userpw, String email, String userid);
		
		public void deleteUserDao(String userid);
		

}


