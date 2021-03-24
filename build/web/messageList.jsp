<%-- 
    Document   : messageList
    Created on : 16-May-2019, 23:40:17
    Author     : ANA
--%>

<%@page import="controllers.messageDAO"%>
<%@page import="controllers.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.AdDAO"%>
<%@page import="java.util.List"%>
<%@page import="controllers.Ads"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
         <%@include file="/WEB-INF/jspf/header-nav.jspf" %>
        <br><br>
        <h2 id="h2">Messages</h2> <br><br>
        <%    
              //String id=request.getParameter("id");  
              //request.setAttribute("id", id);
            String user = (String) request.getSession().getAttribute("USER");
             List<Message> messages=messageDAO.getInstance().getMessages(user); 
for(Message message : messages){
    if(user.equals(message.getSender())){  
%>

<div class="container darker">
    <%out.println(message.getReceiver());%><br>
    <span class="read-right"><a href="messageFromList.jsp?ad=<%out.println(message.getAd());%>&user=<%out.println(message.getReceiver());%>">Read more...</a></span>
</div>
<%}
else{
%>

<div class="container darker">
  <%out.println(message.getSender());%><br>
  
  <span class="read-right"><a href="messageFromList.jsp?ad=<%out.println(message.getAd());%>&user=<%out.println(message.getSender());%>">Read more...</a></span>
</div>


  <%}}%>
<%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>



