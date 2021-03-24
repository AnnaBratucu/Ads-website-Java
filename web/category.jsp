<%-- 
    Document   : category.jsp
    Created on : 19-May-2019, 12:38:29
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


        <h2 id="h2">Categories</h2> <br><br>

        <div class="w3-row-padding">
            <div class="w3-half">
                <div class="tooltip">
                    <a href="cars.jsp"><img src="img/car.jpg" style="height: 280px;width:52%" alt="Cars"></a>
                    <span class="tooltiptext">Cars</span>
                </div>
                <div class="tooltip">
                    <a href="house.jsp"><img src="img/house.jpg" style="height: 280px;width:47%" alt="House and Garden"></a>
                    <span class="tooltiptext">House and Garden</span>
                </div>
            </div>

            <div class="w3-half" id="secondrow">
                <div class="tooltip">
                    <a href="books.jsp"><img src="img/book.jpg" style="height: 280px;width:52%" alt="Books"></a>
                    <span class="tooltiptext">Books</span>
                </div>
                <div class="tooltip">
                    <a href="electronics.jsp"><img src="img/laptop.jpg" style="height: 280px;width:52%" alt="Electronics"></a>
                    <span class="tooltiptext">Electronics</span>
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, 'category.jsp');
            }
        </script>
    </body>
</html>

