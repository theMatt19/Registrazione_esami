<?php

require 'vendor/autoload.php';
use League\Plates\Engine;

// Create new Plates instance
$templates = new League\Plates\Engine('templates', 'phtml');

// Code
try {
    $pdo = new PDO('mysql:host=localhost;dbname=registrazione_esami', 'root');
} catch (Exception $e) {
    echo $e->getMessage();
}

$sql = 'SELECT * FROM professore';
$stmt = $pdo->prepare($sql);
$stmt->execute();
$soci = $stmt->fetchAll();


// Render a template
echo $templates->render('login', [
    'professore' => $professore
]);