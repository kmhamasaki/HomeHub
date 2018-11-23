# HomeHub

## Kristyn Hamasaki, Alex Baker, Maegan Chew, Nikita Takru, Prathik Rao, Nicholas Wang

# Table of Contents

High-Level Requirements
Technical Specifications
Detailed Design
Testing
Deployment

# High-Level Project Specifications

Our web app is a way for suitemates to clearly communicate with each other regarding recurring household tasks. Right now, many suitemates do not complete their weekly chores and one individual has to take charge as the aggressive leader. The majority of people also use handwritten charts which are proven to be ineffective. With HomeHub, we automate the process in an app and allow all users to coexist in a peaceful manner.

User Registration
Every user will individually register with HomeHub through a specific Homehub account. If a user is invited to a household and has no registered account, they will be prompted to create a HomeHub account. After that, they can join the household space. 

Household Space
One user makes the household space and selects from default tasks. The household space has to have a minimum of two users and a maximum of eight users. When a household space is created, the user who creates it will have the option of choosing from a list of default tasks to assign for the household. After the household space is created and people have joined, the tasks will be distributed between the members.

Guest Mode
If a user is not logged in to a HomeHub account, the app will act as a personal planner. The user will still be able to add tasks and see their schedule, but they will not be able to invite any other users to their household.

Tasks
	Add Tasks
Once all the users are in the household space, everyone has the option to add tasks to the household. When users add a weekly task, they are prompted to enter the task name. This will add the task to the task-list.

Removing Tasks
All users can request to remove tasks at anytime. All other members in the household space are notified and must agree to the change before it is completed. 

Distributing Tasks
Tasks will be distributed on a rotating basis so that each task is assigned to a different person each week until everyone has completed the task. At the beginning of each week, the tasks will be assigned for the coming week.

Completing Tasks
When a user finishes a task, they mark the task as completed and their information is recorded.

	Notification Window
		To remind users of their tasks, we will implement a notification center that
sends each user their tasks at time intervals before it’s due. Additionally, users can anonymously poke other users to remind them of tasks.
		
Schedule
Each user will have access to a schedule page on the app which will display all of the upcoming tasks for the next week. The user’s own tasks will be highlighted, but they will be able to see the tasks of everyone in the household. 

Notifications 	
A user will receive an in-app notification at the beginning of the week when the task is assigned. They will also receive a reminder notification one day before the task is due. At the end of the week, everyone will receive a notification of who completed their tasks. So, if a user did not do their task, all their household members will be notified. This incentivises everyone to do their chores on time. 

# Technical Project Specifications
Global Requirements
	Hardware Requirements: 
		HomeHub will run on a standard laptop or desktop computer on Google
Chrome updated to the latest update.
Database 
	Estimated time: 4 hours
	We will use a SQL database to store all data associated with out web app.
		Task Table (set from beginning, doesn’t change)
Primary key taskID (int(2))
Task description (varchar(50))
Active/inactive task (int(1))
		User Table
Primary key username (varchar(30))
Password (varchar(30)) → use external API to hash
Household Name (varchar(30))
Full name (varchar(60))
		Household Table (new table per household, name == householdName)
Primary key username (varchar(30))
Foreign Key taskID (int(2))


Server
Estimated Time: 6 hours
We will use out server to interact with out SQL Database
	Getting data
	Estimated Time: 2 hours
The server will retrieve the associated household information when a user logs in using the username which is the primary key in out User table.
Posting data
	Estimated Time: 2 hours
When a new household is created, a Household table is created for it. The household ID must be unique. Additionally, when a user creates an account, their username must be unique and their information will be stored in a new row in the User table.
	Assigning Tasks
	Estimated Time: 3 hours
Assigning tasks will be handled mainly by our server modifying the SQL database. In each household table,  since the tasks are assigned on a rotating weekly basis, each taskID will simply be shifted down to the next user at the end of the week. This will produce a rotating effect where each task gets assigned to a new user every time a new week starts. If there are more tasks than there are users, certain tasks will be grouped together so that there are an equal number of task ‘objects’ as there are users. This ensures that each task is assigned to a user at the beginning of the week and that no user will have to repeat the same task until every other user has also completed that task.


