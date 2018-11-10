<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Vector" %>
    
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
<link rel="stylesheet" href="guest_style.css">
</head>
<body>

	<% 
		Vector<Vector<String>> assigned = new Vector();
		assigned = (Vector<Vector<String>>)session.getAttribute("assigned_vector");
		System.out.println("In jsp");
		String vector_string = "";
		for(int i = 0; i < assigned.size(); i++){
			for(int j = 0; j < assigned.elementAt(i).size(); j++){
				
				System.out.println(i + 1);
				System.out.println(assigned.elementAt(i).elementAt(j));
				
				vector_string += assigned.elementAt(i).elementAt(j) + ",";
			}
			vector_string += ".";
		}
		
		System.out.println(vector_string);
	%>
	
        <img src="https://i.imgur.com/qEIcvn6.png" id="logo">

    <div class="householdtasks">
        
    </div>
<script>
	var householdtasks_div = document.getElementsByClassName("householdtasks")[0];
	var user_tasks_string = "<%=vector_string%>";
	var user_tasks_array = user_tasks_string.split('.');
	for(i = 0; i < user_tasks_array.length - 1; i++){
		var taskbox = document.createElement("div");		
		taskbox.className = "taskbox";
		
		var taskboxheader = document.createElement("div");
		taskboxheader.className = "taskboxheader";
		var h1 = document.createElement("h1");
		var userNumber = i + 1;
		h1.appendChild(document.createTextNode("User " + userNumber + "'s Tasks"));
		taskboxheader.appendChild(h1);
		taskbox.appendChild(taskboxheader);
		
		var assigned = document.createElement("div");
		assigned.className = "assigned";
		var h4 = document.createElement("h4");
		h4.appendChild(document.createTextNode("To-do"));
		var taskboxlist = document.createElement("li");
		taskboxlist.className = "taskboxlist";
		
		var tasks = user_tasks_array[i].split(',');
		for(j = 0; j < tasks.length - 1; j++){
			var taskboxitem = document.createElement("ul");
			taskboxitem.className = "taskboxitem";
			taskboxitem.appendChild(document.createTextNode(tasks[j]));
			taskboxlist.appendChild(taskboxitem);
		}
		assigned.appendChild(h4);
		assigned.appendChild(taskboxlist);
		taskbox.appendChild(assigned);
		taskbox.appendChild(document.createElement("br"));

		
		
		var completed = document.createElement("div");
		completed.className = "completed";
		var h4_complete = document.createElement("h4");
		h4_complete.appendChild(document.createTextNode("Completed"));
		completed.appendChild(h4_complete);
		taskbox.appendChild(completed)
		
		householdtasks_div.appendChild(taskbox);
		householdtasks_div.appendChild(document.createElement("br"));
		
			
	}
		
			
</script>
    <script
        src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/dragula.min.js'></script>
    
</body>
</html>