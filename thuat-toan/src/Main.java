import java.util.*;

public class Main {
    public static void main(String[] args) {
        String s = "abcbdcef";
        System.out.println(Arrays.toString(solution(s)));
    }
    public static char[] solution(String s) {
        String[] ars = s.split("");
        List<String> c = new ArrayList<>();
        List<Character> r = new ArrayList<>();
        for (String ss: ars) {
            if (!c.contains(ss)){
                c.add(ss);
            } else {
                r.add(ss.charAt(0));
            }
        }
        if (r.size()>=1) {
            char[] ch = new char[r.size()];
            for (int i = 0; i < ch.length; i++) {
                ch[i] = r.get(i);
            }
            return ch;
        } else {
            return new char[0];
        }
    }

}