Web Interface
Each page will have a menu bar at the top that allows for navigation to the login, schedule, and notification page.
Login Page (Landing page) 
Estimated Time: 4 hours
The log-in page will have three options:
Sign in form with username and password field (for users who already have a Homehub account created. Successful sign-in will redirect to the home page.
Button to register for an account which redirects to another page where users can create their account by inputting a new password and username (for users who do not have a Homehub account). Upon registration, user will specify whether they are joining an existing house or creating a new house with separate buttons
Button to continue to the app as a guest, which will have very limited functionality (essentially a personal planner, data will not be stored in)

Schedule Page (Home page)
Estimated Time: 4 hours
When a user logs in, they will be redirected to the home page which will display a calendar-like table with all of the household’s assigned tasks for that week. Tasks and users responsible for task will be listed in a table format. There will be checkboxes users can click on for each task once the task is completed. 

Guest Page
Estimated Time: 2 hours
Guest users will be allowed to add their housemates and ask our server to distribute the preset tasks amongst them for a one-time-usage distribution of tasks per housemate.

Notification Page
Estimated Time: 4 hours
Our notification page will have all of our User’s notifications about tasks and any pokes from other Users. It will also let a user poke another user.

Create Account Page
Estimated Time: 2 hours
The create account will allow a new user to create a username that isn’t taken yet and call the server to verify. The user will then be prompted to create a password for their account.

Create Household Page
Estimated Time: 4 hours
The create household page will allow a user to create a household name that has not been taken yet. The user can add any number of different users through their unique usernames. A list of preset tasks will be shown and the user can select which tasks their household will need to include.

# Detailed Design

Database:
User Table: 
	Columns: 
email VARCHAR(50) PRIMARY KEY - stores the user’s unique email address
profilePic VARCHAR(200) - stores the URL of the user’s google profile picture
fullName VARCHAR(60) - stores the full name of the user (from their google account)
houseName VARCHAR(30) - stores the household name (if it exists) of the user
	Functionality:
Whenever a user registers with a household, they will be stored in the User table with all of their relevant information. This information will be accessed in order to display names and pictures of users and their housemates.

Tasks Table:
	Columns:
taskID INT(2) PRIMARY KEY AUTO_INCREMENT - stores a numeric identifier unique to each task
taskDesc VARCHAR(50) - stores a brief description of the task
Active BIT NOT NULL - stores a 1 if the task is included in the household, stores a 0 if it is not
Completed BIT NOT NULL - stores a 1 if the task has been completed for the given week, a 0 if not
	
Functionality:
There will be a unique task table associated with each household. The table will be named the same as the household name but with “Task” appended to the end of it. The task table for each household will be created at the same time as the household itself is created. 

Household Table:
	Columns: 
Email VARCHAR(30) PRIMARY KEY -  Contains the emails of all users in the household
taskID INT(2) - stores the task/tasks that are assigned to the corresponding user for the week
	Functionality
This table will be used to rotate tasks for the users. After tasks are initially randomly distributed, the tasks will simply rotate through the users ensuring that each member of the household is assigned a fair workload each week.

Backend Requirements:
Servlets
Register.java
doGet()...
Retrieves all households from database to authenticate new, unique household names
Returns a formatted string of all households in the database to the front end
doPost()...
Creates a new household in the database (presumed doGet() was called before and front-end authenticated household name)
Also adds user who created the household into said household
Tasks.java
doGet()...
Retrieves all tasks from database to present user with the choices at registration (allows for us to add new tasks easily if we want to later)
Returns a formatted string of all tasks in the database to the front end
doPost()...
Distributes tasks among the people in a specified database
Users.java
doGet()...
Retrieves specific user from database to authenticate whether they exist in database at sign-in page
Sends back registration status to the front-end about the specified user
doPost()...
Adds user to the database and stores their email, profile picture url, username, and household

Backend - Multithreading

NotificationCenter.java
Class that coordinates all notifications going from user to user and from server to user
Keeps track of each client who’s connected in a vector
Loops through and checks if client sent any notification to be broadcasted to all users
NotificationClient.java extends Thread
Provides an in-app notification window and uses multithreading to allow users to interact with webpage while receiving notifications
Responsible for: notifying NotificationCenter.java when the user 1) completes their task, 2) wishes to poke another user, 3) doesn’t finish their task by their deadline

Backend - Class Structure

Task Class
	Member Variables
String taskName
Integer dueDate
Member Function
String getTaskName()
Integer dueDate()
Void DistributeTasks()
	
TwoPersonTask extends Task
String User1
String User2
String getUser1()
String getUser2()
OnePersonTask extends Task
String User
String getUser()

Backend - Task Distribution Algorithm
Task distribution algorithm: Choose number of users and select tasks. Choose random number between the range of users and assign the first task. Choose another random number between the range of users that has not been chosen and assign second task. Repeat until all users have been chosen, and make all users available to be randomly chosen again. Repeat until all tasks have been distributed.


