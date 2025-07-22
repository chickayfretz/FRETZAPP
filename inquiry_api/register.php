<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once 'config/Database.php';
include_once 'models/User.php';

$db = (new Database())->connect();
$user = new User($db);

$data = json_decode(file_get_contents("php://input"));
$user->name = $data->name ?? '';
$user->email = $data->email ?? '';
$user->password = $data->password ?? '';
$user->role = $data->role ?? 'user';

$response = $user->register()
    ? ['success' => true, 'message' => 'User registered successfully.']
    : ['success' => false, 'message' => 'Registration failed. Email might already exist.'];

echo json_encode($response);
