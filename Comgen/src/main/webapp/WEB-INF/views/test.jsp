<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button type="button" id="build" onclick="location.href='test'">건물특성</button>
<button type="button" id="bdata" onclick="location.href='blist'">건물목록 </button>
<button type="button" id="bdata" onclick="location.href='bdata'">통계청DB </button>
<h4>건물특성 조건 설정</h4>


<legend>건물유형 선택</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">아파트</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">빌라/다세대</label>s
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">오피스텔</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">단독</label>
</div>
</br>
<legend>전용면적 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales">66㎡ 미만</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">66㎡ 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">99㎡ 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">132㎡ 이상</label>
</div>
</br>
<legend>주택가격 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales">1억원 미만</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">1~2억원 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">3~5억원 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">5억원 이상</label>
</div>

</br>
건축연도 지정<span style="color:#777;">(min:1900 max:2099)</span><br>
<input type="number" min="1900" max="2099" step="1" value="2022" />
~
<input type="number" min="1900" max="2099" step="1" value="2022" />
</br>
<legend>소유주 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales">전체</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">자가</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">임대</label>
</div>




</body>
</html>