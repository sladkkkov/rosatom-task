package ru.sladkkov.rosatomtask.hibernate.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import ru.sladkkov.rosatomtask.hibernate.dao.UserDao;
import ru.sladkkov.rosatomtask.hibernate.entity.User;

import java.util.List;


public class UserDaoHql implements UserDao {
    private SessionFactory sessionFactory;

    public UserDaoHql(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User getUserById(int id) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM User WHERE id = :userId";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("userId", id);
            return query.uniqueResult();
        }
    }

    @Override
    public List<User> getUsers(int page, int pageSize) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM User";
            Query<User> query = session.createQuery(hql, User.class);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.list();
        }
    }

    @Override
    public void createUser(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        }
    }

    @Override
    public void updateUser(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.update(user);
            session.getTransaction().commit();
        }
    }

    @Override
    public void deleteUser(int id) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            User user = session.get(User.class, id);
            if (user != null) {
                session.delete(user);
            }
            session.getTransaction().commit();
        }
    }
}
