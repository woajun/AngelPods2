package com.angelPods.command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CdDao;
import com.angelPods.dto.CdDto;

public class DAddViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CdDao cdDao = CdDao.getInstance();
		
		ArrayList<CdDto> ctgList = cdDao.ctgList();
		
		request.setAttribute("ctgList", ctgList);
	}
	
}
