package com.angelPods.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FImgDao;
import com.angelPods.dao.FbDao;

public class FDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int ri = -1;
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		FbDao fbDao = FbDao.getInstance();
		FImgDao fImgDao = FImgDao.getInstance();
		
		ri = fbDao.delete(fbNum);

		if(ri==1) {
			ri = fImgDao.clear(fbNum);
		}
		
		request.setAttribute("ri", ri);
	}
}
