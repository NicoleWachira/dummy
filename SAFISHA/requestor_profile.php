<?php
session_start();
include "connect.php";


// Fetch user details from the database
$user_id = $_SESSION['user_id'];
$sql = "SELECT Fullname, Email, Location, Wastetype FROM user INNER JOIN requestor ON user.id = requestor.requestor_id WHERE user.id = $user_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $fullname = $row['Fullname'];
    $email = $row['Email'];
    $location = $row['Location'];
    $wastetype = $row['Wastetype'];
} else {
    echo "Error fetching user details";
}

// Fetch requests made by the current requestor
$sql = "SELECT request_id, Location, Wastetype FROM request WHERE requestor_id = $user_id";
$request_result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Requestor Profile</title>
    <link rel="stylesheet" href="User profile.css">
</head>
<body>
    <div class="user-profile-container">
        <h1>Requestor Profile</h1>
        <div class="profile-details">
            <p class="user-details"><strong>Full Name:</strong> <?php echo $fullname; ?></p>
            <p class="user-details"><strong>Email:</strong> <?php echo $email; ?></p>
            <p class="user-details"><strong>Location:</strong> <?php echo $location; ?></p>
            <p class="user-details"><strong>Waste Type:</strong> <?php echo $wastetype; ?></p>
        </div>
        <div class="button-group">
            <a href="update_requestor.php"><button>Update Details</button></a>
            <button>History</button>
            <a href="logout.php"><button>Log Out</button></a>
        </div>
        <h2>Request History</h2>
        <table>
            <tr>
                <th>Request ID</th>
                <th>Location</th>
                <th>Waste Type</th>
            </tr>
            <?php while ($row = $request_result->fetch_assoc()) { ?>
                <tr>
                    <td><?php echo $row['request_id']; ?></td>
                    <td><?php echo $row['Location']; ?></td>
                    <td><?php echo $row['Wastetype']; ?></td>
                </tr>
            <?php } ?>
        </table>
    </div>
</body>
</html>
