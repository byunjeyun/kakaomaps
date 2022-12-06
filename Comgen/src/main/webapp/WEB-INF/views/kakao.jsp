<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="module" src="${pageContext.request.contextPath }/resources/js/index.js"></script>
</head>

<body>

<div style="float:left; width:330px;">
<h3>DB주소 검색</br></h3>

<h4>영역선택</br></h4>

<label for="cars">도형선택</label>
<select id="shape" name="shape" >
<option value="1">원반경</option>
<option value="2">사각형</option>
<option value="3">다각형</option>
</select>

<table>
<tr>
<td width="300px" height="100px" id="result">
</td>
</tr>
<tr>
<td><input type="button" name="shape" value="반경"></button>
<input type="button" name="shape" value="사각형"></button>
<input type="button" name="shape" value="다각형"></button>
</td>

</tr>
<tr>
<td><iframe height="600px" src=/test></iframe>
</td>
</tr>
</table>

 
</div>

<div id="map1" style="width:1500px;height:950px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be246cb585128818296aac80f596f18c&libraries=drawing;libraries=services"></script>
	
	</body>
	</html>