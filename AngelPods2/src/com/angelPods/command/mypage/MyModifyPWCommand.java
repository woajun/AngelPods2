package com.angelPods.command.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MemberDto;

public class MyModifyPWCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		int ri = -1;
		MemberDao mDao = MemberDao.getInstance();
		
		MemberDto mDto = mDao.getMember(userId);
		
		String pw = mDto.getPw();
		
		String oldPW = request.getParameter("pw");
		String newPW = request.getParameter("newPW");
		
		
		System.out.println("pw : " + pw);
		System.out.println("oldpw : " + oldPW);
		System.out.println("newpw : " + newPW);
		if(oldPW.equals(pw)) {
			mDto.setPw(newPW);
			mDao.modify(mDto);
			ri = 1;
			System.out.println("비번바뀜?");
		}
		
		request.setAttribute("ri",  ri);
		
	}
}
