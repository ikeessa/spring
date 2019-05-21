package com.spring.vo;

public class SeatVO {

    private  int seat_num;
    private  String seat_status;
    private  String seat_sex;

    public String getSeat_sex() {
        return seat_sex;
    }

    public void setSeat_sex(String seat_sex) {
        this.seat_sex = seat_sex;
    }

    public int getSeat_num() {
        return seat_num;
    }

    public String getSeat_status() {
        return seat_status;
    }

    public void setSeat_num(int seat_num) {
        this.seat_num = seat_num;
    }

    public void setSeat_status(String seat_status) {
        this.seat_status = seat_status;
    }

}

