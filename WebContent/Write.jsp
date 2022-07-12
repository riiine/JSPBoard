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
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
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
<form name="writeFrm" method="post" enctype="multipart/form-data"
      action="/write.do" onsubmit="return validateForm(this);">
<table class="table font3" width="90%">
    <tr >
        <td>작성자</td>
        <td align="left">
            <input type="text" name="name" style="width:150px;" />
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td align="left">
            <input type="text" name="title" style="width:90%;" />
        </td>
    </tr>
    <tr>
        <td>내용</td>
        <td align="left">
            <textarea name="content" style="width:90%;height:300px;"></textarea>
        </td>
    </tr>
    <tr>
        <td>첨부 파일</td>
        <td align="left">
            <input type="file" name="ofile" />
        </td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td align="left">
            <input type="password" name="pass" style="width:100px;" />
        </td>
    </tr>
    </table>  

    <table class="table font3" width="90%">  
    <tr>
        <td colspan="2" align="center">
            <button style="background-color:white" type="submit">작성 완료</button>
            <button style="background-color:white" type="reset">RESET</button>
            <button style="background-color:white"type="button" onclick="location.href='/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
    </table>

  
</form>
</div>
</body>
</html>