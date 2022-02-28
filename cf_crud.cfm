<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
      
        <cfinclude template="templates.cfm" >
    </head>
    <body>
        <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
        <!--- 
        <cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
            insert into Employees(emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
        values ('JESTY','ANALYST',65646,'1991-01-10',3200,null,2001);
        </cfquery>
        --->
        <cfquery name = "getallmanagers" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
       select distinct m.emp_id as manager_id , m.emp_name as Manager,dep_name ,m.dep_id from employees e join employees m on e.manager_id=m.emp_id
       join Departments d on d.dep_id=m.dep_id; 
    </cfquery>
        <!-- <cfdump var = "#getallmanagers#"> -->
        <cfquery name = "getalldepartments" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
   select dep_id,dep_name from Departments;
</cfquery>
 

     

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">REGISTER</h1>
                    <table align="center">
                        <form method="POST" action="cf_crudactionpage.cfm" enctype="multipart/form-data">
                            <tr>
                                <th>Employee Name</th>
                                <td><input class="form-control" type="text" name="employeename"  required/></td>
                            </tr>
                            <tr>
                                <th>Job Name</th>
                                <td><input type="text" class="form-control" name="jobname" required/></td>
                            </tr>
                            <tr>
                                <th>Manager id</th>
                                <td>
                                    <select class="form-control" name="managerid"  required>
                                        <cfoutput>
                                            <option value="">--select manager--</option>
                                            <cfloop QUERY="getallmanagers">
                                                <option value="#getallmanagers.manager_id#" >#getallmanagers.manager#(#getallmanagers.manager_id#) -
                                                         #getallmanagers.dep_name#(#getallmanagers.dep_id#)</option>
                                            </cfloop>
                                        </cfoutput>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Hire date</th>
                                <td><input type="date" class="form-control" name="hiredate" required/></td>
                            </tr>
                            <tr>
                                <th>Salary</th>
                                <td><input type="text" class="form-control" name="salary"  required/></td>
                            </tr>
                            <tr>
                                <th>Commission</th>
                                <td><input type="text" class="form-control" name="commission" required/></td>
                            </tr>
                            <tr>
                                <th>Department Id</th>
                                <td>
                                    <select class="form-select" name="departmentid" required>
                                        <cfoutput>
                                            <option value="">--select department--</option>
                                            <cfloop QUERY="getalldepartments">
                                                <option value="#getalldepartments.dep_id#" >#getalldepartments.dep_name#(#getalldepartments.dep_id#)</option>
                                            </cfloop>
                                        </cfoutput>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Photo</th>
                                <td><input type="file" name="FiletoUpload" size="45">
                                
                                  
                                </td>
                            </tr>
                            <tr>
                                <td class="pt-3" align="center" colspan="2">
                                    <input type="submit" name="registerbtn" value="SAVE" class="btn btn-success"/>
                                    
                                </td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
            
  
                </body>
            </html>