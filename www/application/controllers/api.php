<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {
        
    public function __construct(){
        parent::__construct();
    }
    
    /*---------------------------*\
        $PATIENT
    \*---------------------------*/
    
    public function get_patient($id=null){

        $table = 'patient';
        
        $this->publish($res = $this->db->get($table)->result()); 
    }
    
    /*---------------------------*\
        $TYPE_AMO
    \*---------------------------*/
    
    public function get_type_amo(){
        
        $table = 'type_amo';
        
        $this->publish($res = $this->db->get($table)->result()); 
    }
    
    private function publish($data){
        $this->output->set_content_type('application/json')->set_output(json_encode($data));
    }
   
}
