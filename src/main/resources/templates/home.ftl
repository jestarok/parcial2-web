<!DOCTYPE html>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Home - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/blog-home.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jq.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


    <#--Codigo Hecho a mano-->
    <script type="text/javascript">
        $(document).ready( function (){
            var variable = "${sesion}";
            $('#administrar').hide();
            $('#chatt').hide();

            if(variable ==="true") {

                $('.login').hide();
                $('.logout').show();
                $('.agregarArt').show();
                $('#chatt').show();
                <#--if("${user.isAdministrador()?c}" === "true") {-->
                    <#--$('#administrar').show();-->
                <#--}-->
            }
            else {
                $('.login').show();
                $('.logout').hide();

                $('.agregarArt').hide();
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



    </script>

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top"  role="navigation">
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
                <li class = "agregarArt">
                    <a href="#" data-toggle="modal" data-target="#login-modal"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Articulo</a>
                </li>
                <li class = "chatss">
                    <div style="padding-right: 5%" class="btn-nav"><a href="/perfil" class="btn btn-primary navbar-btn" id="chatt">Perfil</a></div>
                </li>
                <li class="login">
                    <div class="btn-nav"><a class="btn btn-default navbar-btn " id="button_login"  href="/login"> Entrar</a></div>
                </li>
                <li class="logout">
                    <div class="btn-nav"><a class="btn btn-danger navbar-btn " id="button_logout" href="/clear"> Salir</a></div>
                </li>
            </ul>

        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Area para agregar articulo -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <h1>Creando Articulo</h1><br>
            <canvas id="myCanvas" width="500" height="500"></canvas>
            <form method="post" enctype="multipart/form-data" action="/">
            <#--<img id="blah" src="img/placeHolder.png" alt="your image" />-->
            <input type='file' id="imgInp" name="imgInp"/>
            <#--<input type = "hidden" name = "dataImagen" value = "true">-->
            <textarea type="text-area" style="height: 150px;" class="form-control" row="4" name="area-articulo" id="area-articulo" placeholder="Texto..."></textarea>
            <br>
            <textarea type="tags-area" style="height: 50px;" class="form-control" row="4" name="area-etiqueta" id="area-etiqueta" placeholder="Etiquetas,..."></textarea>
            <br>
            <input type="submit" name="crearArt" id="btn-crearArt" class="crearArt loginmodal-submit" value="Aceptar">
            </form>
            <script>

                var image = new Image();
                var canvas = document.getElementById("myCanvas");
                var ctx = canvas.getContext("2d");
                ctx.fillStyle = "black";
                ctx.fillRect(0, 0, canvas.width, canvas.height);

                document.getElementById('imgInp').onchange = function handleImage(e) {
                    var reader = new FileReader();
                    reader.onload = function (event) { console.log('fdsf');
                        var canvas = document.getElementById("myCanvas");
                        var canvasContext = canvas.getContext("2d");
                        var imgObj = new Image();
                        imgObj.src = event.target.result;
                        image.src = imgObj.src;
                        console.log(imgObj.width+" "+imgObj.height);
                        imgObj.onload = function () {
//                            var x = imgObj.width;
//                            var y = imgObj.height ;
//                            if(x > y) {
//                                while (x != 500) {
//                                    console.log(x);
//                                    if (x > 500) {
//                                        x--;
//                                        y--;
//                                    } else if (x < 500) {
//                                        x++;
//                                        y++;
//                                    }
////                                    console.log("x= " + x + " y=" + y);
//                                }
//                            }else if(y > x){
//                                while (y != 500)
//                                {
//                                    console.log(x);
//                                    if (y > 500) {
//                                        x--;
//                                        y--;
//                                    } else if (y < 500) {
//                                        x++;
//                                        y++;
//                                    }
////                                    console.log("x= " + x + " y=" + y);
//                                }
//
//                            }
                            canvasContext.drawImage(imgObj, 0, 0,canvas.width,canvas.height);
                        }
                    }
                    reader.readAsDataURL(e.target.files[0]);
                }
//                $("#btn-crearArt").click(function () {
//
//                    var titulo = document.getElementById("titulo").value;
//
//                    alert(titulo);
//                    var area_articulo = document.getElementById("area-articulo").value;
//                    var area_etiqueta = document.getElementById("area-etiqueta").value;
//
//                    $.ajax({
//                        type:'POST',
//                        enctype: 'multipart/form-data',
//                        data: "titulo="+titulo+"&cuerpo-articulo="+area_articulo+"&cuerpo-etiqueta="+area_etiqueta+"&imagen="+canvas.toDataURL(),
//                        url: "/",
//                        success:function (data) {
//                            alert("succes");
//                        },error:function(e){
//                            alert("fail "+e.responseText);
//                        }
//                    });
//                });

            </script>

        </div>
    </div>
</div>

<div class="modal fade" id="chat-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container col-lg-8">
            <h1>Creando Articulo</h1><br>
            <div class="form-group">
                <input type="text" id="Nombre" class="form-control" placeholder="Nombre del pana" readonly>
                <textarea type="text-area" style="height: 150px;" class="form-control" row="4" id="mensajeServidor" placeholder="Muchos mensajes..." readonly></textarea>
            </div>
            <div class="input-group">
                <input type="text" class="form-control" style="height: 34px" id="areaChat">
                <span class="input-group-btn">
                    <button type="submit" id="enviarChat" class="btn btn-primary" style="bottom: 5px"><span class="glyphicon glyphicon-bell"></span> </button>
                </span>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

            <h1 class="page-header">
                Timeline
            </h1>
            <#if EtiqNotFound??>
                <h3>Etiqueta no encontrada</h3>
            </#if>
            <div id="area-articulos">
            <#if articulos??>
                <!-- First Blog Post -->
              <#list articulos as articulo>
                    <h2>
                        <a href="/articulos?id=${articulo.getId()}">${articulo.getId()}</a>
                    </h2>
                    <p class="lead">
                        by <i>${articulo.getAutor().getUsername()}</i>
                    </p>
                    <img src="${articulo.getFoto()}" height="500" width="500" class="img-responsive">
                    <p><span class="glyphicon glyphicon-time"></span> Publicado en ${articulo.getFecha()}</p>
                    <hr>
                    <p class="parrafoEsp">${articulo.getDescripcion()}</p>
                    <a class="btn btn-primary" href="/articulos?id=${articulo.getId()}">Leer más <span class="glyphicon glyphicon-chevron-right"></span></a>
                    <hr>
                </#list>
            </#if>
            </div>
    </div>
    <!-- /.row -->

        <!-- Busqueda -->
        <#--<div class="col-md-4">
        <form method = "post" action = "/">
            <div class="well">
                <h4>Blog Search</h4>
                <div class="input-group">
                    <input type="text" class="form-control" name ="busqueda">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                </div>
                <!-- /.input-group &ndash;&gt;
            </div>
        </form>


            <div class="well">
                <h4>Chat con Admin o Author</h4>
                <div class="input-group">
                    <input type="text" class="form-control" id="nomChat" placeholder="Nombre">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" data-toggle="modal" data-target="#chat-modal" id="botChat">
                            <span class="glyphicon glyphicon-heart"></span>
                        </button>
                    </span>
                </div>
            </div>

        </div>-->
        <!-- Fin busqueda -->


    <!-- Footer -->
    <footer>
        <div class="row" id="page-index">
            <div class="col-lg-12">
                <#if paginas??>

                        <paginaanterior></paginaanterior>
                        <#list paginas as pagina>
                            <#if pagina == 0>
                                <a href="#"  class="pagination">1 </a>
                            <#else>
                                <a href="#"  class="pagination">${pagina} </a>
                            </#if>
                        </#list>
                        <paginasgt></paginasgt>

                </#if>
                <p>Copyright &copy; Francis y Jesus 2017</p>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </footer>

</div>
<!-- /.container -->
    <script>
        $(".pagination").click(function () {
//            alert($(this).html());
            $.ajax({
                type: 'POST',
                url: "/page/"+$(this).html(),
                dataType: 'json',
                success: function(data) {
//                    alert("succes");
                    var articulos = [];
//                    console.log(Object.keys(data));

                    data.datos.forEach(function(element) {

                        var datos = element.toString().split("/");
//                        console.log(datos);
                        var tmp = {id: datos[0], titulo: datos[1], autor: datos[2], cuerpo: datos[3], fecha: datos[4]};
                        articulos.push(tmp);
                    });

                    page = "";
                    indices = '<paginaanterior></paginaanterior><p>'+
                            '<div class="col-lg-12">';
                    articulos.forEach(function (articulo) {
                        page += '<h2><a href=/articulos?id='+articulo.id+'>"'+articulo.titulo+'"</a></h2><p class="lead">'+
                                'by <i>'+articulo.autor+'</i>'+
                                '</p> <p><span class="glyphicon glyphicon-time"></span> Publicado en '+articulo.fecha+'</p>'+
                                '<hr>'+
                                '<p class="parrafoEsp">'+articulo.cuerpo.substring(0,69)+'</p>'+
                                '<a class="btn btn-primary" href="/articulos?id='+articulo.id+'">Leer más <span class="glyphicon glyphicon-chevron-right"></span></a>'+
                                '<hr>';
                    });
                    page += '<br>';

                    data.paginas.forEach(function(pagina){
                        indices += '<a href="#"  class="pagination">'+pagina+'</a>';
                    });

                    indices +='</p><paginasgt></paginasgt>'+
                            '<p>Copyright &copy; Francis y Jesus 2017</p>'+
                    '</div>';
                    document.getElementById("area-articulos").innerHTML = page;
//                    document.getElementById("page-index").innerHTML = indices;

                },
                error: function(err) {
                    alert("fail");
                    console.log(Object.keys(err));
                    console.log(err.responseText);
                }
            });
        });

    </script>
</body>

</html>