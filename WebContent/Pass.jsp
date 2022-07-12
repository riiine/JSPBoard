<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap');
    .font1{font-family: 'East Sea Dokdo', cursive; font-size:60px;}
  </style>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap');
    .font3{font-family: 'East Sea Dokdo', cursive; font-size:25px;}
  </style>
    <style>
    .header-img{color: rgb(255, 89, 0);}
  </style>
<script type="text/javascript">
    function validateForm(form) {
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<body>
<div style="margin: 10px 0px 0px 0px; text-align:center" class="container-fluid">
<h2 class="font1 header-img">파일 첨부형 게시판</h2>
<form name="writeFrm" method="post" action="/pass.do" onsubmit="return validateForm(this);">
<input type="hidden" name="idx" value="${ param.idx }" />
<input type="hidden" name="mode" value="${ param.mode }" />
<table class="table table-hover font3" width="90%">
    <tr>
        <td align="center">비밀번호&nbsp
            <input type="password" name="pass" style="width:200px;" />
        </td>
    </tr>
</table>


<div style="margin: 200px 0px 0px 0px; text-align:center" class="container-fluid">  
<table class="table font3" width="90%">
    <tr>
        <td colspan="2" align="center">
            <button style="background-color:white" type="submit">검증하기</button>
            <button style="background-color:white" type="reset">RESET</button>
            <button style="background-color:white" type="button" onclick="location.href='/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table> 
</div>
   
</form>
</div>
</body>
</html>