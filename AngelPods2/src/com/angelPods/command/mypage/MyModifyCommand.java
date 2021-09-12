package com.angelPods.command.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.MImgDao;
import com.angelPods.dao.MemberDao;
import com.angelPods.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		int ri = -1;
		MemberDao mDao = MemberDao.getInstance();
		MImgDao mImgDao = MImgDao.getInstance();
		
		MultipartRequest mRequest = null;
		try {
			String directory = session.getServletContext().getRealPath("/images/member/");
			int maxSize = 1024 * 1024 * 100;
			String encoding = "UTF-8";
			mRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		String name = mRequest.getParameter("name");
		String mail = mRequest.getParameter("mail");

		String imageSystemName = mRequest.getFilesystemName("userImg");
		String imageName = mRequest.getOriginalFileName("userImg");
		if(imageSystemName != null) {
			ri = mImgDao.delete(userId);
			if(ri==1)
			mImgDao.add(imageSystemName, imageName, userId);
		}
		
		MemberDto mDto = mDao.getMember(userId);
		mDto.setName(name);
		mDto.seteMail(mail);
		
		mDao.modify(mDto);
		
		
		request.setAttribute("ri", ri);
	}

}
