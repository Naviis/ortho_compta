<!DOCTYPE html>
<html lang="fr" ng-app="WebApp">
<head>
	<meta charset="utf-8">
	<title>Compta</title>
	<link rel="stylesheet" href="<?= base_url('assets/css/style.css') ?>">
</head>
<body>
 
    <header>
        Hello <?= $username ?>
        <a href="<?= site_url('webapp/logout') ?>">Se déconnecter</a>
    </header>

    
    
    <div class="ng-view"></div>

    <script src="<?= base_url('assets/js/lib/angular.min.js') ?>"></script>
    <script src="<?= base_url('assets/js/lib/angular.route.min.js') ?>"></script>
    <script src="<?= base_url('assets/js/app.js') ?>"></script>
    <script src="<?= base_url('assets/js/services/patient_service.js') ?>"></script>
    <script src="<?= base_url('assets/js/controllers/patient_controller.js') ?>"></script>
</body>
</html>