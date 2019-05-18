<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="bg-dark border-bottom">
    <nav class="navbar navbar-expand-lg navbar-dark container">
        <div class="d-flex justify-content-around">
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

            <button class="hamburger hamburger--slider navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="filter:invert(1);">
              <span class="hamburger-box">
                <span class="hamburger-inner"></span>
              </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link <c:if test="${route=='home'}">active</c:if>" href="/home">Home <span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <c:if test="${route=='upload'}">active</c:if>" href="/upload">Upload <span class="sr-only"></span></a>
                    </li>
                    <c:if test="${user.admin}">
                        <li class="nav-item">
                            <a class="nav-link <c:if test="${route=='admin'}">active</c:if>" href="/admin">Admin Panel<span class="sr-only"></span></a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link <c:if test="${route=='account'}">active</c:if>" href="/account">Account <span class="sr-only"></span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout <span class="sr-only"></span></a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
</div>
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