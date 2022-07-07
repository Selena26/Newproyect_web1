<?php
	session_start();
	require 'conexion.php';


    if(isset($_GET['edit']) && !empty(trim($_GET['edit']))){
        //construir la consulta
        $query='SELECT * FROM marca_botellas WHERE id=?';
        //preparar la sentencia
        if($stmt=$mysqli->prepare($query)){
            $stmt->bind_param('i', $_GET['edit']);
            //ejecuto la sentencia
            if($stmt->execute()){
                $result=$stmt->get_result();
                if($result->num_rows==1){
                    $row=$result->fetch_array
                    (MYSQLI_ASSOC);
                    $nombre_marca=$row['nombre_marca'];
                    $representacion_fisica=$row['representacion_fisica'];
                    $foto=$row['foto'];
                    $puntos_promocion=$row['puntos_promocion'];
                }else{
                    echo 'Error! No existen los resultados';
                    exit();
                }
            }else{
                echo 'Error! Revise la conexión a la base de datos';
                exit();
            }
        }
        $stmt->close();
    }else{
        header("location: marca_botellas.php");
        exit();
    }
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
    <title>Marca botellas</title>
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
                    <h1 class="mt-4">Marca de botellas</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="marca_botellas.php">Marca de botellas</a></li>
                        <li class="breadcrumb-item active">Ver Marca de botellas</li>
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
                        <!--<div class="card-body">-->
                        <div class="content-box">
                            <br>
                            <?php
                            
                                
                            ?>
                            <!--aqui iba antes lo del php-->
                            <form action="proceso_modificar.php?id=<?php echo $row['id'];?>" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Nombre de la marca</label>
                                            <input type="text" placeholder="Nombre" class="form-control"
                                                name="nombre_marca" value="<?php echo $nombre_marca; ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Representación física (cm3)</label>
                                            <input type="number" class="form-control" placeholder="cm3"
                                                name="representacion_fisica" value="<?php echo $representacion_fisica; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Foto</label><br>
                                            <img style="width: 100px;" src="data:image/jpeg;base64, <?php echo base64_encode($foto);?>"/>
                                            <input type="file" class="form-control-file"
                                                name="foto" value="<?php base64_encode($foto); ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Puntos de promoción</label>
                                            <input type="number" class="form-control" placeholder="Número de puntos"
                                                name="puntos_promocion" value="<?php echo $puntos_promocion; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!---===== form start====-->
                                    <div class="form-group">
                                    <input type="submit" value="Aceptar">
                                    </div>
                                    
                                    <div class="col text-right">
                                        <a href="marca_botellas.php?" class="btn btn-secondary content-link1">Atrás </a>
                                    </div>
                                    <!---====== form end==========-->
                                </div>
                            </form>
                        </div>
                        <!---</div>-->
                    </div>
                </div>
            </main>
            <?php
                include('partials/footer.php');
                ?>
</body>

</html>
<!---===== Crear el mapa====-->
