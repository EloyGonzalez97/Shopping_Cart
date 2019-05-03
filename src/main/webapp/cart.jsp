<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Shopping Cart</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/main.css" rel="stylesheet">
</head>
<body>
 <header class="s-header header">
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
            
                <li> <a href="http://localhost:8080/"> Home </a></li>
                <li> <a href="http://localhost:8080/products"> Shop Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/manage"> Manage Products </a></li>
                <li><a href="http://localhost:8080/${pageContext.request.userPrincipal.name}/cart"> View Cart </a></li>
            </ul> <!-- end header__nav -->
        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    <section  class="s-content s-content--narrow">   
        <div class="col-full s-content__main"> 
      <h2> ${pageContext.request.userPrincipal.name}'s Cart </h2>
      <ul style = "display: inline;">
      <c:forEach items="${cart.products}" var="product">
        <form method="POST" action="${contextPath}/${pageContext.request.userPrincipal.name}/cart/${product.id}" class="form-signin">
            <li> 
                <h3>${product.name}</h2>
                <h5>Price: ${product.price} </h5>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Remove</button>
            </li>
        </form>
                <div>
                <h5> Quantity: <button onclick="decrement(this)">-</button><h4 id = "quantity" class = "q">1</h4><button onclick="increment(this)">+</button></h5>
                </div>
                <p id = "product" hidden>${product.quantity}</p></h5>
      </c:forEach>
      </ul>
      <input type ="submit" onclick="postCart()" value = "Proceed To Checkout"></input>
               
  </div>
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>
        var counter = 1;
        function decrement(param){
            var counter = parseInt(param.parentElement.parentElement.children[1].innerText);
            if(counter > 1){
                counter--;
                param.parentElement.parentElement.children[1].innerText = counter.toString();
            }
        }
        function increment(param){
            var counter = parseInt(param.parentElement.children[1].innerText);
            if(counter < parseInt(document.getElementById("product").innerText)){
                counter++;
                param.parentElement.children[1].innerText = counter.toString();
            }
        }
        function postCart(){
            var quantities = document.getElementsByClassName("q");
            var listQ = [];
            for(var i = 0; i < quantities.length; i++){
                //console.log(quantities[i].innerText);
                listQ.push(parseInt(quantities[i].textContent));
            }
            console.log(listQ);
            $.ajax({
                type: "POST",
                url: window.location.href,
                data: JSON.stringify(listQ),
                contentType: "application/json; charset=utf-8",
                success : function(data, status, xhr){
                    window.location.href = 'http://localhost:8080/${pageContext.request.userPrincipal.name}/checkout';
                
                },
                error: function(xhr, status, error){
                    console.log(error);
                }
            });
        }
    </script>
</body>
</html>