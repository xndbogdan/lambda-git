<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" type="image/png" href="<c:url value="/resources/logo.png" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/home.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/hamburgers.css"/>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body style="min-height:100vh;" class="bg-dark">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom">
    <a class="navbar-brand" href="/home">
        <div class="row">
            <div class="col d-flex center-vertically">
                <img class="img-fluid d-flex center-vertically" style="width:40px; height: 35px;" src="<c:url value="/resources/logo.png" />">
            </div>
            <div class="col d-flex center-vertically">
                <span class="d-flex center-vertically">Lambda</span>
            </div>
        </div>

    </a>

    <button class="hamburger hamburger--elastic navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="filter:invert(1);">
      <span class="hamburger-box">
        <span class="hamburger-inner"></span>
      </span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/home">Home <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout <span class="sr-only"></span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="work in progress" aria-label="Search" DISABLED>
            <button class="btn btn-outline-danger my-2 my-sm-0" type="submit" disabled>Search</button>
        </form>
    </div>
</nav>

<div class="border-bottom">
    <div class="container">
        <c:if test="${not empty user}">
            <div class="d-flex flex-row bg-dark text-light">
                <div class="p-2 d-flex"><img class="img-fluid rounded d-flex center-vertically" style="height:60px; margin:auto;" src="<c:url value="/resources/avatar.png" />"/></div>
                <div class="p-2 border-left">
                    <div class="row">
                        <div class="col-12">${user.username}</div>
                        <div class="col-12">${user.firstname} ${user.lastname}</div>
                        <div class="col-12">Cart (0)</div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<div class="container">
    <div class="row">
        <p class="col-12 text-light mb-0 py-2">Lastest Uploads</p>
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
                <div class="col-6"><button class="btn btn-success w-100 btn-sm">Buy</button><i class="shiny"></i></div>
            </div>
        </div>
        </c:forEach>
    </div>

</div>



<script
        src="http://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/audiojs/audio.min.js" />"></script>
<script>
    audiojs.events.ready(function() {
        var as = audiojs.createAll();
    });
</script>
<script>
    // Look for .hamburger
    var hamburger = document.querySelector(".hamburger");
    // On click
    hamburger.addEventListener("click", function() {
        // Toggle class "is-active"
        hamburger.classList.toggle("is-active");
        // Do something else, like open/close menu
    });
</script>

</body>
</html>