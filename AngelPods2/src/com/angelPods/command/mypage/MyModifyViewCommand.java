package com.angelPods.command.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.MImgDao;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MImgDto;
import com.angelPods.dto.MemberDto;

public class MyModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		MemberDao mDao = MemberDao.getInstance();
		MImgDao mImgDao = MImgDao.getInstance();
		
		
		MemberDto mDto = mDao.contentView(userId);
		MImgDto mImgDto = mImgDao.get(userId);
		
		request.setAttribute("mDto",mDto );
		request.setAttribute("mImg", mImgDto);
		request.setAttribute("Valid", "yes");
	}

}
