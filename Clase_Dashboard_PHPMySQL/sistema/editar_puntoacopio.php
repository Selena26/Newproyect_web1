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
	
	
     if(!empty($_GET['edit'])){
    $editId= $_GET['edit'];
    $query="SELECT * FROM punto_acopio WHERE id=$editId";
    $res= $mysqli->query($query);
    $editData=$res->fetch_assoc();
    $Nombre= $editData['Nombre'];
    $Representante= $editData['Representante'];
    $Contacto_email= $editData['Contacto_email'];
    $Contacto_telefono= $editData['Contacto_telefono'];
    $Latitud= $editData['Latitud'];
    $Longitud= $editData['Longitud'];
     $idAttr="updateForm";
    }else{
        $Nombre='';
        $Representante= '';
        $Contacto_email= '';
        $Contacto_telefono= '';
        $Latitud= '';
        $Longitud= '';
         $editId='';
         $idAttr="adminForm";
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
                    <h1 class="mt-4">Puntos de Acopio</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="punto_acopio.php">Punto de Acopio</a></li>
                        <li class="breadcrumb-item active">Ver Puntos de Acopio</li>
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
                            <!--aqui iba antes lo del php-->
                            <form id="<?php echo $idAttr; ?>" rel="<?php echo $editId; ?>" name="punto_acopio">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Nombre del centro de acopio</label>
                                            <input type="text" placeholder="Nombre acopio" class="form-control"
                                                name="Nombre" value="<?php echo $Nombre; ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Nombre del Representante</label>
                                            <input type="text" class="form-control" placeholder="Nombre representante"
                                                name="Representante" value="<?php echo $Representante; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Correo electrónico</label>
                                            <input type="email" placeholder="ejemplo@gmail.com" class="form-control"
                                                name="Contacto_email" value="<?php echo $Contacto_email; ?>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Número de teléfono</label>
                                            <input type="number" class="form-control" placeholder="Número"
                                                name="Contacto_telefono" value="<?php echo $Contacto_telefono; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="latitud">Latitud</label>
                                            <input type="text" id="latitud" class="form-control" name="Latitud"
                                                value="<?php echo $Latitud; ?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="longitud">Longitud</label>
                                            <input type="text" id="longitud" class="form-control" name="Longitud"
                                                value="<?php echo $Longitud; ?>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <div id="mapa" style="width: 80%; height: 500px">
                                            </div>
                                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <!---===== form start====-->
                                    <div class="form-group">
                                        <button class="btn btn-secondary">Guardar</button>
                                    </div>
                                    <div class="col text-right">
                                        <a href="punto_acopio.php?" class="btn btn-secondary content-link1">Atrás </a>
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
<script>
function iniciarMapa() {
    var Latitud;
    var Longitud;

    if ($("#latitud").val() == "" && $("#longitud").val() == "") {
        Latitud = -0.4052838;
        Longitud = -79.305067;
    } else {
        Latitud = $("#latitud").val();
        Longitud = $("#longitud").val();
    }

    coordenadas = {
        lng: Longitud,
        lat: Latitud
    }

    generarMapa(coordenadas);

}

function generarMapa(coordenadas) {
    var mapa = new google.maps.Map(document.getElementById('mapa'), {
        zoom: 12,
        center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng)
    });

    marcador = new google.maps.Marker({
        map: mapa,
        draggable: true,
        position: new google.maps.LatLng(coordenadas.lat, coordenadas.lng)
    });
    marcador.addListener('dragend', function(event) {
        document.getElementById("latitud").value = this.getPosition().lat();
        document.getElementById("longitud").value = this.getPosition().lng();
    })
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=&callback=iniciarMapa"></script>