Hardware/Software Requirements:
Hardware: 512 MB RAM, dedicated CPU for computation (JVM gets this for us), servers for database communication (servlets do this)
Software: Tomcat, Eclipse, MySQL Workbench, Chrome

Frontend Requirements:

Sign In Page (Homepage):
Has option to either sign in through google account or to continue as a guest. The guest option will lead to a limited functionality version (sort of a demo). The google sign in button will prompt the user to sign in with their google account, which will then redirect the user based on whether or not they have already registered with a household. If a user has already registered with a household, they will be redirected to the site’s home page which displays all the relevant info. If the user has not registered with a household, they will be redirected the household page where they can either create or join a household.

Registration Page
Dynamically toggles between Create Household and Join Household using radio button

When Create Household is clicked on, dynamically switches to form that takes in household name, tasks using checkboxes, and what day it should be completed by. Whoever creates the household chooses the tasks that they would like to have included in their household (these can be changed later) and assigns the date 


When Join Household is clicked it just takes in enter household
It will make sure the household exists and will use the google login info to add that user to the household

Submit button will call Register.java and talk with the database to store the data in database and make sure the household name exists for join household and doesn’t exist for create household
The page also communicates with Tasks.java to get which tasks are stored in the database and display them as options when creating household.

Schedule Page
This is the site’s home page where users can see and interact with all of their tasks (and those of their housemates). Users will also be able to see their notifications and updates from this page. In the list of chores, users are able to click on an individual chore in order to mark it as completed, and they will receive notifications if they have an upcoming task that is due. There is also a system of viewing other users tasks in the same household, so you can see who is supposed to do what and when it supposed to be completed. Currently this implemented with a table, but this will likely change.

Guest Page: allows a guest to choose which tasks to use to see how they will become distributed and the number of users 
Communicates with the Tasks.java servlet to retrieve what tasks there are from the database
The backend will assign tasks using the distribution algorithm, and then show them in the same schedule page that registered user sees

# Testing

Front End and Back End Tests

Homepage
Sign In Button 
If a user clicks the “Sign In” button or “Guest” button, it reroutes them to the correct page. Clicking elsewhere on the screen does not redirect the user. 
       2.    If a user clicks the Google Sign In button, it signs the user out and they stay on the same page. 
       3.  If a user clicks the HomeHub logo, then it redirects the user to the sign in page  
       4.  If a user is signed in, they are automatically redirected to the schedule page. Otherwise, the user stays on the current homepage.  

Guest Page
If a user distributes tasks, it only displays when a minimum of at least one task is selected. Otherwise, an error message will be displayed to the user. 
If a user clicks the HomeHub logo, then it redirects you to the sign in page  

Register for an Account Page
If a user leaves any field blank or has an invalid input, then we will output an error message to the user on the form. 
If a user joins a household but the household name does not exist or the user leave this section blank, then we output the error on the form and stay on the current page.
A user cannot create a household with a name that already exists. 
If a user clicks the HomeHub logo, they are redirected to the sign in page  

Schedule Page
A user should receive their own notifications too if they complete a task.
When a user crosses off a task, a notification is sent to them and everyone.
If a user’s due date for a task has passed and the user has still not completed it, then we will update that in the notifications section to all household members, including that individual.
The user should not see an empty calendar. Instead, we will display everyone’s tasks updates the calendar.
Users can view their tasks for next week on the schedule page. 
If a user clicks the HomeHub logo, then it redirects them to the sign in page  

# Deployment Document

Deploying the Front End (Web App)

Once the files have been downloaded from GitHub, the web application will run on your selected browser. 

Deployment Dependencies
Tomcat 9.0
JDBC

From a high level perspective, we can deploy our application with the following steps:

High Level
Open Eclipse with Tomcat and MySQL
Clone Homehub from GitHub and import into the Eclipse workspace.
Start SQL database.
Run HomeHub on localhost!

Detailed Level
Install Eclipse and MySQLWorkbench for your computer. 
For MySQLWorkbench, our files are setup to connect to a database called HomeHub using a MySQL username of ‘root’ and a password of ‘password’. You can either match these specifications, or go through the servlet files and change the lines that connect to sql to match your own database.
Clone and import our project from GitHub to your Eclipse workspace.
Add JDBC .jar to deployment path in Eclipse, make sure it is local.
Import the sql file into MySQLWorkbench to set up database structure.
Navigate to your workspace and open up the project.
Run SignIn.jsp on the server and that should launch the app in your selected browser on local host! If everything is done correctly, you should be able to set up a household and have multiple users join that household from the front-end web application. You can check this to see if the database has updated the users on the backend. 
