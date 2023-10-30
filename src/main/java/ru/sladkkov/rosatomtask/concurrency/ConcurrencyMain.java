package ru.sladkkov.rosatomtask.concurrency;

import lombok.SneakyThrows;

import java.util.concurrent.*;

public class ConcurrencyMain {
    public static void main(String[] args) throws InterruptedException {
        createExecutorService();
        while (true) {
            System.out.println("Работает основная программа");
            Thread.sleep(1000);
        }
    }

    private static void createExecutorService() {
        ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
        service.scheduleAtFixedRate(new Runnable() {
            @SneakyThrows
            @Override
            public void run() { 
                System.out.println("Асинхронный привет!");
                Thread.sleep(5_000);
                System.out.println("Асинхронный пока!");

            }
        }, 0, 10, TimeUnit.SECONDS);
    }
}
