<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lambda - Home</title>

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
                        <div class="col-12 revealer cursor-pointer ">Cart (<c:if test="${cart!=null}">${cart.videos.size()}</c:if><c:if test="${cart==null}">0</c:if>)
                            <div class="hidden-element shadow-lg pr-4 pl-2 border">
                                <c:if test="${cart==null}">
                                    <span>Your cart is empty</span>
                                </c:if>
                                <c:if test="${cart!=null}">
                                <ul class="list-unstyled">
                                    <c:forEach items="${cart.videos}" var="video">
                                        <li>${video.title} - ${video.price}</li>
                                    </c:forEach>
                                </ul>
                                </c:if>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<div class="container bg-light p-3">
    <div class="row p-3">
        <p class="col-12 text-dark mb-0 py-2">Lastest Uploads</p>
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
                <div class="col-6"><form enctype="application/x-www-form-urlencoded" method="post" action="/approve"><input type="hidden" value="${video.getId()}" name="product_id"/> <button class="btn btn-dark w-100 btn-sm">Approve</button></form><i class="shiny"></i></div>
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