<%-- 
    Document   : addView
    Created on : 22-Apr-2019, 17:02:52
    Author     : ANA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header-nav.jspf" %>
        <br><br>
        <h2 id="h2">Add new Ad</h2> <br><br>
        <div class="form">
        <form class="login-form" method="post" action="AddController" enctype="multipart/form-data">
                    <input type="text" name="name" placeholder="Ad title" required/>
                    <textarea name="description" placeholder="Ad description" required/></textarea>
                    <select name="category">
                        <option value="house and garden">House and Garden</option>
                        <option value="electronics">Electronics</option>
                        <option value="cars">Cars</option>
                        <option value="books">Books</option>
                    </select>
                    <input type="text" name="price" placeholder="Price" required/>
                    <input type="file" name="file" id="file" placeholder="File" /> <br/>
                    <input type="text" placeholder="Destination" value="C:\Users\ANA\Documents\NetBeansProjects\projectWAD\web\img" name="destination"/>             
<!--                    <input type="submit" id="submit" value="Add"/>-->
<button>Add</button>
        </form>
        </div>
      <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
