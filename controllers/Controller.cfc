<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">
	
	<cffunction name="init">
		
	</cffunction>
	
	<!--- Check login function --->
	
	<cffunction name="checkLogin">
		<cfif not StructKeyExists(session,"user")>
			<cfset redirectTo(controller="Home", action="login")>
		</cfif>
	</cffunction>
	
</cfcomponent>