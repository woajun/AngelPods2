package com.angelPods.command.exer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;

public class EAddBookmarkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String add = request.getParameter("add");
		String title = request.getParameter("title");
		System.out.println(add);
		System.out.println(title);
		
	}

}
