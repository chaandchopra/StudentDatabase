package com.mystudent.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDbUtil studentDbUtil;
	
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		//create our student db util.. and padd inthe conn pool/ datasource
		try{
			studentDbUtil = new StudentDbUtil(dataSource);
		}
		catch(Exception e){
			throw new ServletException(e);	
		}
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try{
			//read the "command" parameter
			String theCommand = request.getParameter("command");
			if(theCommand == null)
			{
				theCommand = "LIST";
			}
			switch(theCommand)
			{
			case "LIST":
				listStudent(request, response);
				break;
			case "ADD":
				addStudent(request, response);
				break;
			case "LOAD":
				loadStudent(request, response);
			case "UPDATE":
				updateStudent(request, response);
				break;
			case "DELETE":
				deleteStudent(request, response);
				break;
			default:
				listStudent(request, response);
			}
			// lis the students.. in MVC fashion
			listStudent(request, response);
		}catch(Exception e){
			throw new ServletException(e);
		}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String studentid = request.getParameter("studentId");
		studentDbUtil.deleteStudent(studentid);
		listStudent(request, response);
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id = Integer.parseInt(request.getParameter("studentId"));
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		Student theStudent = new Student(id, fname,lname, email);
		studentDbUtil.updateStudent(theStudent);
		listStudent(request, response);
	}	

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read student id from form data
		String studentid = request.getParameter("studentId");
		//get student from database
		Student theStudent = studentDbUtil.getStudent(studentid);
		//place student in the request attribute
		request.setAttribute("THE_STUDENT", theStudent);
		//sent to j.s.p page: update 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//read student info from form data
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		//create a new student object
		Student theStudents = new Student(fname, lname, email);
		//add the student to the database
		studentDbUtil.addStudent(theStudents);
		listStudent(request,  response);
	}

	private void listStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//get student s from db util
		List<Student> students = studentDbUtil.getStudents();
		
		//add students to the request
		request.setAttribute("STUDENT_LIST", students);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}

}
