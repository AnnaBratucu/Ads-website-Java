<%-- 
    Document   : premium
    Created on : 16-May-2019, 16:27:42
    Author     : ANA
--%>

<%@page import="controllers.UserDAO"%>
<%@page import="controllers.Users"%>
<%@page import="controllers.Ads"%>
<%@page import="controllers.AdDAO"%>
<%@page import="controllers.AdDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header-nav.jspf" %>

        <h2 style="text-align:center">Subscribing plans</h2>
        <p style="text-align:center">Subscribe now for more advantages!</p>
        <div class="all">
            <%  String user = (String) request.getSession().getAttribute("USER");
                List<Users> users = UserDAO.getInstance().getUser(user);
                
            for (Users userr : users) {%>
            
            <form method="post" action="SubscribeController?subscr=2basic&id=<%out.println(userr.getId());%>">
                <div class="columns">
                    <ul class="price">
                        <li class="header">Basic</li>
                        <li class="grey">$ 9.99</li>
                        <li>6 months</li>
                        <li>Good Promotion</li>
                        <li>Cannot hide rating</li>
                        <li class="grey"><button class="button">Subscribe</button></li>
                    </ul>
                </div>
            </form>
            <form method="post" action="SubscribeController?subscr=1premium&id=<%out.println(userr.getId());%>">
                <div class="columns">
                    <ul class="price">
                        <li class="header">Premium</li>
                        <li class="grey">$ 29.99</li>
                        <li>A year</li>
                        <li>Best priority for promotion</li>
                        <li>Can hide rating</li>
                        <li class="grey"><button class="button">Subscribe</button></li>
                    </ul>
                </div>
            </form>
            <%}%>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
