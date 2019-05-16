package com.spring.vo;

import java.util.Date;

public class StudentVO {

    private String student_name;
    private int student_code;
    private String student_email;
    private Date studend_enter;
    private Date student_out;

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public int getStudent_code() {
        return student_code;
    }

    public void setStudent_code(int student_code) {
        this.student_code = student_code;
    }

    public String getStudent_email() {
        return student_email;
    }

    public void setStudent_email(String student_email) {
        this.student_email = student_email;
    }

    public Date getStudend_enter() {
        return studend_enter;
    }

    public void setStudend_enter(Date studend_enter) {
        this.studend_enter = studend_enter;
    }

    public Date getStudent_out() {
        return student_out;
    }

    public void setStudent_out(Date student_out) {
        this.student_out = student_out;
    }
}
