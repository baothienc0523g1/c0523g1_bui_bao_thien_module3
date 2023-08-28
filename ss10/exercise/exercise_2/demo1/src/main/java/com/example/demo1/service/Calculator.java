package com.example.demo1.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.lang.System.out;

public class Calculator implements ICalculator{
    @Override
    public Double calculator(String conditional, Double first, Double second) {
        Double result = null;
        switch (conditional) {
            case "minus":
                result = minus(first, second);
                break;
            case "plus":
                result = plus(first, second);
                break;
            case "multi":
                result = multi(first, second);
                break;
            case "divide":
                result = divide(first, second);
        }
        return result;
    }

    @Override
    public Double plus(Double first, Double second) {
        return first + second;
    }

    @Override
    public Double minus(Double first, Double second) {
        return first - second;
    }

    @Override
    public Double multi(Double first, Double second) {
        return first * second;
    }

    @Override
    public Double divide(Double first, Double second) {
        return first / second;
    }

}
