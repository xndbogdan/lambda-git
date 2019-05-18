<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lambda - Admin Panel</title>

    <link rel="icon" type="image/png" href="<c:url value="/resources/logo.png" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/home.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/hamburgers.css"/>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body style="min-height:100vh;" class="bg-white">

<jsp:include page="navbar.jsp"/>

<jsp:include page="user-bar.jsp"/>

<div class="container bg-light p-3">
    <div class="row p-3">
        <p class="col-12 text-dark mb-0 py-2">Lastest unapproved uploads</p>
        <c:forEach items="${videos}" var="video">
        <div class="col-12 col-md-6 col-lg-4 px-4 text-light pt-2 border border-dark bg-light text-dark shadow-lg">
            <div class="row">
                <p class="col-12">${userSvc.getUserById(video.user_id).username} - ${video.title}</p>
                <div class="col-12">
                    <audio src="<c:url value="/resources/uploads/${video.file_Link}" />" preload="auto" /><br/>
                </div>
            </div>

            <div class="row py-2">
                <div class="col-6 d-flex"><p class="d-flex align-middle my-0 center-vertically">Price: &euro; ${video.price}</p></div>
                <div class="col-4 pr-1"><form enctype="application/x-www-form-urlencoded" method="post" action="/approve"><input type="hidden" value="${video.getId()}" name="product_id"/> <button class="btn btn-dark w-100 btn-sm">Approve</button></form><i class="shiny"></i></div>
                <div class="col-2 pl-1"><form enctype="application/x-www-form-urlencoded" method="post" action="/decline"><input type="hidden" value="${video.getId()}" name="product_id"/> <button class="btn btn-danger w-100 btn-sm">X</button></form><i class="shiny"></i></div>
            </div>
        </div>
        </c:forEach>
    </div>

</div>

<script src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/audiojs/audio.min.js" />"></script>
<script>
    audiojs.events.ready(function() {
        var as = audiojs.createAll();
    });
</script>

</body>
</html>