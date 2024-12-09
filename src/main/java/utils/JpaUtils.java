package utils;

import  jakarta.persistence.EntityManager;
import  jakarta.persistence.EntityManagerFactory;
import  jakarta.persistence.Persistence;

public class JpaUtils {
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("UTESHOP");

    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }
}