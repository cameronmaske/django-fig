(function () {
  var app, installed_apps;
  installed_apps = [
    'ui.router',
    'ngTemplates'
  ];
  app = angular.module('app', installed_apps);
  app.config([
    '$stateProvider',
    '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
      $stateProvider.state('todoList', {
        url: '/',
        templateUrl: 'todoList.template',
        controller: 'todoListCtrl'
      });
      return $urlRouterProvider.otherwise('/');
    }
  ]);
  app.controller('todoListCtrl', [
    '$scope',
    function ($scope) {
      $scope.todos = [
        {
          text: 'learn angular',
          done: true
        },
        {
          text: 'build an angular app',
          done: false
        }
      ];
      $scope.addTodo = function () {
        $scope.todos.push({
          text: $scope.todoText,
          done: false
        });
        return $scope.todoText = '';
      };
      $scope.remaining = function () {
        var count, todo, _i, _len, _ref, _ref1;
        count = 0;
        _ref = $scope.todos;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          todo = _ref[_i];
          count += (_ref1 = todo.done) != null ? _ref1 : { 0: 1 };
        }
        return count;
      };
      return $scope.archive = function () {
        var oldTodos, todo, _i, _len, _results;
        oldTodos = $scope.todos;
        $scope.todos = [];
        _results = [];
        for (_i = 0, _len = oldTodos.length; _i < _len; _i++) {
          todo = oldTodos[_i];
          if (!todo.done) {
            _results.push($scope.todos.push(todo));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };
    }
  ]);
}.call(this));