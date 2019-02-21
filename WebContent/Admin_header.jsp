<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/style.css?ver5sffh6dd">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/myscript.js"></script>
    <style>
  	 .time {
  	    background-color: #8cc4d9;
		color:#848484;
		font-weight:bold;
		font-size:20px;
		text-align:center;
		border:none;
  	}
  </style>
</head>

<body onload="showtime()" >

<div class="bg-5 text-center">
	<!-- 디지털시계 -->
	<form name="myform">
      <input type="text" name="clock" size="40" class="time" readonly>
    </form>	
    
</div>

<!-- Container 시작 -->
<div class="bg-3 text-center"></div>
  <div class="row"></div>
    <div class="col-sm-12"></div>
      
  