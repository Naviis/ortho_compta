<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

session_start();

class Login extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        
        $this->load->model('user');
    }

	public function index(){    
        
        $this->load->library('form_validation');
        
        if($this->session->userdata('user')){
            redirect( site_url('webapp'), 'refresh');
        }
        
        if( isset($_POST) && !empty($_POST) ){
            
            $this->form_validation->set_rules('login', 'Identifiant', 'trim|required|xss_clean');
            $this->form_validation->set_rules('pass', 'Mot de passe', 'trim|required|xss_clean');

            if($this->form_validation->run() == false){
                $this->show_form(array('error_login'=>'Identifiants incorrects')); 
            }else{                
                if( $this->check_login($_POST['login'], $_POST['pass']) ){
                    redirect('webapp', 'refresh');
                }else{                    
                    $this->show_form(array('error_login'=>'Identifiants incorrects')); 
                }                
            }
        }else{            
            $this->show_form();
        }
        
	}
    
    public function show_form($data = array()){
        $this->load->view('login',$data);
    }
    
    public function check_login($user, $password){
        
        $res = $this->user->login($user, $password);
        
        if( $res ){
            $this->session->set_userdata('user', array(
                'id' => 0,
                'username' => 'Aimée LEVY'
            ));
            return true;
        }else{
            return false;
        }
    }
}
