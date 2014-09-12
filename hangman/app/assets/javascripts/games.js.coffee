# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

GameApp = angular.module "GameApp", []

GameApp.controller "gameCtrl", ['$scope', ($scope) ->
	
	$scope.secrets = []

	$scope.inputWord = ->
		$scope.secrets = $scope.secretWord.split("")
		console.log($scope.secrets)
		$scope.hide = true

	$scope.letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n",'o','p','q','r','s','t','u','v','w','x','y','z']

]