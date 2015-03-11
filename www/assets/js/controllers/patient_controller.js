
app.controller('PatientCtrl',function($scope,PatientService){
    
    $scope.patients = [];
    
    PatientService.get_all().success(function(res){
        if( res.status == 'success' ){
            $scope.patients = res.results;
        } 
    });

    
});