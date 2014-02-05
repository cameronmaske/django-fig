(function(module) {
try {
  module = angular.module('ngTemplates');
} catch (e) {
  module = angular.module('ngTemplates', []);
}
module.run(['$templateCache', function($templateCache) {
  $templateCache.put('todoList.template',
    '<div class="row panel todo-panel"><div class="large-8 columns"><h2 class="subheader">{{remaining()}} of {{todos.length}} remaining</h2></div><div class="large-4 columns"><button class="button tiny todo-archive" ng-click="archive()">Archive</button></div><div class="large-12 columns" ng-repeat="todo in todos"><input type="checkbox" ng-model="todo.done"><label class="done-{{todo.done}}">{{todo.text}}</label></div><form class="large-12 columns" ng-submit="addTodo()"><input type="text" ng-model="todoText" size="30" placeholder="add new todo here"><input class="button" type="submit" value="Add"></form></div>');
}]);
})();
