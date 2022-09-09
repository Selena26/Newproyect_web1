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
                    <h1 class="mt-4">Usuarios</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="usuarios.php">Usuarios</a></li>
							<li class="breadcrumb-item active">Ver Usuarios</li>
						</ol>
						<div class="card mb-4">
							<div class="card-body">En esta sección se encuentra información referente al usuario.
								Hay una tabla con contenido individual del usuario, nombre, y tipo de usuario
								registrado.</div>
						</div>
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
							<div class="card-body">
								<div class="table-responsive">
                                <?php 
                                $id= $_GET['view'];
                                $query="SELECT * FROM usuarios WHERE id=$id";
                                $res= $mysqli->query($query);
                                $viewData=$res->fetch_assoc();
                                $backId=$viewData['id']-1;
                                $usuario=$viewData['usuario'];
                                $password=$viewData['password'];
                                $nombre=$viewData['nombre'];
                                $tipo_usuario=$viewData['tipo_usuario'];
                                ?>
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tr>
                                        <th>Usuario -</th><td><?php echo $usuario; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Nombre del usuario -</th><td><?php echo $nombre; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Tipo de usuario -</th><td><?php 
										if($tipo_usuario==1){
											echo 'Administrador';
										}else{
											echo 'Usuario';
										}
									 ?></td>
                                    </tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col text-right">
							<center>
								<a href="usuarios.php?" class="btn btn-secondary content-link1">Atrás </a>
							</center>
						</div>
				</main>
                <?php
                include('partials/footer.php');
                ?>
			</div>
		</div>
	</body>
</html>