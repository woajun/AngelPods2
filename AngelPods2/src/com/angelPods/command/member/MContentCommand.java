package com.angelPods.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MemberDto;

public class MContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String userId = request.getSession().getAttribute("userId").toString();
		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = dao.contentView(userId);
		
		request.setAttribute("mdto", dto);
	}

}
