<?php
namespace Cloudy\Core;

class ProviderVSphere extends Provider{
    protected $connector;
    
    public function __construct($host,$port,$user,$pwd){
        $this->connector = new \Vmwarephp\Vhost($host.':'.$port, $user, $pwd);
    }
    
    public function serverList(){
        $serverList=array();
        $vmList = $this->connector->findAllManagedObjects('VirtualMachine', array('name'));
        foreach($vmList as $vm){
            $serverList[$vm->getReferenceId()]=$vm->name;
        }
        return $serverList;
    }
}