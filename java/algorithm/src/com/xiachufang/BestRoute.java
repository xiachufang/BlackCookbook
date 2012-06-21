package com.xiachufang;

public class BestRoute {
	int cast = Integer.MAX_VALUE;
    int lastPre = -1;
    boolean inOpen = true;

    public int getLastPre() {
        return lastPre;
    }

    public void setLastPre(int lastPre) {
        this.lastPre = lastPre;
    }

    public int getCast() {
        return cast;
    }

    public void setCast(int cast) {
        this.cast = cast;
    }

    public boolean isInOpen() {
        return inOpen;
    }

    public void setInOpen(boolean inOpen) {
        this.inOpen = inOpen;
    }

    public void setLstPre(int pre) {
        this.lastPre = pre;
    }
}
