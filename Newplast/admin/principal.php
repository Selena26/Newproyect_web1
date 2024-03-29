<?php
	
	session_start();
	
	if(!isset($_SESSION['id'])){
		header("Location: index.php");
	}
	
	$nombre = $_SESSION['nombre'];
	$tipo_usuario = $_SESSION['tipo_usuario'];
	
	
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="assets/img/newplast.jpg">
    <title>Sistema Web</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/estilo1.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous">
    </script>

</head>

<body class="sb-nav-fixed">
    <!-- Cabecera -->
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
                    <h1 class="mt-4">Dashboard</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header"><i class="fas fa-chart-area mr-1"></i>Area Chart Example</div>
                                <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>Bar Chart Example</div>
                                <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>DataTable Example</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Usuario</th>
                                            <th>Punto de acopio</th>
                                            <th>Fecha</th>
                                            <th>Control</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Usuario</th>
                                            <th>Punto de acopio</th>
                                            <th>Fecha</th>
                                            <th>Control</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                        require_once('conexion.php'); 
                                        $db= $mysqli;
                                        $sql1="SELECT * FROM registro_botellas ORDER BY id DESC";
                                        $res1= $mysqli->query($sql1);
                                        if($res1->num_rows>0)
                                        {$i=1;
                                        while($data=$res1->fetch_assoc()){
                                            ?>
                                        <tr>
                                            <td><?php echo $i; ?></td>
                                            <td><?php echo $data['usuario']; ?></td>
                                            <td><?php echo $data['pto_acopio']; ?></td>
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
                        </div>
                    </div>
                </div>
            </main>
            <?php
                    include('partials/footer.php');
                ?>
</body>

</html>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>