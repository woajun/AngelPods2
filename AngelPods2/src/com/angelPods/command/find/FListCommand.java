package com.angelPods.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FImgDao;
import com.angelPods.dao.FbDao;
import com.angelPods.dto.FbDto;

public class FListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		FbDao fbDao = FbDao.getInstance();
		
		ArrayList<FbDto> fbDto = fbDao.list();
		
		request.setAttribute("list", fbDto);
		
		
		
		
		
		
		
		request.setAttribute("Valid-list", "yes");
	}

}
