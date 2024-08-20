<?php  include_once '../Controller/visualizarReceta_controller.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}

$nombreUsuario = isset($_SESSION['nombre']) ? $_SESSION['nombre'] : '';

?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Argon - Proyecto Ambiente Web</title>

  <link rel="icon" href="assets/img/brand/favicon.png" type="image/png">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <link rel="stylesheet" href="assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <link rel="stylesheet" href="assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body>

  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">

      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="javascript:void(0)">
          <img src="assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
        </a>
      </div>
      <div class="navbar-inner">
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <ul class="navbar-nav">
            <li class="nav-item">
            <a class="nav-link active" href="homeMedicos.php">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">Dashboard Médico</span>
              </a>
            </li>
          </ul>
          <hr class="my-3">
          <!-- Heading -->
          <h6 class="navbar-heading p-0 text-muted">
            <span class="docs-normal">Dashboard</span>
          </h6>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="asignarPrescripciones.php">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">Asignar prescripciones</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="VisualizarMedicamentos.php">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">Visualizar Medicamentos</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <div class="main-content" id="panel">
    <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
            <div class="form-group mb-0">
              <div class="input-group input-group-alternative input-group-merge">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-search"></i></span>
                </div>
                <input class="form-control" placeholder="Search" type="text">
              </div>
            </div>
            <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main"
              aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </form>
          <ul class="navbar-nav align-items-center  ml-md-auto ">
            <li class="nav-item d-xl-none">
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">
                <i class="ni ni-bell-55"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
                <div class="list-group list-group-flush">
                  <a href="#!" class="list-group-item list-group-item-action">
                    <div class="row align-items-center">
                    </div>
                  </a>
                </div>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-dark bg-default  dropdown-menu-right ">
                </div>
                <li class="nav-item dropdown">
                  <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <div class="media align-items-center">
                      <span class="avatar avatar-sm rounded-circle">
                        <img alt="Image placeholder" src="assets/img/theme/usuario.png">
                      </span>
                      <div class="media-body  ml-2  d-none d-lg-block">
                      <span class="mb-0 text-sm  font-weight-bold"><?php echo htmlspecialchars($nombreUsuario); ?></span>
                      </div>
                    </div>
                  </a>
                  <div class="dropdown-menu  dropdown-menu-right ">
                    <div class="dropdown-header noti-title">
                      <h6 class="text-overflow m-0">Bienvenido</h6>
                    </div>
                    <div class="dropdown-divider"></div>
                    <a href="dashboard_paciente.php" class="dropdown-item">
                      <i class="ni ni-tv-2"></i>
                      <span>Dashboard Paciente</span>
                    </a>
                    <a href="dashboard_medico.php" class="dropdown-item">
                      <i class="ni ni-tv-2"></i>
                      <span>Dashboard Médico</span>
                    </a>
                    <a href="login.php" class="dropdown-item">
                      <i class="ni ni-user-run"></i>
                      <span>Salir</span>
                    </a>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="header bg-primary pb-6">
          <div class="container-fluid">
            <div class="header-body">
              <div class="row">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id Medicamento</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Stock</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                          ConsultarRecetas();
                        ?>
                    </tbody>
                </table>
    <!-- Footer -->
    <footer class="footer pt-0">
      <div class="row align-items-center justify-content-lg-between">
        <div class="col-lg-6">
          <div class="copyright text-center  text-lg-left  text-muted">
            &copy; 2020
          </div>
        </div>
        <div class="col-lg-6">
          <ul class="nav nav-footer justify-content-center justify-content-lg-end">
          </ul>
        </div>
      </div>
    </footer>
  </div>
  <script src="assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <script src="assets/vendor/chart.js/dist/Chart.min.js"></script>
  <script src="assets/vendor/chart.js/dist/Chart.extension.js"></script>
  <script src="assets/js/argon.js?v=1.2.0"></script>
</body>

</html>
