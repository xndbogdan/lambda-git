<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <form:form id="regForm" modelAttribute="user" action="registerProcess"
                   method="post">
            <h2 class="text-center w-100 my-4">Register</h2>
            <div class="form-group">
                <form:label path="username">Username</form:label>
                <form:input path="username" name="username" id="username" class="form-control"/>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>

            </div>
            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password path="password" name="password"
                               id="password" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="firstname">FirstName</form:label>
                <form:input path="firstname" name="firstname"
                            id="firstname" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="lastname">LastName</form:label>
                <form:input path="lastname" name="lastname" id="lastname" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="email">Email</form:label>
                <form:input path="email" name="email" id="email" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="address">Address</form:label>
                <form:input path="address" name="address" id="address" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="phone">Phone</form:label>
                <form:input path="phone" name="phone" id="phone" class="form-control"/>
            </div>

            <form:button id="register" name="register" class="btn btn-primary">Register</form:button>
            <a href="home.jsp">Home</a>

        </form:form>
        <c:if test="${not empty message}">
            <div class="alert alert-danger mt-5" role="alert">${message}</div>
        </c:if>

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