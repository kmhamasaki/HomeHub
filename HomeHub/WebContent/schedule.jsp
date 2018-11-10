<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mypackage.UserObj"
import = "java.io.IOException"
import = "java.sql.Connection" 
import = "java.sql.DriverManager"
import = "java.sql.PreparedStatement"
import = "java.sql.ResultSet"
import = "java.sql.SQLException"
import = "java.sql.Statement"
import = "java.util.ArrayList"
import = "java.util.Arrays"
import = "java.util.List"
import = "java.util.Vector"
import = "java.sql.Driver"
import = "java.util.LinkedList"
%>
<%@page import="java.util.concurrent.TimeUnit"%>
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
<body onload="socketCreation();">
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
            </div>
        </div>
    </div>
    <div class="header">
        <img src="https://i.imgur.com/qEIcvn6.png" id="logo">
    </div>
    <section class="section">
        <h1>My Tasks</h1>
    </section>
    <div class="drag-container">
        <ul class="drag-list">
            <li class="drag-column drag-column-next-week"><span
                class="drag-column-header">
                    <h2>Next Week</h2>
            </span>
                <div class="drag-options" id="options1"></div>
                <ul class="drag-inner-list" id="1">
                    
                </ul></li>
            <li class="drag-column drag-column-this-week"><span
                class="drag-column-header">
                    <h2>This Week</h2>
            </span>
                <div class="drag-options" id="options2"></div>
                <ul class="drag-inner-list" id="2">
                
                </ul></li>
            <li class="drag-column drag-column-completed"><span
                class="drag-column-header">
                    <h2>Completed</h2>
            </span>
                <div class="drag-options" id="options3"></div>
                <ul class="drag-inner-list" id="3">
                </ul></li>
        </ul>
    </div>
    <div class="householdtasks" id="householdtasks">
    </div>
    <script>
    var socket;
    function socketCreation() {
    	console.log("success running")
    	socket = new WebSocket("ws://localhost:8080/HomeHub/Server");
        socket.onopen = function(event){
            //Multithreading register
            var name = sessionStorage.getItem('username');
            var house = sessionStorage.getItem('house');
            var message = name + "," + house + ",register,blank";
            socket.send(message);
        	
        }
        socket.onmessage = function(event){
        	console.log("success onmessage")
            var message = event.data
            var cal = document.getElementsByClassName('calendar_events')[0];
        	var html = "<div class='event_item'><div class='ei_Dot dot_active'></div><div class='ei_Title'>10:30 am</div><div class='ei_Copy'>Monday briefing with the team</div></div>"
            cal.innerHTML += html;
        	//Update Frontend when message is received. message is the text we want to display
        }
        /* socket.onclose = function(event){
            
        } */
    }

    dragula([
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
    	console.log(el);
    	var email = sessionStorage.getItem('email');
    	// remove 'is-moving' class from element after dragging has stopped
    	el.classList.remove('is-moving');
    	var task = el.innerHTML.trim();
    	console.log(task);
        $.ajax({
      	  type: "GET",
      	  url: "DragDrop",
      	  data: {
      		  		task: task,
      		  		email: email
    			},
        	success: function(data) {
        		console.log("data: " + data);
        		var name = sessionStorage.getItem('username');
        		var house = sessionStorage.getItem('house');
        		var status = data;
        		var message = name + "," + house + ",update," + task + "-" + status;
        		socket.send(message);
        	}
      	});	
    	// add the 'is-moved' class for 600ms then remove it
    	window.setTimeout(function() {
    		el.classList.add('is-moved');
    		window.setTimeout(function() {
    			el.classList.remove('is-moved');
    		}, 600);
    	}, 100);
    });

    
    </script>
    <script>
