package com.angelPods.command.find;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelPods.command.Command;
import com.angelPods.dao.FImgDao;
import com.angelPods.dao.FbDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		FbDao dao = FbDao.getInstance();
		FImgDao fImgDao = FImgDao.getInstance();
		
		MultipartRequest mRequest = null;
		try {
			String directory = request.getSession().getServletContext().getRealPath("/images/findBoard/");
			int maxSize = 1024 * 1024 * 100;
			String encoding = "UTF-8";
			mRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		int fbNum = Integer.parseInt(mRequest.getParameter("fbNum"));
		int cNum = Integer.parseInt(mRequest.getParameter("cNum"));
		int cdNum = Integer.parseInt(mRequest.getParameter("cdNum"));
		String sn = mRequest.getParameter("sn");
		String lat = mRequest.getParameter("lat");
		String lng = mRequest.getParameter("lng");
		String sido = mRequest.getParameter("sido");
		String gue = mRequest.getParameter("gue");
		String dong = mRequest.getParameter("dong");
		String addrDetail = mRequest.getParameter("addrDetail");
		String title = mRequest.getParameter("title");
		String contents = mRequest.getParameter("contents");
		
		dao.modify(fbNum,  cNum,  cdNum, sido, gue , dong,  addrDetail,  title,  contents,  sn,  lat,  lng);
		
		//이미지를 생성해서 DB에 넣기
		int ri = fImgDao.clear(fbNum);
		
		if(ri == 1) {
			for (int i = 1; i <= 10; i++) {
				String image = "image"+i;
				try {
					String imageSystemName = mRequest.getFilesystemName(image);
					String imageName = mRequest.getOriginalFileName(image);
					if(imageSystemName != null) {
						fImgDao.imageSetDB(imageSystemName, imageName, fbNum, i);
					} else {
						String[] imageInfo = mRequest.getParameter(image).split("/");
						imageSystemName = imageInfo[0];
						imageName = imageInfo[1];
						fImgDao.imageSetDB(imageSystemName, imageName, fbNum, i);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(ri);
		request.setAttribute("ri", ri);
		
	}
}
