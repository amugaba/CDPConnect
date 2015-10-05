
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _ClientVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("autoid", "clientid", "intakeExists", "intakeDate", "dischargeExists", "followupExists", "followupSelected");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("autoid", "clientid", "intakeExists", "intakeDate", "dischargeExists", "followupExists", "followupSelected");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("autoid", "clientid", "intakeExists", "intakeDate", "dischargeExists", "followupExists", "followupSelected");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("autoid", "clientid", "intakeExists", "intakeDate", "dischargeExists", "followupExists", "followupSelected");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("autoid", "clientid", "intakeExists", "intakeDate", "dischargeExists", "followupExists", "followupSelected");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "ClientVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _clientidIsValid:Boolean;
    model_internal var _clientidValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _clientidIsValidCacheInitialized:Boolean = false;
    model_internal var _clientidValidationFailureMessages:Array;
    
    model_internal var _intakeDateIsValid:Boolean;
    model_internal var _intakeDateValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _intakeDateIsValidCacheInitialized:Boolean = false;
    model_internal var _intakeDateValidationFailureMessages:Array;

    model_internal var _instance:_Super_ClientVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _ClientVOEntityMetadata(value : _Super_ClientVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["autoid"] = new Array();
            model_internal::dependentsOnMap["clientid"] = new Array();
            model_internal::dependentsOnMap["intakeExists"] = new Array();
            model_internal::dependentsOnMap["intakeDate"] = new Array();
            model_internal::dependentsOnMap["dischargeExists"] = new Array();
            model_internal::dependentsOnMap["followupExists"] = new Array();
            model_internal::dependentsOnMap["followupSelected"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["autoid"] = "int";
        model_internal::propertyTypeMap["clientid"] = "String";
        model_internal::propertyTypeMap["intakeExists"] = "Boolean";
        model_internal::propertyTypeMap["intakeDate"] = "String";
        model_internal::propertyTypeMap["dischargeExists"] = "Boolean";
        model_internal::propertyTypeMap["followupExists"] = "Boolean";
        model_internal::propertyTypeMap["followupSelected"] = "Boolean";

        model_internal::_instance = value;
        model_internal::_clientidValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForClientid);
        model_internal::_clientidValidator.required = true;
        model_internal::_clientidValidator.requiredFieldError = "clientid is required";
        //model_internal::_clientidValidator.source = model_internal::_instance;
        //model_internal::_clientidValidator.property = "clientid";
        model_internal::_intakeDateValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIntakeDate);
        model_internal::_intakeDateValidator.required = true;
        model_internal::_intakeDateValidator.requiredFieldError = "intakeDate is required";
        //model_internal::_intakeDateValidator.source = model_internal::_instance;
        //model_internal::_intakeDateValidator.property = "intakeDate";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity ClientVO");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity ClientVO");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of ClientVO");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity ClientVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity ClientVO");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity ClientVO");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isAutoidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isClientidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIntakeExistsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIntakeDateAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDischargeExistsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFollowupExistsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFollowupSelectedAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnClientid():void
    {
        if (model_internal::_clientidIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfClientid = null;
            model_internal::calculateClientidIsValid();
        }
    }
    public function invalidateDependentOnIntakeDate():void
    {
        if (model_internal::_intakeDateIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIntakeDate = null;
            model_internal::calculateIntakeDateIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get autoidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get clientidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get clientidValidator() : StyleValidator
    {
        return model_internal::_clientidValidator;
    }

    model_internal function set _clientidIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_clientidIsValid;         
        if (oldValue !== value)
        {
            model_internal::_clientidIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "clientidIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get clientidIsValid():Boolean
    {
        if (!model_internal::_clientidIsValidCacheInitialized)
        {
            model_internal::calculateClientidIsValid();
        }

        return model_internal::_clientidIsValid;
    }

    model_internal function calculateClientidIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_clientidValidator.validate(model_internal::_instance.clientid)
        model_internal::_clientidIsValid_der = (valRes.results == null);
        model_internal::_clientidIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::clientidValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::clientidValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get clientidValidationFailureMessages():Array
    {
        if (model_internal::_clientidValidationFailureMessages == null)
            model_internal::calculateClientidIsValid();

        return _clientidValidationFailureMessages;
    }

    model_internal function set clientidValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_clientidValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_clientidValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "clientidValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get intakeExistsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get intakeDateStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get intakeDateValidator() : StyleValidator
    {
        return model_internal::_intakeDateValidator;
    }

    model_internal function set _intakeDateIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_intakeDateIsValid;         
        if (oldValue !== value)
        {
            model_internal::_intakeDateIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeDateIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get intakeDateIsValid():Boolean
    {
        if (!model_internal::_intakeDateIsValidCacheInitialized)
        {
            model_internal::calculateIntakeDateIsValid();
        }

        return model_internal::_intakeDateIsValid;
    }

    model_internal function calculateIntakeDateIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_intakeDateValidator.validate(model_internal::_instance.intakeDate)
        model_internal::_intakeDateIsValid_der = (valRes.results == null);
        model_internal::_intakeDateIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::intakeDateValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::intakeDateValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get intakeDateValidationFailureMessages():Array
    {
        if (model_internal::_intakeDateValidationFailureMessages == null)
            model_internal::calculateIntakeDateIsValid();

        return _intakeDateValidationFailureMessages;
    }

    model_internal function set intakeDateValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_intakeDateValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_intakeDateValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeDateValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get dischargeExistsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get followupExistsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get followupSelectedStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("clientid"):
            {
                return clientidValidationFailureMessages;
            }
            case("intakeDate"):
            {
                return intakeDateValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
