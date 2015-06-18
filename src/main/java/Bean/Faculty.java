/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;

/**
 *
 * @author Harvey
 */
public class Faculty implements Serializable{

    private int id;
    private String name;
    private int dean;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDean() {
        return dean;
    }

    public void setDean(int dean) {
        this.dean = dean;
    }
    
    
}
