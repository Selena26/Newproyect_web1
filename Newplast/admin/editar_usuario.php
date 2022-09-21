<?php
	session_start();
	require 'conexion.php';
	
	if(!isset($_SESSION['id'])){
		header("Location: index.php");
	}
	
	$id = $_SESSION['id'];
	$tipo_usuario = $_SESSION['tipo_usuario'];
	
	if($tipo_usuario == 1){
		$where = "";
		} else if($tipo_usuario == 2){
		$where = "WHERE id=$id";
	}
	
	$sql = "SELECT * FROM usuarios $where";
	$resultado = $mysqli->query($sql);
	
	
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="assets/img/newplast.jpg">
    <title>Usuarios</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/estilo1.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous">
    </script>

    <!-- Importar recursos de sweet alert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.js"></script>
    <!-- ************************************ -->
</head>

<body class="sb-nav-fixed">
    <?php
			include('partials/header.php');
		?>
    <div id="layoutSidenav">
        <?php
				include('partials/sidebar.php');
			?>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">Usuarios</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="usuarios.php">Usuarios</a></li>
                        <li class="breadcrumb-item active">Ingresar Usuario</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">En esta sección se puede editar o añadir un nuevo registro.
								Hay un formulario con contenido del usuario, contraseña, nombre, y tipo de usuario
								registrado.</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
                        <!--<div class="card-body">-->
                        <div class="content-box">
                            <?php
                                    if(!empty($_GET['edit'])){
                                        $editId= $_GET['edit'];
                                        $query="SELECT * FROM usuarios WHERE id=$editId";
                                        $res= $mysqli->query($query);
                                        $editData=$res->fetch_assoc();
                                        $usuario= $editData['usuario'];
                                        $password= $editData['password'];
                                        $nombre= $editData['nombre'];
                                        $tipo_usuario= $editData['tipo_usuario'];
                                        $idAttr="updateForm";
                                    }else{
                                        $usuario='';
                                        $password= '';
                                        $nombre= '';
                                        $tipo_usuario= '';
                                        $editId='';
                                        $idAttr="adminForm";
                                    }?>
                            <form id="<?php echo $idAttr; ?>" rel="<?php echo $editId; ?>" name="usuarios">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Nombre del usuario</label>
                                            <input type="text" placeholder="Nombre del usuario" class="form-control"
                                                name="usuario" value="<?php echo $usuario; ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Contraseña</label>
                                            <input type="password" class="form-control" placeholder="Contraseña"
                                                name="password" value="<?php echo $password; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" placeholder="Nombre" class="form-control" name="nombre"
                                                value="<?php echo $nombre; ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Tipo de usuario</label>
                                            <select class="form-control" name="tipo_usuario" type="number" required>
                                            <?php
				                            $selectedAdmin = ($tipo_usuario == 1) ? 'selected' : '';
				                            $selectedCliente = ($tipo_usuario == 2) ? 'selected' : '';
				                            ?>
                                            <option value="" selected="selected">Seleccionar</option>
                                            <option value=1 <?=$selectedAdmin ?>>Administrador</option>
                                            <option value=2 <?=$selectedCliente ?>>Usuario</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!---===== Crear el mapa====-->

                                <div class="row">
                                    <!---===== form start====-->
                                    <div class="form-group">
                                        <button class="btn btn-secondary">Guardar</button>
                                    </div>
                                    <div class="col text-right">
                                        <a href="usuarios.php?" class="btn btn-secondary content-link1">Atrás </a>
                                    </div>
                                    <!---====== form end==========-->
                                </div>
                            </form>
                        </div>
                        <!---</div>-->
                    </div>
                </div>
            </main>
        <?php include('partials/footer.php'); ?>
</body>

</html>