<cfcomponent extends="controllers.Controller" output="false">
	
	<cffunction name="init">
		<cfset provides("json,xml,pdf")>
		<cfset filters(through="$findUser", only="show, edit, delete, update")>
		
	</cffunction>

	<cffunction name="index">
		<cfset pageTitle = "Index">
		<cfset Users = model("user").findAll()>
		<cfset renderWith(users)>
	</cffunction>
	
	<cffunction name="show">
		<cfset pageTitle = "show">
		<cfset renderWith(user)>
	</cffunction>
	
	<cffunction name="$findUser" access="private">
		
		<cfset user = model("user").findByKey(params.key)>
	</cffunction>

</cfcomponent>