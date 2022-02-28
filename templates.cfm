<html>
<head>
<meta charset="utf-8">
<!---<meta name="viewport" content="width=device-width, initial-scale=1">--->

<meta name="description" content="Login Page">
<meta name="author" content="SitePoint">

<!-- <link rel="stylesheet" href="css/styles.css?v=1.0"> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">		
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<script src="validcheck/checkvalid.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery.min.js'></script>	
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> --->
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="cf_index.cfm">COLD FUSION(<cfoutput>#session.loggedin#</cfoutput>)</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="cf_index.cfm">Home <span class="sr-only">(current)</span></a>
      </li>
      <cfif  structKeyExists(session, "loggedin") or session.loggedin is true>
       <li class="nav-item">
        <a class="nav-link" href="EmployeesList.cfm">Employees List</a>
      </li>
    </cfif>
     <!-- <li class="nav-item">
        <a class="nav-link disabled" href="##">Disabled</a>
      </li> -->
    </ul>
    
      <a class="btn btn-outline-info my-2 my-sm-0" href="cf_crud.cfm">Register</a>
     
      <cfif not structKeyExists(session, "loggedin") or #session.loggedin# is false>
                 <a class="btn btn-outline-success my-2 my-sm-0 ml-3" href="cf_login.cfm">Login</a>
            
      <cfelseif structKeyExists(session, "loggedin") or session.loggedin is true>

                          <form class="form-signout">
								<cfdump var="#session.loggedin#" >
                                <cfset session.loggedin = false>
	    					
	    						<!---<button class="btn btn-lg btn-danger btn-block" type="button" id="logoutbutton"><a href="index.cfm">Logout</button></a>--->
	    						<input type="submit" name="logoutButton" id="logoutButton" class="btn btn-outline-success my-2 my-sm-0 ml-3" 
                                onclick="_fnLogOutViaAjax(event)" value="Logout" >
	  						</form> 
   

            </cfif>
     


    
  </div>
</nav>
        </div>
    </div>
</div>


</body>

</html>