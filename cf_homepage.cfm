<!doctype html>
<html lang="en">
	<head>
		<cfinclude template="templates.cfm" >
	</head>
	<body>
<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfquery datasource="mysqldsn" name="empSalary"> 
select distinct m.emp_id as manager_id ,e.emp_id as emp_id, m.emp_name as Manager,dep_name ,m.dep_id,
e.salary,e.hire_date,e.commission,e.job_name,e.emp_name,d.dep_name
 from employees e join employees m on e.manager_id=m.emp_id
       join Departments d on d.dep_id=m.dep_id
       where e.emp_id=<cfqueryparam value = "#session.employeeid#" cfsqltype = "cf_sql_integer" >; 

</cfquery> 



		<div id="logout">
	        <h3 class="text-center text-white pt-5">Welcome Back!</h3>

	        <div class="container">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-6">
	                    <div id="login-box" class="col-md-12">
	                       <table width="95%" border="2" cellspacing="2" cellpadding="2" > 
            <tr> 
                <th colspan="2">Employee Details</th> 
                 
            </tr> 
       
        <cfoutput> 
            <tr > 
            <td style="color:crimson"><font size="-1">Employee Name</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.emp_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Job</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.job_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Joining Date</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.hire_date#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Managed By</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.Manager#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Department</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.dep_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Salary</font></td> <td style="color:crimson;font-weight:900"><font size="-1">   #DollarFormat(empSalary.salary)#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Commission</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #DollarFormat(empSalary.commission)#</font>  </td> </tr> 
 </cfoutput> 
           
           
            </table> 
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div> <!---Logout--->
	</body>
</html>

