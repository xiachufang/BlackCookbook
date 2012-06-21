package com.xiachufang;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

public class Dijkstra {
	private SortingAlgorithm sortingAlgorithm;
	private int[][] links;
    private int sta;
    private int dst;
    private BestRoute[] routes;
    private LinkedList<Integer> result;

    public LinkedList<Integer> getResult() {
        return result;
    }

    public void setResult(LinkedList<Integer> result) {
        this.result = result;
    }

    public int getDst() {
        return dst;
    }

    public void setDst(int dst) {
        this.dst = dst;
    }

    public int[][] getLinks() {
        return links;
    }

    public void setLinks(int[][] links) {
        this.links = links;
    }

    public int getSta() {
        return sta;
    }

    public void setSta(int sta) {
        this.sta = sta;
    }

    public Dijkstra(int[][] links, int sta, int dst) {
        this.links = links;
        this.sta = sta;
        this.dst = dst;
        init();
    }

    public void init() {     //?????pen/closeè¡?

        routes = new BestRoute[links[sta].length];
        for (int i = 0; i < links[sta].length; i++) {
            if (i == sta) {
                routes[i] = new BestRoute();
                routes[i].setCast(0);
                routes[i].setLstPre(sta);
                continue;
            }
            routes[i] = new BestRoute();
            routes[i].setCast(links[sta][i]);
            routes[i].setLstPre(sta);
        }
        ArrayList<Unit> us = new ArrayList<Unit>();
        for (int i = 0; i < routes.length; i++) {
            if (routes[i].getCast() != Integer.MAX_VALUE && routes[i].isInOpen()) {
                us.add(new Unit(String.valueOf(i), routes[i].getCast()));
            }else{
                continue;
            }
        }
        sortingAlgorithm = new HeapSorting(us);
    }

    public LinkedList<Integer> calculate() {

        int pre = sta;
        while (routes[dst].isInOpen()) {    //å¦?????è¾¾ç??¹å¾ª???å§?
            pre = findMin();
            if (routes[pre].isInOpen()) {
                routes[pre].setInOpen(false) ;
            }                      //å°?penè¡¨ä¸­???cast??estrouteç¼??èµ??ç»?ext  å¹¶ä?å°?ext?¹ä?openè¡¨å????³å?next?¹ç?inopenç½?¸ºfalse)
            for (int i = 0; i < routes.length; i++) {      //
                if (links[pre][i] != Integer.MAX_VALUE) { //å¦??next??¾¾i  å¼??å¾??
                    if (links[pre][i] + routes[pre].getCast() < routes[i].getCast() && routes[i].isInOpen()) {
                        routes[i].setCast(links[pre][i] + routes[pre].getCast());
                        routes[i].setLastPre(pre);
                        sortingAlgorithm.insert(new Unit(String.valueOf(i), routes[i].getCast()));
                    }

                }
            }
        }
        result();
        Collections.reverse(result);
        return result;
    }

    private void result() {
        result = new LinkedList<Integer>();
        int i = dst;
        result.add(dst);
        while (routes[i].getLastPre() != sta || routes[i].isInOpen()) {
            if (!routes[i].isInOpen()) {
                i = routes[i].getLastPre();
                result.add(i);
            } else {
                continue;
            }
        }
        result.add(routes[i].getLastPre());
    }

    public BestRoute[] getOpen() {
        return routes;
    }

    int findMin() {
        return sortingAlgorithm.extractMin();
    }
}
