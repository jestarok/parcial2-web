<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/blog-post.css" rel="stylesheet">
    <link href="css/blog-home.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!--<script src="js/jq.js"></script>-->
  <#--  <script type="text/javascript">
        $(document).ready( function (){
            var variable= "${sesion}";

            $(".elimComent").hide();
            $(".editElim").hide();
            $(".hacerComentario").hide();

            $("#button_login").show();
            $("#button_logout").hide();

            if(variable==="true"){

                if ( ("${user.getUsername()}" === "${articulo.getAutor().getUsername()}") ||
                        ("${user.isAdministrador()?c}" === "true") )
                {
                    $(".elimComent").show();
                    $(".editElim").show();
                }
                else
                {
                    $(".editElim").hide();
                }

                $(".hacerComentario").show();

                $("#button_login").hide();
                $("#button_logout").show();
            }
        });

    </script>

    <script>
        //abriendo el objeto para el websocket
        var webSocket;
        var tiempoReconectar = 5000;

        $(document).ready(function(){

            $("#botChat").click(function(){
                if(!webSocket || webSocket.readyState == 3){
                    console.log("Entro a conexion.")
                    conectar();
                }
                $("#Nombre").val($("#nomChat").val());
                setInterval(verificarConexion, tiempoReconectar); //para reconectar.
            });
//            conectar();

            $("#enviarChat").click(function(){
                $("#mensajeServidor").val($("#mensajeServidor").val()+"Tu: "+$("#areaChat").val()+"\n");
                webSocket.send($("#nomChat").val()+"/"+$("#areaChat").val());
                $("#areaChat").val("");
            });
        });

        /**
         *
         * @param mensaje
         */
        function recibirInformacionServidor(mensaje){
            console.log("Recibiendo del servidor: "+mensaje.data)
            $("#mensajeServidor").val($("#mensajeServidor").val()+"Jefe: "+mensaje.data+"\n");
        }

        function conectar() {
            console.log("Creando el Websocket");
            webSocket = new WebSocket("ws://" + location.hostname + ":" + location.port + "/mensajeServidor");

            //indicando los eventos:
            webSocket.onmessage = function(data){recibirInformacionServidor(data);};
            webSocket.onopen  = function(e){ console.log("Conectado - status "+this.readyState); };
            webSocket.onclose = function(e){
                console.log("Desconectado - status "+this.readyState);
            };
        }

        function verificarConexion(){
            if(!webSocket || webSocket.readyState == 3){
                console.log("Entro a Verificar conexion.")
                conectar();
            }
        }



    </script>-->

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <![endif]-->

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/" style="font-size: 20px">Insta</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="btn-nav"><button class="btn btn-default navbar-btn" data-toggle="modal" data-target="#chat-modal" id="botChat">Follows</button></div>
                </li>
                <li>
                    <div class="btn-nav"><a class="btn btn-danger navbar-btn " id="button_logout" href="/clear" > Salir</a></div>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Blog Post Content Column -->
        <div class="col-lg-12">

            <!-- Perfil -->
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4 img-responsive">
                    <#if user??>
                        <img src="${user.getFoto()}" height="250" width="250">
                    <#else>
                        <img src="img/placeHolder.png" height="250" width="250">
                    </#if>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <p></p>
                <#if user??>
                    <p><strong>"${user.getNombre()}"</strong></p>
                    <#if user.isPrivacidad()>
                        <p>Publicaciones: Privadas</p>
                    <#else>
                        <p>Publicaciones: Publicas</p>
                    </#if>
                <#else>
                    <p><strong>Nombre</strong></p>
                </#if>
                </div>
                <div class="col-md-4">
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-5">
                    <#if user??>
                        <p>"${user.getDescription()}"</p>
                    <#else>
                        <p>Bio</p>
                    </#if>
                </div>
                <div class="col-md-4">
                </div>
            </div>

            <!-- Title -->
            <#--<h1>${articulo.getTitulo()}</h1>-->

            <!-- Author -->
            <p class="lead">
                <#--by <i>${articulo.getAutor().getUsername()} - ${articulo.getAutor().getNombre()}</i>-->
            </p>

            <!-- Date/Time -->
            <p>
            <form action ="/" method = "post">
                <#--<span class="glyphicon glyphicon-time"></span>  Publicado en ${articulo.getFecha()}
                <input type = "hidden" name = "eliminarArt" value = "true">
                <div class = "editElim">
                    <a href="#" data-toggle="modal" data-target="#login-modal" style='margin-left: 20em; font-size: 15px;'>Editar</a>
                    <button class="btn btn-link" style='margin-left: 5em; font-size: 15px;' name="elim" value="${articulo.getId()}">Eliminar</button>
                </div>-->
            </form>
            </p>

            <hr>
            <#--<div class="container">
            <#if sesion??>
                <#if sesion != "false">
                    <#if dioLike??>
                        <ta class="like" style='margin-left: 15em; font-size: 15px;'><i class="fa fa-thumbs-o-up"></i>
                            Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${totalLA}" />
                        </ta>
                        <a class="dislike" href = "/articulos/${id}/dislikeA"><i class="fa fa-thumbs-o-down"></i>
                            Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${totalDA}" />
                        </a>
                    </#if>
                    <#if dioDisLike??>
                        <a class="like"  href = "/articulos/${id}/likeA" style='margin-left: 15em; font-size: 15px;'><i class="fa fa-thumbs-o-up"></i>
                            Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${totalLA}" />
                        </a>
                        <ta class="dislike" href = "/articulos/${id}/dislikeA"><i class="fa fa-thumbs-o-down"></i>
                            Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${totalDA}" />
                        </ta>
                    </#if>

                    <#if aunNada??>
                        <a class="like" href = "/articulos/${id}/likeA" style='margin-left: 15em; font-size: 15px;'><i class="fa fa-thumbs-o-up"></i>
                            Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${totalLA}" />
                        </a>
                        <a class="dislike" href = "/articulos/${id}/dislikeA"><i class="fa fa-thumbs-o-down"></i>
                            Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${totalDA}" />
                        </a>
                    </#if>

                <#else>
                    <ta class="like" style='margin-left: 15em; font-size: 15px;'><i class="fa fa-thumbs-o-up"></i>
                        Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${totalLA}" />
                    </ta>
                    <ta class="dislike" ><i class="fa fa-thumbs-o-down"></i>
                        Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${totalDA}" />
                    </ta>
                </#if>
            </#if>
            </div>-->

            <hr>


        <!-- Blog Sidebar Widgets Column -->
    </div>
    <!-- /.row -->

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Francis y Jesus 2017</p>
            </div>
        </div>
        <!-- /.row -->
    </footer>

</div>
<!-- /.container -->

</body>

</html>
