package se.visma.bbs.model;

/**
 * Created by gideon on 2014-01-16.
 */
public class User {

    private String name = null;
    private String standard = null;
    private int age;
    private String gender = null;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", standard='" + standard + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                '}';
    }
}
