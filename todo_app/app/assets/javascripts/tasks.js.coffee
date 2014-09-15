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

TodoApp.controller "TasksCtrl", ["$scope", "$http", ($scope, $http) ->
	$scope.tasks = []

	click = 0

	$scope.getTasks = ->
		$http.get("/tasks.json").success (data) ->
			$scope.tasks = data
			console.log $scope.tasks

	$scope.postTask = ->
		$http.post("/tasks.json", $scope.newTask).success (data) ->
			$scope.newTask = {}
			$scope.tasks.push(data)

	$scope.showEdit = ->
		this.edit = true

	$scope.deleteTask = (task) ->
		conf = confirm "Are you sure?"
		if conf
			$http.delete("/tasks/#{task.id}").success (data) ->
				$scope.tasks.splice($scope.tasks.indexOf(task), 1)

	$scope.editTask = (task) ->
		this.edit = false
		$http.put("/tasks/#{task.id}.json", task).success (data) ->

		
	$scope.getTasks()


]

TodoApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]