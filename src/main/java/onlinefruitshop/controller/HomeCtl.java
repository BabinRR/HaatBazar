package onlinefruitshop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import onlinefruitshop.bean.CategoryBean;
import onlinefruitshop.bean.ProductBean;
import onlinefruitshop.exception.ApplicationException;
import onlinefruitshop.model.CategoryModel;
import onlinefruitshop.model.ProductModel;
import onlinefruitshop.util.DataUtility;
import onlinefruitshop.util.PropertyReader;
import onlinefruitshop.util.ServletUtility;

/**
 * Servlet implementation class HomeCtl
 */
@WebServlet(name = "HomeCtl", urlPatterns = { "/adminPortal/home" })
public class HomeCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
	private static Logger log = Logger.getLogger(HomeCtl.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletUtility.forward(getView(), request, response);
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return SOTGView.HOME_VIEW;
	}

}
