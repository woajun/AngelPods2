package com.angelPods.command.lost;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.LImgDao;
import com.angelPods.dao.LbDao;

public class LDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int ri = -1;
		int lbNum = Integer.parseInt(request.getParameter("lbNum"));
		
		LbDao lbDao = LbDao.getInstance();
		LImgDao lImgDao = LImgDao.getInstance();
		
		ri = lbDao.delete(lbNum);

		if(ri==1) {ri = lImgDao.clear(lbNum);}
		
		request.setAttribute("ri", ri);
	}
}
