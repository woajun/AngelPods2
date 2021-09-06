package com.angelPods.command.lost;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.LImgDao;
import com.angelPods.dao.LbDao;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.LImgDto;
import com.angelPods.dto.LbDto;
import com.angelPods.dto.MemberDto;

public class LContentViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int lbNum = Integer.parseInt(request.getParameter("lbNum"));
		
		LbDao lbDao = LbDao.getInstance();
		LImgDao lImgDao = LImgDao.getInstance();
		MemberDao mDao = MemberDao.getInstance();
		
		LbDto lbDto = lbDao.getContent(lbNum);
		ArrayList <LImgDto> images = lImgDao.getImgs(lbNum);
		MemberDto mDto = mDao.getMember(lbDto.getUserId());
		
		request.setAttribute("dto",lbDto);
		request.setAttribute("lImages", images);
		request.setAttribute("writer", mDto);
		
	}

}
