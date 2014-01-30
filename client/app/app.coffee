installed_apps = [
    # 3rd party
    'ui.router',
    'ngTemplates'
]

app = angular.module('app', installed_apps)

app.config(($stateProvider, $urlRouterProvider) ->
    $stateProvider
        .state('todoList'
            url: '/'
            templateUrl: 'todoList.template'
            controller: 'todoListCtrl'
        )
    $urlRouterProvider.otherwise('/');
)


app.controller('todoListCtrl', ($scope) ->
 $scope.todos = [
    {text: 'learn angular', done: true},
    {text: 'build an angular app', done: false}
  ]

  $scope.addTodo = ->
    $scope.todos.push({text: $scope.todoText, done: false})
    $scope.todoText = ''

  $scope.remaining = ->
    count = 0
    for todo in $scope.todos
      count += todo.done ? 0: 1
    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    for todo in oldTodos
      $scope.todos.push(todo) unless todo.done

)