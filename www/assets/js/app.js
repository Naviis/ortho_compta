var app= angular.module('WebApp',['ngRoute']);

app.config(function($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'assets/js/views/index.html',
        controller: 'PatientCtrl'
    }).otherwise({
        redirectTo: '/'
    });
});
