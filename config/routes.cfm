<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfscript>

drawRoutes()
	.root(controller="home", action="index")	
	.namespace("api")
		.resources(name="user", nested=true)
			.resources("orders")
			.resources("transactions")
			.resources(name="wallets", nested=true)
				.resources("childWallets")
			.end()
			.resources(name="shops", nested=true)
				.resources("branch")
			.end()
			.resources("messages")
		.end()
	.end()
.end();
</cfscript>

