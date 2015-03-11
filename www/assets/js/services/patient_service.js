
app.service('PatientService',function ($http){
    return {
        get_all : function(){
            return $http.get('./api/get_patients/');
        },
        get_patient_sessions : function(id){
            return $http.get('./api/get_patient_sessions/'+id);
        },
        set_clear : function(id, value){
            $http({url:'./api/set_patient_clear/',
                   method: 'POST',
                   data: {'id':id,'value':value}
                  });
        }
    };
});