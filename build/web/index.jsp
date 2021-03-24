<%-- 
    Document   : index
    Created on : 06-Apr-2019, 22:26:06
    Author     : ANA
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
    </head>
    <body>

        <div class="login-page">
            <div class="form">
                <form class="login-form" method="post" action="LoginController">
                    <span id="uname_error" class="eror-span" style="color:red;"></span>
                    <input type="text" id="username" name="username" placeholder="username" required/>
                    <input type="password" name="password" placeholder="password" required/>
                    <button id="myBtn">login</button>
                    <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
