
app.controller('PatientsListCtrl',function($scope,PatientService){
    
    $scope.patients = [];
    
    PatientService.get_all().success(function(res){
        if( res.status == 'success' ){
            $scope.patients = res.results;
        } 
    });
    
    // get patient'ssessions
    $scope.toggle_sessions = function(id){
        
        var p = getPatient(id);
        if( p !== false ){
            PatientService.get_patient_sessions(id).success(function(res){
                if( res.status == 'success' ){
                    p.sessions_details = res.results;
                } 
            }); 
        }
 
        
        for( var i= 0; i < $scope.patients.length; i++){
            var p = $scope.patients[i];
            if( p.id == id ){
               p.active = !p.active; 
            }
        }
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
    
    function getPatient(id){
        for( var i= 0; i < $scope.patients.length; i++){
            var p = $scope.patients[i];
            if( p.id == id ){
               return p;
            }
        }
        
        return false;
    }
    
});