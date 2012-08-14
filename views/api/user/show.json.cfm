<cfset dataToReturn = []>

<cfset arrayAppend(
		dataToReturn,
			{
				"createdAt" = user.createdAt,
				"firstname" = user.firstname,
				"lastname" = user.lastname,
				"id" = user.id,
				"photourl" = user.photourl,
				"phone" = user.phone,
				"role" = user.role,
				"email" = user.email,
				"urlid" = user.urlid
				}
		)>
<cfoutput>#serializeJson(dataToReturn)#</cfoutput>