<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

session_start();

class Webapp extends CI_Controller {

	public function index(){
        
        if($this->session->userdata('user')){
            $session_data = $this->session->userdata('user');            
            $content = $this->load->view('webapp', array('username'=>$session_data['username']));          
        }else{
            redirect('login', 'refresh');
        }
        
	}
    
    public function logout(){
        $this->session->unset_userdata('user');
        session_destroy();
        redirect('login', 'refresh');
    }
}
