# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

GameApp = angular.module "GameApp", ['ui.bootstrap']

GameApp.controller "gameCtrl", ['$scope', ($scope) ->
	
	$scope.secrets = []

	$scope.letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n",'o','p','q','r','s','t','u','v','w','x','y','z']

	$scope.inputWord = ->
		$scope.secrets = $scope.secretWord.split("")
		console.log($scope.secrets)
		$scope.hide = true
		$scope.winner = false
		$scope.showLetter = {}
		$scope.secrets.forEach (letter) ->
			$scope.showLetter[letter] = false
		$scope.showKeys = {}
		$scope.letters.forEach (keys) ->
			$scope.showKeys[keys] = true

	$scope.letterClick = ->
		index = $scope.secrets.indexOf(this.letter)
		count = 0
		if index > -1
			$scope.showLetter[this.letter] = true
			$scope.showKeys[this.letter] = false
			for answer of $scope.showLetter
				if $scope.showLetter[answer] == true
					count++
					if count == Object.keys($scope.showLetter).length
						$scope.winner = true

	
				

		console.log index
]