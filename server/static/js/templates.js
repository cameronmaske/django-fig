angular.module('ngTemplates', ['todoList.template']);

angular.module("todoList.template", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("todoList.template",
    "<div>\n" +
    "  <span>\n" +
    "    {{remaining()}} of {{todos.length}} remaining\n" +
    "  </span>\n" +
    "  [ <a href=\"\" ng-click=\"archive()\">archive</a> ]\n" +
    "  <ul class=\"unstyled\">\n" +
    "    <li ng-repeat=\"todo in todos\">\n" +
    "      <input type=\"checkbox\" ng-model=\"todo.done\">\n" +
    "      <span class=\"done-{{todo.done}}\">{{todo.text}}</span>\n" +
    "    </li>\n" +
    "  </ul>\n" +
    "  <form ng-submit=\"addTodo()\">\n" +
    "    <input type=\"text\" ng-model=\"todoText\"  size=\"30\"\n" +
    "           placeholder=\"add new todo here\">\n" +
    "    <input class=\"btn-primary\" type=\"submit\" value=\"add\">\n" +
    "  </form>\n" +
    "</div>");
}]);
