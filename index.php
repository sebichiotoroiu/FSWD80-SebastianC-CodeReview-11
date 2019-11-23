<?php 
include 'connection.php';

 ?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>sebiphp</title>
	<link rel="stylesheet" href="./css/style.css">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
</head>
<body>

	<?php include 'header.php'; ?>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://cdn.pixabay.com/photo/2015/08/27/15/42/montreal-910653__340.jpg" class="d-block w-100" alt="Responsive image">
    </div>
    <div class="carousel-item">
      <img src="https://cdn.pixabay.com/photo/2015/06/02/14/37/florence-795076_1280.jpg" class="d-block w-100" alt="Responsive image">
    </div>
    <div class="carousel-item">
      <img src="https://cdn.pixabay.com/photo/2015/08/30/06/38/hong-kong-913872__340.jpg" class="d-block w-100" alt="Responsive image">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <div class="col-lg-12 py-3 pl-5 section1 text-center" id="atrr">
        <h1>Travel Made Easy</h1>
            <p>Whether you’re looking for a romantic escape or a group getaway, we provide all of the professional and personalized services to cover your needs. </br>Learn more about my service offerings below, and reach out with any questions.</p>
      </div>
  <div class="fluid-container pt-5 text-center">
    <div class="row" id="menu">
      <div class="col-lg-2 col-md-12 col-sd-12 offset-lg-2 py-3" >
        <div class="photo">
          <img src="./img/The Palace of the Parliament.jpg" alt="">
          <button class="btn"><a href="#atrr">Attractions</a></button>
        </div>
      </div>
      <div class="col-lg-2 col-md-12 col-sd-12  offset-lg-1 py-3" >
        <div class="photo">
          <img src="./img/Casa-romaneasca.jpg" alt="">
          <button class="btn"><a href="#restaurants">Restaurants</a></button>
        </div>
      </div>
      <div class="col-lg-2 col-md-12 col-sd-12 offset-lg-1 py-3">
        <div class="photo">
          <img src="./img/Neversea.jpg" alt="">
          <button class="btn"><a href="#events">Events</a></button>
        </div>
      </div>
    </div>
  </div>
  <div class="fluid-container mt-2">
    <div class="row">
      <div class="col-lg-12 py-3 pl-5 section1" id="atrr">
        <h5>Traveler's Choice: Attractions</h5>
      </div>

    </div>
    <div class="row my-5" id="loc">
       <?php 
      $sql1 = "SELECT places.placeID, places.name, places.description, places.fk_typeID, address.street, address.city, address.country, Type.type_name, address.ZIP, images.url FROM places
            left join address
            on address.fk_placeID=places.placeID
            left join Type 
            on Type.typeID=places.fk_typeID
            left join images
            on places.placeID=images.fk_placesID";
            $result1 = $conn->query($sql1);
 
                while($rows = $result1->fetch_assoc()) {
       ?>
      <div class="col-lg-3 col-md-6 col-sd-12 py-2" data-aos="zoom-in" data-aos-duration="900">
        <div class="card">
          <img class="card-img-top" src="<?php echo $rows['url'];?>" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title"><?php echo $rows['name'];?></h5>
          <div class="card-text">
            <p>Address: <?php echo $rows['street'].', '.$rows['ZIP'];?> </p>
          </div>
        </div>
      </div>
    </div>
  <?php } ?>
    </div>

    <div class="row ">
      <div class="col-lg-12 py-3 pl-5 section1" id="restaurants">
        <h5>Traveler's Choice: Restaurants</h5>
      </div>
    </div>
    
    <div class="row my-5" id="rest">
      <?php 
      $sql = "SELECT restaurants.restID, restaurants.rest_name, restaurants.rest_description,restaurants.website, address.street, address.city, address.country, address.ZIP, images.url FROM restaurants
            left join address
            on address.fk_restID=restaurants.restID
            left join images
            on restaurants.restID=images.fk_restID";
      $result = $conn->query($sql);
 
                while($row = $result->fetch_assoc()) {
       ?>
      <div class="col-lg-3 col-md-6 col-sd-12 py-2" data-aos="zoom-in" data-aos-duration="900">
        <div class="card">
          <img class="card-img-top" src="<?php echo $row['url'];?>" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title"><?php echo $row['rest_name'];?></h5>
          <div class="card-text">
            <p>Address: <?php echo $row['street'].', '.$row['ZIP'];?> </p>
            <p><a href="${this.webAddress}"><?php echo $row['website']; ?></a></p> 
          </div>
        </div>
      </div>
    </div>
  <?php } ?>
    </div>
    <div class="row ">
      <div class="col-lg-12 py-3 pl-5 section1" id="events">
        <h5>Traveler's Choice: Events</h5>
      </div>
    </div>
      <div class="row my-5" id="event">
        <?php 
      $sql ="SELECT events.eventID, events.event_name,events.event_date, events.event_time, Type.type_name, address.street, address.city, address.country, address.ZIP,images.url FROM events
           left join address
            on address.fk_eventID=events.eventID
           left join Type 
            on Type.typeID=events.fk_typeID
            left join images
          on images.fk_eventID=events.eventID";
            $result = $conn->query($sql);
 
                while($rows = $result->fetch_assoc()) {
       ?>
      <div class="col-lg-3 col-md-6 col-sd-12 py-2" data-aos="zoom-in" data-aos-duration="900">
        <div class="card">
          <img class="card-img-top" src="<?php echo $rows['url'];?>" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title"><?php echo $rows['event_name'];?></h5>
          <div class="card-text">
            <p>Address: <?php echo $rows['street'].', '.$rows['ZIP'];?> </p>
            <p>Date:<?php echo ' '.$rows['event_date'].', '.$rows['event_time']; ?></a></p> 
          </div>
        </div>
      </div>
    </div>
  <?php } ?>
      </div>
    
  </div>
  

	<?php include 'footer.php'; ?>


  
  <script src="./javascript/script.js" type="text/javascript"></script>

</body>
</html>