package com.xiachufang;

public class Unit {
	private String key;
    private int value;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Unit(String key, int value) {
        this.key = key;
        this.value = value;
    }
    @Override
    public String toString(){
        return "key:  "+key+"  value:  "+value;
    }
}
