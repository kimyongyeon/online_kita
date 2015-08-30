package com.ec21.util;

import java.io.*;
import java.lang.*;
import java.util.*;
import java.text.*;
import java.util.HashMap;

public class BlackBox
{

    private HashMap blackBox;

    public BlackBox() 
    {
        blackBox = new HashMap();
    }

    public BlackBox(int cnt) 
    {
        blackBox = new HashMap(cnt);
    }

    public void put(String name, String value) 
    {
        blackBox.put(name, value);
    }

    public void put(String name, int value) 
    {
        String tmp = value + "";
        blackBox.put(name, tmp);
    }

    public void put(String name, Object value) 
    {
        blackBox.put(name, value);
    }

    public String getString(String name) 
    {
        String rv = (String)blackBox.get(name);
        if (rv == null) rv = "";
        return rv;
    }

    public int getInt(String name) 
    {
        String rv = (String)blackBox.get(name);
        if (rv == null || rv.equals("")) rv = "0"; 
        return Integer.parseInt(rv);
    }

    public Object getObject(String name) 
    {
        return blackBox.get(name);
    }

    public void remove(String name) 
    {
        blackBox.remove(name);
    }

    public Set keySet() 
    {
        return blackBox.keySet();
    }
}
