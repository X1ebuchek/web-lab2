package com.example.demo4;

public class Result {
    double x;
    double y;
    double r;
    String shot;
    String  currentTime;
    int leadTime;

    public Result(double x, double y, double r, String shot, String currentTime, int leadTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.shot = shot;
        this.currentTime = currentTime;
        this.leadTime = leadTime;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getShot() {
        return shot;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public int getLeadTime() {
        return leadTime;
    }
}
