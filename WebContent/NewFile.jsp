<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#homehublogo
{
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 20%;
}
#register
{
    width:80%;
    padding:20px;
    margin-left: auto;
    margin-right: auto;
    border: 2px solid black;
    font-family: 'Roboto', sans-serif;
    font-size: 20px;
    text-align: center;
}
#submit
{
        border: 2px solid black;
        padding: 6px;
}
</style>
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
	<img id="homehublogo" src="https://i.imgur.com/qEIcvn6.png" border="0" />
	<br />
	<br />
	<div id="register">
		<h1>Register for an Account</h1>
			Username: <input type="text" name="username" /><br /> 
			Password: <input type="text" name="password" /><br /> 
			Confirm Password <input type="text" name="confirmpassword" /><br /> 
			<input type="radio" name="household" value="Create" onclick="householdclickB()" /> Create household 
			<input type="radio" name="household" value="Join" onclick="householdclickA()" /> Join household 
			<br /> 
            <div id = "household" style="display:none">
				Household Name <input type="text" name="household" /><br />
			</div>
			<div id="create" style="display:none">
				Check tasks for your Household <br />
				<div id="tasks"></div> 
<!-- 				<input type="checkbox"name="task1" value="yes" />Task1 
				<input type="checkbox" name="task1" value="yes" />Task2 <br /> 
				<input type="checkbox" name="task1" value="yes" />Task3 
				<input type="checkbox" name="task1" value="yes" />Task4 <br />  -->
				What day should these tasks be completed by? 
				<select name="day">
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
			<input id="submit" type="submit" name="submit" value="Submit" onclick="household();"/>
	</div>
</body>
</html>