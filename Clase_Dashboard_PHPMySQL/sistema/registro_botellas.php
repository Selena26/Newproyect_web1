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
	
	$sql = "SELECT * FROM cont_registro $where";
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
		<title>Proyecto - New Plast</title>
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
						<h1 class="mt-4">Registro de Botellas</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="principal.php">Dashboard</a></li>
							<li class="breadcrumb-item active">Registro de Botellas</li>
						</ol>
						<div class="card mb-4">
							<div class="card-body">Información XXXXXXXXXXXX <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
						</div>
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>Usuario</th>
												<th>Punto Acopio</th>
												<th>Fecha</th>
												<th>Control</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>Usuario</th>
												<th>Punto Acopio</th>
												<th>Fecha</th>
												<th>Control</th>
											</tr>
										</tfoot>
										<tbody>
											<?php while($row = $resultado->fetch_assoc()) { ?>
												
												<tr>
													<td><?php echo $row['usuario']; ?></td>
													<td><?php echo $row['pto_acopio']; ?></td>
													<td><?php echo $row['fecha']; ?></td>
													<td><?php echo $row['control']; ?></td>
												</tr>
											<?php } ?>
										</tbody>
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
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="js/scripts.js"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
		<script src="assets/demo/datatables-demo.js"></script>
	</body>
</html>
