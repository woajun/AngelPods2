package com.angelPods.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.SerialnumberDao;

public class fWriteCategoryActionCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int ri = -1;
		
		SerialnumberDao dao = SerialnumberDao.getInstance();
		
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		int cdNum = Integer.parseInt(request.getParameter("cdNum"));
		String sn = request.getParameter("sn");
		
		if(dao.searchSn(sn) != null) {
			ri = 1;
		}
		
		request.setAttribute("cNum", cNum);
		request.setAttribute("cdNum", cdNum);
		request.setAttribute("sn", sn);
		
		request.setAttribute("ri", ri);
	}

}
