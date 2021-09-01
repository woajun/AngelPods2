package com.angelPods.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.CategoryDao;
import com.angelPods.dao.CategoryDetailDao;
import com.angelPods.dto.CategoryDetailDto;
import com.angelPods.dto.CategoryDto;

public class fWriteCategoryViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		CategoryDao cDao = CategoryDao.getInstance();
		ArrayList<CategoryDto> cDto = cDao.list();
		
		CategoryDetailDao cdDao = CategoryDetailDao.getInstance();
		ArrayList<CategoryDetailDto> cdDto = cdDao.list();
		
		request.setAttribute("cList", cDto);
		request.setAttribute("cdList", cdDto);
		request.setAttribute("ri", 1);
	}

}
