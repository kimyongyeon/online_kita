package com.ec21.connection;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*; 

public class PoolManager
{
	private static PoolManager instance;
	private Context initCtx;
	private Context envCtx;
	private PoolManager()
	{
		try {
			initCtx = new InitialContext();
			envCtx = (Context) initCtx.lookup("java:comp/env");
		}catch(Exception e){
			System.out.println("PoolManager Constructor [Pool Creating Error] : "+e.toString());
		}//try		
		System.out.println("PoolManager Constructor [Pool Created Now!!] : ");
	}
	
	public static synchronized PoolManager getInstance(){
		if(instance == null){
			instance = new PoolManager();
		}
		
		return instance;
	}
	
	public Connection getConnection(String dsName)
	{
		Connection conn = null;
		DataSource ds = null;
		
		try{
		
			ds  = (javax.sql.DataSource) envCtx.lookup (dsName);
						
			try{
				conn = ds.getConnection();
			}
			catch(Exception ee){
				System.out.println("PoolManager Connection Creating Fail ["+dsName+"]");
				ee.printStackTrace();
			}
			
			if(conn == null){
				initCtx = new InitialContext();
				ds  = (javax.sql.DataSource) initCtx.lookup (dsName);
				conn = ds.getConnection();
				
				if(conn == null){
					System.out.println("PoolManager Connection Creating Fail ["+dsName+"]");
					throw new SQLException("PoolManager Connection Creating Fail ["+dsName+"]");
				}
			}
			
		}catch(Exception e){
			System.out.println("getConnection Exp : "+e.toString());
			e.printStackTrace();
		}//try
		   

		return conn;
	}//getConnection
	
	public void freeConnection(String name,Connection conn){
		if(conn == null) return;

		try{
			conn.close();
		}catch(SQLException e){
			System.out.println("Pool Connection free error ");
		}

	}//freeConnection	


    public static void releaseConnection(Connection conn)
    {
		if(conn == null) return;

		try{
			conn.close();
		}catch(SQLException e){
			System.out.println("Pool Connection free error ");
		}
    }
}