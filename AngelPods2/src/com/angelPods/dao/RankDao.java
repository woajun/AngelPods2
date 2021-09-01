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

public class RankDao {
	
	private static RankDao instance = new RankDao();
	
	private RankDao() {
	}
	
	public static RankDao getInstance(){
		return instance;
	}

}
