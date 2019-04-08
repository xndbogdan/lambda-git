<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="h-100">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lambda - Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="icon" type="image/png" href="<c:url value="/resources/logo.png" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/auth.css"/>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="h-100 bg-auth">
<div class="container h-100 d-flex justify-content-center">
    <div class="d-flex justify-content-center center-vertically ">
        <div class="card py-5 px-5 shadow-lg">
        <form:form id="loginForm" modelAttribute="login" action="loginProcess" method="post" class="row">
            <h2 class="text-center w-100 mb-3">Login</h2>
            <div class="form-group col-12">
                <form:label path="username">Username: </form:label>
                <form:input path="username" name="username" id="username" class="form-control"/>
            </div>
            <div class="form-group col-12">
                <form:label path="password">Password:</form:label>
                <form:password path="password" name="password" id="password" class="form-control"/>
            </div>
            <div class="col-12 ">
                <h5 class="h6">Don't have an account? <a href="/register">Create one!</a></h5>
            </div>
            <div class="col-12 d-flex justify-content-center">

                <form:button id="login" name="login" class="btn btn-primary btn-lg">Login</form:button>
            </div>

        </form:form>

        <c:if test="${not empty message}">
            <div class="alert alert-danger mt-5" role="alert">${message}</div>
        </c:if>
        </div>
    </div>

</div>

<script
        src="http://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>