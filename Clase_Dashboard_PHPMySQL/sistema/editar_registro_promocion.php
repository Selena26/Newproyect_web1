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
        <title>Tables - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/estilo1.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
            crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous">
        </script>
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
                        <h1 class="mt-4">Registro de Promociones</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="registro_promocion.php">Registro de Promociones</a></li>
                            <li class="breadcrumb-item active">Ver Registro de Promociones</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                            En esta sección se encuentra el apartado para añadir o editar un registro referente a los puntos de acopio.
                            Hay un fomulario con contenido del nombre del punto de acopio, nombre del representante, email, telefono, latitud y longitud del lugar
                            que se desee registrar.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
                                <div class="content-box">
                                    <br>
                                    <?php
                                    if(!empty($_GET['edit'])){
                                        $editId= $_GET['edit'];
                                        $query="SELECT * FROM registro_promocion WHERE id=$editId";
                                        $res= $mysqli->query($query);
                                        $editData=$res->fetch_assoc();
                                        $nombre_promocion= $editData['nombre_promocion'];
                                        $responsable_promocion= $editData['responsable_promocion'];
                                        $fecha_inicio= $editData['fecha_inicio'];
                                        $fecha_fin= $editData['fecha_fin'];
                                        $puntos_recolectar= $editData['puntos_recolectar'];
                                        $idAttr="updateForm";
                                    }else{
                                        $nombre_promocion='';
                                        $responsable_promocion= '';
                                        $fecha_inicio= '';
                                        $fecha_fin= '';
                                        $puntos_recolectar= '';
                                        $editId='';
                                        $idAttr="adminForm";
                                    }?>
                                    <form id="<?php echo $idAttr; ?>" rel="<?php echo $editId; ?>" name="registro_promocion">
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Nombre de la promocion</label>
                                                    <input type="text" class="form-control"
                                                    name="nombre_promocion" value="<?php echo $nombre_promocion; ?>">
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Responsable de la promoción</label>
                                                    <input type="text" class="form-control" 
                                                    name="responsable_promocion" value="<?php echo $responsable_promocion; ?>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Fecha de inicio</label>
                                                    <input required type="date" class="form-control"
                                                    name="fecha_inicio" value="<?php echo $fecha_inicio; ?>">
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Fecha de fin</label>
                                                    <input required type="date" class="form-control"
                                                    name="fecha_fin" value="<?php echo $fecha_fin; ?>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Puntos a recolectar</label>
                                                    <input type="number" class="form-control" placeholder="Número de puntos"
                                                        name="puntos_recolectar" value="<?php echo $puntos_recolectar; ?>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <button class="btn btn-secondary">Guardar</button>
                                            </div>
                                            <div class="col text-right">
                                                <a href="registro_promocion.php?" class="btn btn-secondary content-link1">Atrás </a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                        </div>
                    </div>
                </main>
                <?php
                    include('partials/footer.php');
                ?>
    </body>

</html>