<%@page import="org.beans.Authorization.VisaTypes"%>
<%@page import="org.sessions.AuthorizationSessionConstant"%>
<%@page import="org.beans.Authorization"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.dao.UserService"%>
<%@page import="org.constants.GlobalConstants"%>
<%@page import="org.sessions.BookSessionConstant"%>
<%@page import="org.beans.Book"%>
<%@page import="org.sessions.ParticipationSessionConstant"%>
<%@page import="org.beans.Participation.ParticipationName"%>
<%@page import="org.beans.Participation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Participation</title>
</head>
    <style>
        .form-item {
            color: #1F45FC;
            background: #FFEBCD;
            padding: 7px 10px 9px;
        }
        </style>
<body class="form-item">
	<jsp:include page="Menu.jsp"/>
		<fieldset>
			<legend>Authorization Details</legend>
			<table style="text-align: center; width: 100%;" align="center" border="1" cellspacing="0">
				<tr>
					<th>Work Authorization</th>
					<th>Country</th>
					<th>Passport Issued By</th>
				</tr>
			</table>
		<br>
			<form method="post" action="AddAuthorization.jsp">
			<table>
				<tr>
					<td>Type of Authorization-</td>
					<td><select
						name="<%=AuthorizationSessionConstant.STATUS%>">
							<%
								for(Authorization.VisaTypes p : VisaTypes.values()){
							%>
							<option value="<%=p.name()%>">
								<%=p.name()%>
							</option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Country :-</td>
					<td><input type="text"
						name="<%=AuthorizationSessionConstant.COUNTRY%>"></td>
				</tr>
                        <tr>
					<td>Issued by :-</td>
					<td><input type="text"
						name="<%=AuthorizationSessionConstant.ISSUEDBY%>"></td>
				</tr>
				<tr>
					<td></td> 
					<td colspan="2"><input type="submit" value="Next" name="next" /></td>
					<td></td><td></td><td></td>
					<td><input type="reset" value="Reset" /></td>
				</tr>
			</table>
			</form>
		</fieldset>
	
</body>
</html>