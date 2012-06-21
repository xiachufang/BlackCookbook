package com.xiachufang;

import java.util.ArrayList;
import java.util.Collections;

public class HeapSorting implements SortingAlgorithm {
	private ArrayList<Unit> units;
    int count=0;

    public HeapSorting(ArrayList<Unit> data) {
        units = new ArrayList<Unit>(20);
        makeHeap(data);
    }


    public void makeHeap(ArrayList<Unit> data) {
        units.addAll(0,data);
        for (int i = units.size() / 2 - 1; i >= 0; i--) {
            heapAdjust(i);
        }
//        System.out.println("make heap complete");
    }

    public void insert(Unit u) {
        units.add(u);
        int position = units.size() - 1;
        while (position > 0 && units.get(position).getValue() < units.get((position - 1) / 2).getValue()) {
            Collections.swap(units, position,(position - 1) / 2);
            position = (position - 1) / 2;
        }
    }

    public void heapAdjust(int position) {
        while (position * 2 + 1 < units.size()) {
            if (position * 2 + 2 < units.size()) {
                if (units.get(position * 2 + 1).getValue() > units.get(position * 2 + 2).getValue()) {
                    if (units.get(position * 2 + 2).getValue() < units.get(position).getValue()) {
                        Collections.swap(units, position, position * 2 + 2);
                        position = position * 2 + 2;
                        continue;
                    } else {
                        return;
                    }
                } else {
                    if (units.get(position * 2 + 1).getValue() < units.get(position).getValue()) {
                         Collections.swap(units, position, position * 2 + 1);
                        position = position * 2 + 1;
                        continue;
                    } else {
                        return;
                    }
                }
            } else {

                if (units.get(position * 2 + 1).getValue() < units.get(position).getValue()) {
                    Collections.swap(units, position, position * 2 + 1);
                    position = position * 2 + 1;
                    continue;
                } else {
                    return;
                }
            }
        }
    }

    public int extractMin() {
        if (!units.isEmpty()) {
            Collections.swap(units, 0, units.size() - 1);
            Unit temp = units.remove(units.size() - 1);
            heapAdjust(0);
//           System.out.print(++count + "\ttimes  findmin"+temp+"\tcomplete   opentable size for now:" + units.size()+"\t");           
            return Integer.parseInt(temp.getKey());
        } else {
            return Integer.MIN_VALUE;
        }
    }

}
