package com.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class FileUtil {
    public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
        Part part = req.getPart("ofile");
        String partHeader = part.getHeader("content-disposition");
        System.out.println("partHeader ::: " + partHeader);

        // 헤더 값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");
        System.out.println("ori file Name :: " + originalFileName);
        if (!originalFileName.isEmpty())
            part.write(sDirectory + File.separator + originalFileName);

        return originalFileName;
    }

    public static String renameFile(String sDirectory, String fileName) {
        String ext = fileName.substring(fileName.lastIndexOf("."));
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + ext;
        File oldFile = new File(sDirectory + File.separator + fileName);
        File newFile = new File(sDirectory + File.separator + newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDir) throws ServletException, IOException {
        ArrayList<String> listFileName = new ArrayList<>();
        Collection<Part> parts = req.getParts();
        for(Part part : parts) {
            if(!part.getName().equals("ofile"))
                continue;
            String partHeader = part.getHeader("content-disposition");
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");
            if(!originalFileName.isEmpty())
                part.write(sDir+ File.separator +originalFileName);
            listFileName.add(originalFileName);
        }
        return listFileName;
    }
//    public static void deleteFile(HttpServletRequest req, String directory, String filename) {
//        String sDir = req.getServletContext().getRealPath(directory);
//        File file = new File(sDir + File.separator + filename);
//        if(file.exists())
//            file.delete();
//        else {
//            System.out.println("File not found");
//        }
//    }
    public static void deleteFile(String filePath) {
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
        } else {
            System.out.println("File not found: " + filePath);
        }
    }
}