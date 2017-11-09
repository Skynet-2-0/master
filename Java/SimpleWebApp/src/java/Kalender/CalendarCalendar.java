/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kalender;

/**
 *
 * @author Ann Margrethe
 */
public class CalendarCalendar {
    private int Kalender_id;
    private int Dato;
    private String Hendelse;
    
    public CalendarCalendar(){
        
    }
    
    public CalendarCalendar(int Kalendar_id, int Dato, String Hendelse){
        this.Kalender_id = Kalender_id;
        this.Dato = Dato;
        this.Hendelse = Hendelse;
    }

    CalendarCalendar(Integer Dato, String Hendelse) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int getDato(){
        return Dato;
    }
    
    public String getHendelse(){
        return Hendelse;
    }
    
    public void setDato(int Dato){
        this.Dato = Dato;
    }

    public void setHendelse(String Hendelse){
        this.Hendelse = Hendelse;
    }
}
