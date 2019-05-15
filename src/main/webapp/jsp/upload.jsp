<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lambda - Upload</title>

    <link rel="icon" type="image/png" href="<c:url value="/resources/logo.png" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/home.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/hamburgers.css"/>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body style="min-height:100vh;" class="bg-white">

<jsp:include page="navbar.jsp"/>

<div class="border-bottom">
    <div class="container ">
        <c:if test="${not empty user}">
            <div class="d-flex flex-row bg-white text-dark">
                <div class="p-2 d-flex"><img class="img-fluid rounded d-flex center-vertically" style="height:60px; margin:auto;" src="<c:url value="/resources/avatar.png" />"/></div>
                <div class="p-2 border-left">
                    <div class="row">
                        <div class="col-12">${user.username}</div>
                        <div class="col-12">${user.firstname} ${user.lastname}</div>
                        <div class="col-12">Cart (<c:if test="${cart!=null}">${cart.videos.size()}</c:if><c:if test="${cart==null}">0</c:if>)</div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<div class="container bg-light p-3">
    <form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data" >

        <div class="form-group">
            <label for="track_title">Track name</label>
            <input type="text" class="form-control" id="track_title" aria-describedby="Title" placeholder="Enter a title" name="title" required>
            <small id="Title" class="form-text text-muted">Choose something catchy</small>
        </div>

        <div class="form-group">
            <label for="track_description">Track description</label>
            <textarea class="form-control" id="track_description" placeholder="Write a description" name="description"></textarea>
        </div>

        <div class="form-group">
            <label for="track_description">Track price</label>
            <input type="numeric" class="form-control" id="track_price" placeholder="Choose a price" name="price">
        </div>
        <div class="form-group">
            <label for="exampleFormControlFile1">File Input</label>
            <input type="file" name="file" class="form-control-file" id="exampleFormControlFile1" accept=".mp3" required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Upload</button>
        </div>

    </form>

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