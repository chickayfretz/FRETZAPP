<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once 'config/Database.php';
include_once 'models/User.php';

$db = (new Database())->connect();
$user = new User($db);

$data = json_decode(file_get_contents("php://input"));
$user->email = $data->email ?? '';
$user->password = $data->password ?? '';

$loggedInUser = $user->login();

if ($loggedInUser) {
    echo json_encode(['success' => true, 'user' => $loggedInUser]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid email or password.']);
}
