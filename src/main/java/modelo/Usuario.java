package modelo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
@Data
@Entity
@NamedQueries({@NamedQuery(name = "Usuario.findAllByUsername", query = "SELECT a FROM Usuario a WHERE a.username like :username")})
public class Usuario implements Serializable{
    @Id
    @Column(unique = true)
    private String username;
    private String foto;
    private String nombre;
    private String password;
    @Column(unique = true)
    private String email;
    private boolean privacidad;
    private boolean autor;
    private String description;

    @OneToMany ( mappedBy = "autor", cascade = CascadeType.REMOVE)
    private List<Articulo> articulos;
    @OneToMany ( mappedBy = "autor", cascade = CascadeType.REMOVE)
    private List<Comentario> comentarios;
    @OneToMany(mappedBy = "usuario",fetch = FetchType.EAGER,orphanRemoval = true,cascade = CascadeType.REMOVE)
    private List<LikeA> likesA;
    @OneToMany(mappedBy = "usuario",fetch = FetchType.EAGER,orphanRemoval = true,cascade = CascadeType.REMOVE)
    private List<LikeC> likesC;

    public Usuario(){

    }

    public Usuario(String username, String foto, String nombre, String password, String email, boolean privacidad, String description) {
        this.username = username;
        this.foto = foto;
        this.nombre = nombre;
        this.password = password;
        this.email = email;
        this.privacidad = privacidad;
        this.autor = true;
        this.description = description;
    }

    public Usuario(String username, String nombre, String password) {
        this.username = username;
        this.nombre = nombre;
        this.password = password;
        this.autor = true;
    }



    public List<LikeA> getLikesA() {
        return likesA;
    }

    public void setLikesA(List<LikeA> likesA) {
        this.likesA = likesA;
    }

    public List<LikeC> getLikesC() {
        return likesC;
    }

    public void setLikesC(List<LikeC> likesC) {
        this.likesC = likesC;
    }

    public List<Articulo> getArticulos() {
        return articulos;
    }

    public void setArticulos(List<Articulo> articulos) {
        this.articulos = articulos;
    }

    public void addArticulo(Articulo art) {
        this.articulos.add(art);
        if (art.getAutor() != this) {
            art.setAutor(this);
        }
    }
    public void addLikeA(LikeA la) {
        this.likesA.add(la);
        if (la.getUsuario() != this) {
            la.setUsuario(this);
        }
    }

    public void addLikeC(LikeC la) {
        this.likesC.add(la);
        if (la.getUsuario() != this) {
            la.setUsuario(this);
        }
    }

    public List<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios) {
        this.comentarios = comentarios;
    }
}
