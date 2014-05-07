({
	appDir: './app',
	baseUrl: 'js',
	mainConfigFile: './app/js/main.js',

	dir: './build',

	allowSourceOverwrites: false,
	keepBuildDir: false,
	optimizeCss: "standard",
	optimize: 'uglify2',

	waitSeconds: 10,

	uglify2: {
		output: {
			beautify: false
		},
		compress: {
			sequences: true,
			unused: true,
		},
		warnings: true,
		mangle: true
	},
	removeCombined: true,
	wrapShim: true,
	preserveLicenseComments: false,
	generateSourceMaps: false,
	findNestedDependencies: true,
	modules: [
		{
			name: "main"
		}
	],

	wrap: {
		start: "(function() {",
		end: "}());"
	},
})