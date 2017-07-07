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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/form-validation.js"></script>

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
            <a class="navbar-brand" href="/">Blog.EF</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->

        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <!--Pulling Awesome Font -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


    <br>
    <br>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-5">

                <form id="userForm" method="post" action="/registro" enctype="multipart/form-data">
                    <div class="form-login">
                        <h4>Registro</h4>
                        <div><canvas id="myCanvas" width="400" height="400"></canvas></div>
                        <input type='file' id="imgInp" name="imgInp"/>
                        </br>
                        <input type="text" id="userName" name="user" class="form-control input-sm chat-input" placeholder="Usuario" />
                        </br>
                        <input type="text" id="Name" name="nombre" class="form-control input-sm chat-input" placeholder="Nombre" />
                        </br>
                        <input type="password" id="userPassword" name = "pass" class="form-control input-sm chat-input" placeholder="Contraseña" />
                        </br>
                        <input type="text" id="Correo" name="correo" class="form-control input-sm chat-input" placeholder="Email" />
                        </br>
                        <textarea type="text" id="desc" name="desc" class="form-control input-sm chat-input" placeholder="Descripción"></textarea>
                        </br>
                        <label>Privada</label>
                        <input type="checkbox" id="privat" name="privat" />
                        </br>
                        <div class="wrapper">
                            <span class="group-btn">
                                <input id= "listo" type="submit" class="btn btn-primary btn-md" value = "Listo">
                            </span>
                        </div>
                    </div>
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
                                canvasContext.drawImage(imgObj, 0, 0,canvas.width,canvas.height);
                            }
                        }
                        reader.readAsDataURL(e.target.files[0]);
                    }
                </script>
            </div>
        </div>
    </div>



    <!-- Footer -->
    <footer >
        <div class="rowT" >
            <div class="col-lg-12" >
                <hr>
                <p>Copyright &copy; Francis y Jesus 2017</p>
            </div>
        </div>
        <!-- /.row -->
    </footer>

</div>
<!-- /.container -->



<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>

</html>
