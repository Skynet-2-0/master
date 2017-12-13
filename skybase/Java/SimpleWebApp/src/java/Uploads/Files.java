/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploads;

import java.sql.Blob;

/**
 *
 * @author mathi
 */
public class Files {
    
    private Integer attachment_id;
    private String fileName;
    private Blob fileData;
    private String description;
    
    public Files(){

    }
    
    public Files(Integer attachment_id, String fileName, Blob fileData, String description){
        this.attachment_id = attachment_id;
        this.fileName = fileName;
        this.fileData = fileData;
        this.description = description;
    }

    
    
    public Integer getId(){
        return attachment_id;
    }
    
    public void setId(Integer attachment_id){
        this.attachment_id = attachment_id;
    }
    
    public String getFileName(){
        return fileName;
    }
    
    public void setFileName(String fileName){
        this.fileName = fileName;
    }
    
    public Blob getFileData(){
        return fileData;
    }
    
    public void setFileData(Blob fileData){
        this.fileData = fileData;
    }
    
     public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
}

