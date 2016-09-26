package org.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import org.beans.Achievements;
import org.beans.Authorization;
import org.beans.Education;
import org.beans.Experience;
import org.beans.Personal;
import org.beans.Projects;
import org.beans.References;

public class UserService
{	
	private DBConnect dbConnection = new DBConnect();

	public boolean insertPersonalDetails(Personal personal){	
		return dbConnection.insertPersonalDetails(personal);
	}

	public boolean insertEducationalDetails(ArrayList<Education> education){
		return dbConnection.insertEducationalDetails(education);
	}
	
	public boolean insertExperiences(ArrayList<Experience> experience){
		return dbConnection.insertExperiences(experience);
	}
	
	public boolean inserAuthorization(Authorization part){
        return dbConnection.insertAuthorization(part);
    }
	    
    public boolean insertAchievement(ArrayList<Achievements> achievement){
    	return dbConnection.insertAchievements(achievement);
    }
    
    public boolean insertProject(ArrayList<Projects> projects){
    	return dbConnection.insertProjects(projects);
    }
    
    public boolean insertReference(ArrayList<References> reference){
    	return dbConnection.insertReferences(reference);
    }
    
	public Personal getPersonalDetails(String id){
		return dbConnection.getPersonalDetails(id);
	}
        
        public ResultSet getProfiles(){
            	return dbConnection.getProfiles();
        }
	
	public ArrayList<Education> getEducationDetails(String id){
		return dbConnection.getEducationalDetails(id);
	}
	
	public ArrayList<Experience> getExperienceDetails(String id){
		return dbConnection.getExperienceDetails(id);
	}
	
	public Authorization getAuthroizationDetails(String id){
        return dbConnection.getAuthorizationDetails(id);
    }
    
    public ArrayList<Achievements> getAchievementDetails(String id){
        return dbConnection.getAchievementDetails(id);
    }
    
    public ArrayList<Projects> getProjectDetails(String id){
        return dbConnection.getProjectDetails(id);
    }
    
    public ArrayList<References> getReferencesDetails(String id){
        return dbConnection.getReferencesDetails(id);
    }
}