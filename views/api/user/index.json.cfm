<cfset dataToReturn = []>

<cfloop query="users">
	<cfset arrayAppend(
			dataToReturn,
				{
					"createdAt" = users.createdAt,
					"firstname" = users.firstname,
					"lastname" = users.lastname,
					"id" = users.id,
					"photourl" = users.photourl,
					"phone" = users.phone,
					"role" = users.role,
					"email" = users.email,
					"urlid" = users.urlid
					}
			)>
</cfloop>

<cfoutput>#serializeJson(dataToReturn)#</cfoutput>