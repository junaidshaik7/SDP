<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Student student = (Student) session.getAttribute("student");
if (student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
    <%@include file="stdhome.jsp" %>

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <h3 style="text-align: center;"><u>Update Student Profile</u></h3>
    <div class="form-container">
        <form method="post" action="updatestudentprofile">
            <table>
                <tr>
                    <td><label for="sid">Student ID</label></td>
                    <td><input type="number" id="sid" name="sid" readonly value="<%= student.getId() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="sfirstname">Enter Name</label></td>
                    <td><input type="text" id="sfirstname" name="sfirstname" value="<%= student.getFirstname() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="slastname">Enter Name</label></td>
                    <td><input type="text" id="slastname" name="slastname" value="<%= student.getLastname() %>" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="sgender" value="MALE" <%= student.getGender().equals("MALE") ? "checked" : "" %> required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="sgender" value="FEMALE" <%= student.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="sgender" value="OTHERS" <%= student.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="sdob">Enter Date of Birth</label></td>
                    <td><input type="date" id="sdob" name="sdob" value="<%= student.getDateofbirth() %>" required/></td>
                </tr>
                <tr>
    				<td><label for="sdept">Select Department</label></td>
    				<td>
        			<select id="sdept" name="sdept" required>
            		<option value="">---Select---</option>
            		<option value="ARTIFICIAL INTELLIGENCE AND DATA SCIENCE" <%= student.getDepartment().equals("ARTIFICIAL INTELLIGENCE AND DATA SCIENCE") ? "selected" : "" %>>ARTIFICIAL INTELLIGENCE AND DATA SCIENCE</option>
            		<option value="BACHELOR OF BUSINESS ADMINISTRATION" <%= student.getDepartment().equals("BACHELOR OF BUSINESS ADMINISTRATION") ? "selected" : "" %>>BACHELOR OF BUSINESS ADMINISTRATION</option>
            		<option value="COMPUTER SCIENCE AND ENGINEERING" <%= student.getDepartment().equals("COMPUTER SCIENCE AND ENGINEERING") ? "selected" : "" %>>COMPUTER SCIENCE AND ENGINEERING</option>
            		<option value="ELECTRONICS AND COMMUNICATION ENGINEERING" <%= student.getDepartment().equals("ELECTRONICS AND COMMUNICATION ENGINEERING") ? "selected" : "" %>>ELECTRONICS AND COMMUNICATION ENGINEERING</option>
           		    <option value="INTERNET OF THINGS" <%= student.getDepartment().equals("INTERNET OF THINGS") ? "selected" : "" %>>INTERNET OF THINGS</option>
            		<option value="MASTER OF BUSINESS ADMINISTRATION" <%= student.getDepartment().equals("MASTER OF BUSINESS ADMINISTRATION") ? "selected" : "" %>>MASTER OF BUSINESS ADMINISTRATION</option>
            		<option value="MECHANICAL ENGINEERING" <%= student.getDepartment().equals("MECHANICAL ENGINEERING") ? "selected" : "" %>>MECHANICAL ENGINEERING</option>
        			</select>
   				 </td>
				</tr>
                <tr>
                    <td><label for="semail">Enter Email ID</label></td>
                    <td><input type="email" id="semail" name="semail" readonly value="<%= student.getEmail() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="spwd">Enter Password</label></td>
                    <td><input type="password" id="spwd" name="spwd" value="<%= student.getPassword() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="scontact">Enter Contact</label></td>
                    <td><input type="number" id="scontact" name="scontact" value="<%= student.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
