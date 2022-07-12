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
    .table-color{background-color: rgb(179, 179, 179);}
  </style>
  
  
  
  
<style>a{text-decoration:none;}</style>
</head>
<body>
    <div style="margin: 10px 0px 0px 0px; text-align:center" class="container-fluid">
    <h1 class="font1 header-img">파일 첨부형 게시판</h1>

    <!-- 검색 폼 -->
    <form class="font3" method="get">  
    <table class="table" width="90%">
    <tr>
        <td align="center">
            <select name="searchField">
                <option class="font3" value="title">제목</option>
                <option class="font3" value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input style="background-color:white" class="font3" type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>

    <!-- 목록 테이블 -->
    <table class="table table-hover"  width="90%">
        <tr>
            <th class="font3 table-color" width="10%">번호</th>
            <th class="font3 table-color" width="*">제목</th>
            <th class="font3 table-color" width="15%">작성자</th>
            <th class="font3 table-color" width="10%">조회수</th>
            <th class="font3 table-color" width="15%">작성일</th>
            <th class="font3 table-color" width="8%">첨부파일</th>
        </tr>
<c:choose>    
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
        <tr>
            <td class="font3" colspan="6" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
    </c:when>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
        <c:forEach items="${ boardLists }" var="row" varStatus="loop">    
        <tr class="font3" align="center">
            <td>  <!-- 번호 -->
                ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}   
            </td>
            <td align="left">  <!-- 제목(링크) -->
                <a href="/view.do?idx=${ row.idx }">${ row.title }</a> 
            </td> 
            <td>${ row.name }</td>  <!-- 작성자 -->
            <td>${ row.visitcount }</td>  <!-- 조회수 -->
            <td>${ row.postdate }</td>  <!-- 작성일 -->
            <td>  <!-- 첨부 파일 -->
            <c:if test="${ not empty row.ofile }">
                <a href="/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">

                <c:forTokens var="token" items="${ row.ofile }" delims="."
                 varStatus="status">
                <c:if test="${status.last }">
                <c:choose>
                <c:when test="${token eq 'avi' }">
                <img src="/img/icon_avi.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'css' }">
                <img src="/img/icon_avi.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'docx' }">
                <img src="/img/icon_docx.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'gif' }">
                <img src="/img/icon_gif.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'html' }">
                <img src="/img/icon_html.png" alt="${ row.ofile }" />
                </c:when>                
                <c:when test="${token eq 'jpg' }">
                <img src="/img/icon_jpg.png" alt="${ row.ofile }" />
                </c:when> 
                <c:when test="${token eq 'mov' }">
                <img src="/img/icon_mov.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'mp3' }">
                <img src="/img/icon_mp3.png" alt="${ row.ofile }" />
                </c:when>        
                <c:when test="${token eq 'pdf' }">
                <img src="/img/icon_pdf.png" alt="${ row.ofile }" />
                </c:when>  
                <c:when test="${token eq 'png' }">
                <img src="/img/icon_png.png" alt="${ row.ofile }" />
                </c:when>                  
                <c:when test="${token eq 'pptx' }">
                <img src="/img/icon_ppt.png" alt="${ row.ofile }" />
                </c:when>                                                                                                
                <c:when test="${token eq 'txt' }">
                <img src="/img/icon_txt.png" alt="${ row.ofile }" />
                </c:when>
                <c:when test="${token eq 'xls' }">
                <img src="/img/icon_xls.png" alt="${ row.ofile }" />
                </c:when>     
                <c:when test="${token eq 'zip' }">
                <img src="/img/icon_zip.png" alt="${ row.ofile }" />
                </c:when>                             
                <c:otherwise>
                <img src="/img/icon_download.png" alt="${ row.ofile }" />
                </c:otherwise>
                </c:choose></c:if>
                </c:forTokens>
                 </a>
            </c:if>
            </td>
        </tr>
        </c:forEach>        
    </c:otherwise>    
</c:choose>
    </table>

    <!-- 하단 메뉴(바로가기, 글쓰기) -->
    <table class="table" width="90%">
        <tr align="center">
            <td class="font3">
                ${ map.pagingImg }
            </td>
            <td width="100"><button style="background-color:white" type="button" class="font3"
                onclick="location.href='/write.do';">글쓰기</button></td>
        </tr>
    </table>
    </div>
</body>
</html>