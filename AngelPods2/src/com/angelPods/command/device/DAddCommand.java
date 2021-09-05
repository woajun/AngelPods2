package com.angelPods.command.device;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.angelPods.command.Command;
import com.angelPods.dao.DevDao;
import com.angelPods.dao.DevImgDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DAddCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		int ri = -1;
		DevDao devDao = DevDao.getInstance();
		DevImgDao devImgDao = DevImgDao.getInstance();

		MultipartRequest mRequest = null;
		try {
			String directory = session.getServletContext().getRealPath("/devimgs/");
			int maxSize = 1024 * 1024 * 100;
			String encoding = "UTF-8";
			mRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		int cdNum = Integer.parseInt(mRequest.getParameter("cdNum"));
		String sn = mRequest.getParameter("sn");

		int devNum = devDao.add(userId, cdNum, sn);
		
		for (int i = 1; i <= 5; i ++) {
			String image = "image" +i;
			try {
				String imageSystemName = mRequest.getFilesystemName(image);
				String imageName = mRequest.getOriginalFileName(image);
				if(imageSystemName != null) {
					devImgDao.add(imageSystemName, imageName, devNum, i);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		if(devNum != -1) { ri = 1; }
		request.setAttribute("ri", ri);
	}
}
