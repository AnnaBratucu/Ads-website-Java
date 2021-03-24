<%-- 
    Document   : cars
    Created on : 19-May-2019, 13:54:51
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


        <h2 id="h2">List of Ads</h2> <br><br>
        <form method="post" action="search.jsp">
            <div class="right-inner-addon">
                <i class="fa fa-search"></i>
                <input type="text" name="search" id="myInput" placeholder="Search for ads..." title="Type in an ad">
            </div>
        </form><br>
        <table class="adList">
            <tr>
                <th>Ad Name</td>
                <th>Ad Description</td>
                <th>Ad Date</td>
                <th>Ad Category</td>
                <th>Options</td>
            </tr>
            <% List<Ads> ads = AdDAO.getInstance().getCarsAds();
                String user = (String) request.getSession().getAttribute("USER");
                for (Ads ad : ads) {
                    String id = ad.getId();%>
            <tr>
                <td><% out.println(ad.getName()); %></td>
                <td><% out.println(ad.getDescription()); %></td>
                <td><% out.println(ad.getDate()); %></td>
                <td><% out.println(ad.getCategory()); %></td>
                <td><a href="view.jsp?id=<%out.println(id);%>" title="View Ad"><i class="fa fa-eye" style="color:#3d3d5c;"></i></a>
                        <%if (user.equals(ad.getUser())) {%>
                    <a href="edit.jsp?id=<%out.println(id);%>" title="Edit Ad"><i class="fa fa-edit" style="color:#3d3d5c;"></i></a>
                    <a href="DeleteController?id=<%out.println(id);%>" title="Delete Ad"><i class="fa fa-trash" style="color:#3d3d5c;text-shadow:1px 1px 2px #000000;"></i></a>
                        <%}%>
                </td>
            </tr>
            <% }%>
        </table>


        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, 'home.jsp');
            }
        </script>
    </body>
</html>

