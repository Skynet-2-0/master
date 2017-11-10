package Users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mathi, Brage
 */
public class UserAccount {
    
    public static final String GENDER_MALE ="M";
    public static final String GENDER_FEMALE ="F";
    
    private String userName;
    private String gender;
    private String password;
    private int user_account_id;
    private String name;
    private String email;
    private String usertype;
    
    public UserAccount(){

    }
    
    public UserAccount(String userName, String gender, int user_account_id, String name, String email, String usertype){
        this.userName = userName;
        this.gender = gender;
        this.user_account_id = user_account_id;
        this.name = name;
        this.email = email;
        this.usertype = usertype;
    }
    
    public String getUserName(){
        return userName;
    }
    
    public void setUserName(String userName){
        this.userName = userName;
    }
    
    public String getGender(){
        return gender;
    }
    
    public void setGender(String gender){
        this.gender = gender;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
     public int getUser_account_id(){
        return user_account_id;
    }
    
    public void setUser_account_id(int user_account_id){
        this.user_account_id = user_account_id;
    }
    
     public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email= email;
    }
    
    public String getUserType(){
        return usertype;
    }
    
    public void setUserType(String usertype){
        this.usertype = usertype;
    }

    
}
