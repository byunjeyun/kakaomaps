<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Board</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/input.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<br><br><br>
<center>
<h2>유지보수 내역 리스트 </h2>


	<hr>

	<table>
		<tr>
			<td align="right">
			<span class="content01"></span></td>
			<form action="index"> 

            <td>Date</td>
			<td align="center"> <input type="date" name="sdate" value="">~</td>
            <td align="center"> <input type="date" name="edate" value=""></td>


			<td colspan="8">
			<label for="factnm">사업장</label>
			<select id="factnm" name="factnm" value="">
			  <option value="">-- 선택 --</option>
				<c:forEach items="${nfact_list}" var="ndto">
    				<option value="${ndto.factnm}">${ndto.factnm}</option>
    			</c:forEach>				
			</select>
			</td>
            <td colspan="">
            <label for="managernm">담당자</label>
            <select id="managernm" name="managernm" value="">
              <option value="">-- 선택 --</option>
                <c:forEach items="${manager_list}" var="mdto">
                    <option value="${mdto.managernm}">${mdto.managernm}</option>
                </c:forEach>
            </select>
            </td>
<%--
            <td>date</td>
			<td align="center"> <input type="date" name="sdate" value=""></td>
            <td align="center"> <input type="date" name="edate" value=""></td>
--%>
			
<%--			<td colspan="8">
			<label for="factnm">사업장</label>
			<select id="factnm" name="factnm" value="">
			  <option value="">-- 선택 --</option>
				<c:forEach items="${fact_list}" var="fdto">
    				<option value="${fdto.factnm}">${fdto.factnm}</option>
    			</c:forEach>				
			</select>
			</td>
--%>



	<%--		<td align="rigth">
		    	<label for="managernm">담당자</label>
		    	<select id="managernm" name="managernm" value="">
		    	  <option value="">-- 선택 --</option>
		    		<c:forEach items="${fact_list}" var="mdto">
		    		<option value="${mdto.managernm}">${mdto.managernm}</option>
		    		</c:forEach>
		        </select>
		    </td>
	--%>
			<td>
		        <input type="submit" value="검색">
		   </td>
		</tr>	
	</table>

	<table width="2200px"color="#aaa" cellpadding="0" cellspacing="0" border="1" style="border-color:#eee"  >
		<tr bgcolor="#333"  align="center" height="50" style="color:#ccc">

			<th width='100px'>요청번호</td>
			<th width='100px'>사업장</td>
			<th width='200px'>업무구분</td>
			<th width='100px'>요청자</td>
			<th width='100px'>요청일</td>
			<th width='600px'>요청내역</td>
			<th width='100px'>담당자</td>
			<th width='600px'>처리결과</td>
			<th width='100px'>처리완료일</td>
			<th width='100px'>처리기간</td>
			<th width='100px'>작업시간</td>
			
		</tr>
		<c:forEach var="rdto" items="${request_list}" >
			<tr height="30">

				<td align="center">${rdto.requestno}</td>
				<td align="center">${rdto.factnm}</td>
				<td align="center">${rdto.requestgr}</td>
				<td align="center">${rdto.requesternm}</td>
				<td align="center">${rdto.requestdate}</td>
				<td align="center">${rdto.requestcomment}</td>
				<td align="center">${rdto.managernm}</td>
				<td align="center">${rdto.resultstat}</td>		
				<td align="center">${rdto.enddate}</td>
				<td align="center">${rdto.processingtime}</td>
				<td align="center">${rdto.note}</td>
			</tr>		
		</c:forEach>
		</table>		

</center>

<center>	
<table width="75%" border="0" cellspacing="0" cellpadding="10" >
														   
	<tr>
        <input  type="button" value="추가" onclick="location.href='input'">&nbsp;&nbsp;
		<input  type="button" value="수정삭제" onclick="location.href='delete'">

	</tr>				
		
</table>
</center>

</body>
</html>