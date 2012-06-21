package com.xiachufang;

public class Levenshtein {
    public static int ditstance(String source, String target) {
        int src_length = source.length() + 1;
        int tgt_length = target.length() + 1;

        if (src_length == 1) {
            return tgt_length - 1;
        }

        if (tgt_length == 1) {
            return src_length - 1;
        }

        int[][] matrix = new int[src_length][tgt_length];
        for (int i = 0; i < src_length; i++) {
            matrix[i][0] = i;
        }
        for (int i = 0; i < tgt_length; i++) {
            matrix[0][i] = i;
        }

        for (int i = 1; i < src_length; i++) {
            char src_char = source.charAt(i-1);
            for (int j = 1; j < tgt_length; j++) {
                char tgt_char = target.charAt(j-1);
                int cost = (src_char == tgt_char)?0:1;
                int above = matrix[i-1][j]+1;
                int left = matrix[i][j-1]+1;
                int diag = matrix[i-1][j-1]+cost;
                int value = Math.min(above, Math.min(left, diag));
                matrix[i][j] = value;
            }
        }
        
        return matrix[src_length - 1][tgt_length - 1];
    }
}
