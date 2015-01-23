<?php
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
        if($Header->userName == 'USERNAME' && $Header->passWord == 'PASSWORD')
            $this->authenticated = true;

    }

	function UploadDocument($data)
	{
		if(!$this->authenticated)
			return new SoapFault("AuthenticationError", "Username or password incorrect.");
		else
		{
			$responseObj = new SimpleXMLElement($data->content);
			//$res = $responseObj->body->myvar;
			$res = "Record accepted";
			$response = array('UploadDocumentResult' => $res);
			return $response;
		}
	}
}

ini_set("soap.wsdl_cache_enabled", "0");
$service = new SOAP_Service_Secure('My_Service');
$server = new SoapServer("http://localhost/GPRA/services/UploadDocument.wsdl");
$server->setObject($service);
$server->handle();
?>