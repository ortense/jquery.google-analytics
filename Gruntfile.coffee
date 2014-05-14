module.exports = (grunt) ->
	grunt.initConfig
		
		# Import package manifest
		pkg: grunt.file.readJSON("jquery-google-analytics.json")
		
		# Banner definitions
		meta:
			banner: """
					/*
					 *  <%= pkg.title || pkg.name %> - v<%= pkg.version %>
					 *  <%= pkg.description %>
					 *  <%= pkg.homepage %>
					 *
					 *  Made by <%= pkg.author.name %>
					 *  Under <%= pkg.licenses[0].type %> License
					 */
					 
					"""
		
		# Concat definitions
		concat:
			dist:
				src: ["src/jquery.google-analytics.js"]
				dest: "dist/jquery.google-analytics.js"

			options:
				banner: "<%= meta.banner %>"

		
		# Lint definitions
		jshint:
			files: ["src/jquery.google-analytics.js"]
			options:
				jshintrc: ".jshintrc"

		
		# Minify definitions
		uglify:
			my_target:
				src: ["dist/jquery.google-analytics.js"]
				dest: "dist/jquery.google-analytics.min.js"

			options:
				banner: "<%= meta.banner %>"

		
		# CoffeeScript compilation
		coffee:
			compile:
				files:
					"dist/jquery.google-analytics.js": "src/jquery.google-analytics.coffee"

	grunt.loadNpmTasks "grunt-contrib-concat"
	grunt.loadNpmTasks "grunt-contrib-jshint"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.registerTask "default", [
		"coffee"
		"jshint"
		"concat"
		"uglify"
	]
	grunt.registerTask "travis", ["jshint"]
	return
