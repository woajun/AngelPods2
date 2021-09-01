package com.angelPods.command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MemberDto;

public class MPrintAll implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 조회 권한 확인
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> dto = dao.membersAll();
		request.setAttribute("mList", dto);
	}
}
