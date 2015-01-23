<?php
include_once '../../WEB-INF/GPRA/services/GpraService.php';

class SOAP_Service_Secure
{
    protected $class_name    = '';
    protected $authenticated = false;

    // -----

    public function __construct($class_name)
    {
        $this->class_name = $class_name;
    }

    public function EDIServiceSOAPHeader($Header)
    {
        if($Header->userName == 'IPRCGPRA' && $Header->passWord == 'pvc83i7c')
            $this->authenticated = true;

    }

	function UploadResponse($data)
	{
		if(!$this->authenticated)
			return new SoapFault("AuthenticationError", "Username or password incorrect.");
		
		$xml = new SimpleXMLElement($data->content);
		$xml->asXML("./logs/response-".$data->referenceIdentifier);

		$status_code = $xml->ProcessControl->PROCESS_STATUS;
		if($status_code == 0)
		{
			$res = "Records accepted";
			$gpraIDs = array();
			foreach($xml->Record as $record)
				array_push($gpraIDs,$record->GranteeSourceID);

			if(count($gpraIDs) > 0)
			{
				$o = new GpraService();
				$o->setGprasUploaded($gpraIDs);
			}
		}
		else
			$res = "Records rejected";

		$response = array('UploadResponseResult' => $res);
		return $response;

	}
}

ini_set("soap.wsdl_cache_enabled", "0");
$service = new SOAP_Service_Secure('SATED_Response_Service');
$server = new SoapServer("https://bl-iprc-webserv.ads.iu.edu/SATED/GPRA/services/UploadResponse.wsdl");
$server->setObject($service);
$server->handle();
?>