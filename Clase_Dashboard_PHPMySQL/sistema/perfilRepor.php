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
	
	$sql = "SELECT * FROM registro_botellas $where";
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
		<title>Reportes</title>
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
						
						<div class="card mb-4">
							<div class="card-header"><i class="fas fa-table mr-1"></i>Reporte de registro de botellas</div>
							
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>S.N</th>
												<th>Nombre</th>
												<th>Usuario</th>
												<th>Punto Acopio</th>
												<th>Fecha</th>
												<th>Control</th>
												
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>S.N</th>
												<th>Nombre</th>
												<th>Usuario</th>
												<th>Punto Acopio</th>
												<th>Fecha</th>
												<th>Control</th>
												
											</tr>
										</tfoot>
										<tbody>
										<?php
                                        require_once('conexion.php'); 
                                        $db= $mysqli;
                                        $sql1="SELECT * FROM registro_botellas ORDER BY fecha DESC";
                                        $res1= $mysqli->query($sql1);
                                        if($res1->num_rows>0)
                                        {$i=1;
                                        while($data=$res1->fetch_assoc()){
                                            ?>
                                        <tr>
                                            <td><?php echo $i; ?></td>
                                            <td><?php 
												$sql2="SELECT id, nombre FROM usuarios WHERE id=" . $data['usuario'];
												$res2= $mysqli->query($sql2);
												$viewData=$res2->fetch_assoc();
												echo $viewData['nombre'];
												?>
											</td>
											<td><?php 
												$sql2="SELECT id, usuario FROM usuarios WHERE id=" . $data['usuario'];
												$res2= $mysqli->query($sql2);
												$viewData=$res2->fetch_assoc();
												echo $viewData['usuario'];
												?>
											</td>
                                            <td><?php
												$sql2="SELECT id, nombre FROM punto_acopio WHERE id=" . $data['pto_acopio'];
												$res2= $mysqli->query($sql2);
												$viewData=$res2->fetch_assoc();
												echo $viewData['nombre'];
											?>
											</td>
                                            <td><?php echo $data['fecha']; ?></td>
                                            <?php
                                            if($data['control']=='Verificado'){
                                            ?>
                                            <td><i class="fa fa-check"></i></td>
                                            <?php } else{ ?>
                                            <td><i class='fa fa-ban'></i></td>
                                            <?php } ?>

											
                                        </tr>
                                        <?php
                                        $i++;}
                                        }else{
                                        ?>
                                        <tr>
                                            <td colspan="6">Sin datos de registro de botellas plasticas </td>
                                        </tr>
                                        <?php } ?>
										</tbody>
									</table>

								</div>
                                    <div align="center">
									<h5>Ver los Reportes en los siguientes formatos:</h5>
									<a href="./excel.php" class="btn-small blue z-depth-2">
										<img src="assets/img/sobresalir.png" width="50" height="50" margin="25" HSPACE="15"></a>
                                    <a class="btn-small blue z-depth-3" href="reportes.php">
									<img src="assets/img/expediente.png" width="50" height="50" margin="25" HSPACE="15"></a>
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
