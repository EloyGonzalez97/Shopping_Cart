<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
  <header class="s-header header">
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
            
                <li> <a href="http://localhost:8080/products"> Shop Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/manage"> Manage Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/cart"> View Cart </a></li>
		<li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
            </ul> <!-- end header__nav -->
        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    <section  class="s-content s-content--narrow">
        <div class="col-full s-content__main">
          <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
          <c:if test="${pageContext.request.userPrincipal.name != null}">
              <h1 style="font-size: 4rem;">Welcome ${pageContext.request.userPrincipal.name}</h1>
              <br>
              <br>
              <h2> Shop or list items to be bought and sold.</h2>
          </c:if>
        </div>
    </section>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>