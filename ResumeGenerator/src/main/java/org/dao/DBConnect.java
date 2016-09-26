package org.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.beans.Achievements;
import org.beans.Authorization;
import org.beans.Education;
import org.beans.Experience;
import org.beans.Personal;
import org.beans.Projects;
import org.beans.References;

public class DBConnect {

    private static Connection connection = null;
    private int counter =1;

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //step2 create  the connection object  
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "system", "kiran");
            return connection;
        } catch (ClassNotFoundException cne) {
            System.out.println(cne);
            System.out.println("Connection finds exception");
        } catch (SQLException sqle) {
            System.out.println("Conn finds SQL Exceptions");
            System.out.println(sqle.toString());
        }
        return con;
    }

    public void closeConnection() {
        try {

            if (connection != null) {
                connection.close();
            }
        } catch (SQLException sqle) {
            System.out.println(sqle.toString());
        }
    }
    
    public int getIndexval(){
        String SQL = "SELECT max(id) FROM personal_details";
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        Personal result = null;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while(rs.next()){
                    
                    counter = Integer.valueOf(rs.getString(1));
                }
                closeConnection();                    
                }
    }catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ++counter;
    }
    
    public boolean insertPersonalDetails(Personal personal) {

        System.out.println("Personal Information from UI::" + personal.getFatherName());
        String SQL = "INSERT INTO personal_details(id, name, father_name, sex, dob, age, "
                + "contact, marital_status, address, email_id, langauge_proficiencies,"
                + "nationality, Career_objectives, hobbies, skill_set) "
                + "VALUES('"
                + getIndexval()
                + "', '"
                + personal.getName()
                + "', '"
                + personal.getFatherName()
                + "','"
                + personal.getGender()
                + "','"
                + personal.getDob()
                + "','"
                + personal.getAge()
                + "','"
                + personal.getMobileNo()
                + "','"
                + personal.getMaritalStatus()
                + "','"
                + personal.getAddress()
                + "','"
                + personal.getEmailId()
                + "','"
                + personal.getLangaugeProf()
                + "','"
                + personal.getNationality()
                + "','"
                + personal.getCareerObjectives()
                + "','"
                + personal.getHobbies()
                + "', '"
                + personal.getSkillSet()
                + "')";

        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        boolean result = Boolean.FALSE;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out
                        .println("Connection is null in insertPersonalDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertPersonalDetails - " + sqle);
        }
        return result;
    }

    public boolean insertEducationalDetails(ArrayList<Education> education) {
        for (Education edu : education) {
            if (!insertEducationalDetails(edu)) {
                return false;
            }
        }
        return true;
    }

    public boolean insertEducationalDetails(Education education) {
        String SQL = "INSERT INTO eductional_details (user_id, name, degree, "
                + "subject, year, board_or_university, "
                + "obtained_marks, total_marks,percentage) "
                + "VALUES('"
                + counter
                + "', '"
                + education.getCollegeName()
                + "','"
                + education.getDegree()
                + "','"
                + education.getSubject()
                + "', '"
                + education.getYear()
                + "','"
                + education.getBoard()
                + "', '"
                + education.getObtainedMarks()
                + "', '"
                + education.getTotalMarks()
                + "', '"
                + education.getPercentage()
                + "')";
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        boolean result = Boolean.FALSE;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out
                        .println("Connection is null in insertEducationalDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertEducationalDetails - " + sqle);
        }
        return result;
    }

    public boolean insertExperiences(ArrayList<Experience> experience) {
        for (Experience exp : experience) {
            if (!insertExperienceDetails(exp)) {
                return false;
            }
        }
        return true;
    }

    public boolean insertExperienceDetails(Experience experience) {
        String SQL = "INSERT INTO experience (user_id, employer, designation, "
                + "joining_date, leaving_date, work, experience) "
                + "VALUES('"
                + counter
                + "', '"
                + experience.getEmployer()
                + "', '"
                + experience.getDesignation()
                + "', '"
                + experience.getJoiningDate()
                + "', '"
                + experience.getLeavingDate()
                + "', '"
                + experience.getWorking()
                + "', '"
                + experience.getExperience()
                + "')";
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        boolean result = Boolean.FALSE;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out
                        .println("Connection is null in insertExperienceDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertExperienceDetails - " + sqle);
        }
        return result;
    }

    public boolean insertAuthorization(Authorization part) {
        String SQL = "insert into authorizations(user_id , work_status, country, issued_by)"
                + " values( '"
                + counter
                + "', '"
                + part.getStatus()
                + "', '"
                + part.getCountry()
                + "', '"
                + part.getIssuedBy()
                + "')";
        System.out.println("SQL >> " + SQL);
        boolean result = false;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out.println("Connection is null in insertAuthorization");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in InsertAuthorization - " + sqle);
        }
        return result;
    }

    public boolean insertAchievements(ArrayList<Achievements> achievements) {
        for (Achievements achieve : achievements) {
            if (!insertAchievement(achieve)) {
                return false;
            }
        }
        return true;
    }

    public boolean insertAchievement(Achievements achievement) {
        String SQL = "insert into achievement(user_id, name, title, place, ach_date)"
                + " values ('"
                + counter
                + "', '"
                + achievement.getName()
                + "','"
                + achievement.getTitle()
                + "','"
                + achievement.getPlace()
                + "','"
                + achievement.getDate()
                + "')";
        System.out.println("SQL >> " + SQL);
        boolean result = false;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out.println("Connection is null in insertAchievement");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertAchievement - " + sqle);
        }
        return result;
    }

    public boolean insertProjects(ArrayList<Projects> projects) {
        for (Projects project : projects) {
            if (!insertProject(project)) {
                return false;
            }
        }
        return true;
    }

    public boolean insertProject(Projects projects) {
        String SQL = "insert into projects(user_id, title, guide,"
                + "front_end, back_end, input, output, description)"
                + " values('"
                + counter
                + "', '"
                + projects.getTitte()
                + "','"
                + projects.getGuide()
                + "','"
                + projects.getFrontEnd()
                + "','"
                + projects.getBackEnd()
                + "','"
                + projects.getInputs()
                + "','"
                + projects.getOutputs()
                + "','"
                + projects.getDescription()
                + "')";
        System.out.println("SQL >> " + SQL);
        boolean result = false;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out.println("Connection is null in insertProject");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertProject - " + sqle);
        }
        return result;
    }

    public boolean insertReferences(ArrayList<References> references) {
        for (References reference : references) {
            if (!insertReference(reference)) {
                return false;
            }
        }
        return true;
    }

    public boolean insertReference(References reference) {
        String SQL = "insert into reference(user_id, name, designation, affilation, email, contact_no)"
                + " values('"
                + counter
                + "', '"
                + reference.getName()
                + "','"
                + reference.getDesignation()
                + "','"
                + reference.getAffiliation()
                + "','"
                + reference.getEmailId()
                + "','"
                + reference.getContactNo()
                + "')";
        System.out.println("SQL >> " + SQL);
        boolean result = false;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                int update = st.executeUpdate(SQL);
                if (update > 0) {
                    result = Boolean.TRUE;
                }
                closeConnection();
            } else {
                System.out.println("Connection is null in insertReference");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in insertReference - " + sqle);
        }
        return result;
    }

    public Personal getPersonalDetails(String id) {
        String SQL = "SELECT * FROM personal_details where id = " + id;
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        Personal result = null;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                if (rs.next()) {
                    result = new Personal();
                    result.setName(rs.getString("name"));
                    result.setFatherName(rs.getString("father_name"));
                    result.setGender(rs.getString("sex"));
                    result.setDob(rs.getString("dob"));
                    result.setAge(rs.getString("age"));
                    result.setMobileNo(rs.getString("contact"));
                    result.setMaritalStatus(rs.getString("marital_status"));
                    result.setAddress(rs.getString("address"));
                    result.setEmailId(rs.getString("email_id"));
                    result.setLangaugeProf(rs.getString("langauge_proficiencies"));
                    result.setNationality(rs.getString("nationality"));
                    result.setSkillSet(rs.getString("skill_set"));
                    result.setHobbies(rs.getString("hobbies"));
                }
                closeConnection();
            } else {
                System.out.println("Connection is null in getPersonalDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in getPersonalDetails - " + sqle);
        }
        return result;
    }

    public ArrayList<Education> getEducationalDetails(String id) {
        String SQL = "SELECT * FROM eductional_details where user_id = " + id;
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        ArrayList<Education> results = new ArrayList<Education>();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                    Education result = new Education();
                    result.setCollegeName(rs.getString("name"));
                    result.setDegree(rs.getString("degree"));
                    result.setSubject(rs.getString("subject"));
                    result.setYear(rs.getString("year"));
                    result.setBoard(rs.getString("board_or_university"));
                    result.setObtainedMarks(rs.getString("obtained_marks"));
                    result.setTotalMarks(rs.getString("total_marks"));
                    result.setPercentage(rs.getString("percentage"));
                    results.add(result);
                }
                closeConnection();
            } else {
                System.out
                        .println("Connection is null in getEducationalDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in getEducationalDetails - " + sqle);
        }
        return results;
    }

    public ArrayList<Experience> getExperienceDetails(String id) {
        String SQL = "SELECT * FROM experience where user_id = " + id;
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        ArrayList<Experience> results = new ArrayList<Experience>();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                    Experience result = new Experience();
                    result.setEmployer(rs.getString("employer"));
                    result.setDesignation(rs.getString("designation"));
                    result.setJoiningDate(rs.getString("joining_date"));
                    result.setLeavingDate(rs.getString("leaving_date"));
                    result.setWorking(rs.getString("work"));
                    result.setExperience(rs.getString("experience"));
                    results.add(result);
                }
                closeConnection();
            } else {
                System.out
                        .println("Connection is null in getExperienceDetails");
            }
        } catch (SQLException sqle) {
            System.out.println("sqle in getExperienceDetails - " + sqle);
        }
        return results;
    }

    public Authorization getAuthorizationDetails(String id) {
        Authorization authorization = null;
        String SQL = "select * from authorizations where user_id = " + id;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                   authorization = new Authorization(
                                    rs.getString("work_status"),
                            rs.getString("country"),
                            rs.getString("issued_by"));
                }
                closeConnection();
            } else {
                System.out.println("Conection null in getParticipationDetails");
            }
        } catch (Exception e) {
            System.out.print("Error in getParticipationDetails - " + e);
        }

        return authorization;
    }

    public ArrayList<Achievements> getAchievementDetails(String id) {
        ArrayList<Achievements> achievementDetails = new ArrayList<Achievements>(0);
        String SQL = "select * from achievement where user_id = "+ id;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                    Achievements achieve = new Achievements();
                    achieve.setName(rs.getString("name"));
                    achieve.setTitle(rs.getString("title"));
                    achieve.setPlace(rs.getString("place"));
                    achieve.setDate(rs.getString("ach_date"));
                    achievementDetails.add(achieve);
                }
                closeConnection();
            } else {
                System.out.println("Conection null in getAchievementDetails");
            }
        } catch (Exception e) {
            System.out.print("Error in getAchievementDetails- " + e);
        }

        return achievementDetails;
    }

    public ArrayList<Projects> getProjectDetails(String id) {
        ArrayList<Projects> projectDetails = new ArrayList<Projects>(0);
        String SQL = "select * from projects where user_id = " + id;
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                    Projects project = new Projects();
                    project.setTitte(rs.getString("title"));
                    project.setGuide(rs.getString("guide"));
                    project.setFrontEnd(rs.getString("front_end"));
                    project.setBackEnd(rs.getString("back_end"));
                    project.setInputs(rs.getString("input"));
                    project.setOutputs(rs.getString("output"));
                    project.setDescription(rs.getString("description"));
                    projectDetails.add(project);
                }
                closeConnection();
            } else {
                System.out.println("Conection null in getProjectDetails");
            }
        } catch (Exception e) {
            System.out.print("Error in getProjectDetails - " + e);
        }
        return projectDetails;
    }

    public ArrayList<References> getReferencesDetails(String id) {

        String SQL = "SELECT * FROM reference where user_id = " + id;
        System.out.println("SQL>>" + SQL);
        ArrayList<References> referencesDetails = new ArrayList<References>();
        connection = getConnection();
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(SQL);
                while (rs.next()) {
                    References refer = new References();
                    refer.setName(rs.getString("name"));
                    refer.setDesignation(rs.getString("designation"));
                    refer.setAffiliation(rs.getString("affilation"));
                    refer.setEmailId(rs.getString("email"));
                    refer.setContactNo(rs.getString("contact_no"));
                    referencesDetails.add(refer);
                }
                closeConnection();
            } else {
                System.out.println("Conection null in getReferencesDetails");
            }
        } catch (Exception e) {
            System.out.print("Error in getReferencesDetails - " + e);
        }
        return referencesDetails;
    }
    
    public ResultSet getProfiles(){
        String SQL = "SELECT * FROM personal_details";
        System.out.println("SQL >> " + SQL);
        connection = getConnection();
        ResultSet rs = null;
        try {
            if (connection != null) {
                Statement st = connection.createStatement();
                rs = st.executeQuery(SQL);
            }
        }catch(SQLException sq){
            System.out.println("Exception at query Execution::"+ sq.getMessage());
        }
        return rs;
        
    }
}
