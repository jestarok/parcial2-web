package database;

import modelo.Usuario;

import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 * Created by Francis Cáceres on 15/6/2017.
 */
public class UsuarioQueries extends Manejador<Usuario> {
    private static UsuarioQueries instancia;

    public UsuarioQueries() {
        super(Usuario.class);
    }

    public static UsuarioQueries getInstancia() {
        if(instancia==null){
            instancia = new UsuarioQueries();
        }
        return instancia;
    }

    public boolean findUser(String username){
        EntityManager em = getEntityManager();
        boolean result = false;
        Query query;
        Usuario user;
        try{
             query = em.createQuery("SELECT a FROM Usuario a WHERE a.username = :username")
                    .setParameter("username",username);
             user = (Usuario) query.getSingleResult();

             if(user.getUsername().equals(username)){
                 return true;
             }
        }catch (Exception e){
            result = false;
        }

        return result;
    }

    public boolean findMail(String email){
        EntityManager em = getEntityManager();
        boolean result = false;
        Query query;
        Usuario user;
        try{
            query = em.createQuery("SELECT a FROM Usuario a WHERE a.email = :email")
                    .setParameter("email",email);
            user = (Usuario) query.getSingleResult();

            if(user.getEmail().equals(email)){
                return true;
            }
        }catch (Exception e){
            result = false;
        }

        return result;
    }


}
