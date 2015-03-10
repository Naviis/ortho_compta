<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {
    
    private $res = null;
        
    public function __construct(){
        parent::__construct();
        
        $this->load->model('response');
        $this->res = new Response();
    }
    
    /*---------------------------*\
        $PATIENT
    \*---------------------------*/
    
    public function patients($id = null){
        
        $table_patient = 'patient';   
        $table_session = 'session';   
        
        switch($this->input->server('REQUEST_METHOD')){
            
            case 'GET':
                
                if( !is_null($id) ){
                    
                    $this->db->select('patient.id,patient.lastname,patient.firstname,patient.note,patient.clear,session.id as sessionid, session.type_AMO, session.holder,session.date,session.bills');
                    $this->db->from('patient');
                    $this->db->join('session', 'session.patient = patient.id','left');

                    $query = $this->db->get();
                    var_dump($query->result());
                    $this->publish($res = $query->result(),'success','Patient'); 
                }else{
                    $this->publish($res = $this->db->get($table)->result(),'success','Patients'); 
                }

            break;
            
        }
    }
    
    private function publish($data,$status,$type){
        
        $this->res->set_status($status);
        $this->res->set_result($data);
        $this->res->send();
        
    }
   
}
