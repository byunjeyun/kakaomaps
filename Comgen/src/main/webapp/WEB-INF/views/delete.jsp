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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/update.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

<center>
<h2>유지보수 내역 </h2>
	<hr>
	
		
	<table width="100%" color="#999" cellpadding="0" cellspacing="0" border="1" style="border-color:#eee"  >
		<tr bgcolor="#555"  align="center" height="30" style="color:#ccc">
			<td>No</td>
			<td>사업장</td>
			<td>업무구분</td>
			<td>요청자</td>
			<td>요청일</td>
			<td>요청내역</td>
			<td>담당자</td>
			<td>처리결과</td>
			<td>처리완료일</td>
			<td>note</td>
			<td>삭제</td>		
		</tr>
		<c:forEach var="rdto" items="${request_list}" >
		<form action="updateOk" method="get" name="update_frm">
			<tr height="30">
				<td align="center">${rdto.requestno}</td>
				<input  type="hidden" name="requestno" value="${rdto.requestno}">
				<td align="center">
				
				<select id="factnm" name="factnm" value="${rdto.factnm}">
				  <option value="">--선택--</option>
					<c:forEach items="${nfact_list}" var="ndto">
	    				<option value="${ndto.factnm}">${ndto.factnm}</option>
	    			</c:forEach>				
				</select>
				</td>
				<td align="center"><input type="text" name="requestgr" value="${rdto.requestgr}"></td>
				<td align="center"><input type="text" name="requesternm" value="${rdto.requesternm}"></td>
				<td align="center"><input type="text" name="requestdate" value="${rdto.requestdate}"></td>
				<td align="center"><input type="text" name="requestcomment" value="${rdto.requestcomment}"></td>
				<td align="center"><input type="text" name="managernm" value="${rdto.managernm}"></td>
				<td align="center"><input type="text" name="resultstat" value="${rdto.resultstat}"></td>
				<td align="center"><input type="text" name="enddate" value="${rdto.enddate}"></td>
				<input type="hidden" name="processingtime" value="${rdto.processingtime}" readonly></td>
				<td align="center"><input type="text" name="note" value="${rdto.note}"></td>				
				<td align="center">
				<input class="button01" type="submit" value="수정">
				<input class="button03" type="button" value="삭제" onclick="location.href='deleteOk?requestno=${rdto.requestno}'">
				</td>
			</tr>
		</form>
		</c:forEach>
			<tr align="center">
			<td colspan="10"><input class="button03" type="button" value="목록" onclick="location.href='index'"></td>
			</tr>	
		</table>		
		
</center>
</body>
</html>