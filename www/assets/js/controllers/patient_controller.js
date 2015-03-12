
app.controller('PatientsListCtrl',function($scope,PatientService){
    
    $scope.patients = [];
    $scope.AMO_VALUE = 2.5;
    
    PatientService.get_all().success(function(res){
        if( res.status == 'success' ){
            $scope.patients = res.results;
        } 
    });
    
    // get patient's sessions
    $scope.toggle_sessions = function(id){
        
        var p = getPatient(id);
        if( p !== false && !p.active){
            PatientService.get_patient_sessions(id).success(function(res){
                if( res.status == 'success' ){
                    p.sessions_details = res.results;
                } 
            }); 
        }
 
        p.active = !p.active; 
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
    
    // Calculate session total paid
    
    $scope.session_total_paid = function(id_patient,id_session){
        var s = getSession(id_patient,id_session);
        
        if( s !== false ){
            var total = 0;
            for( var i= 0; i < s.paiements.length; i++){
                total += s.paiements[i].value;
            }

            return total;
        }
    }
    
    // Calculate session total 
    $scope.session_total_due = function(id_patient,id_session){
        var s = getSession(id_patient,id_session);
        
        if( s !== false ){
            return s.amo*$scope.AMO_VALUE;
        }
    }
    
    /*-----------------------------------------*|
            $FUNCTIONS 
    |*-----------------------------------------*/
    
    
    function getPatient(id){
        for( var i= 0; i < $scope.patients.length; i++){
            var p = $scope.patients[i];
            if( p.id == id ){
               return p;
            }
        }
        
        return false;
    }
    
    function getSession(id_patient,id_session){
        
        var  p = getPatient(id_patient);
        
        if( p !== false ){
            for( var i= 0; i < p.sessions_details.length; i++){
                var s = p.sessions_details[i];
                if( s.id == id_session ){
                   return s;
                }
            }

            return false;
        }
        
    }
    
});