
app.service('PatientService',function ($http){
    return {
        get_all : function(){
            return $http.get('./api/patients');
        },
        get_by_id : function(id){
            return $http.get('./api/patients/'+id);
        },
        handle_results(data){
            var patients = [];
            for( p in data ){
                patient.push({'test':'test'});
            }
            return patients;
        }
    };
});