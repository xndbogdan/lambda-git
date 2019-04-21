<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="h-100">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lambda - Register</title>

    <link rel="icon" type="image/png" href="<c:url value="/resources/logo.png" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/auth.css"/>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="h-100 bg-auth">
<div class="container h-100 d-flex justify-content-center my-5">
    <div class="d-flex justify-content-center center-vertically ">
        <div class="card py-5 px-5 shadow-lg">
        <form:form id="regForm" modelAttribute="user" action="registerProcess"
                   method="post" class="row">
            <h2 class="text-center w-100 mb-3">Register</h2>
            <div class="form-group col-12 col-md-6">
                <form:label path="username">Username</form:label>
                <form:input path="username" name="username" id="username" class="form-control"/>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone</small>

            </div>
            <div class="form-group col-12 col-md-6">
                <form:label path="password">Password</form:label>
                <form:password path="password" name="password"
                               id="password" class="form-control"/>
            </div>
            <div class="form-group col-12 col-md-6">
                <form:label path="firstname">First Name</form:label>
                <form:input path="firstname" name="firstname"
                            id="firstname" class="form-control"/>
            </div>
            <div class="form-group col-12 col-md-6">
                <form:label path="lastname">Last Name</form:label>
                <form:input path="lastname" name="lastname" id="lastname" class="form-control"/>
            </div>
            <div class="form-group col-12 col-md-6">
                <form:label path="email">Email</form:label>
                <form:input path="email" name="email" id="email" class="form-control"/>
            </div>
            <div class="form-group col-12 col-md-6">
                <form:label path="address">Address</form:label>
                <form:input path="address" name="address" id="address" class="form-control"/>
            </div>
            <div class="form-group col-12">
                <form:label path="phone">Phone</form:label>
                <form:input path="phone" name="phone" id="phone" class="form-control"/>
            </div>
            <div class="col-12 ">
                <h5 class="h6">Already have an account? <a href="/">Log in!</a></h5>
            </div>
            <div class="col-12 d-flex justify-content-center ">
                <form:button id="register" name="register" class="btn btn-primary btn-lg">Register</form:button>
            </div>
        </form:form>
        <c:if test="${not empty message}">
            <div class="alert alert-danger mt-5" role="alert">${message}</div>
        </c:if>
        </div>
    </div>

</div>

<script src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</body>
</html>