<%-- 
    Document   : View
    Created on : Jul 2, 2016, 5:08:31 PM
    Author     : RS-Kiran
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="org.dao.UserService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="form" >
        <%
            UserService us = new UserService();
            ResultSet resultset = us.getProfiles();
        %>
        <form action="ViewResume.jsp">
            <TABLE border="100"  style="background: #FFFFCC;" >
                <TR>
                    <TH>ID</TH>
                    <TH>Name</TH>
                    <TH>View</th>
                </TR>
                <% while (resultset.next()) {%>
                <TR>
                    <TD> <%= resultset.getString(1)%></td>
                    <TD> <%= resultset.getString(2)%></TD>
                    <TD><input type="radio" name="view" value="'<%= resultset.getString(1)%>'" </TD>
                </TR>
                <% }%>

                <tr>
                    <td><input type="submit" value="submit"/></td>
                    <td></td>
                    <td> <input type="button" value="back" onclick="myFunction()" /></td>

                </tr>
            </TABLE>
        </form>

    </body>
    <script>
        function myFunction() {
            window.location.href = "HomePage.jsp";
        }
    </script>
</html>
