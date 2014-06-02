<?php
namespace Cloudy\Core;

abstract class Provider{
    /**
    * Get server list
    * @return array
    */
    abstract public function serverList();
    
    /**
    * Provider Factory
    * @param string $type   Provider type, ex: 'vsphere'
    * @param array $args    Provider constructor arguments
    * @return Provider
    */
    static public function factory($type,$args){
        switch($type){
            case 'vsphere': 
                return new ProviderVSphere($args['host'],$args['port'],$args['user'],$args['pwd']);
            default:
                throw new Exception('Unkown provider type');
        }
        
    }
}