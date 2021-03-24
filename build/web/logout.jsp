<%-- 
    Document   : logout
    Created on : 07-Apr-2019, 09:10:20
    Author     : ANA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
         <%
            String username = (String)session.getAttribute("username");
            if(username!=null)
            out.print("Goodbye " + username);
            //out.print(session.getId());
            session.setAttribute("username", null);
            
            %>
    </body>
</html>
