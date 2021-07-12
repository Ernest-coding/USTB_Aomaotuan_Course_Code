package edu.ustb.test;

import edu.ustb.utils.MD5Util;

public class test {
    public static void main(String[] args) {
        String pass = MD5Util.getMd5("abc");
        System.out.println(pass);
    }
}
