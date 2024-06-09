<?php
// Database configuration
$host = "localhost:3307";
$user = "root"; 
$password = "";
$dbname = "glowtfdb";

// Create connection
$conn = new mysqli($host, $user, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    // Return error as JSON
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit;
}

// Get POST data
$name = $_POST['nome'];
$pass = $_POST['senha'];

// Prepare and execute SQL query with prepared statement
$stmt = $conn->prepare("SELECT * FROM user WHERE (name = ? OR email = ?) AND password = ?");
$stmt->bind_param("sss", $name, $name, $pass);
$stmt->execute();
$result = $stmt->get_result();

// Fetch results and encode as JSON
$data = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($data);

// Close statement and connection
$stmt->close();
$conn->close();
?>
