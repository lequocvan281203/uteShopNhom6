package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("UTESHOP");

    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }
}