package com.example.demo2.service;

public class DiscountCalculator {
    public Double discountCalculator(Double listPrice, Double discountPercent){
        Double discountAmount = listPrice * discountPercent * 0.01;
        return discountAmount;
    }
}
