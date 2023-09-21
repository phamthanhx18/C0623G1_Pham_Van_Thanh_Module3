package thuat_toan_week2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        int[][] arrayInt = new int[][]{{1, 2, 8, 43}, {9, 4, 53, 7}, {11, 6, 4, 0}, {1, 2, 6, 51}};
        System.out.println(Arrays.toString(solution(arrayInt)));
    }
    public static int[] solution(int[][] arr) {
        List<Integer> l = new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                int count = 0;
                if (arr[i][j] <= 1) {
                    count++;
                }
                for (int k = 2; k <= arr[i][j] / 2; k++) {
                    if (arr[i][j] % k == 0) {
                        count++;
                    }
                }
                if (count == 0 && !l.contains(arr[i][j])){
                    l.add(arr[i][j]);
                }
            }
        }
        Collections.sort(l);
        int [] r = new int[l.size()];
        for (int i = 0; i < r.length; i++) {
            r[i] = l.get(i);
        }
        return r;
    }
}
