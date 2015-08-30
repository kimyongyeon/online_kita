package com.ec21.util;

import java.io.*;

public class FileCopy 
{
    public static void main(String[] args) 
    {
        if (args.length != 2)
            System.err.println("Usage: java FileCopy <source> <destination>");
        else 
        {
            boolean result = copy(args[0], args[1]); 
        }
    }
    
    public static boolean copy(String from_name, String to_name)
    {
        if (from_name == null || from_name.equals("")) 
        {
            System.out.println("[FileCopy.java:copy(String, String)]: source file is null");
            return false;
        }
       
        if (to_name == null || to_name.equals("")) 
        {
            System.out.println("[FileCopy.java:copy(String, String)]: destination file is null");
            return false;
        }

        File from_file = new File(from_name);
        File to_file = new File(to_name);
        
        if (!from_file.exists())
        {
            System.out.println("[FileCopy.java:copy(String, String)]: No such source file: " + from_name);
            return false;
        }
        if (!from_file.isFile())
        {
            System.out.println("[FileCopy.java:copy(String, String)]: Can't copy directory: " + from_name);
            return false;
        }
        if (!from_file.canRead())
        {
            System.out.println("[FileCopy.java:copy(String, String)]: Source file is unreadable: " + from_name);
            return false;
        }
        
        if (to_file.isDirectory())
            to_file = new File(to_file, from_file.getName());
        
        if (to_file.exists()) 
        {
            if (!to_file.canWrite())
            {
                System.out.println("[FileCopy.java:copy(String, String)]: Destination file is unwriteable: " + to_name);
                return false;
            }
        }
        else 
        {  
            String parent = to_file.getParent();
            if (parent == null)
		parent = System.getProperty("user.dir");

            File dir = new File(parent);
            if (!dir.exists())
                dir.mkdirs();

            if (dir.isFile())
            {
                System.out.println("[FileCopy.java:copy(String, String)]: Destination is not a directory: " + parent);
                return false;
            }
            if (!dir.canWrite())
            {
                System.out.println("[FileCopy.java:copy(String, String)]: Destination directory is unwriteable: " + parent);
                return false;
            }
        }
        
        FileInputStream from = null;
        FileOutputStream to = null;
        try 
        {
            from = new FileInputStream(from_file);
            to = new FileOutputStream(to_file);
            byte[] buffer = new byte[4096];
            int bytes_read;

            while((bytes_read = from.read(buffer)) != -1)
                to.write(buffer, 0, bytes_read);
        }
        catch (FileNotFoundException e) { return false;}
        catch (IOException e) { return false;}
        finally 
        {
            if (from != null) try { from.close(); } catch (IOException e) { ; }
            if (to != null) try { to.close(); } catch (IOException e) { ; }
        }
        return true;
    }
}
