<%@page import="org.beans.References"%>
<%@page import="org.beans.Projects"%>
<%@page import="org.beans.Achievements"%>
<%@page import="org.beans.ExpertActivities"%>
<%@page import="org.beans.Membership"%>
<%@page import="org.beans.Authorization"%>
<%@page import="org.beans.Book"%>
<%@page import="org.beans.Conference"%>
<%@page import="org.beans.Journal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.dao.UserService"%>
<%@page import="org.sessions.ExperienceSession"%>
<%@page import="org.beans.Experience"%>
<%@page import="org.sessions.EducationSession"%>
<%@page import="org.beans.Education"%>
<%@page import="org.constants.GlobalConstants"%>
<%@page import="org.beans.Personal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>*Preview and Prints* - Resume Builder</title>
    </head>
    <body class="form-item" id="image">

        <%
            UserService us = new UserService();
            String id = request.getParameter("view");
            Personal personal = us.getPersonalDetails(id);
            ArrayList<Education> educations = us.getEducationDetails(id);
            ArrayList<Experience> experiences = us.getExperienceDetails(id);
            Authorization participations = us.getAuthroizationDetails(id);
            ArrayList<Achievements> achievements = us.getAchievementDetails(id);
            ArrayList<Projects> projects = us.getProjectDetails(id);
            ArrayList<References> refers = us.getReferencesDetails(id);
        %>
        <form action="control?action=resume" method="post">
            <fieldset>
                <center>
                    <h2>RESUME</h2>
                </center>
                <hr width="200" class="border">

                <center>
                    <h4>Personal Info</h4>
                </center>
                <hr class="border">
                <table align="center" >
                    <tr>
                        <td><b>Mr. <%=personal.getName()%></b></td>
                    </tr>

                    <tr>
                        <td><%=personal.getAddress()%></td>
                    </tr>
                    <tr>
                        <td>Contact no :- <%=personal.getMobileNo()%></td>
                    </tr>
                    <tr>
                        <td>Mail id :- <%=personal.getEmailId()%></td>
                    </tr>

                    <tr>
                        <td>D.O.B :- <%=personal.getDob()%></td>
                    </tr>
                    <tr>
                        <td>Languages known :- <%=personal.getLangaugeProf()%></td>
                    </tr>
                </table>
                <hr class="border">
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My Skills</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%=personal.getSkillSet()%>
                <fieldset>
                    <center>
                        <h4>Work Authorization</h4>
                    </center>
                    <hr class="border">
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Current Status
                        :- </b>
                    <%=participations.getStatus()%><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Authorization in                        :- </b>
                    <%=participations.getCountry()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> Issued Country
                        :- </b>
                        <%=participations.getIssuedBy()%>

                </fieldset>
                <fieldset>
                    <center>
                        <h4>Educational Info</h4>
                    </center>
                    <hr class="border">
                    <%
                        for (int i = 0; i < educations.size(); i++) {
                            Education education = educations.get(i);
                    %>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=i + 1%>)
                        Year <%=education.getYear()%></b> <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b>Education :-</b>
                    <%=education.getDegree()%>
                    In
                    <%=education.getSubject()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b>Institute :-</b>
                    <%=education.getCollegeName()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b>University :-</b>
                    <%=education.getBoard()%>
                    <br>
                    <%
                        }
                    %>
                </fieldset>
                <fieldset>
                    <center>
                        <h4>My Experience</h4>
                    </center>
                    <hr class="border">
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Employment Details</u>
                    </h4>
                    <%
                        for (int i = 0; i < experiences.size(); i++) {
                            Experience experience = experiences.get(i);
                    %>


                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=i + 1%>)
                        <%=experience.getEmployer()%></b><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Designation
                        :- </b>
                        <%=experience.getDesignation()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Experience
                        :- </b>
                        <%=experience.getExperience()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Joining
                        at :- </b>
                        <%=experience.getJoiningDate()%>
                    To
                    <%=experience.getLeavingDate()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Working
                        :- </b>
                        <%=experience.getWorking()%>
                    <br>
                    <%
                        }
                    %>

                </fieldset>
                <fieldset>
                    <center>
                        <h4>Projects</h4>
                    </center>
                    <hr class="border">
                    <%
                        for (int i = 0; i < projects.size(); i++) {
                            Projects project = projects.get(i);
                    %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=i + 1%>)
                        <%=project.getTitte()%> </b><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Front-End
                        :- </b>
                        <%=project.getFrontEnd()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Inputs
                        :- </b>
                        <%=project.getInputs()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Outputs
                        :- </b>
                        <%=project.getOutputs()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>About
                        :- </b>
                        <%=project.getDescription()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Guide
                        :- </b>
                        <%=project.getGuide()%>
                    <br>

                    <%
                        }
                    %>
                </fieldset>

                <fieldset>
                    <center>
                        <h4>Achievements</h4>
                    </center>
                    <hr class="border">
                    <%
                        for (int i = 0; i < achievements.size(); i++) {
                            Achievements achieve = achievements.get(i);
                    %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=i + 1%>)
                        <%=achieve.getTitle()%> for <%=achieve.getName()%> </b><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Place
                        :- </b>
                        <%=achieve.getPlace()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Date
                        :- </b>
                        <%=achieve.getDate()%>
                    <br>
                    <%
                        }
                    %>
                </fieldset>

                <fieldset>
                    <center>
                        <h4>References</h4>
                    </center>
                    <hr class="border">
                    <%
                        for (int i = 0; i < refers.size(); i++) {
                            References ref = refers.get(i);
                    %>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=i + 1%>)
                        <%=ref.getName()%> </b><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Designation
                        :- </b>
                        <%=ref.getDesignation()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Affiliation
                        :- </b>
                        <%=ref.getAffiliation()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Contact
                        no. :- </b>
                        <%=ref.getContactNo()%>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Email
                        id :- </b>
                        <%=ref.getEmailId()%>
                    <br>
                    <%
                        }
                    %>
                </fieldset>
                <fieldset>
                    <center>
                        <h4>Personal Info</h4>
                    </center>
                    <hr class="border" align="left">
                    <table align="center">
                        <tr>
                            <td>Father Name :- <%=personal.getFatherName()%></td>
                        </tr>
                        <tr>
                            <td>Gender :- <%=personal.getGender()%></td>
                        </tr>
                        <tr>
                            <td>Marital :- <%=personal.getMaritalStatus()%>

                        <tr>
                            <td>Nationality :- <%=personal.getNationality()%></td>
                        </tr>

                        <tr>
                            <td>Hobbies :- <%=personal.getHobbies()%></td>
                        </tr>
                    </table>
                </fieldset>
            </fieldset>
        </form>
        <center>
            <input type="button" onClick="window.print()"
                   value="Print Your Resume" />
        </center>
    </body>
    <style>
        .form-item {
            color: #FFFFFF;
            background: #151B54;
            padding: 7px 10px 9px;
        }


    </style>
</html>