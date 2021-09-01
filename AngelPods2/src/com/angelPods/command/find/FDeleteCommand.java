package com.angelPods.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FindBoardDao;

public class FDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		FindBoardDao dao = FindBoardDao.getInstance();
		dao.delete(fbNum);
	}
}
