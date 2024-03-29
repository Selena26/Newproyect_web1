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
	
	$sql = "SELECT * FROM registro_promocion $where";
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
		<title>Proyecto - New Plast</title>
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
						<h1 class="mt-4">Registro de Botellas</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="principal.php">Dashboard</a></li>
							<li class="breadcrumb-item active">Registro de Botellas</li>
						</ol>
						<div class="card mb-4">
							<div class="card-body">En esta sección se encuentra información referente al registro de botellas. 
								Hay una tabla con contenido del usuario, punto de acopio fecha, y control de estado de las botellas 
								registradas. Así mismo, de forma detallada de puede visualizar el contenido a detalle, editar, añadir 
								o eliminar un registro.</div>
						</div>
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
							<div class="col text-right">
                                <a href="editar_registro_promocion.php?" class="btn btn-secondary content-link1">Añadir Nuevo </a>
                            </div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>S.N</th>
												<th>Nombre promoción</th>
												<th>Responsable de la promoción</th>
												<th>Fecha inicio de la promoción</th>
												<th>Fecha fin de la promoción</th>
                                                <th>Puntos a recolectar</th>
												<th>Ver</th>
												<th>Editar</th>
												<th>Eliminar</th>
											</tr>
										</thead>
										<tfoot>
                                            <tr>
												<th>S.N</th>
												<th>Nombre promoción</th>
												<th>Responsable de la promoción</th>
												<th>Fecha inicio de la promoción</th>
												<th>Fecha fin de la promoción</th>
                                                <th>Puntos a recolectar</th>
												<th>Ver</th>
												<th>Editar</th>
												<th>Eliminar</th>
											</tr>
										</tfoot>
										<tbody>
											<?php
											require_once('conexion.php'); 
											$db= $mysqli;
											$sql1="SELECT * FROM registro_promocion ORDER BY id ASC";
											$res1= $mysqli->query($sql1);
											if($res1->num_rows>0)
											{$i=1;
                                                while($data = $res1->fetch_assoc()) { ?>
												    <tr>
													    <td><?php echo $i; ?></td>
													    <td><?php echo $data['nombre_promocion']; ?></td>
													    <td><?php echo $data['responsable_promocion']; ?></td>
													    <td><?php echo $data['fecha_inicio']; ?></td>
                                                        <td><?php echo $data['fecha_fin']; ?></td>
                                                        <td><?php echo $data['puntos_recolectar']; ?></td>
													    <td><a href="ver_registro_promocion.php?view=<?php echo $data['id']; ?>" class="text-secondary content-link1"><i class='far fa-eye'></i></a></td>
                                                        <td><a href="editar_registro_promocion.php?edit=<?php echo $data['id']; ?>" class="text-success content-link1"><i onclick="cargar()" class=' far fa-edit'></i></a></td>
													    <td><a href="javascript:void(0)" class="text-danger delete" name="registro_promocion" id="<?php echo $data['id']; ?>"><i class='far fa-trash-alt'></i></a></td>
												    </tr>
											    <?php 
											    $i++;}
                                            }else{
                                            ?>
                                            <tr>
                                                <td colspan="6">Sin datos de registro de promociones </td>
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
	</body>
</html>