package com.angelPods.command.device;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.DevDao;
import com.angelPods.dao.DevImgDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DDeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int devNum = Integer.parseInt(request.getParameter("devNum"));
		int ri = -1;
		
		DevDao devDao = DevDao.getInstance();
		DevImgDao devImgDao = DevImgDao.getInstance();
		
		ri = devDao.delete(devNum);
		if(ri == 1) {
			ri = devImgDao.clear(devNum);
		}
		
		request.setAttribute("ri", ri);
	}
}
