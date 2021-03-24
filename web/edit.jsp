<%-- 
    Document   : edit
    Created on : 12-May-2019, 13:32:30
    Author     : ANA
--%>

<%@page import="controllers.AdDAO"%>
<%@page import="controllers.Ads"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header-nav.jspf" %>
        <br><br>
        <h2 id="h2">Edit Ad</h2> <br><br>
        <%    
              String id=request.getParameter("id");  
            
             List<Ads> ads=AdDAO.getInstance().getIdAd(Integer.parseInt(id)); 
for(Ads ad : ads){%>
        <div class="form">
        <form class="login-form" method="post" action="EditController?id=<%out.println(id);%>" enctype="multipart/form-data">
                    <input type="text" name="name" placeholder="Ad title" value='<% out.println(ad.getName()); %>' required/>
                    <textarea name="description" placeholder="Ad description" required/><% out.println(ad.getDescription()); %></textarea>
        <%if(ad.getCategory().equals("house and garden")){%>
                    <select name="category" required>
                        <option value="house and garden" selected>House and Garden</option>
                        <option value="electronics">Electronics</option>
                        <option value="cars">Cars</option>
                        <option value="books">Books</option>
                    </select>
        <%}%>
        
        <%if(ad.getCategory().equals("electronics")){%>
                    <select name="category" required>
                        <option value="house and garden">House and Garden</option>
                        <option value="electronics" selected>Electronics</option>
                        <option value="cars">Cars</option>
                        <option value="books">Books</option>
                    </select>
        <%}%>
        
        <%if(ad.getCategory().equals("cars")){%>
                    <select name="category" required>
                        <option value="house and garden">House and Garden</option>
                        <option value="electronics" >Electronics</option>
                        <option value="cars" selected>Cars</option>
                        <option value="books">Books</option>
                    </select>
        <%}%>
        
        <%if(ad.getCategory().equals("books")){%>
                    <select name="category" required>
                        <option value="house and garden">House and Garden</option>
                        <option value="electronics" >Electronics</option>
                        <option value="cars" >Cars</option>
                        <option value="books" selected>Books</option>
                    </select>
        <%}%>
                    <input type="text" name="price" placeholder="Price" value='<% out.println(ad.getPrice()); %>' required/>
                    <input type="file" name="file" id="file" placeholder="File" value='<% out.println(ad.getFileName()); %>' required/> <br/>
                    <img src="img/<% out.println(ad.getFileName()); %>" style="width: 200px; height: 150px;"><br>
                    <input type="text" placeholder="Destination" value="C:\Users\ANA\Documents\NetBeansProjects\projectWAD\web\img" name="destination" required/>             
<!--                    <input type="submit" value="Save Ad"/>-->
                    <button>Save Ad</button>
        </form>
        </div>
        <%} %>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
