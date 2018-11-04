<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="Register.css" />

<title>Insert title here</title>

</head>
<script>
function householdclickB()
{
         document.getElementById("household").style.display = "block";
         document.getElementById("create").style.display = "block";
}
function householdclickA()
{
     document.getElementById("household").style.display = "block";
         document.getElementById("create").style.display = "none";
}
</script>
<body>
	<img id="homehublogo" src="https://i.imgur.com/qEIcvn6.png" border="0" />	<br />
	<br />
	<div id="register">
	<div id = "internal">
		<h1>Welcome to HomeHub</h1>
			<input type="radio" name="household" value="Create" id="radio-one" class="form-radio" onclick="householdclickB()" /> Create household 
			<input type="radio" name="household" value="Join"id="radio-one" class="form-radio"  onclick="householdclickA()" /> Join household 
			<br /> 
            <div id = "household" style="display:none">
            
                <fieldset>
      			<br /> 
      
      <input class="form__input" type="text" placeholder="Enter Household Name" required />
    </fieldset>
    
    			</div>
			<div id="create" style="display:none">
						<br>
			
				<h2>Check tasks for your Household </h2><br />
				<div id="tasks">
				
				    <input type="checkbox" class="form-checkbox" id="check-one" ><label for="check-one">Checkbox</label>
				        <input type="checkbox" class="form-checkbox" id="check-one" checked><label for="check-one">Checkbox2</label>
				    
				</div> 
				<h2>What day should these tasks be completed by? </h2>
				<select id = "header-container">
					<option value="Monday">Monday</option>
					<option value="Tuesday">Tuesday</option>
					<option value="Wednesday">Wednesday</option>
					<option value="Thursday">Thursday</option>
					<option value="Friday">Friday</option>
					<option value="Saturday">Friday</option>
					<option value="Sunday">Friday</option>
				</select>
			</div>
			<br>
			<input id="submit" type="submit" name="submit" value="Submit" class = 'form__submit' onclick="household();"/>
	</div>
		</div>
	
	<script>
		// DOES WORK, SHOULD SIGN OUT USER WHEN THEY RETURN TO HOMEPAGE
		document.getElementById("homehublogo").addEventListener("click", () => {window.location="signIn.jsp";}, false)
		
		// prints list of tasks user can select from based on available tasks in database to screen
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "/HomeHub/Tasks", false);
		xhttp.send();
		var tasks = xhttp.getResponseHeader("tasks");
		var tasksList = tasks.split(",");
		var html = "";
		for (var i = 0; i < tasksList.length; i++) {
			html += '<input type="checkbox"name="task"/>' + tasksList[i] + "  ";
			if ((i%2)!=0) html += '<br>'
		}
		document.getElementById('tasks').innerHTML = html;
	</script>
	<script>
		// BOTH creates a household and adds the user creating the household into the database
		function createHousehold() {
			// extract information from session storage and html inputs
			var email = sessionStorage.getItem("email");
			var username = sessionStorage.getItem("username");
			var pic = sessionStorage.getItem("pic");
			var houseName = document.getElementById("houseName").value;
			houseName = houseName.replace(" ", "_");
			var xhttp = new XMLHttpRequest();
			// add user to database
			xhttp.open("POST", "/HomeHub/User", false);
			xhttp.setRequestHeader("email", email);
			xhttp.setRequestHeader("fullName", username);
			xhttp.setRequestHeader("profilePic", pic);
			xhttp.setRequestHeader("houseName", houseName);
			xhttp.send();
			// query database for all existing households to check if household exists
			// create household...
				// 2 -> add household if not already present
				// 		(need to send the number of existing households for foreign key generation)
			// add user to household...
				// 1 -> add user email to respective household table
			xhttp.open("GET", "/HomeHub/Register", false);
			xhttp.send();
			var householdsString = xhttp.getResponseHeader("households");
			var householdsList = householdsString.split(",");
			var create = document.getElementsByName("household")[0].checked;
			var join = document.getElementsByName("household")[1].checked;
			xhttp.open("POST", "/HomeHub/Register", false);
			xhttp.setRequestHeader("name", houseName);
			if (create) {
				var len = 0;
				if (householdsList[0] != "") {
					len = householdsList.length;
				}
				console.log(householdsList);
				if (!householdsList.includes(houseName)) {
					xhttp.setRequestHeader("type", "create");
					xhttp.setRequestHeader("len", len);
				}
				xhttp.send();
				// also need to join the household you've created
				xhttp.open("POST", "/HomeHub/Register", false);
				xhttp.setRequestHeader("type", "join");
				xhttp.setRequestHeader("email", email);
				xhttp.send();
				var tasks = document.getElementsByName("task");
				var tasksString = ""
				for (let i = 0; i < tasks.length; i++) {
					if (tasks[i].checked) {
						tasksString += tasksList[i] + ",";
					}
				}
				xhttp.open("POST", "/HomeHub/Tasks", false);
				xhttp.setRequestHeader("tasks", tasksString);
				xhttp.setRequestHeader("household", houseName);
				xhttp.send();
			} else if (join) {				
				if (householdsList.includes(houseName)) {
					xhttp.setRequestHeader("type", "join");
					xhttp.setRequestHeader("email", email);
					xhttp.send();
				}
			}
		}
	</script>
</body>
</html>