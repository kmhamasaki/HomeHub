<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="schedule.css" /> 
<link href="https://fonts.googleapis.com/css?family=Roboto"
   rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
</head>
<body>

<div class="container">
  <div class="calendar light">
    <div class="calendar_header">
      <h1 class = "header_title">Notifications</h1>
      <p class="header_copy"> Updates</p>
    </div>
    <div class="calendar_plan">
      <div class="cl_plan">
        <div class="cl_title">Today's Date</div>
        <div class="cl_copy">22nd  April  2018</div>
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
        <div class="ei_Copy">Meet with the client for final design <br> @foofinder</div>
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
    <img  src="https://i.imgur.com/qEIcvn6.png" id="logo">
    
</div>



<!-- <div id = "myChores">
	<p id = "chores"> Kristyn's Chores for This Week </p>
</div>
<div class="task-list" id="pending">
  <h3>Pending</h3>
  Sample task added manually to check look
  <div class="todo-task">
    <div class="task-header">Sample Header</div>
    <div class="task-date">25/06/1992</div>
    <div class="task-description">Lorem Ipsum Dolor Sit Amet</div>
  </div>
</div>

<div class="task-list" id="inProgress">
  <h3>In Progress</h3>
</div>

<div class="task-list" id="completed">
  <h3>Completed</h3>
    <div id="delete-div">Drag Here to Delete</div>
  
</div> -->


<div class="drag-container">
	<ul class="drag-list">
		<li class="drag-column drag-column-on-hold">
			<span class="drag-column-header">
				<h2>On Hold</h2>
				<svg class="drag-header-more" data-target="options1" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/</svg>
			</span>
				
			<div class="drag-options" id="options1"></div>
			
			<ul class="drag-inner-list" id="1">
				<li class="drag-item"></li>
				<li class="drag-item"></li>
			</ul>
		</li>
		<li class="drag-column drag-column-in-progress">
			<span class="drag-column-header">
				<h2>In Progress</h2>
				<svg class="drag-header-more" data-target="options2" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/</svg>
			</span>
			<div class="drag-options" id="options2"></div>
			<ul class="drag-inner-list" id="2">
				<li class="drag-item"></li>
				<li class="drag-item"></li>
				<li class="drag-item"></li>
			</ul>
		</li>
		<li class="drag-column drag-column-needs-review">
			<span class="drag-column-header">
				<h2>Needs Review</h2>
				<svg data-target="options3" class="drag-header-more" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/</svg>
			</span>
			<div class="drag-options" id="options3"></div>
			<ul class="drag-inner-list" id="3">
				<li class="drag-item"></li>
				<li class="drag-item"></li>
				<li class="drag-item"></li>
				<li class="drag-item"></li>
			</ul>
		</li>
		<li class="drag-column drag-column-approved">
			<span class="drag-column-header">
				<h2>Approved</h2>
				<svg data-target="options4" class="drag-header-more" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/</svg>
			</span>
			<div class="drag-options" id="options4"></div>
			<ul class="drag-inner-list" id="4">
				<li class="drag-item"></li>
				<li class="drag-item"></li>
			</ul>
		</li>
	</ul>
</div>

<script>
dragula([
	document.getElementById('1'),
	document.getElementById('2'),
	document.getElementById('3'),
	document.getElementById('4'),
	document.getElementById('5')
])

.on('drag', function(el) {
	
	// add 'is-moving' class to element being dragged
	el.classList.add('is-moving');
})
.on('dragend', function(el) {
	
	// remove 'is-moving' class from element after dragging has stopped
	el.classList.remove('is-moving');
	
	// add the 'is-moved' class for 600ms then remove it
	window.setTimeout(function() {
		el.classList.add('is-moved');
		window.setTimeout(function() {
			el.classList.remove('is-moved');
		}, 600);
	}, 100);
});


