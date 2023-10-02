package ru.sladkkov.rosatomtask.stream;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class Developer {
    private String name;
    private List<String> languages;

    public static void main(String[] args) {
        Developer dev1 = new Developer("Наташа", Arrays.asList("Java", "C++"));
        Developer dev2 = new Developer("Эрнест", Arrays.asList("Java", "Python"));
        Developer dev3 = new Developer("Элла", Arrays.asList("С#", "Python", "JavaScript"));

        List<Developer> developerStream = List.of(dev1, dev2, dev3);

        List<String> uniqLang = new ArrayList<>();
        Set<Developer> uniq = new HashSet<>();

        developerStream.stream().forEach(t -> t.getLanguages()
                .stream()
                .filter(f -> !uniqLang.containsAll(t.getLanguages()))
                .forEach(g -> {
                    uniqLang.addAll(t.getLanguages());
                    uniq.add(t);
                }));

        uniq.forEach(System.out::println);
    }
}
