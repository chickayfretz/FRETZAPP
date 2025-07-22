<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once 'config/Database.php';
include_once 'models/Inquiry.php';

$db = (new Database())->connect();
$inquiry = new Inquiry($db);

$data = json_decode(file_get_contents("php://input"));
$inquiry->keywords = $data->keywords ?? '';
$inquiry->answer = $data->answer ?? '';

$response = $inquiry->addInquiry()
    ? ['success' => true, 'message' => 'Inquiry added successfully.']
    : ['success' => false, 'message' => 'Failed to add inquiry.'];

echo json_encode($response);
