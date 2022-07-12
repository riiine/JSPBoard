
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
</head>
<body>

<div style="margin: 10px 0px 0px 0px; text-align:center" class="container-fluid">
<h2 class="font1 header-img">파일 첨부형 게시판</h2>
<table class="table" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr class="font3">
        <td>번호</td> <td align="left">${ dto.idx }</td>
        <td>작성자</td> <td align="left">${ dto.name }</td>
    </tr>
    <tr class="font3">
        <td>작성일</td> <td align="left">${ dto.postdate }</td>
        <td>조회수</td> <td align="left">${ dto.visitcount }</td>
    </tr>
    <tr class="font3">
        <td>제목</td>
        <td align="left" colspan="3">${ dto.title }</td>
    </tr>
    <tr class="font3">
        <td>내용</td>
        <td align="left" colspan="3" height="100">${ dto.content }</td>
    </tr>

    <!-- 첨부파일 -->
    <tr class="font3">
        <td>첨부파일</td>
        <td align="left">
            <c:if test="${ not empty dto.ofile }">
            ${ dto.ofile }
            <a href="/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }">
                [다운로드]
            </a>
            </c:if>
        </td>
         <td>다운로드수</td>
        <td align="left">${ dto.downcount }</td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
    <tr class="font3">
        <td colspan="4" align="center">
            <button style="background-color:white" type="button" onclick="location.href='/pass.do?mode=edit&idx=${ param.idx }';">
                수정하기
            </button>
            <button style="background-color:white" type="button" onclick="location.href='/pass.do?mode=delete&idx=${ param.idx }';">
                삭제하기
            </button>
            <button style="background-color:white" type="button" onclick="location.href='/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</div>
</body>
</html>
