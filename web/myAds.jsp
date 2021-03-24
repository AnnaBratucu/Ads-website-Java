<%-- 
    Document   : myAds
    Created on : 11-May-2019, 16:49:34
    Author     : ANA
--%>

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
        <h2 id="h2">My Ads</h2> <br><br>
        <form method="post" action="searchMe.jsp">
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
                <th>Price</td>
                <th>Options</td>
            </tr>
            <%  String user = (String) request.getSession().getAttribute("USER");
                List<Ads> ads = AdDAO.getInstance().getMyAds(user);
                List<String> ids = new ArrayList();
                for (Ads ad : ads) {%>
            <tr>
                <td><% out.println(ad.getName()); %></td>
                <td><% out.println(ad.getDescription()); %></td>
                <td><% out.println(ad.getDate()); %></td>
                <td><% out.println(ad.getCategory()); %></td>
                <td><% out.println(ad.getPrice()); %></td>
                <td>
                    <%  String id = ad.getId();

                        ids.add(id);
                        //out.println(ids);
                        request.getSession().setAttribute("ids", ids); %>
                    <a href="view.jsp?id=<%out.println(id);%>" title="View Ad"><i class="fa fa-eye" style="color:#3d3d5c;"></i></a>
                    <a href="edit.jsp?id=<%out.println(id);%>" title="Edit Ad"><i class="fa fa-edit" style="color:#3d3d5c;"></i></a>
                    <a href="DeleteController?id=<%out.println(id);%>" title="Delete Ad"><i class="fa fa-trash" style="color:#3d3d5c;text-shadow:1px 1px 2px #000000;"></i></a>


                </td>

            </tr>
            <% }%>
        </table>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, 'myAds.jsp');
            }
        </script>
    </body>
</html>

