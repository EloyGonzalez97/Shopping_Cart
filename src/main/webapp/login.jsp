
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Log in with your account</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>

  <body>
      
    <style>
        
        html {
            height: 100%;
        }

        body {
            min-height: 100%;
            background: #1d8cf0;  /* fallback for old browsers */
            background: -webkit-linear-gradient(0deg, #1d8cf0, #68b5f9);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(0deg, #1d8cf0, #68b5f9); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            font-family: Avenir, "Avenirr", sans-serif;
        }

        .wrapper {
            left: 0;
            margin-left: auto;
            margin-right: auto;
            position: absolute;
            right: 0;
            margin-top: 20px;
            width: 300px;
            background: #ffffff;
            border-radius: 7px;
            border-top: 3px solid #d32223;
            padding: 13px;
            box-shadow: 0 2px 12px rgba(0, 6, 12, 0.3);
            padding: 13px 13px 18px;
        }

        .wrapper h1, .wrapper h2 {
            color: #505050;
            font-weight: 100;
            margin: 6px auto;
            text-align: center;
        }

        .wrapper .error {
            color: #505050;
            font-size: 12px;
            margin: 0 auto;
            text-align: center;
        }

        form input:not([type=submit]) {
            border-radius: 0px;
            border: 1px solid lightgrey;
            display: block;
            font-size: 14px;
            margin: -1px auto;
            max-width: 65%;
            padding: 10px 5px;
            width: 191px;
            -webkit-appearance: none;

        }

        form input:not([type=submit]):first-child {
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-left: none;
            border-top: none;
            border-right: none;
        }

        form input:not([type=submit]):nth-child(2) {
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
            border-left: none;
            border-right: none;
            border-bottom: none;
        }

        form input:not([type=submit]):focus {
            outline: none;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 30px white inset;
        }

        form input[type=submit] {
            border-radius: 4px;
            color: white;
            border: 1px solid #449df5;
            cursor: pointer;
            display: block;
            font-size: 16px;
            margin: 11px auto 0 auto;
            padding: 7px 17px;
            background: #449ef5;
            width: 221.4px;
            transition: all 0.25s ease;
            -webkit-appearance: none;
        }

        form input[type=submit]:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 12px rgba(0, 6, 12, 0.3);
        }

        a {
            color: #505050;
            font-size: 14px;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .social {
            opacity: 0.01;
        font-size: 2px;
        padding: 0;
        margin: 0;
        width: 10px;
        position: absolute;
        }
    
    </style>
    <div class="wrapper">
      <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div>
            <span>${message}</span>
            <input name="username" type="text" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="submit" value = "Log In"/>
            <p style="text-align: center;"><a href="${contextPath}/registration">Create an account</a></p>
        
        </div>
      </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>
</html>