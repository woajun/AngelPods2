package com.angelPods.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;

public class FWriteViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String dId = request.getParameter("dId");
		System.out.println(dId);
		request.setAttribute("dId", dId);
	}

}
