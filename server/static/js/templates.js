(function(module) {
try {
  module = angular.module('ngTemplates');
} catch (e) {
  module = angular.module('ngTemplates', []);
}
module.run(['$templateCache', function($templateCache) {
  $templateCache.put('todoList.template',
    '<div><span>{{remaining()}} of {{todos.length}} remaining</span> [ <a href="" ng-click="archive()">archive</a> ]<ul class="unstyled"><li ng-repeat="todo in todos"><input type="checkbox" ng-model="todo.done"><span class="done-{{todo.done}}">{{todo.text}}</span></li></ul><form ng-submit="addTodo()"><input type="text" ng-model="todoText" size="30" placeholder="add new todo here"><input class="btn-primary" type="submit" value="add"></form></div>');
}]);
})();
