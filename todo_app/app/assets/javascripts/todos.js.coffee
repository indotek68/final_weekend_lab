TodoApp = angular.module("TodoApp", ["ngRoute", "templates"])

TodoApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "TasksCtrl"
	.otherwise
			redirectTo: "/"

	$locationProvider.html5Mode(true)
]

TodoApp.controller "TasksCtrl", ["$scope", "$http", ($scope, $http)]