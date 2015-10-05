/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - AssessmentService.as.
 */
package services.assessmentservice
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;
import valueObjects.AssessmentVO;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_AssessmentService extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_AssessmentService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service
        valueObjects.AssessmentVO._initRemoteClassAlias();

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "getAssessmentsByClientID");
         operation.resultElementType = valueObjects.AssessmentVO;
        operations["getAssessmentsByClientID"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "createAssessment");
         operation.resultType = valueObjects.AssessmentVO;
        operations["createAssessment"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "updateAssessmentData");
        operations["updateAssessmentData"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getAssessmentsByClientID2");
         operation.resultElementType = Object;
        operations["getAssessmentsByClientID2"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "createBlankAssessment");
         operation.resultType = valueObjects.AssessmentVO;
        operations["createBlankAssessment"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getBatchAssessments");
         operation.resultElementType = Object;
        operations["getBatchAssessments"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "deleteAssessment");
        operations["deleteAssessment"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "AssessmentService";
        _serviceControl.endpoint = "http://localhost//CDPConnect/CDPConnect/public/gateway.php";


         preInitializeService();
         model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {
        destination = "AssessmentService";
      
    }
    

    /**
      * This method is a generated wrapper used to call the 'getAssessmentsByClientID' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getAssessmentsByClientID(autoid:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAssessmentsByClientID");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(autoid) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'createAssessment' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function createAssessment(item:valueObjects.AssessmentVO) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createAssessment");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'updateAssessmentData' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function updateAssessmentData(item:valueObjects.AssessmentVO) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateAssessmentData");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getAssessmentsByClientID2' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getAssessmentsByClientID2(autoid:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAssessmentsByClientID2");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(autoid) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'createBlankAssessment' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function createBlankAssessment(item:valueObjects.AssessmentVO) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createBlankAssessment");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getBatchAssessments' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getBatchAssessments(instrumentType:int, interviewType1:int, interviewType2:int, newOnly:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getBatchAssessments");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(instrumentType,interviewType1,interviewType2,newOnly) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'deleteAssessment' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function deleteAssessment(item:valueObjects.AssessmentVO) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("deleteAssessment");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;
        return _internal_token;
    }
     
}

}
