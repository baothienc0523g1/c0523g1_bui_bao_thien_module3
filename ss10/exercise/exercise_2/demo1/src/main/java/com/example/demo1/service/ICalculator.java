package com.example.demo1.service;

public interface ICalculator {
    Double calculator(String conditional, Double first, Double second);
    Double plus(Double first, Double second);
    Double minus(Double first, Double second);
    Double multi(Double first, Double second);
    Double divide(Double first, Double second);
}