function success(){
/* 	socket = new WebSocket("ws://localhost:8080/HomeHub/Server");
    socket.onopen = function(event){
        //Multithreading register
        var name = sessionStorage.getItem('username');
        var house = sessionStorage.getItem('house');
        var message = name + "," + house + ",register,blank";
        socket.send(message);
    	
    }
    socket.onmessage = function(event){
    	console.log("success onmessage")
        var message = event.data
        //Update Frontend when message is received. message is the text we want to display
    }
    socket.onclose = function(event){
        
    } */
    

	
    console.log("help");
    var email = sessionStorage.getItem("email");
    console.log(email);
    $.ajax({
          type: "POST",
          url: "PopulateSchedule",
          data: {
                email: email
            },
          //async: false,
          success: function(data)
          {
                  console.log("data: " + data);
                  pop(data);
              
          },
            error: function(data)
            {
                console.log("error" + data);
            }
        
        });
}
success();  
function pop(data)
{
	console.log("DATA: " + data);
    var user = data.split('*');
    console.log(user);
    
    var NextWeekList = document.getElementById('1');
    var ThisWeekList = document.getElementById('2');
    var CompletedList = document.getElementById('3');
    var Household = document.getElementById('householdtasks');
    
    var thisuser = user[0].split('/');
    
    var thistasks = parse(thisuser[2]);
    
    for(var i = 0; i < thistasks.length; i++)
    {
        if(thistasks[i]=='') break;
        var new_li = document.createElement('li');
        new_li.className = "drag-item";
        if (thistasks[i] != "") {
        	new_li.innerHTML = thistasks[i];
        	NextWeekList.appendChild(new_li);
        }
    }
    var next = parse(thisuser[3]);
    for(var i = 0; i < thistasks.length; i++)
    {
        if(next[i]=='') break;
        var new_li = document.createElement('li');
        new_li.className = "drag-item";
        if (next[i]) {
	        new_li.innerHTML = next[i];
	        ThisWeekList.appendChild(new_li);
        }
    }
    
    var done = parse(thisuser[4]);
    for(var i = 0; i < thistasks.length; i++)
    {
        if(done[i]=='' || done[i]==' ') break;
        console.log("done");
        var new_li = document.createElement('li');
        new_li.className = "drag-item";
        if (done[i]) {
	        new_li.innerHTML = done[i];
	        CompletedList.appendChild(new_li);
        }
    }
    
    for(var i = 1; i < user.length-1; i++)
    {
        var u = user[i].split('/');
        console.log(u);
        var t = parse(u[3]);
        var c = parse(u[4]);
        console.log(t + c);
        var Taskbox = document.createElement('div');
        Taskbox.className = "taskbox";
        Household.appendChild(Taskbox);
        
        var Taskboxheader = document.createElement('div');
        Taskboxheader.className = "taskboxheader";
        Taskboxheader.innerHTML = u[0] + "\'s Tasks";
        Taskbox.appendChild(Taskboxheader);
        
        var Assigned = document.createElement('div');
        Assigned.className = "assigned";
        Assigned.innerHTML = "<h4>To-do</h4>";
        Taskbox.appendChild(Assigned);
        
        var TaskboxList1 = document.createElement('li');
        TaskboxList1.className = "taskboxlist";
        Assigned.appendChild(TaskboxList1);
        var Completed = document.createElement('div');
        Completed.className = "completed";
        Completed.innerHTML = "<h4>Completed</h4>";
        Taskbox.appendChild(Completed);
        
        var TaskboxList2 = document.createElement('li');
        TaskboxList2.className = "taskboxlist";
        Completed.appendChild(TaskboxList2);
        console.log(t.length);
        for(var j = 0; j < t.length; j++)
        {
            if(t[j]=='') break;
            console.log("todo");
            var TaskboxListItem = document.createElement('ul');
            TaskboxListItem.className = "taskboxitem";
            TaskboxListItem.innerHTML = t[j];
            TaskboxList1.appendChild(TaskboxListItem);
        }
            
        for(var j = 0; j < c.length; j++)
        {
            if(c[j]=='') break;
            var TaskboxListItem = document.createElement('ul');
            TaskboxListItem.className = "taskboxitem";
            TaskboxListItem.innerHTML = c[j];
            TaskboxList2.appendChild(TaskboxListItem);
        }
    var Break = document.createElement('br');
    Household.appendChild(Break.cloneNode());
}
    
}
function parse(obj)
{
    obj = obj.replace(']','');
    obj = obj.replace('[','');
    return obj.split(',');
}
        
        
    </script>
    <script
        src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/dragula.min.js'></script>
    <script src="index.js"></script>
</body>
</html>