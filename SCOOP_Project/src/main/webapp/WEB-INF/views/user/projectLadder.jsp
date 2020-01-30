<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title></title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset=utf-8>
    <meta name=description content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
       <link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
     <link href="<c:url value="/resources/css/style_la.css" />" rel="stylesheet">
     <link href="<c:url value="/resources/css/meterial.css" />" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body style="height: 300px;">
    <div class="landing" id="landing">
       <div class="start-form">
            <div class="landing-form">
                <div class="group">      
                  <input type="text" name="member" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>참여자 수</label>
                    <div  id="button" class="button raised green">
                      <div  class="center" fit>START</div>
                      <paper-ripple fit></paper-ripple>
                    </div>
                </div>
            </div>
       </div>
    </div>
    <div id="ladder" class="ladder" style="margin-top: 270px;">
        <div class="dim"></div>
         <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
    </div>
<script src="<c:url value="/resources/js/ladder.js"/>"></script>
</body>
</html>