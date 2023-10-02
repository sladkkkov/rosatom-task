package ru.sladkkov.rosatomtask.io;

import java.io.*;
import java.util.Scanner;

public class SimpleFileManager {
    public static void main(String[] args) throws IOException {
        try (Scanner scanner = new Scanner(System.in)) {

            while (true) {
                String filePath = scanner.nextLine();

                if (filePath.equalsIgnoreCase("exit")) {
                    break;
                }

                File file = new File(filePath);

                if (!file.exists()) {
                    throw new FileNotFoundException("File not found");
                }

                System.out.print("(-create, -delete, -read, -write)");
                String operation = scanner.nextLine();

                switch (operation) {
                    case "-create":
                        createFile(file);
                        break;
                    case "-delete":
                        deleteFile(file);
                        break;
                    case "-read":
                        readFile(file);
                        break;
                    case "-write":
                        String textToWrite = scanner.nextLine();
                        writeFile(file, textToWrite);
                        break;
                    default:
                        System.out.println("Unknown operation: " + operation);
                        break;
                }
            }
        }
    }

    private static void createFile(File file) throws IOException {
        if (file.createNewFile()) {
            System.out.println("File created");
        } else {
            System.out.println("File exists");
        }
    }

    private static void deleteFile(File file) {
        if (file.delete()) {
            System.out.println("File deleted");
        } else {
            System.out.println("File not deleted");
        }
    }

    private static void readFile(File file) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        }
    }

    private static void writeFile(File file, String text) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            writer.write(text);
        }
    }

}