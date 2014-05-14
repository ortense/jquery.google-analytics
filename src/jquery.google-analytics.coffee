do ($ = jQuery, window, document) ->
	jGA =
		pluginName: "ga"
		accounts: []
		fn:
			create: (account) ->
				ga("create", account, 
								name: account
				)