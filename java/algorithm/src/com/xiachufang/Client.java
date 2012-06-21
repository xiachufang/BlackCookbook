package com.xiachufang;

public class Client {
	static int MAX = Integer.MAX_VALUE;
	static int[][] links = {{MAX,1,2,MAX},{3,MAX,1,2},{2,3,MAX,1},{MAX,2,3,MAX}};
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int sta = 0;
		int dst = 3;
		Dijkstra d = new Dijkstra(links, sta, dst);
		System.out.println(d.calculate());
	}

}
