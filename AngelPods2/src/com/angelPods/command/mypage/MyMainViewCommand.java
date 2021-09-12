package com.angelPods.command.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.DevDao;
import com.angelPods.dao.MImgDao;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.DevDto;
import com.angelPods.dto.MImgDto;
import com.angelPods.dto.MemberDto;

public class MyMainViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		DevDao devDao = DevDao.getInstance();
		MemberDao mDao = MemberDao.getInstance();
		MImgDao mImgDao = MImgDao.getInstance();
		
		ArrayList<DevDto> devList = devDao.list(userId);
		MemberDto mDto = mDao.contentView(userId);
		MImgDto mImgDto = mImgDao.get(userId);
		
		request.setAttribute("mDto",mDto );
		request.setAttribute("devList", devList);
		request.setAttribute("mImg", mImgDto);
		request.setAttribute("Valid-mypage", "yes");
	}
}
