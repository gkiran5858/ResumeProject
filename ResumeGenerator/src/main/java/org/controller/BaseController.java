package org.controller;

import java.io.IOException;
import javax.servlet.http.*;
import org.beans.Personal;
import org.constants.GlobalConstants;
import org.dao.UserService;


public class BaseController extends HttpServlet {
	private static final long serialVersionUID = 4481510681863866579L;
	private UserService userServices = new UserService();
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
			String action = request.getParameter("action");
			doPostAction(action, request, response);		
	}
	
	public void doPostAction(String action, HttpServletRequest request,
			HttpServletResponse response) {
		try ;{
		if(action.equals("resume"))
		{
			HttpSession session = request.getSession();
			
			Personal personal = (Personal) session.getAttribute(GlobalConstants.PERSONAL_DETAILS);
//			ArrayList<Education> education = (Education) session.getAttribute(GlobalConstants.EDUCATIONAL_DETAILS);
//			Experience experience = (Experience) session.getAttribute(GlobalConstants.EXPERIENCE_DETAILS);
//			Participation part = (Participation) session.getAttribute(GlobalConstants.PARTICIPATION_DETAILS);
//			Achievements achieve = (Achievements) session.getAttribute(GlobalConstants.ACHIEVEMENTS_DETAILS);
//			Projects project = (Projects) session.getAttribute(GlobalConstants.PROJRCT_DETAILS);
//			References ref = (References) session.getAttribute(GlobalConstants.REFERENCES_DETAILS);
			
			boolean p = userServices.insertPersonalDetails(personal);
			
			
			
			//GlobalConstants.JSP_PAGE = "Final.jsp";
			
			
			if(userServices.insertPersonalDetails(personal))
			{				
				GlobalConstants.MESSAGE = "Personal Details Inserted Sucesfully";
				/*if(userServices.insertEducationalDetails(education))
				{
					GlobalConstants.MESSAGE = "Educational Details Inserted Sucesfully";
					if(userServices.insertExperienceDetails(experience))
					{
						GlobalConstants.MESSAGE = "Experience Details Inseted Sucesfully";
						session.setAttribute(GlobalConstants.PERSONAL_DETAILS, null);
						session.setAttribute(GlobalConstants.EDUCATIONAL_DETAILS, null);
						session.setAttribute(GlobalConstants.EXPERIENCE_DETAILS, null);
						
					}
					else
					{
						GlobalConstants.MESSAGE = "Error in Experience Details Insertion";
					}
				}
				else
				{
					GlobalConstants.MESSAGE = "Error in Educational Details Insertion";
				}*/
			}
			else
			{
				GlobalConstants.MESSAGE = "Error in Personal Details Insertion";
			}
			response.sendRedirect(GlobalConstants.JSP_PAGE);			
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
		} catch (IOException e) {
			e.printStackTrace();
		}			
	}
}