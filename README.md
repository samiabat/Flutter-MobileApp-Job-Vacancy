## Title Of The Project
<pre>
	Job-vacancy
</pre>

## Group Members

<pre>
	|------------------------------------------------------------|
	|     Name                 |     ID            |     Section |
	|--------------------------|-------------------|-------------|
	|  1. Samuel Abatneh       |   UGR/7229/12     |         1   |
	|  2. Sefineh Tesfa        |  UGR/2844/12      |         1   |
	|  3. Yeabsira Tekuamwork  |   UGR/9192/12     |         2   |
	|------------------------------------------------------------|

</pre>


## About The App
<pre>
Our project is a job vacancy Mobile App with flutter that allow
	1, The organization to post the job
	2, The jobseeker to visit the job vacancy
	3, The admin will verify the organization
	4, The admin will controll the  action of organizationies and the jobseekers
</pre>

## User Types

<pre>
	1. Admin
	2. Organization
	3. Jobseeker
</pre>


## Business Features

<pre>
	1, Allow the organization to post the job. CRUD operation: create job ["POST"], read jobs ["GET"], update job ["PUT"]
	   and delete job ["DELETE"]
	2, Allow the jobseekers to view jobs, follow the organization so that they get the job posted by that organization, unfollow 
	   organization. CRUD operation: follow the organization ["POST"],  view jobs ["GET"],  unfolllow the organization ["DELETE"] and
	   update the profile of the jobseeker ["UPDATE"]
</pre>
      

 
## Languages And Frameworks Used

<pre>
	1. Flutter - Dart
	2. Django as back-end
	3. HTML, CSS, and Javascript
	4. MySQL database as a backend
</pre>

## Roles And Their Previllage

<pre>
	|---------------+----------------------------------------------|
	| Role     	|       	Action	                       |
	|---------------+----------------------------------------------|
	| Admin         | Controll the organization and the job seeeker|
	|---------------+----------------------------------------------|
	| organization  | Post Job                                     |
	|		| View Jobs                        `	       |
	|               | Update Job                                   |
	|               | Delete Job                                   |
	|---------------+----------------------------------------------|
	| Jobseeker     | View posted jobs                             |
	|               | Follow the organization                      |
	| 		| Unfollow the organization                    |
	|---------------+----------------------------------------------|
	
</pre>

## Authentication/Authorization Feature
<pre>
Our app will have sign up, login and logout use case so that unauthenticated user can join or leave. 
The app also has autherization too, so that specific user will have a specific privillage. <hr>
	- Different usercase and the Authentication and Autherization explained hereunder.</pre>


	|-------------------------------+----------------------------------------------|---------------------------------|
	| Actions                       | Authentication                               | Autherization		         |
	|                               |                                              |                                 |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Delete organization           | Authenticated                                | Admin only	                 |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Delete Jobseeker              | Authenticated                                | Admin only                      |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Post Job			| Authenticated                                | organization only               |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Update Job			| Authenticated                                |The organization that post the job|
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Delete Job                    | Authenticated                                | The organization that post      |
	|                               |                                              | the job or Admin                |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| View Jobs                     | Anybody                                      | Anybody                         |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Follow the organization       | Authenticated                                | Jobseeker only                  |
	|-------------------------------+----------------------------------------------+---------------------------------|
	| Unfollow the organization     | Authenticated                                | Jobseeker only                  |
	|-------------------------------+----------------------------------------------+---------------------------------|


