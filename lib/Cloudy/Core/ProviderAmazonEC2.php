<?php
namespace Cloudy\Core;

class ProviderAmazonEC2 extends Provider{
    /**
    * Internal AWS EC2 API connector
    */
    protected $connector;
    
    /**
    * Amazon Web Services EC2 Provider
    * @param string $awsAccessKeyId     Access key id
    * @param string $awsSecretAccessKey Secret access key
    * @param string $region             Region (us-west-2, etc.)
    * @return ProviderAmazonEC2
    */
    public function __construct($key,$secret,$region){
        $this->connector = \Aws\EC2\Ec2Client::factory(array(
            'key'    => $key,
            'secret' => $secret,
            'region' => $region
        ));
    }
    
    /**
    * Get server list
    * @return array
    */
    public function serverList(){
        $serverList=array();
        
        foreach($this->connector->describeInstances()->get('Reservations') as $r){
            $id=$r['Instances'][0]['InstanceId'];
            $name="$id";
            
            foreach($r['Instances'][0]['Tags'] as $t){
                if($t['Key']=='Name'){
                    $name=$t['Value'];
                    break;
                }
            }  
            
            $serverList[$id]=$name;
        }
        
        /*
        $vmList=$this->connector->vmlist();
        foreach($vmList as $vm){
            $serverList[$vm['vmid']]=$vm['name'];
        }
        */
        return $serverList;
    }
}