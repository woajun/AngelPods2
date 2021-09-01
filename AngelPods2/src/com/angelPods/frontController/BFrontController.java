package com.angelPods.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.command.find.FContentCommand;
import com.angelPods.command.find.FDeleteCommand;
import com.angelPods.command.find.FListCommand;
import com.angelPods.command.find.FModifyCommand;
import com.angelPods.command.find.FModifyViewCommand;
import com.angelPods.command.find.fWriteActionCommand;
import com.angelPods.command.find.fWriteCategoryActionCommand;
import com.angelPods.command.find.fWriteCategoryViewCommand;
import com.angelPods.command.member.MContentCommand;
import com.angelPods.command.member.MJoinCommand;
import com.angelPods.command.member.MLoginCommand;
import com.angelPods.command.member.MLogoutCommand;
import com.angelPods.command.member.MModifyCommand;
import com.angelPods.command.member.MPrintAll;
import com.angelPods.command.member.MWithdrawCommand;

@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Command command = null;
		
//		String uri = request.getRequestURI();
//		String conPath = request.getContextPath();
//		String com = uri.substring(conPath.length());
		
		String uri[] = request.getRequestURI().split("/");
		String com = uri[uri.length-1];
		System.out.println(com);
		
//------------------member -----------------------
		if(com.equals("membersAll.do")) {
			command = new MPrintAll();
			command.execute(request, response);
			viewPage = "/member/membersAll.jsp";
			
		} else if (com.equals("join.do")) {
			command = new MJoinCommand();
			command.execute(request, response);
			viewPage = "/member/joinOk.jsp";
			
		} else if (com.equals("login.do")) {
			command = new MLoginCommand();
			command.execute(request, response);
			viewPage = "/member/loginOk.jsp";
			
		} else if (com.equals("logout.do")) {
			command = new MLogoutCommand();
			command.execute(request, response);
			viewPage = "/member/login.jsp";
			
		} else if (com.equals("modify_view.do")) {
			command = new MContentCommand();
			command.execute(request, response);
			viewPage = "/member/modify.jsp";
			
		} else if (com.equals("member_modify.do")) {
			command = new MModifyCommand();
			command.execute(request, response);
			viewPage = "/member/modifyOk.jsp";
			
		} else if (com.equals("member_withdraw.do")) {
			command = new MWithdrawCommand();
			command.execute(request, response);
			viewPage = "/member/login.jsp";
		}
			
		
//------------------find---------------------
		
		if(com.equals("f_write_category_action.do")) {
			command = new fWriteCategoryActionCommand();
			command.execute(request, response);
			viewPage = "/find/write_category_action.jsp";
		
		} else if(com.equals("f_write_category_view.do")) {
			command = new fWriteCategoryViewCommand();
			command.execute(request, response);
			viewPage = "/find/write_category_view.jsp";
			
		} else if(com.equals("f_write_action.do")) {
			command = new fWriteActionCommand();
			command.execute(request, response);
			viewPage = "/find/write_action.jsp";
		
		} else if (com.equals("f_list.do")) {
			command = new FListCommand();
			command.execute(request, response);
			viewPage = "/board/list_view.jsp";
		
		} else if (com.equals("f_content_view.do")) {
			command = new FContentCommand();
			command.execute(request,response);
			viewPage = "/find/content_view.jsp";
			
		} else if (com.equals("f_delete.do")) {
			command = new FDeleteCommand();
			command.execute(request, response);
			viewPage = "f_list.do";
			
		} else if (com.equals("f_modify_view.do")) {
			command = new FModifyViewCommand();
			command.execute(request, response);
			viewPage = "/find/modify_view.jsp";
			
		} else if (com.equals("f_modify.do")) {
			command = new FModifyCommand();
			command.execute(request, response);
			viewPage = "/find/modify_action.jsp";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
}
