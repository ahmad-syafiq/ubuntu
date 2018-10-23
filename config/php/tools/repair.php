<?php
session_start();

if(isset($_GET['path']))
{
	if(!empty($_GET['path']))
	{
		$_GET['path'] .= (substr($_GET['path'], -1) != '/') ? '/' : '';
		$_SESSION['Mpath'] = $_GET['path'];
		header('Location:'.$_SERVER['PHP_SELF']);
	}
}
if(empty($_SESSION['Mpath']))
{
	if(!isset($_GET['path']))
	{
		header('Location:'.$_SERVER['PHP_SELF'].'?path=');
	}
	?>
	<!DOCTYPE html>
	<html>
		<head>
			<title>Repair</title>
		</head>
		<body onload="document.pathform.path.focus();">
			<form name="pathform" action="" method="GET" target='_parent'>
				<input type="text" name="path" placeholder="web path" />
			</form>
		</body>
	</html>
	<?php
	die();
}
if(!is_file($_SESSION['Mpath'].'config.php'))
{
	unset($_SESSION['Mpath']);
	header('Location:'.$_SERVER['PHP_SELF'].'?path=');
}
$t = '/Users/danang/Documents/php/';
if(file_exists($_SESSION['Mpath'].'admin/check.inc.php'))
{
	include $t.'repair_store.php';
}else{
	include $t.'repair_profile.php';
}
