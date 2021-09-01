package com.angelPods.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FindBoardDao;
import com.angelPods.dto.FindBoardDto;

public class FModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		FindBoardDao dao = FindBoardDao.getInstance();
		FindBoardDto fbDto = dao.contentView(fbNum);
		String directory = request.getSession().getServletContext().getRealPath("/images/");
		request.setAttribute("fbDto", fbDto);
		request.setAttribute("directory", directory);
		
	}
}
