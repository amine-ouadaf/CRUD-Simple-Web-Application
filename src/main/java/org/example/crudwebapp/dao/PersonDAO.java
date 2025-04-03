package org.example.crudwebapp.dao;


import org.example.crudwebapp.model.Person;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

public class PersonDAO {
    private static final EntityManagerFactory emf;

    static {
        EntityManagerFactory factory = null;
        boolean connected = false;
        while (!connected) {
            try {
                factory = Persistence.createEntityManagerFactory("myPU");
                factory.createEntityManager().close();
                connected = true;
            } catch (Exception e) {
                System.out.println("MySQL pas encore prêt... nouvelle tentative dans 3s");
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException ignored) {}
            }
        }
        emf = factory;
    }

    public void create(Person person) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(person);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Person> readAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT p FROM Person p", Person.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Person read(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Person.class, id);
        } finally {
            em.close();
        }
    }

    public void update(Person person) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(person);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Person person = em.find(Person.class, id);
            if (person != null) {
                em.remove(person);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}