var createOptions = (function() {
	var dragOptions = document.querySelectorAll('.drag-options');
	
	// these strings are used for the checkbox labels
	var options = ['Research', 'Strategy', 'Inspiration', 'Execution'];
	
	// create the checkbox and labels here, just to keep the html clean. append the <label> to '.drag-options'
	function create() {
		for (var i = 0; i < dragOptions.length; i++) {

			options.forEach(function(item) {
				var checkbox = document.createElement('input');
				var label = document.createElement('label');
				var span = document.createElement('span');
				checkbox.setAttribute('type', 'checkbox');
				span.innerHTML = item;
				label.appendChild(span);
				label.insertBefore(checkbox, label.firstChild);
				label.classList.add('drag-options-label');
				dragOptions[i].appendChild(label);
			});

		}
	}
	
	return {
		create: create
	}
	
	
}());

var showOptions = (function () {
	
	// the 3 dot icon
	var more = document.querySelectorAll('.drag-header-more');
	
	function show() {
		// show 'drag-options' div when the more icon is clicked
		var target = this.getAttribute('data-target');
		var options = document.getElementById(target);
		options.classList.toggle('active');
	}
	
	
	function init() {
		for (i = 0; i < more.length; i++) {
			more[i].addEventListener('click', show, false);
		}
	}
	
	return {
		init: init
	}
}());

createOptions.create();
showOptions.init();



</script>
<!-- <script>
var defaults = {
		  // CSS selectors and attributes that would be used by the JavaScript functions
		  todoTask: "todo-task",
		  todoHeader: "task-header",
		  todoDate: "task-date",
		  todoDescription: "task-description",
		  taskId: "task-",
		  formId: "todo-form",
		  dataAttribute: "data",
		  deleteDiv: "delete-div"
		}, codes = {
		  "1" : "#pending", // For pending tasks
		  "2" : "#inProgress",
		  "3" : "#completed"
		};
$("." + defaults.todoTask).draggable();

//Add Task
var generateElement = function(params) {
wrapper.draggable({
 start: function() {
   $("#" + defaults.deleteDiv).show();
 },
 stop: function() {
   $("#" + defaults.deleteDiv).hide();
 }
});
};
$.each(codes, function(index, value) {
	  $(value).droppable({
	    drop: function(event, ui) {
	      var element = ui.helper,
	          css_id = element.attr("id"),
	          id = css_id.replace(options.taskId, ""),
	          object = data[id];

	      // Removing old element
	      removeElement(object);

	      // Changing object code
	      object.code = index;

	      // Generating new element
	      generateElement(object);

	      // Updating Local Storage
	      data[id] = object;
	      localStorage.setItem("todoData", JSON.stringify(data));

	      // Hiding Delete Area
	      $("#" + defaults.deleteDiv).hide();
	    }
	  });
	});


</script> -->

<!-- <ul id="myUL">
  <li>Hit the gym</li>
  <li class="checked">Pay bills</li>
  <li>Meet George</li>
  <li>Buy eggs</li>
  <li>Read a book</li>
  <li>Organize office</li>
</ul> 
<script>
// Add a "checked" symbol when clicking on a list item
var list = document.querySelector('ul');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
  }
}, false);
</script> -->

	<div class = "allProfileContents">
			<div class = "calendarContents">
				<span id = "UpcomingEvents"> View Everyone's Tasks </span>
				
				<div id = "outerDivWithBorder">
				  <div class = "tableDiv">
						<span id = "DateDiv"> Name </span>
						<span id = "TimeDiv"> Task </span>		
 						<span id = "EventSummaryTable"> Date Due </span>
 				   </div> 		   
			    </div>
			    
			</div>	   		
	</div>	
	
	<div id = "otherInfo">
		<p id = "UpcomingTasks"> Kristyn, view your upcoming tasks for next week: </p>	
		<p id = "newTasks"> Take out the trash </p> 	
	</div>
	  <script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/dragula.min.js'></script>

  

    <script  src="js/index.js"></script>	
</body>
</html>