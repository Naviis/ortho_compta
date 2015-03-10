<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>

    <?= isset($error_login) ? $error_login : '' ?>
    <form action="" method="post">
        <div>
            <label for="login">Identifiant</label><input type="text" id="login" name="login">
        </div>
        <div>
            <label for="pass">Mot de passe</label><input type="password" id="pass" name="pass">
        </div>
        <button>Log in</button>
    </form>

</body>
</html>