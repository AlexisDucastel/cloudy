<?php
namespace Cloudy\Core;

class ProviderProxmox extends Provider{
    /**
    * Internal Proxmox API connector
    */
    protected $connector;
    
    /**
    * Proxmox Provider
    * @param string $host   Hostname or ip of Proxmox host or cluster
    * @param int $port      Usually 8006
    * @param string $user   User account name
    * @param string $realm  User account realm (pam,pve,etc.)
    * @param string $pwd    User account password
    * @return ProviderProxmox
    */
    public function __construct($host,$port,$user,$realm,$pwd){
        $this->connector = new \PVE\Api\Client($host,$port);
        $this->connector->login($user, $realm, $pwd);
    }
    
    /**
    * Get server list
    * @return array
    */
    public function serverList(){
        $serverList=array();
        $vmList=$this->connector->vmlist();
        foreach($vmList as $vm){
            $serverList[$vm['vmid']]=$vm['name'];
        }
        return $serverList;
    }
}