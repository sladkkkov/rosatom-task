package ru.sladkkov.rosatomtask.hibernate.dao;

import ru.sladkkov.rosatomtask.hibernate.entity.User;

import java.util.List;

public interface UserDao {
    User getUserById(int id);

    List<User> getUsers(int page, int pageSize);

    void createUser(User user);

    void updateUser(User user);

    void deleteUser(int id);
}
