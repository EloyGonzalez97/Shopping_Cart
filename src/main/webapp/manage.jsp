<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Products</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
 <header class="s-header header">
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
            
                <li> <a href="http://localhost:8080/"> Home </a></li>
                <li><a href="http://localhost:8080/products"> Shop Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/cart"> View Cart </a></li>
            </ul> <!-- end header__nav -->
        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    <section  class="s-content s-content--narrow">   
        <div class="col-full s-content__main">   
      <h2>Products</h2>
    <c:forEach items="${products}" var="product">
        <li><a href = "${contextPath}/${pageContext.request.userPrincipal.name}/manage/${product.id}">${product.name}</a></li>
    </c:forEach>
    <input type="submit" onclick = "location.href = '${contextPath}/${pageContext.request.userPrincipal.name}/create'" value = "Create Product" ></input>
  </div>
    </section>
</body>
</html>