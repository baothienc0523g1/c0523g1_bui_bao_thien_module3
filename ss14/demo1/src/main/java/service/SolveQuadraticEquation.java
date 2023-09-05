package service;

import java.util.ArrayList;
import java.util.List;

public class SolveQuadraticEquation {
    public static List<Double> solveQuadraticEquation (double first, double second, double third){
        double delta = Math.pow(second, 2) - (4 * first * third);
        List <Double> result = new ArrayList<>();
        if(delta > 0){
            double equation1 = (-second + Math.sqrt(delta)) / (2*first);
            double equation2 = (-second - Math.sqrt(delta)) / (2*first);
            result.add(equation1);
            result.add(equation2);
        } else if (delta == 0) {
            double equation = -second / (2 * first);
            result.add(equation);
        }else {
            return result;
        }
        return result;
    }
}
