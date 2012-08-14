<cfcomponent extends="Controller" output="false">
	
	<cffunction name="init">
		<cfset filters(through="checkLogin")>
	</cffunction>
	
	
	<cffunction name="dash">
		
		<!--- TODO: Use below comment to make validate function in sscc plugin --->
		
		<!--- <cfset number = generateSsccAsn(serialSequence='000000002', distributorId='223456')>
		<cfset number = right(number, 16)>
		<cfset number = left(number, 6)>
		<cfdump var="#right(number, 16)#" abort="true"> --->
		
		<cfset pageTitle = "Social Trading">
		<!--- RESTful call --->
		<!--- TODO: Implement API key --->
		<cfset $findUser()>
		
		<!--- <cfdump var="#user#" abort="true">
		
		
		<cfset user = model("user").findOne(where="id='#session.user.id#'")> --->
	</cffunction>

	<cffunction name="uploadavatar">
		
		<cfset validFormats = "image/*">
		<cfif isDefined('uploadurlimage') AND uploadurlimage NEQ ''>
			<cfset ifolder8 = "profile">
			<cfset nifolder8 = ExpandPath("images/#ifolder8#")>
			<cfset TAB = Chr(9)>
				<cfif NOT DirectoryExists(nifolder8)>
					<cfdirectory action="create" directory="#nifolder8#" mode="777">
				</cfif>
			<cfset Path = nifolder8>
		</cfif>
		<cffile action="upload" filefield="uploadurlimage" accept="#validFormats#" destination="#Path#\" nameconflict="overwrite">
		<cfset sFile = cffile.serverFile>
		<cfset sFileExt = cffile.serverFileExt>
		<cffile action="rename" source="#Path#/#sFile#" destination="#path#/#session.user.id#.#sFileExt#">
		
		<!--- Resize image --->
		
		<cfset originalSize("#path#/#session.user.id#.#sFileExt#")>
		
		<cfset params.user.photourl = "#session.user.id#.#sFileExt#">
		<cfset user = model("user").findByKey(session.user.id)>
		<cfset user.update(params.user)>

		<cfset redirectTo(action="dash")>
	</cffunction>
	
	<cffunction name="checkRole">
		
		<!--- TODO: Factor roles here --->
		
	</cffunction>
	
	<!--- Private functions --->
	
	<cffunction name="$findUser" access="private">
		
		<cfhttp url="http://#cgi.SERVER_NAME#/api/user/#session.user.id#.json">
		
		<cfset data = deSerializeJSON(cfhttp.FileContent)>
		
		<cfset user.firstname = #data[1].firstname#>
		<cfset user.lastname = #data[1].lastname#>
		<cfset user.email = #data[1].email#>
		<cfset user.id = #data[1].id#>
		<cfset user.phone = #data[1].phone#>
		<cfset user.role = #data[1].role#>
		<cfset user.photourl = #data[1].photourl#>
		<cfset user.urlid = #data[1].urlid#>
		<cfset user.createdAt = #data[1].createdAt#>
		
	</cffunction>
</cfcomponent>