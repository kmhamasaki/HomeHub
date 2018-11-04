<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel="stylesheet" href="style.css">
</head>
<body>

	<div class="container">
		<div class="calendar light">
			<div class="calendar_header">
				<h1 class="header_title">Notifications</h1>
				<p class="header_copy">Updates</p>
			</div>
			<div class="calendar_plan">
				<div class="cl_plan">
					<div class="cl_title">Today's Date</div>
					<div class="cl_copy">22nd April 2018</div>
					<!--     <div class="cl_add">
          <p class="number">1</p>
        </div>  -->
				</div>
			</div>
			<div class="calendar_events">
				<p class="ce_title">Latest Notifications</p>
				<div class="event_item">
					<div class="ei_Dot dot_active"></div>
					<div class="ei_Title">10:30 am</div>
					<div class="ei_Copy">Monday briefing with the team</div>
				</div>
				<div class="event_item">
					<div class="ei_Dot dot_active"></div>
					<div class="ei_Title">12:00 pm</div>
					<div class="ei_Copy">Lunch for with the besties</div>
				</div>
				<div class="event_item">
					<div class="ei_Dot dot_active"></div>
					<div class="ei_Title">13:00 pm</div>
					<div class="ei_Copy">
						Meet with the client for final design <br> @foofinder
					</div>
				</div>
				<div class="event_item">
					<div class="ei_Dot dot_active"></div>
					<div class="ei_Title">14:30 am</div>
					<div class="ei_Copy">Plan event night to inspire students</div>
				</div>
				<div class="event_item">
					<div class="ei_Dot dot_active"></div>
					<div class="ei_Title">15:30 am</div>
					<div class="ei_Copy">Add some more events to the calendar</div>
				</div>
			</div>
		</div>

	</div>

	<div class="header">
		<img src="https://i.imgur.com/qEIcvn6.png" id="logo">

	</div>





	<section class="section">
		<h1>Tasks</h1>

	</section>

	<div class="drag-container">
		<ul class="drag-list">
			<li class="drag-column drag-column-on-hold"><span
				class="drag-column-header">
					<h2>Next Week</h2>
			</span>

				<div class="drag-options" id="options1"></div>

				<ul class="drag-inner-list" id="1">
					<li class="drag-item">Mop Floor</li>
					<li class="drag-item">Task2</li>
				</ul></li>
			<li class="drag-column drag-column-in-progress"><span
				class="drag-column-header">
					<h2>This Week</h2>
			</span>
				<div class="drag-options" id="options2"></div>
				<ul class="drag-inner-list" id="2">
					<li class="drag-item">Wipe counter</li>
					<li class="drag-item">Do dishes</li>
					<li class="drag-item">Task3</li>
				</ul></li>
			<li class="drag-column drag-column-needs-review"><span
				class="drag-column-header">
					<h2>Completed</h2>
			</span>
				<div class="drag-options" id="options3"></div>
				<ul class="drag-inner-list" id="3">
					<li class="drag-item">Buy eeggs</li>

				</ul></li>
		</ul>
	</div>
	<div class="householdtasks">

		<div class="taskbox">
			<div class="taskboxheader">
				<h1>Alex's Rask</h1>
			</div>

			<div class="assigned">
				<h4>Tast 1</h4>
			</div>

			<div class="completed">
				<h4>Tast 4</h4>

			</div>
		</div>
	</div>

	<script
		src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/dragula.min.js'></script>



	<script src="index.js"></script>




</body>

</html>


