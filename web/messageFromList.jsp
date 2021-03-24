<%-- 
    Document   : messageFromList
    Created on : 17-May-2019, 08:29:49
    Author     : ANA
--%>

<%@page import="controllers.Message"%>
<%@page import="java.util.List"%>
<%@page import="controllers.messageDAO"%>
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
              //String message1=request.getParameter("message");
        String ad=request.getParameter("ad");  
        String user_ad=request.getParameter("user");   
        String user = (String) request.getSession().getAttribute("USER");
        
        //messageDAO.getInstance().InsertMessage(message1, user, user_ad, ad);  
              //request.setAttribute("id", id);
            //String user = (String) request.getSession().getAttribute("USER");
             List<Message> messages=messageDAO.getInstance().getMessage(user,ad); 
for(Message message : messages){
if(user.equals(message.getSender())){    
%>

<div class="container">
  <%out.println(message.getSender());%>
  <p><%out.println(message.getContent());%></p>
  <span class="time-right"><%out.println(message.getDate());%></span>
</div>
<%}
else{
%>

<div class="container darker">
  <%out.println(message.getSender());%>
  <p><%out.println(message.getContent());%></p>
  <span class="time-left"><%out.println(message.getDate());%></span>
</div>



  <%}}
  %>
  <div class="form">
        <form class="login-form" method="post" action="message.jsp?ad=<%out.println(ad);%>&user=<%out.println(user_ad);%>">
            <textarea name="message" placeholder="Message..."/></textarea>
                      
            <input type="submit" value="Send Message"/>
        </form>
  </div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>