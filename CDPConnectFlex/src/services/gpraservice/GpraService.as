/**
 * This is a generated sub-class of _GpraService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package services.gpraservice
{

public class GpraService extends _Super_GpraService
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
		if(CDPConnectFlex.DEBUG_MODE == 0)
			serviceControl.endpoint = "https://www.drugs.indiana.edu/SATED/GPRA/gateway.php";
		else if(CDPConnectFlex.DEBUG_MODE == 1)
			serviceControl.endpoint = "https://www.drugs.indiana.edu/SATED/GPRATest/gateway.php";
		serviceControl.requestTimeout = 5;
    }
               
}

}
