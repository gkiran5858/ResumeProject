package org.constants;

import java.util.ArrayList;
import org.beans.Achievements;
import org.beans.Education;
import org.beans.Experience;
import org.beans.Participation;
import org.beans.Projects;
import org.beans.References;

public class GlobalConstants
{
	public static String JSP_PAGE = "index.jsp";
	
	public static String MESSAGE = "Click 'Fill Resume' To Insert Details...";
	
	public static String PERSONAL_DETAILS = "user_details";	
	public static ArrayList<Education> educations = new ArrayList<Education>();
	public static ArrayList<Experience> experiences = new ArrayList<Experience>();
	public static ArrayList<Participation> participations =new ArrayList<Participation>();
	public static ArrayList<Achievements> achievements= new ArrayList<Achievements>();
	public static ArrayList<Projects> projects = new ArrayList<Projects>();
	public static ArrayList<References> references = new ArrayList<References>();
        public static String AUTHRO_DETAILS = "authorization";
        
}