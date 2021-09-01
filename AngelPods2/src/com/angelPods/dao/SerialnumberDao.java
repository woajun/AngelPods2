package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.MemberDto;

public class SerialnumberDao {
	
	private static SerialnumberDao instance = new SerialnumberDao();
	
	private SerialnumberDao() {
	}
	
	public static SerialnumberDao getInstance(){
		return instance;
	}

	public Object searchSn(String sn) {
		// TODO Auto-generated method stub
		return null;
	}
}
