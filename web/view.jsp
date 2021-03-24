<%-- 
    Document   : edit
    Created on : 12-May-2019, 00:28:11
    Author     : ANA
--%>

<%@page import="controllers.rateDAO"%>
<%@page import="controllers.Rate"%>
<%@page import="java.util.ArrayList"%>
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
        <h2 id="h2">View Ad</h2> <br><br>
        <%
            String id = request.getParameter("id");
            //request.setAttribute("id", id);
            String user = (String) request.getSession().getAttribute("USER");
            List<Ads> ads = AdDAO.getInstance().getIdAd(Integer.parseInt(id));
            List<Rate> rates = rateDAO.getInstance().getRating(id);
            for (Ads ad : ads) {%>
        <div class="form">
            <form class="login-form" method="post" action="edit.jsp?id=<%out.println(id);%>" enctype="multipart/form-data">
                <input type="text" name="name" placeholder="Ad title" value='<% out.println(ad.getName()); %>' disabled/>
                <textarea name="description" placeholder="Ad description" disabled/><% out.println(ad.getDescription()); %></textarea>
                <%if (ad.getCategory().equals("house and garden")) {%>
                <select name="category" disabled>
                    <option value="house and garden" selected>House and Garden</option>
                    <option value="electronics">Electronics</option>
                    <option value="cars">Cars</option>
                    <option value="books">Books</option>
                </select>
                <%}%>

                <%if (ad.getCategory().equals("electronics")) {%>
                <select name="category" disabled>
                    <option value="house and garden">House and Garden</option>
                    <option value="electronics" selected>Electronics</option>
                    <option value="cars">Cars</option>
                    <option value="books">Books</option>
                </select>
                <%}%>

                <%if (ad.getCategory().equals("cars")) {%>
                <select name="category" disabled>
                    <option value="house and garden">House and Garden</option>
                    <option value="electronics" >Electronics</option>
                    <option value="cars" selected>Cars</option>
                    <option value="books">Books</option>
                </select>
                <%}%>

                <%if (ad.getCategory().equals("books")) {%>
                <select name="category" disabled>
                    <option value="house and garden">House and Garden</option>
                    <option value="electronics" >Electronics</option>
                    <option value="cars" >Cars</option>
                    <option value="books" selected>Books</option>
                </select>
                <%}%>
                <input type="text" name="price" placeholder="Price" value='<% out.println(ad.getPrice()); %>' disabled/>
                <input type="text" name="file" id="file" placeholder="File" value='<% out.println(ad.getFileName()); %>' disabled/> <br/>
                <img src="img/<% out.println(ad.getFileName()); %>" style="width: 200px; height: 150px;"><br>
                <input type="text" placeholder="Destination" value="C:\Users\ANA\Documents\NetBeansProjects\lab7WADtry\web\img" name="destination" disabled/>
                <p><% out.println(ad.getDate()); %></p>
                <% if (ad.getUser().equals(user)) { %>
                <!--                    <input type="submit" value="Edit Ad"/>-->
                <%if (!rates.isEmpty()) {
                        for (Rate rate : rates) { %>
                <p>Rating: <%out.println(rate.getScore());%></p>
                <%}
                } else {%>
                <p>Rating: 0</p>
                <%}%>
                <button>Edit Ad</button>
                <%}
                    if (!ad.getUser().equals(user)) { %>
                <form>

                </form>
                <!--                    <div class="form">-->
                <form class="login-form" method="post" action="message.jsp?ad=<%out.println(id);%>&user=<%out.println(ad.getUser());%>">
                    <textarea name="message" placeholder="Message <%out.print(ad.getUser());%>..."/></textarea>

                    <!--                    <input type="submit" value="Send Message"/>-->
                    <button>Send Message</button>
                </form><br>
                <!--                    </div>-->
                <%if (!rates.isEmpty()) {
        for (Rate rate : rates) { %>
                <p>Rating: <%out.println(rate.getScore());%></p>
                <%}
                    } else{%>
                    <p>Rating: 0</p><%}%>
                <div class="form">

                    <form class="login-form" method="post" action="rateController?ad=<%out.println(id);%>&user=<%out.println(ad.getUser());%>">
                        <div class="ab"><input type="radio" name="rate" value="1"> 1</div>
                        <div class="ab"><input type="radio" name="rate" value="2"> 2</div>
                        <div class="ab"><input type="radio" name="rate" value="3"> 3</div>
                        <div class="ab"><input type="radio" name="rate" value="4"> 4</div>
                        <div class="ab"><input type="radio" name="rate" value="5"> 5</div>

                        <button>Rate Ad</button>
                    </form>
                </div>



                <%}%>


            </form>
        </div>
        <%}%>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
