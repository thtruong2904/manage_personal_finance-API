package com.huutruong.moneypro.Utils;

import java.util.Random;

public class GenerateId {
    public static Long genetaredId() {
        Random rd = new Random();
        long result = Math.abs(rd.nextLong());
        return Long.valueOf(result);
    }
}
