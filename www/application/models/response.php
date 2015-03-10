<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    Class Response extends CI_Model{
        
        private $status = null;
        private $count = 0;
        private $results = [];
        
        public function __construct(){
            parent::__construct();
        }
        
        public function set_status($status){
            $this->status = $status;
        }
        
        public function set_result($data){
            $this->results = $data;
            $this->count = count($data);
        }
        
        public function send(){
            $this->output->set_content_type('application/json')->set_output(json_encode($this->serialize()));
        } 
        
        function serialize(){
            $var = get_object_vars($this);
            foreach($var as &$value){
               if(is_object($value) && method_exists($value,'getJsonData')){
                  $value = $value->getJsonData();
               }
            }
            return $var;
         }
            
    }
?>