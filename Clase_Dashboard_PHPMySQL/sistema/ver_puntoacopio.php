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
		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
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
                    <h1 class="mt-4">Puntos de Acopio</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="punto_acopio.php">Punto de Acopio</a></li>
							<li class="breadcrumb-item active">Ver Puntos de Acopio</li>
						</ol>
						<div class="card mb-4">
							<div class="card-body">Información XXXXXXXXXXXX <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
						</div>
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
							<div class="card-body">
								<div class="table-responsive">
                                    <?php 
                                    $id= $_GET['view'];
                                    $query="SELECT * FROM punto_acopio WHERE id=$id";
                                    $res= $mysqli->query($query);
                                    $viewData=$res->fetch_assoc();
                                    $backId=$viewData['id']-1;
                                    $Nombre=$viewData['Nombre'];
                                    $Representante=$viewData['Representante'];
                                    $Contacto_email=$viewData['Contacto_email'];
                                    $Contacto_telefono=$viewData['Contacto_telefono'];
                                    $Latitud=$viewData['Latitud'];
                                    $Longitud=$viewData['Longitud'];
                                    ?>
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tr>
                                        <th colspan=2><?php echo $Nombre; ?></th>
                                    </tr>
                                    <tr>
                                        <th>Nombre del representante -</th><td><?php echo $Representante; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Correo electrónico -</th><td><?php echo $Contacto_email; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Número Celular -</th><td><?php echo $Contacto_telefono; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Latitud -</th><td id="latitud"><?php echo $Latitud; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Longitud -</th><td id="latitud"><?php echo $Longitud; ?></td>
                                    </tr>
									</table>     
									
								</div>
							</div>
						</div>
					</div>
				</main>
                <?php
                include('partials/footer.php');
                ?>
			</div>
		</div>
	</body>
</html>