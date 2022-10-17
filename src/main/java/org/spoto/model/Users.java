package org.spoto.model;

public class Users {

    private Integer id;
    private String account;
    private String passwd;
    private Integer sex;
    private Integer age;
    private Integer status;

    public Users() {
    }

    public Users(Integer id, String account, String passwd, Integer sex, Integer age, Integer status) {
        this.id = id;
        this.account = account;
        this.passwd = passwd;
        this.sex = sex;
        this.age = age;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", passwd='" + passwd + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", status=" + status +
                '}';
    }
}
