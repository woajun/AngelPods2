package com.angelPods.command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CDao;
import com.angelPods.dao.CdDao;
import com.angelPods.dto.CDto;
import com.angelPods.dto.CdDto;

public class ACategoryViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CDao cDao = CDao.getInstance();
		CdDao cdDao = CdDao.getInstance();
		
		ArrayList<CDto> cList = cDao.list();
		
		for (int i = 0; i < cList.size(); i++) {
			CDto cDto = cList.get(i);
			int cNum = cDto.getcNum();
			cDto.setCdList(cdDao.list(cNum));
		}
		
		request.setAttribute("cList", cList);
		request.setAttribute("Valid", "yes");
	}
	
}
