<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="">
    <div class="container ">
        <c:if test="${not empty user}">
            <div class="d-flex flex-row bg-white text-dark">
                <div class="p-2 d-flex"><img class="img-fluid rounded d-flex center-vertically" style="height:60px; margin:auto;" src="<c:url value="/resources/avatar.png" />"/></div>
                <div class="p-2">
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
                                <c:if test="${cart!=null}"><div class="w-100"><a href="/checkout"><button class="btn btn-dark rounded-0" type="submit">Checkout</button></a></div></c:if>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </c:if>
    </div>
</div>