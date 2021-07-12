package edu.ustb.domain;

import java.util.List;

public class Funs {
    private int funId;
    private String funName;
    private String funUrl;
    private int funPid;
    private String funTarget;
    private int funSort;
    private int funLevel;

    // 二级目录
    private List<Funs> secondFunList;

    public List<Funs> getSecondFunList() {
        return secondFunList;
    }

    public void setSecondFunList(List<Funs> secondFunList) {
        this.secondFunList = secondFunList;
    }

    public int getFunId() {
        return funId;
    }

    public void setFunId(int funId) {
        this.funId = funId;
    }

    public String getFunName() {
        return funName;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }

    public String getFunUrl() {
        return funUrl;
    }

    public void setFunUrl(String funUrl) {
        this.funUrl = funUrl;
    }

    public int getFunPid() {
        return funPid;
    }

    public void setFunPid(int funPid) {
        this.funPid = funPid;
    }

    public String getFunTarget() {
        return funTarget;
    }

    public void setFunTarget(String funTarget) {
        this.funTarget = funTarget;
    }

    public int getFunSort() {
        return funSort;
    }

    public void setFunSort(int funSort) {
        this.funSort = funSort;
    }

    public int getFunLevel() {
        return funLevel;
    }

    public void setFunLevel(int funLevel) {
        this.funLevel = funLevel;
    }

    @Override
    public String toString() {
        return "Funs{" +
                "funId=" + funId +
                ", funName='" + funName + '\'' +
                ", funUrl='" + funUrl + '\'' +
                ", funPid=" + funPid +
                ", funTarget='" + funTarget + '\'' +
                ", funSort=" + funSort +
                ", funLevel=" + funLevel +
                ", secondFunList=" + secondFunList +
                '}';
    }
}
