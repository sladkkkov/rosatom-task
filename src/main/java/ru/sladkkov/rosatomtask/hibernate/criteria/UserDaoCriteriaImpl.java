package ru.sladkkov.rosatomtask.hibernate.criteria;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import ru.sladkkov.rosatomtask.hibernate.entity.User;

import javax.persistence.criteria.*;

@Component
public class UserDaoCriteriaImpl {

    private static SessionFactory sessionFactory;

    public void save(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
            Root<User> root = criteriaQuery.from(User.class);
            criteriaQuery.select(root);
            session.getTransaction().commit();
        }
    }

    public void update(Long id, User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaUpdate<User> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(User.class);
            Root<User> root = criteriaUpdate.from(User.class);
            criteriaUpdate.set("name", user.getLastName());
            criteriaUpdate.set("email", user.getEmail());
            criteriaUpdate.set("birthdate", user.getBirthdate());
            criteriaUpdate.where(criteriaBuilder.equal(root.get("id"), user.getId()));
            session.createQuery(criteriaUpdate).executeUpdate();
            session.getTransaction().commit();

        }
    }

    public void delete(Long id) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaDelete<User> criteriaDelete = criteriaBuilder.createCriteriaDelete(User.class);
            Root<User> root = criteriaDelete.from(User.class);
            criteriaDelete.where(criteriaBuilder.equal(root.get("id"), id));
            session.createQuery(criteriaDelete).executeUpdate();
            session.getTransaction().commit();

        }
    }

    public User findById(Long id) {
        try (Session session = sessionFactory.openSession()) {
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
            Root<User> root = criteriaQuery.from(User.class);
            criteriaQuery.select(root).where(criteriaBuilder.equal(root.get("id"), id));
            User user = session.createQuery(criteriaQuery).getSingleResult();
            session.getTransaction().commit();

            return user;
        }

    }
}
