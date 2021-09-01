package com.angelPods.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MemberDto;

public class MLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		// TODO Auto-generated method stub
		MemberDao dao = MemberDao.getInstance();

		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		
		int checkNum = dao.userCheck(userId, pw);
		int ri= 0;
			
		if(checkNum == -1) {
			ri = 2;
		}else if (checkNum == 0 ) {
			ri = 3;
		}else if (checkNum == 1) {
			MemberDto dto = dao.getMember(userId);
			if(dto == null) {
				ri = 4;
			} else {
				HttpSession session = request.getSession();
				String name = dto.getName();
				session.setAttribute("userId", userId);
				session.setAttribute("name", name);
				session.setAttribute("ValidMem", "yes");
				ri = 1;
			}
		}
		request.setAttribute("ri", ri);
	}
}
