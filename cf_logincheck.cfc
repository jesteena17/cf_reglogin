<cfcomponent>
         <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
<cffunction name="processLogin" access="remote" returnType="string" returnformat="plain" output="false">
     <cfargument name="username" required="true">
    <cfargument name="password" required="true">
    <cfset var returnStg = "">
    
        <cfquery  name="validateUser"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="tmpResult">
            SELECT emp_id,emp_name FROM employees WHERE emp_id=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_integer" maxlength="255"> 
            AND emp_name=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" maxlength="4000">
        </cfquery>
          <!--- <cfdump var="#tmpResult.SQL#">
          <cfdump var="#validateUser.emp_name#">
        <cfdump var="#tmpResult.SQLParameters#"> --->
        <cfif validateUser.RecordCount EQ 1>
            <cfset session.loggedin = true>
            <cfset session.employeeid ="#validateUser.emp_id#" >
            <cfset returnStg = true>
        <cfelse>
            <cfset returnStg = false>
        </cfif>
        
    <cfreturn returnStg>    
</cffunction>





  <!---doLogout() Method--->

  <cffunction name="doLogout" access="remote" output="false" returntype="string">
    <cfset var returnStg = "">
    <!---delete user from session scope--->
  
    <cfset structDelete(session,'loggedin') />
    
    <cfset structDelete(session,'employeeid') />
    <!---log the user out--->
  
    <cflogout />
  
    <cfset session.loggedin=false />
    

    <cfif not structKeyExists(session, "loggedin") or session.loggedin is false>
        <cfset returnStg = true>
<cfelseif structKeyExists(session, "loggedin") or session.loggedin is true>
    <cfset returnStg = false>
</cfif>


<cfreturn returnStg>    
    </cffunction>

    
</cfcomponent>


		