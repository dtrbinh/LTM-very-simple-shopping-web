package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;

/**
 * Servlet implementation class UpdateUser
 */
//@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		java.sql.Date ngaysinh = null;

		try {
			ngaysinh = new java.sql.Date(
					(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngaysinh"))).getTime());
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String gioitinh = request.getParameter("gioitinh");
		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
		String diachi = request.getParameter("diachi");

		String err = "";
		String url = "/update_user.jsp";

		if (password.equals("") || email.equals("") || sdt.equals("") || diachi.equals("")) {
			err += "Ph???i nh???p ?????y ????? th??ng tin!";
		} else {

			Pattern pattenObj = Pattern.compile(
					"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher matcherObj = pattenObj.matcher(email);
			if (!matcherObj.matches()) {
				err += "Email sai ?????nh d???ng!";
			} else {
				Pattern pattenObj2 = Pattern.compile("(09)\\d{8}|(01)\\d{9}");
				Matcher matcherObj2 = pattenObj2.matcher(sdt);
				if (!matcherObj2.matches()) {
					err += "S??t sai ?????nh d???ng!";
				}
			}
		}

		if (err.length() > 0) {
			request.setAttribute("err", err);
		}

		try {
			if (err.length() == 0) {
				User u = new User(Integer.parseInt(user_id), username, password, ngaysinh, gioitinh, email, sdt, diachi,
						"2");
				UserBO.updateUser(u);
				url = "/index.jsp";
			} else {
				url = "/update_user.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/register.jsp");
		}
	}

}
