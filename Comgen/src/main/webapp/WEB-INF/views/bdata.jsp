<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h4>통계청DB 조건 설정</h4>
<legend>성별</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">남자</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">여자</label>
</div>
</br>
<legend>연령</legend>
<div>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales"20대 이하</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">20대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">30대</label>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales">40대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">50대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">60대 이상</label>
</div>
</br>
<legend>유형선택</legend>
<div>
  <input type="checkbox" id="scales" name="scales">
  <label for="scales">주택</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">기업체</label>
  <input type="checkbox" id="horns" name="horns">
</div>
</body>
</html>