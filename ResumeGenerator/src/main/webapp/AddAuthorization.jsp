<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.constants.GlobalConstants"%>
<%@page import="org.beans.Authorization"%>
<%@page import="org.sessions.AuthorizationSessionConstant"%><%
	Authorization auth = new Authorization();
	auth.setStatus(request.getParameter(AuthorizationSessionConstant.STATUS));
	auth.setCountry(request.getParameter(AuthorizationSessionConstant.COUNTRY));
        auth.setIssuedBy(request.getParameter(AuthorizationSessionConstant.ISSUEDBY));
        

        session.setAttribute(GlobalConstants.AUTHRO_DETAILS, auth);
	response.sendRedirect("EducationalDetails.jsp");
        
%>