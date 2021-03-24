/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author ANA
 */
public class Rate {
    private String id;
    private String score;
    private String ad;
    private String ratingNo;
    
    public Rate( String id, String score, String ad, String ratingNo) {
        
        this.id = id;
        this.score = score;
        this.ad = ad;
        this.ratingNo = ratingNo;
       
    }

    public String getRatingNo() {
        return ratingNo;
    }

    public void setRatingNo(String ratingNo) {
        this.ratingNo = ratingNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }
    
    
}
