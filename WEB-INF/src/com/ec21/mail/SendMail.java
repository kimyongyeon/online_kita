package com.ec21.mail;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendMail
{
    private String host = "";
    private String charSet = "";  // us-ascii, iso-8859-1, euc-kr, ks_c_5601-1987, ksc5601

    public SendMail(String host)
    {
        this.host = host;
    }

    public SendMail(String serv, String code) 
    {
        this.host = serv;
        this.charSet = code;
    }

    public String getCCC(String str)
    {
        String retVal;

        if (str == null || str.equals(""))
            return "";
        else
        {
            try
            {
                if (charSet == null || charSet.equals(""))
                    retVal = new String(str.getBytes("8859_1"), "KSC5601");
                else
                    retVal = new String(str.getBytes("8859_1"), charSet);
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    public String getCCC2(String str)
    {
        String retVal;

        if (str == null || str.equals(""))
            return "";
        else
        {
            try
            {
                if (charSet == null || charSet.equals(""))
                    retVal = new String(str.getBytes("KSC5601"), "8859_1");
                else
                    retVal = new String(str.getBytes(charSet), "8859_1");
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    public String sendPlain(String fromEmail, String to, String subject, String content) 
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendPlain(null, fromEmail, toArr, subject, content);
    }

    public String sendPlain(String fromEmail, String[] toArr, String subject, String content) 
    {
        return sendPlain(null, fromEmail, toArr, subject, content);
    }

    public String sendPlain(String fromName, String fromEmail, String to, String subject, String content) 
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendPlain(fromName, fromEmail, toArr, subject, content);
    }


    public String sendPlain(String fromName, String fromEmail, String[] toArr, String subject, String content) 
    {
        int toCount = toArr.length;
        try
        {
            Properties mailProps = new Properties();
            mailProps.put("mail.smtp.host", host);
            javax.mail.Session mailSession = Session.getDefaultInstance(mailProps, null);

            InternetAddress[] toAddrs = new InternetAddress[toCount];
            for (int i = 0; i < toCount; ++i)
            {
                toAddrs[i] = new InternetAddress(toArr[i]);
            }

            InternetAddress fromAddr = null;
            if (fromName == null || fromName.equals(""))
                fromAddr = new InternetAddress(fromEmail);
            else
            {
                if (charSet == null || charSet.equals(""))
                    fromAddr = new InternetAddress(fromEmail, fromName);
                else 
                    fromAddr = new InternetAddress(fromEmail, fromName, charSet);
            }

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(fromAddr);
            message.setRecipients(Message.RecipientType.TO, toAddrs);
            if (charSet == null || charSet.equals(""))
            {
                message.setSubject(subject);
                message.setText(content);
            }
            else
            {
                message.setSubject(subject, charSet);
                message.setText(content, charSet);
            }

            Transport.send(message);
        }
        catch (AddressException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (MessagingException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (Exception e)
        {
            return "FAILURE: " + e.getMessage();
        }

        return "SUCCESS: " + toCount;
    }


    public String sendPlainFile(String fromName, String fromEmail, String to, String subject, String content, String fileName)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendPlainFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String fromName, String fromEmail, String to, String subject, String content, String[] fileArr)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendPlainFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String fromName, String fromEmail, String[] toArr, String subject, String content, String fileName)
    {
        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendPlainFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String from, String to, String subject, String content, String fileName)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendPlainFile(null, from, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String from, String to, String subject, String content, String[] fileArr)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendPlainFile(null, from, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String from, String[] toArr, String subject, String content, String fileName)
    {
        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendPlainFile(null, from, toArr, subject, content, fileArr);
    }

    public String sendPlainFile(String fromName, String fromEmail, String[] toArr, String subject, String content, String[] fileArr)
    {
        int toCount = toArr.length;
        int fileCount = 0;
        if (fileArr == null || fileArr.equals("")) fileCount = 0;
        else fileCount = fileArr.length;

        for (int i = 0; i < fileCount; i++)
        {
            File f = new File(fileArr[i]);
            if (f == null || !f.exists())
                return "FAILURE: " + fileArr[i] + " is Not Exist.!!!";
        }

        try
        {
            Properties mailProps = new Properties();
            mailProps.put("mail.smtp.host", host);
            javax.mail.Session mailSession = Session.getDefaultInstance(mailProps, null);

            InternetAddress[] toAddrs = new InternetAddress[toCount];
            for (int i = 0; i < toCount; ++i)
            {
                toAddrs[i] = new InternetAddress(toArr[i]);
            }

            InternetAddress fromAddr = null;
            if (fromName == null || fromName.equals(""))
                fromAddr = new InternetAddress(fromEmail);
            else
            {
                if (charSet == null || charSet.equals(""))
                    fromAddr = new InternetAddress(fromEmail, fromName);
                else
                    fromAddr = new InternetAddress(fromEmail, fromName, charSet);
            }

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(fromAddr);
            message.setRecipients(Message.RecipientType.TO, toAddrs);
            if (charSet == null || charSet.equals(""))
                message.setSubject(subject);
            else
                message.setSubject(subject, charSet);

            Multipart mp = new MimeMultipart();

            MimeBodyPart content_mbp = new MimeBodyPart();
            if (charSet == null || charSet.equals(""))
                content_mbp.setText(content);
            else
                content_mbp.setText(content, charSet);
            mp.addBodyPart(content_mbp);

            for (int i = 0; i < fileCount; i++)
            {
                MimeBodyPart file_mbp = new MimeBodyPart();
                FileDataSource fds = new FileDataSource(fileArr[i]);
                file_mbp.setDataHandler(new DataHandler(fds));
                file_mbp.setFileName(this.getCCC2(fds.getName()));

                mp.addBodyPart(file_mbp);
            }

            message.setContent(mp);

            message.setSentDate(new java.util.Date());

            Transport.send(message);
        }
        catch (AddressException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (MessagingException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (Exception e)
        {
            return "FAILURE: " + e.getMessage();
        }

        return "SUCCESS: " + toCount;
    }



    public String sendHtml(String fromEmail, String to, String subject, String content)
    {
        String[] toArr = new String[1];
        toArr[0] = to;
        return sendHtml(null, fromEmail, toArr, subject, content);
    }
    public String sendHtml(String fromEmail, String[] toArr, String subject, String content)
    {
        return sendHtml(null, fromEmail, toArr, subject, content);
    }

    public String sendHtml(String fromName, String fromEmail, String to, String subject, String content)
    {
        String[] toArr = new String[1];
        toArr[0] = to;
        return sendHtml(fromName, fromEmail, toArr, subject, content);
    }

    public String sendHtml(String fromName, String fromEmail, String[] toArr, String subject, String content) 
    {
        int toCount = toArr.length;
        try
        {
            Properties mailProps = new Properties();
            mailProps.put("mail.smtp.host", host);
            javax.mail.Session mailSession = Session.getDefaultInstance(mailProps, null);

            InternetAddress[] toAddrs = new InternetAddress[toCount];
            for (int i = 0; i < toCount; ++i)
            {
                toAddrs[i] = new InternetAddress(toArr[i]);
            }

            InternetAddress fromAddr = null;
            if (fromName == null || fromName.equals(""))
                fromAddr = new InternetAddress(fromEmail);
            else
            {
                if (charSet == null || charSet.equals(""))
                    fromAddr = new InternetAddress(fromEmail, fromName);
                else
                    fromAddr = new InternetAddress(fromEmail, fromName, charSet);
            }

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(fromAddr);
            message.setRecipients(Message.RecipientType.TO, toAddrs);

            if (charSet == null || charSet.equals(""))
                message.setSubject(subject);
            else
                message.setSubject(subject, charSet);

            message.setContent(this.getCCC2(content), "text/html");

            Transport.send(message);
        }
        catch (AddressException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (MessagingException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (Exception e)
        {
            return "FAILURE: " + e.getMessage();
        }

        return "SUCCESS: " + toCount;
    }


    public String sendHtmlFile(String fromName, String fromEmail, String to, String subject, String content, String fileName)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendHtmlFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromName, String fromEmail, String to, String subject, String content, String[] fileArr)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendHtmlFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromName, String fromEmail, String[] toArr, String subject, String content, String fileName)
    {
        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendHtmlFile(fromName, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromEmail, String to, String subject, String content, String fileName)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendHtmlFile(null, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromEmail, String to, String subject, String content, String[] fileArr)
    {
        String[] toArr = new String[1];
        toArr[0] = to;

        return sendHtmlFile(null, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromEmail, String[] toArr, String subject, String content, String fileName)
    {
        String[] fileArr = new String[1];
        fileArr[0] = fileName;

        return sendHtmlFile(null, fromEmail, toArr, subject, content, fileArr);
    }

    public String sendHtmlFile(String fromName, String fromEmail, String[] toArr, String subject, String content, String[] fileArr)
    {
        int toCount = toArr.length;
        int fileCount = fileArr.length;

        for (int i = 0; i < fileCount; i++)
        {
            File f = new File(fileArr[i]);
            if (f == null || !f.exists()) return "FAILURE: " + fileArr[i] + " is Not Exist.!!!"; 
        }

        try
        {
            Properties mailProps = new Properties();
            mailProps.put("mail.smtp.host", host);
            javax.mail.Session mailSession = Session.getDefaultInstance(mailProps, null);

            InternetAddress[] toAddrs = new InternetAddress[toCount];
            for (int i = 0; i < toCount; ++i)
            {
                toAddrs[i] = new InternetAddress(toArr[i]);
            }

            InternetAddress fromAddr = null;
            if (fromName == null || fromName.equals(""))
                fromAddr = new InternetAddress(fromEmail);
            else
            {
                if (charSet == null || charSet.equals(""))
                    fromAddr = new InternetAddress(fromEmail, fromName);
                else
                    fromAddr = new InternetAddress(fromEmail, fromName, charSet);
            }

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(fromAddr);
            message.setRecipients(Message.RecipientType.TO, toAddrs);
            if (charSet == null || charSet.equals(""))
                message.setSubject(subject);
            else
                message.setSubject(subject, charSet);

            Multipart mp = new MimeMultipart();

            MimeBodyPart content_mbp = new MimeBodyPart();
            content_mbp.setContent(this.getCCC2(content), "text/html");
            mp.addBodyPart(content_mbp);

            for (int i = 0; i < fileCount; i++)
            {
                MimeBodyPart file_mbp = new MimeBodyPart();
                FileDataSource fds = new FileDataSource(fileArr[i]);
                file_mbp.setDataHandler(new DataHandler(fds));
                file_mbp.setFileName(this.getCCC2(fds.getName()));

                mp.addBodyPart(file_mbp);
            }

            message.setContent(mp);

            message.setSentDate(new java.util.Date());

            Transport.send(message);
        }
        catch (AddressException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (MessagingException e)
        {
            return "FAILURE: " + e.getMessage();
        }
        catch (Exception e)
        {
            return "FAILURE: " + e.getMessage();
        }

        return "SUCCESS: " + toCount;
    }
}
