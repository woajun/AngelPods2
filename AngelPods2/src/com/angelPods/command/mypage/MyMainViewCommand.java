package com.angelPods.command.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.DevDao;
import com.angelPods.dto.DevDto;

public class MyMainViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		DevDao devDao = DevDao.getInstance();
		ArrayList<DevDto> devList = devDao.list(userId);
		
		request.setAttribute("devList", devList);
		request.setAttribute("Valid-mypage", "yes");
	}
}
