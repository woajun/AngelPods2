package com.angelPods.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.command.admin.ACategoryViewCommand;
import com.angelPods.command.device.DAddCommand;
import com.angelPods.command.device.DAddViewCommand;
import com.angelPods.command.device.DDeleteCommand;
import com.angelPods.command.exer.EAddBookmarkCommand;
import com.angelPods.command.find.FContentViewCommand;
import com.angelPods.command.find.FDeleteCommand;
import com.angelPods.command.find.FListCommand;
import com.angelPods.command.find.FModifyCommand;
import com.angelPods.command.find.FModifyViewCommand;
import com.angelPods.command.find.FSearchCommand;
import com.angelPods.command.find.FWriteActionCommand;
import com.angelPods.command.find.FWriteViewCommand;
import com.angelPods.command.lost.LContentViewCommand;
import com.angelPods.command.lost.LDeleteCommand;
import com.angelPods.command.lost.LListCommand;
import com.angelPods.command.lost.LModifyCommand;
import com.angelPods.command.lost.LModifyViewCommand;
import com.angelPods.command.lost.LWriteActionCommand;
import com.angelPods.command.lost.LWriteViewCommand;
import com.angelPods.command.member.MContentCommand;
import com.angelPods.command.member.MJoinCommand;
import com.angelPods.command.member.MLoginCommand;
import com.angelPods.command.member.MLogoutCommand;
import com.angelPods.command.member.MPrintAll;
import com.angelPods.command.member.MWithdrawCommand;
import com.angelPods.command.mypage.MyContentsViewCommand;
import com.angelPods.command.mypage.MyMainViewCommand;
import com.angelPods.command.mypage.MyModifyCommand;
import com.angelPods.command.mypage.MyModifyPWCommand;
import com.angelPods.command.mypage.MyModifyViewCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
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
			viewPage = "/find/list_view.jsp";
			
		} else if (com.equals("modify_view.do")) {
			command = new MContentCommand();
			command.execute(request, response);
			viewPage = "/member/modify.jsp";
			
		} else if (com.equals("member_withdraw.do")) {
			command = new MWithdrawCommand();
			command.execute(request, response);
			viewPage = "/member/login.jsp";
		}
			
		
//------------------find---------------------
		
		if (com.equals("f_list.do")) {
			command = new FListCommand();
			command.execute(request, response);
			viewPage = "/find/list_view.jsp";
		
		} else if (com.equals("f_write_view.do")) {
			command = new FWriteViewCommand();
			command.execute(request, response);
			viewPage = "/find/write_view.jsp";
		
		} else if(com.equals("f_write_action.do")) {
			command = new FWriteActionCommand();
			command.execute(request, response);
			viewPage = "/find/write_action.jsp";
			
		} else if (com.equals("f_content_view.do")) {
			command = new FContentViewCommand();
			command.execute(request,response);
			viewPage = "/find/content_view.jsp";
			
		} else if (com.equals("f_modify_view.do")) {
			command = new FModifyViewCommand();
			command.execute(request, response);
			viewPage = "/find/modify_view.jsp";
			
		} else if (com.equals("f_modify.do")) {
			command = new FModifyCommand();
			command.execute(request, response);
			viewPage = "/find/modify_action.jsp";

		} else if (com.equals("f_delete.do")) {
			command = new FDeleteCommand();
			command.execute(request, response);
			viewPage = "/find/delete_action.jsp";

		} else if (com.equals("f_search.do")) {
			command = new FSearchCommand();
			command.execute(request, response);
			viewPage = "/find/list_view.jsp";
		} 
		
//------------------LOST---------------------
		
		if (com.equals("l_list.do")) {
			command = new LListCommand();
			command.execute(request, response);
			viewPage = "/lost/list_view.jsp";
			
		} else if (com.equals("l_write_view.do")) {
			command = new LWriteViewCommand();
			command.execute(request, response);
			viewPage = "/lost/write_view.jsp";
			
		} else if(com.equals("l_write_action.do")) {
			command = new LWriteActionCommand();
			command.execute(request, response);
			viewPage = "/lost/write_action.jsp";
			
		} else if (com.equals("l_content_view.do")) {
			command = new LContentViewCommand();
			command.execute(request,response);
			viewPage = "/lost/content_view.jsp";
			
		} else if (com.equals("l_modify_view.do")) {
			command = new LModifyViewCommand();
			command.execute(request, response);
			viewPage = "/lost/modify_view.jsp";
			
		} else if (com.equals("l_modify.do")) {
			command = new LModifyCommand();
			command.execute(request, response);
			viewPage = "/lost/modify_action.jsp";
			
		} else if (com.equals("l_delete.do")) {
			command = new LDeleteCommand();
			command.execute(request, response);
			viewPage = "/lost/delete_action.jsp";
		}
		
//------------------Device---------------------

		if (com.equals("d_add_view.do")) {
			command = new DAddViewCommand();
			command.execute(request, response);
			viewPage = "/device/add_view.jsp";
			
		} else if (com.equals("d_add.do")) {
			command = new DAddCommand();
			command.execute(request, response);
			viewPage = "/device/add_action.jsp";
			
		} else if (com.equals("d_delete.do")) {
			command = new DDeleteCommand();
			command.execute(request, response);
			viewPage = "/device/delete_action.jsp";
			
		}

//------------------mypage---------------------
		
		if (com.equals("my_main_view.do")) {
			command = new MyMainViewCommand();
			command.execute(request, response);
			viewPage = "/mypage/main.jsp";
			
		} else if (com.equals("my_contents_view.do")) {
			command = new MyContentsViewCommand();
			command.execute(request, response);
			viewPage = "/mypage/contents.jsp";

		} else if (com.equals("my_modify_view.do")) {
			command = new MyModifyViewCommand();
			command.execute(request, response);
			viewPage = "/mypage/modify_view.jsp";

		} else if (com.equals("my_modify.do")) {
			command = new MyModifyCommand();
			command.execute(request, response);
			viewPage = "/mypage/modify_action.jsp";
			
		} else if (com.equals("my_modifyPW_view.do")) {
			command = new MyModifyViewCommand();
			command.execute(request, response);
			viewPage = "/mypage/modifyPW_view.jsp";
			
		} else if (com.equals("my_modifyPW.do")) {
			command = new MyModifyPWCommand();
			command.execute(request, response);
			viewPage = "/mypage/modifyPW_action.jsp";
		}
		
//------------------admin---------------------
		
		if (com.equals("a_category_view.do")) {
			command = new ACategoryViewCommand();
			command.execute(request, response);
			viewPage = "/admin/category.jsp";
			
		} else if (com.equals("#")) {
//			command = new MyContentsViewCommand();
//			command.execute(request, response);
//			viewPage = "/mypage/contents.jsp";
		}
		
		
//		--------------------exercise
		if (com.equals("add_bookmark.do")) {
			command = new EAddBookmarkCommand();
			command.execute(request, response);
			viewPage = "/addNewUser.jsp";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
}
