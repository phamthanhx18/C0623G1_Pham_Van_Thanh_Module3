import java.util.*;

public class Main {
    public static void main(String[] args) {
        String s = "abcbdcef";
        System.out.println(solution(s));
    }
    public static char[] solution(String s) {
        List<Character> r = new ArrayList<>();
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (s.indexOf(ch) != s.lastIndexOf(ch) && !r.contains(ch)) {
                r.add(ch);
            }
        }
        char[] c = new char[r.size()];
        for (int i = 0; i < r.size(); i++) {
            c[i] = r.get(i);
        }
        return c;
    }
}