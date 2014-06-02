<?php
namespace Cloudy\Core;

class ProviderVSphere extends Provider{
    /**
    * Internal vSphere connector
    * @var \Vmwarephp\Vhost
    */
    protected $connector;
    
    /**
    * VmWare vSphere Provider
    * @param string $host   Hostname or ip of vCenter/vHost
    * @param int $port  Usually 443
    * @param string $user   User account name
    * @param mixed $pwd     User account password
    * @return ProviderVSphere
    */
    public function __construct($host,$port,$user,$pwd){
        $this->connector = new \Vmwarephp\Vhost($host.':'.$port, $user, $pwd);
    }
    
    /**
    * Get server list
    * @return array
    */
    public function serverList(){
        $serverList=array();
        $vmList = $this->connector->findAllManagedObjects('VirtualMachine', array('name'));
        foreach($vmList as $vm){
            $serverList[$vm->getReferenceId()]=$vm->name;
        }
        return $serverList;
    }
}