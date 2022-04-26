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
						<h1 class="mt-4">Tables</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="principal.php">Dashboard</a></li>
							<li class="breadcrumb-item active">Tables</li>
						</ol>
						<div class="card mb-4">
							<div class="card-body">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
						</div>
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>DataTable Example</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>Usuario</th>
												<th>Password</th>
												<th>Nombre</th>
												<th>Tipo Usuario</th>
												<th>Eliminar</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>Usuario</th>
												<th>Password</th>
												<th>Nombre</th>
												<th>Tipo Usuario</th>
												<th>Eliminar</th>
											</tr>
										</tfoot>
										<tbody>
											<?php
											require_once('conexion.php'); 
											$db= $mysqli;
											$sql1="SELECT * FROM usuarios ORDER BY id DESC";
											$res1= $mysqli->query($sql1);
											if($res1->num_rows>0)
											{$i=1;
											while($row = $resultado->fetch_assoc()) { ?>
												
												<tr>
													<td><?php echo $row['usuario']; ?></td>
													<td><?php echo $row['password']; ?></td>
													<td><?php echo $row['nombre']; ?></td>
													<td><?php echo $row['tipo_usuario']; ?></td>
													<td><a href="javascript:void(0)" class="text-danger delete" name="usuarios" id="<?php echo $row['id']; ?>"><i class='far fa-trash-alt'></i></a></td>
												</tr>
												
											<?php $i++;}
										 } ?>
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
	</body>
</html>
