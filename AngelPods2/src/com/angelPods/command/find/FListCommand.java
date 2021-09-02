package com.angelPods.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CDao;
import com.angelPods.dao.CdDao;
import com.angelPods.dao.FImgDao;
import com.angelPods.dao.FbDao;
import com.angelPods.dto.CDto;
import com.angelPods.dto.CdDto;
import com.angelPods.dto.FbDto;

public class FListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		FbDao fbDao = FbDao.getInstance();
		CDao cDao = CDao.getInstance();
		CdDao cdDao = CdDao.getInstance();
		
		ArrayList<FbDto> fbDto = fbDao.list();
		ArrayList<CDto> cList = cDao.list();
		ArrayList<CdDto> cdList = cdDao.list();
		
		request.setAttribute("list", fbDto);
		request.setAttribute("cList", cList);
		request.setAttribute("cdList", cdList);
		
		
		
		
		
		
		
		request.setAttribute("Valid-list", "yes");
	}

}
