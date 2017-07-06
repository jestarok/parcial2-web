package modelo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@NamedQueries(
        {@NamedQuery( name =  "Articulo.findAllSorted", query = "SELECT a FROM Articulo a order by  a.fecha desc"),
         @NamedQuery( name =  "Articulo.findAllByTagsSorted", query = "SELECT a FROM Articulo a WHERE :tag member of  a.listaEtiqueta order by a.fecha desc")})
public class Articulo implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(columnDefinition = "TEXT")
    private String foto;
//        @Column(length = 1024*5)
    private String descripcion;
    @ManyToOne
    private Usuario autor;
    @OrderBy
    private Date fecha;
    @OneToMany(mappedBy = "articulo",fetch=FetchType.EAGER,cascade = CascadeType.REMOVE)
    private List<Comentario> listaComentario;
    @OneToMany(mappedBy = "articulo",fetch=FetchType.EAGER,cascade = CascadeType.REMOVE)
    private List<Etiqueta> listaEtiqueta;
    @OneToMany(mappedBy = "articulo",fetch = FetchType.EAGER,cascade = CascadeType.REMOVE)
    private List<LikeA> likes;

    public Articulo(){

    }

    public Articulo(String foto, String descripcion, Usuario autor, List<Comentario> listaComentario, List<Etiqueta> listaEtiqueta, List<LikeA> likes) {
        this.foto = foto;
        this.descripcion = descripcion;
        this.autor = autor;
        fecha = new Date();
        java.sql.Date fechasql = new java.sql.Date(fecha.getTime());
        this.setFecha(fechasql);
        this.listaComentario = listaComentario;
        this.listaEtiqueta = listaEtiqueta;
        this.likes = likes;
    }


    public void addLikeA(LikeA like) {
        this.likes.add(like);
        if (like.getArticulo() != this) {
            like.setArticulo(this);
            //ArticuloQueries.getInstancia().editar(this);
        }
    }

    public void addEtiqueta(Etiqueta et) {
        this.listaEtiqueta.add(et);
        if (et.getArticulo() != this) {
            et.setArticulo(this);
        }
    }
    public int getGoodLikes()
    {
        int sum= 0 ;
        for(LikeA la : likes)
        {
            if(la.getIsLike())
                sum++;
        }
        return sum;
    }
    public int getTHeLike(Usuario usuario)
    {
        for(LikeA la : likes) {
            if( la.getUsuario().getUsername().equals(usuario.getUsername())) {
                int dummy =la.getId();
                likes.clear();
                return dummy;
            }
        }

        return -1;

    }
}
