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

    $query1=mysqli_query($mysqli,'SELECT id, Nombre FROM punto_acopio');
    $query3=mysqli_query($mysqli,'SELECT id, nombre FROM usuarios WHERE id <> 1');
    $query2=mysqli_query($mysqli,'SELECT Nombre FROM punto_acopio p JOIN registro_botellas c ON p.id = c.id');
	
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
    <title>Resgitro de botellas</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/estilo1.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/plugins/SweetAlert/dist/sweetalert2.min.css">
    <script src="assets/plugins/SweetAlert/dist/sweetalert2.min.js"></script>
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
                    <h1 class="mt-4">Registro de Botellas</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="registro_botellas.php">Registro de Botellas</a></li>
                        <li class="breadcrumb-item active">Ingresar Registro de Botellas</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">En esta sección se encuentra información referente al registro de botellas, ya sea para editar o añadir un nuevo registro.</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>Registro</div>
                        <!--<div class="card-body">-->
                        <div class="content-box">
                            <?php
                                    if(!empty($_GET['edit'])){

                                        $editId= $_GET['edit'];
                                        $query="SELECT * FROM registro_botellas WHERE id=$editId";
                                        $res= $mysqli->query($query);
                                        $editData=$res->fetch_assoc();
                                        $usuario=$editData['usuario'];
                                        $pto_acopio=$editData['pto_acopio'];
                                        $fecha=$editData['fecha'];
                                        $control=$editData['control'];
                                        $idAttr="updateForm";
                                        
                                     }else{
                                         $usuario='';
                                         $pto_acopio= '';
                                         $fecha= '';
                                         $control= '';
                                         $editId='';
                                         $idAttr="adminForm";
                                     }?>
      <form id="<?php echo $idAttr; ?>" rel="<?php echo $editId; ?>" name="registro_botellas" >
	<div class="row">
    <div class="col">
		<div class="form-group">
			<label>Usuario</label>
			<select required name="usuario" class="form-control">
			    <option value="" selected="selected">Seleccionar</option>
				<?php
				while($usuarioDB= mysqli_fetch_array($query3)){
					if ($usuario == $usuarioDB['id']) {
						echo "<option value=" . $usuarioDB['id'] . " selected=selected>" . $usuarioDB['nombre'] . "</option>";
					} else{
						echo "<option value=" . $usuarioDB['id'] . ">" . $usuarioDB['nombre'] . "</option>";
					}
				}
				?>
            </select>
		</div>
        <div class="form-group">
			<label>Punto de acopio</label>
			<select required name="pto_acopio" class="form-control">
				<option value="" selected="selected">Seleccionar</option>
				<?php
				while($pto_acopioDB= mysqli_fetch_array($query1)){
					if ($pto_acopio == $pto_acopioDB['id']) {
						echo "<option value=" . $pto_acopioDB['id'] . " selected=selected>" . $pto_acopioDB['Nombre'] . "</option>";
					} else{
						echo "<option value=" . $pto_acopioDB['id'] . ">" . $pto_acopioDB['Nombre'] . "</option>";
					}
				}
				?>
            </select>
		</div>
        <div class="form-group">
			<label>Fecha</label>
			<input required type="Date" placeholder="Introduce una fecha" class="form-control" name="fecha" value="<?php echo $fecha ?>">
		</div>
		<div class="row">
		<div class="col">
		<div class="form-group">
			<label>Control</label>
			<select id="control" name="control" class="form-control"  required>
				<?php
				$selectedVerificado = ($control == 'Verificado') ? 'selected' : '';
				$selectedNoVerificado = ($control == 'No verificado') ? 'selected' : '';
				?>
                    <option value="" selected="selected">Seleccionar</option>
                    <option value="Verificado" <?=$selectedVerificado ?>>Verificado</option>
                    <option value="No verificado" <?=$selectedNoVerificado ?>>No verificado</option>
            </select>
		    </div>
	      </div>
        </div>
		<div class="row">
            <div class="form-group">
				<button type="submit" class="btn btn-secondary">Guardar</button>
			</div>
        <div class="col text-right">
            <a href="registro_botellas.php?" class="btn btn-secondary content-link1">Atrás </a>
		</div>
	</div>
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