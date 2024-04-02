<?php
// Include the database connection file
include 'connect.php';

// Get the requestor's ID, location, and waste type from the requestor table
$sql = "SELECT requestor_id, Location, Wastetype FROM requestor";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $requestor_id = $row["requestor_id"];
        $location = $row["Location"];
        $wastetype = $row["Wastetype"];

        // Insert the data into the request table
        $sql = "INSERT INTO request (requestor_id, Location, Wastetype) VALUES ($requestor_id, '$location', '$wastetype')";
        if ($conn->query($sql) === TRUE) {
            header("Location: requestor.php");
        } else {
            echo "Error inserting request: " . $conn->error;
        }
    }
} else {
    echo "No requestor found.";
}

// Close the database connection
$conn->close();
?>