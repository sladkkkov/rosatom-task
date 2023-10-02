package ru.sladkkov.rosatomtask.serialization;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.*;

@Getter
@Setter
@ToString
public class Human implements Serializable {

    private String name;
    private int age;

    private transient String work;

    public Human(String name, int age) {
        this.name = name;
        this.age = age;
        this.work = calculateWork(age);
    }

    private String calculateWork(int age) {

        if (age >= 0 && age < 3) {
            return "Сидит дома";
        } else if (age >= 3 && age < 7) {
            return "Ходит в детский сад";
        } else if (age >= 7 && age < 18) {
            return "Учится в школе";
        } else if (age >= 17 && age < 23) {
            return "Учится в институте";
        } else if (age >= 24 && age < 65) {
            return "Работает";
        } else {
            return "На пенсии";
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        work = calculateWork(age);
    }
    public static void main(String[] args) {

        Human human = new Human("Иван", 25);
        Human human1 = new Human("Анна", 5);

        try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream("humans.ser"))) {
            outputStream.writeObject(human);
            outputStream.writeObject(human1);
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream("humans.ser"))) {
            Human deserializedHuman = (Human) inputStream.readObject();
            Human deserializedHuman1 = (Human) inputStream.readObject();

            System.out.println("Десериализованные объекты:");
            System.out.println(deserializedHuman);
            System.out.println(deserializedHuman1);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
