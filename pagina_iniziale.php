<?php
require 'vendor/autoload.php';

use League\Plates\Engine;

// Create new Plates instance
$templates = new Engine('template', 'phtml');

// Render a template
echo $templates->render('pagina_iniziale');