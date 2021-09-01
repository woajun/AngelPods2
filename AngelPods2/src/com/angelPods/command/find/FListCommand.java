package com.angelPods.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FindBoardDao;
import com.angelPods.dto.FindBoardDto;

public class FListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		FindBoardDao dao = FindBoardDao.getInstance();
		ArrayList<FindBoardDto> dto = dao.list();
		
		String directory = request.getSession().getServletContext().getRealPath("/images/");
		request.setAttribute("list", dto);
		request.setAttribute("f_list", "yes");
	}

}
