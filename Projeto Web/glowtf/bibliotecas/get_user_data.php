<?php
// Database configuration
$host = "localhost";
$port = "3307"; // Port should be separated from the host
$user = "root"; 
$password = "";
$dbname = "glowtfdb";

// Create connection
$conn = new mysqli($host, $user, $password, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    // Return error as JSON
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit;
}

// Get POST data
$id = $_POST['id'];

// Prepare and execute SQL query with prepared statement
$stmt = $conn->prepare("SELECT * FROM user WHERE id = ?");
if (!$stmt) {
    // Return error as JSON
    echo json_encode(["error" => "Prepare statement failed: " . $conn->error]);
    exit;
}

$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

// Fetch results and encode as JSON
$data = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($data);

// Close statement and connection
$stmt->close();
$conn->close();
?>
