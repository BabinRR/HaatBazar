<%@page import="onlinefruitshop.bean.CategoryBean"%>
<%@page import="onlinefruitshop.model.CategoryModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="onlinefruitshop.bean.ProductBean"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body style="margin: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9;">

<%@ include file="Header.jsp" %>

<div style="position: relative; height: 550px; background: url('../images/back.jpg') center/cover no-repeat;">
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;
                background-color: rgba(0, 0, 0, 0.5); display: flex;
                justify-content: center; align-items: center; flex-direction: column;">
        <div style="color: white; font-size: 48px; font-weight: bold; text-align: center;">
            WELCOME TO<br/>Haat Bazaar
        </div>
        <div style="margin-top: 10px; color: #f0f0f0; font-size: 20px; text-align: center;">
            Your online fruit and Vegetables marketplace
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
