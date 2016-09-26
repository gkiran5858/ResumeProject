<%@page import="org.constants.GlobalConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resume Builder</title>
</head>
<body>
    <center><b><%=GlobalConstants.MESSAGE%></b></center>
    <!--    <table bgcolor="blue" align="right" border="1"> 
            <tr>
            <a href="PersonalDetails.jsp" > Fill Resume </a> <br></tr>
            <tr> <a href="View.jsp"> View Resume</a> </tr>
        </table>
        -->
        
        <div class="new-login-right">
           <!-- <h3><center><b><%=GlobalConstants.MESSAGE%></b></center></h3> -->
    <div class="form-item">
        <table>
        <tbody><tr>
                    <td class="vm">
                <div>
                    <a href="PersonalDetails.jsp" > Fill Resume </a> <br>
                </div>
                <div>
                    <a href="View.jsp"> View Resume</a>
                </div>
            </td>
        </tr>
        </tbody></table>
    </div>
</body>
<style>
.new-login-right {
    width: 275px;
    margin-right: 70px;
    float: left;
    display: inline-block;
    vertical-align: top;
}

.form-item {
    color: #848d95;
    background: #f9f9f9;
    border: 1px solid #d4d4d4;
    box-shadow: -1px 1px #f2f2f2;
    padding: 7px 10px 9px;
}

.vm {
    vertical-align: middle;
}
    
</style>
</html>