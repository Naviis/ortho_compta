
app.controller('PatientsListCtrl',function($scope,PatientService){
    
    $scope.patients = [];
    
    PatientService.get_all().success(function(res){
        if( res.status == 'success' ){
            $scope.patients = res.results;
        } 
    });
    
    // get patient'ssessions
    $scope.get_sessions = function(id){
        PatientService.get_patient_sessions(id).success(function(res){
            if( res.status == 'success' ){
                console.log(res);
            } 
        });
    };
    
    // Change clear
    $scope.set_clear = function(id){
        
        for( var i= 0; i < $scope.patients.length; i++){
            var p = $scope.patients[i];
            if( p.id == id ){
                p.clear = !p.clear;
                PatientService.set_clear(id,p.clear);
            }
        }
        
    };
    
});