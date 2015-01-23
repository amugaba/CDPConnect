<?php
class AuthHeader
{
    public $userName;
    public $passWord;   
   
}
$client = new SoapClient("http://localhost/GPRA/services/UploadResponse.wsdl", 
	array('trace' => 1, 'exceptions' => 1));

$AuthHeader = new AuthHeader();

$AuthHeader->userName = 'USERNAME';
$AuthHeader->passWord = 'PASSWORD';

$headers[] = new SoapHeader("http://tempuri.org/", 'EDIServiceSOAPHeader', $AuthHeader);
$client->__setSoapHeaders($headers);

$callID = "CALLID";
$servName = "SBIRT";
$refID = "REFID";
$content = <<<XML
<?xml version='1.0'?>
<StatusList>
	<Status>
		<Code>OK</Code>
		<Message>OK</Message>
	</Status>
</StatusList>
XML;
$format = "XML";
$args = array('UploadResponse' => array('callerIdentifier' => $callID, 
'serviceName' => $servName, 'referenceIdentifier' => $refID, 
'content' => $content, 'contentFormat' => $format));

$res = $client->__soapCall("UploadResponse", $args);
header('Content-Type: text/plain');
var_dump($res);
#echo( "res is " . $res);

echo( "\n\nRequest Header: ". $client->__getLastRequestHeaders());
echo( "\n\nRequest: ". $client->__getLastRequest());
echo( "\n\nResponse Header: ". $client->__getLastResponseHeaders());
echo( "\n\nResponse Header: ". $client->__getLastResponse());
?>