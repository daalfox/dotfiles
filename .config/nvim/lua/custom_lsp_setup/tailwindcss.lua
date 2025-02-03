return {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					-- I usually define a `tw` utility that just takes strings and return strings
					-- this allows me to have auto completion inside `tw` utility
					"tw\\(([^)]*)\\)",
				},
			},
		},
	},
}
