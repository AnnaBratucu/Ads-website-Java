<%-- 
    Document   : register
    Created on : 06-Apr-2019, 22:39:26
    Author     : ANA
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="js/register.js"></script>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <form class="login-form" method="post" action="RegistrationController">
                    <span id="uname_error" class="eror-span" style="color:red;"></span>
                    <input type="text" name="username" id="username" placeholder="name" required/>
                    <span id="uname_error" class="eror-span"></span>
                    <input type="password" name="password" placeholder="password" required/>
                    <input type="text" name="email" placeholder="email address" required/>
                    <select name="type">
                        <option value="seller">Seller</option>
                        <option value="client">Client</option>
                    </select>
                    <button id="myBtn">create</button>
                    <p class="message">Already registered? <a href="index.jsp">Sign In</a></p>

                </form>
            </div>
        </div>
    </body>
</html>
