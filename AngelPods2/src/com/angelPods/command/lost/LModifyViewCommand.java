package com.angelPods.command.lost;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CDao;
import com.angelPods.dao.CdDao;
import com.angelPods.dao.LImgDao;
import com.angelPods.dao.LbDao;
import com.angelPods.dto.CDto;
import com.angelPods.dto.CdDto;
import com.angelPods.dto.LImgDto;
import com.angelPods.dto.LbDto;

public class LModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int lbNum = Integer.parseInt(request.getParameter("lbNum"));
		
		LbDao lbDao = LbDao.getInstance();
		LImgDao lImgDao = LImgDao.getInstance();
		CDao cDao = CDao.getInstance();
		CdDao cdDao = CdDao.getInstance();
		
		LbDto lbDto = lbDao.getContent(lbNum);
		ArrayList <LImgDto> images = lImgDao.getImgs(lbNum);
		ArrayList<CDto> cList = cDao.list();
		ArrayList<CdDto> cdList = cdDao.list();
		

		request.setAttribute("dto", lbDto);
		request.setAttribute("lImages", images);
		request.setAttribute("cList", cList);
		request.setAttribute("cdList", cdList);
	}
}
