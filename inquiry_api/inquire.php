<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once 'config/Database.php';
include_once 'models/Inquiry.php';

$db = (new Database())->connect();
$inquiry = new Inquiry($db);

$data = json_decode(file_get_contents("php://input"));
$userQuestion = $data->question ?? '';

$response = [
    'answer' => $inquiry->getAnswer($userQuestion)
];

echo json_encode($response);
