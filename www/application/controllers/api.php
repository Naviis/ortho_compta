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
        
        switch($this->input->server('REQUEST_METHOD')){
            
            case 'GET':
                
                // One patient
                if( !is_null($id) ){
                    
                    
                    
                // Multiple patients
                }else{
                    $this->db->select(' patient.id,
                                        patient.lastname,
                                        patient.firstname,
                                        patient.note,
                                        patient.clear,
                                        patient.bills,
                                        session.id as session_id, 
                                        type_AMO.value AS amo');
                    $this->db->from('patient');
                    $this->db->join('session', 'session.patient = patient.id','left');
                    $this->db->join('type_AMO', 'session.type_AMO = type_AMO.id','left');

                    $res = $this->db->get()->result();
                    
                    $patients = array();
                    $current_patient = null;
                    
                    foreach( $res as $line ){
                        $c_id = $line->id;
                        
                        if( is_null($current_patient) || ( !is_null($current_patient) && $current_patient->id != $c_id) ){
                            
                            $current_patient = new stdClass();
                            $current_patient->id = (int)$line->id;
                            $current_patient->lastname = $line->lastname;
                            $current_patient->firstname = $line->firstname;
                            $current_patient->note = $line->note;
                            $current_patient->clear = (int)$line->clear;
                            $current_patient->bills = $line->bills;
                            $current_patient->total = 0;
                            $current_patient->sessions = array();
                            
                            if( !is_null($line->session_id) ){
                                $current_session = new stdClass();
                                $current_session->id = (int)$line->session_id;
                                $current_session->amo = (float)$line->amo;
                                
                                array_push($current_patient->sessions,$current_session);
                            }
                            
                            array_push($patients,$current_patient);
                            
                        }else{
                            if( !is_null($line->session_id) ){
                                $current_session = new stdClass();
                                $current_session->id = (int)$line->session_id;
                                $current_session->amo = (float)$line->amo;
                                
                                array_push($current_patient->sessions,$current_session);
                            }
                        }
                        
                        // Total
                        
                        foreach( $current_patient->sessions as $session ){
                            $current_patient->total += ($session->amo*AMO_VALUE);
                        }
                        
                    } //end foreach
                    
                    
                    $this->publish($patients);
                    
                }// end if id

            break; // End get
            
        }
    }
    
    private function publish($data,$status = 'success'){
        
        $this->res->set_status($status);
        $this->res->set_result($data);
        $this->res->send();
        
    }
   
}
