<%@page import="org.beans.Authorization"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.beans.References"%>
<%@page import="org.beans.Projects"%>
<%@page import="org.beans.Achievements"%>
<%@page import="org.beans.ExpertActivities"%>
<%@page import="org.beans.Membership"%>
<%@page import="org.beans.Participation"%>
<%@page import="org.beans.Book"%>
<%@page import="org.beans.Conference"%>
<%@page import="org.beans.Journal"%>
<%@page import="org.beans.Experience"%>
<%@page import="org.beans.Education"%>
<%@page import="org.beans.Personal"%>
<%@page import="org.constants.GlobalConstants"%>
<%@page import="org.dao.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	UserService us = new UserService();
        HttpSession sess = request.getSession();
	Personal personal = (Personal) session.getAttribute(GlobalConstants.PERSONAL_DETAILS);
	ArrayList<Education> education = GlobalConstants.educations;
	ArrayList<Experience> experience = GlobalConstants.experiences;
	ArrayList<Achievements> achieve = GlobalConstants.achievements;
	ArrayList<Projects> project = GlobalConstants.projects;
	ArrayList<References> ref = GlobalConstants.references;
        Authorization auth = (Authorization) session.getAttribute(GlobalConstants.AUTHRO_DETAILS);
	try {
		us.insertPersonalDetails(personal);
                us.insertEducationalDetails(education);
		us.insertExperiences(experience);
		us.insertAchievement(achieve);
		us.insertProject(project);
		us.insertReference(ref);
                us.inserAuthorization(auth);
                GlobalConstants.MESSAGE = "Saved Successfully... Click 'Print Resume' to View Preview & Print";
	} catch(Exception ex) {
		out.println("Error in Insertion = "+ex);
		ex.printStackTrace();
		GlobalConstants.MESSAGE = "Error - "+ex+"... Try Again...";
	}
	response.sendRedirect("HomePage.jsp");
%>
</body>
</html>