package com.angelPods.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.MemberDao;

public class MModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String userId = request.getSession().getAttribute("userId").toString();
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		String addr = request.getParameter("addr");
		String lat = request.getParameter("lat") ;
		String lon = request.getParameter("lon");
		String profilImage = "0";
		
		MemberDao dao = MemberDao.getInstance();
		int ri = dao.modify(userId, pw, name, eMail, addr, 
				 lat, lon, profilImage);
		
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		
		request.setAttribute("ri", ri);
	}
}
