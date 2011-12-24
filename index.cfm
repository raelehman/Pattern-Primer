<!--- retrieve all files in the patterns directory --->
<cfdirectory 
	action="list" 
	directory="#expandPath('patterns')#" 
	name="patterns" 
	filter="*.html"
	type="file"
	recurse="true"
	sort="name ASC">

<cfoutput>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Pattern Primer</title>

<!--- replace global.css link with your own style sheet --->
<link rel="stylesheet" href="global.css">

<style>
.pattern {
    clear: both;
    overflow: hidden;
}
.pattern .display {
    width: 65%;
    float: left;
}
.pattern .source {
    width: 30%;
    float: right;
}
.pattern .source textarea {
    width: 90%;
}
</style>
</head>
<body>

<!--- loop over the files in the patterns directory and display each ---->
<cfloop query="patterns">
	<div class="pattern">
		
		<!--- display the file --->
	    <div class="display">
	    	<cfinclude template="patterns/#patterns.name#">
	    </div>
		
		<!--- display the source for the file --->
	    <div class="source">
	    	<!--- the condensed code formatting here prevents extra whitespace from showing in the code samples --->
	    	<cfsavecontent variable="theCode"><cfinclude template="patterns/#patterns.name#"></cfsavecontent>
	    	<textarea rows="6" cols="30">#htmlEditFormat('<!-- #patterns.name# -->')#<br/>
#trim(htmlEditFormat(theCode))#
	    	</textarea>
			
	    	<!--- link to the file --->
			<p><a href="patterns/#patterns.name#">#patterns.name#</a></p>
	    </div>
		
    </div>
</cfloop>

</body>
</html>
</cfoutput>