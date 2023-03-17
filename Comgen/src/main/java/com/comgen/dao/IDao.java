package com.comgen.dao;

import java.util.ArrayList;

import com.comgen.dto.ManagerDto;
import org.apache.ibatis.annotations.Param;

import com.comgen.dto.FactDto;
import com.comgen.dto.RequestDto;



public interface IDao {

	
	//fact_option
		public ArrayList<RequestDto> F_listDao();
				
		public ArrayList<RequestDto> managerlistDao(@Param("managernm") String managernm, @Param("factnm") String factnm, @Param("sdate") String sdate, @Param("edate") String edate);

		public ArrayList<RequestDto> listDao(@Param("managernm") String managernm, @Param("factnm") String factnm);
		
	//request_mst
		public ArrayList<RequestDto> R_listDao();
		
		public void r_inputDao(String factnm, String requestgr , String requesternm, String requestdate, String requestcomment, String managernm, String reusltstat, String  enddate, String note);
		
		public void deleteDao(String requestno);
		
		public void updateDao(String factnm, String requestgr, String requestdate, String requesternm, String requestcomment, String managernm, String reusltstat,  String enddate, String note, String requestno);

		
		
		public void fact_inputDao(String factnm);

		public int nmcheckDao(String factnm);
		
		public ArrayList<FactDto> factlistDao();

		public void fdeleteDao(String factcd);

	public void manager_inputDao(String managernm);

	public int mcheckDao(String managernm);

	public ArrayList<ManagerDto> mlistDao();

	public void mdeleteDao(String managercd);


}


