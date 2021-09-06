package com.angelPods.command.lost;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CDao;
import com.angelPods.dao.CdDao;
import com.angelPods.dao.LbDao;
import com.angelPods.dto.CDto;
import com.angelPods.dto.CdDto;
import com.angelPods.dto.LbDto;

public class LListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		LbDao lbDao = LbDao.getInstance();
		CDao cDao = CDao.getInstance();
		CdDao cdDao = CdDao.getInstance();
		
		ArrayList<LbDto> lbDto = lbDao.list();
		ArrayList<CDto> cList = cDao.list();
		ArrayList<CdDto> cdList = cdDao.list();
		
		request.setAttribute("list", lbDto);
		request.setAttribute("cList", cList);
		request.setAttribute("cdList", cdList);
		
		request.setAttribute("Valid-list", "yes");
	}

}
