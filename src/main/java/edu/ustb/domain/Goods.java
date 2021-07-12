package edu.ustb.domain;

import java.util.Date;

public class Goods {
    private int goodsId;
    private String goodsName;
    private double goodsPrice;
    private int goodsNum;
    private String goodsImg;
    private int goodsTypeId;
    private Date goodsCreateTime;
    private int goodsPriority;
    private String goodsDetail;

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public int getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(int goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public Date getGoodsCreateTime() {
        return goodsCreateTime;
    }

    public void setGoodsCreateTime(Date goodsCreateTime) {
        this.goodsCreateTime = goodsCreateTime;
    }

    public int getGoodsPriority() {
        return goodsPriority;
    }

    public void setGoodsPriority(int goodsPriority) {
        this.goodsPriority = goodsPriority;
    }

    public String getGoodsDetail() {
        return goodsDetail;
    }

    public void setGoodsDetail(String goodsDetail) {
        this.goodsDetail = goodsDetail;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsNum=" + goodsNum +
                ", goodsImd='" + goodsImg + '\'' +
                ", goodsTypeId=" + goodsTypeId +
                ", goodsCreateTime=" + goodsCreateTime +
                ", goodsPriority=" + goodsPriority +
                ", goodsDetail='" + goodsDetail + '\'' +
                '}';
    }
}
