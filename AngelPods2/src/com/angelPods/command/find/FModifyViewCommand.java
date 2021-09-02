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
import com.angelPods.dto.FImgDto;
import com.angelPods.dto.FbDto;

public class FModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		FbDao fbDao = FbDao.getInstance();
		FImgDao fImgDao = FImgDao.getInstance();
		CDao cDao = CDao.getInstance();
		CdDao cdDao = CdDao.getInstance();
		
		FbDto fbDto = fbDao.getContent(fbNum);
		ArrayList <FImgDto> images = fImgDao.getImgs(fbNum);
		ArrayList<CDto> cList = cDao.list();
		ArrayList<CdDto> cdList = cdDao.list();
		

		request.setAttribute("dto", fbDto);
		request.setAttribute("fImages", images);
		request.setAttribute("cList", cList);
		request.setAttribute("cdList", cdList);
		
	}
}
