package com.angelPods.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.FImgDao;
import com.angelPods.dao.FbDao;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.FImgDto;
import com.angelPods.dto.FbDto;
import com.angelPods.dto.MemberDto;

public class FContentViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		FbDao fbDao = FbDao.getInstance();
		FImgDao fImgDao = FImgDao.getInstance();
		MemberDao mDao = MemberDao.getInstance();
		
		FbDto fbDto = fbDao.getContent(fbNum);
		ArrayList <FImgDto> images = fImgDao.getImgs(fbNum);
		MemberDto mDto = mDao.getMember(fbDto.getUserId());
		
		request.setAttribute("dto",fbDto);
		request.setAttribute("fImages", images);
		request.setAttribute("writer", mDto);
		
	}

}
