/**
 * This is a generated sub-class of _AssessmentService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package services.assessmentservice
{

public class AssessmentService extends _Super_AssessmentService
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
		if(CDPConnectFlex.DEBUG_MODE == 0)
			serviceControl.endpoint = "https://www.iprctech.org/cdpconnect/indiana/gateway.php";
		else if(CDPConnectFlex.DEBUG_MODE == 1)
			serviceControl.endpoint = "http://www.iprctech.org/cdpconnect/indianatest/gateway.php";
		serviceControl.requestTimeout = 5;
    }
               
}

}
