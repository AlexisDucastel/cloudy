<?php
namespace Cloudy\Core;

class ProviderOvhDedicatedServers extends Provider{
    /**
    * Internal SoAPI connector
    */
    protected $connector;
    protected $session;
    
    /**
    * OVH Dedicated Servers Provider
    * @param string $nichandle  User NicHandle (Ex : XX0000-ovh)
    * @param string $pwd    User account password
    * @return ProviderOvhDedicatedServers
    */
    public function __construct($nichandle,$pwd){
        $this->connector = new \SoapClient("https://www.ovh.com/soapi/soapi-re-1.63.wsdl");
        $this->session = $this->connector->login($nichandle, $pwd,"fr", false);
    }
    
    /**
    * Get server list
    * @return array
    */
    public function serverList(){
        $serverList=array();
        
        $idList=$this->connector->dedicatedList($this->session);
        foreach($idList as $id){
            $reverses=$this->connector->dedicatedReverseList($this->session, $id);
            $serverList[$id]=$reverses[0]->reverse;
        }
        return $serverList;
    }
}