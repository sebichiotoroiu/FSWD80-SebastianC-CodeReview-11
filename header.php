<?php 

ob_start();
session_start();
require_once 'connection.php';
if( !isset($_SESSION['user']) ) {
 header("Location: login.php");
 exit;
}
// select logged-in users details
$res=mysqli_query($conn, "SELECT * FROM user, user_role WHERE userID=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

 ?>
<nav class="navbar navbar-expand-lg navbar-light" id="navbar">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="restaurant_display.php">Search Restaurants</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="locations.php">Attractions List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="restaurants.php">Restaurants List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="events.php">Events List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="map.php">Map</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user_profile.php">Your profile</a>
      </li>
    </ul>
</div>

<!-------<form id="adminphp" action="admin.php" method="get">
  <input type="text" name="pattern" value="" /> <input type="submit" value="Search" /><br>
</form>
------>
<ul>
<?php
        if (isset($_SESSION['user'])) {
          $displayName = $userRow['username'];
          echo "Login name",": ", $displayName," ";
        }
?>
</ul>
<ul>
<?php
        if (isset($_SESSION['user'])) {
          $displayEmail = $userRow['user_email'];
          echo "Email ", ": ", $displayEmail, "  ";
        }
?>
</ul>

<ul>
<?php
        if (isset($_SESSION['user'])) {
          $displayRole = $userRow['user_role'];
          echo "User_role ", ": ", $displayRole, "  ";
        }
?>
</ul>
<?php if(isset($_SESSION['user'])!="" ) {?>
<ul class="nav navbar-nav ml-auto" id="nav-right"  >  

      <li><a href="logout.php?logout"><i class="fas fa-user"></i>Signout</a></li>
    </ul>
  </div>
</nav>

<?php } else {?>
    <ul class="nav navbar-nav ml-auto" id="nav-right">
      <li><a href="register.php"><i class="fas fa-user"></i> Sign Up</a></li>
      <li class="mx-4"><a href="login.php"><i class="fas fa-sign-in-alt"></i> Login</a></li>
    </ul>
  </div>
</nav>
<?php } ?>
