<!DOCTYPE html>
<html lang="fr" ng-app="WebApp">
<head>
	<meta charset="utf-8">
	<title>Compta</title>
	
</head>
<body>
<h1>test</h1>
    
    Hello <?= $username ?>

    <a href="<?= site_url('webapp/logout') ?>">Se déconnecter</a>
    
    <div class="ng-view"></div>

    <script src="<?= base_url('assets/js/lib/angular.min.js') ?>"></script>
    <script src="<?= base_url('assets/js/lib/angular.route.min.js') ?>"></script>
    <script src="<?= base_url('assets/js/app.js') ?>"></script>
    <script src="<?= base_url('assets/js/services/patient_service.js') ?>"></script>
    <script src="<?= base_url('assets/js/controllers/patient_controller.js') ?>"></script>
</body>
</html>