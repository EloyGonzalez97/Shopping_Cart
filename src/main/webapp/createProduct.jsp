<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/manage"> Manage Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/cart"> View Cart </a></li>
            </ul> <!-- end header__nav -->
        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    <section  class="s-content s-content--narrow">   
        <div class="col-full s-content__main"> 
      <form:form method="POST" modelAttribute="productForm" class="form-signin">
            <h2 class="form-signin-heading">Create the product</h2>
            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="name" class="form-control" placeholder="Product Name"
                                autofocus="true"></form:input>   
                </div>
            </spring:bind>

            <spring:bind path="price">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="number" step="0.01" path="price" class="form-control" placeholder="Product Price"></form:input>
                </div>
            </spring:bind>

            <spring:bind path="quantity">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="number" path="quantity" class="form-control"
                                placeholder="Product Quantity"></form:input>
                </div>
            </spring:bind>

            <input type="submit" value="Add Product"></button>
        </form:form>
  </div>
    </section>
</body>
</html>