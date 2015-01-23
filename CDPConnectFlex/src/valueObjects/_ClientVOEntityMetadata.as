
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
import mx.collections.ArrayCollection;
import mx.events.ValidationResultEvent;
import valueObjects.GpraVO;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _ClientVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("autoid", "gpras", "intake", "discharge", "followup", "firstname", "lastname", "dob", "ssn", "intakestaff", "createddate");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("autoid", "gpras", "intake", "discharge", "followup", "firstname", "lastname", "dob", "ssn", "intakestaff", "createddate");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("autoid", "gpras", "intake", "discharge", "followup", "firstname", "lastname", "dob", "ssn", "intakestaff", "createddate");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("autoid", "gpras", "intake", "discharge", "followup", "firstname", "lastname", "dob", "ssn", "intakestaff", "createddate");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("autoid", "gpras", "intake", "discharge", "followup", "firstname", "lastname", "dob", "ssn", "intakestaff", "createddate");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array("gpras");
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "ClientVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _gprasIsValid:Boolean;
    model_internal var _gprasValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _gprasIsValidCacheInitialized:Boolean = false;
    model_internal var _gprasValidationFailureMessages:Array;
    
    model_internal var _intakeIsValid:Boolean;
    model_internal var _intakeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _intakeIsValidCacheInitialized:Boolean = false;
    model_internal var _intakeValidationFailureMessages:Array;
    
    model_internal var _dischargeIsValid:Boolean;
    model_internal var _dischargeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dischargeIsValidCacheInitialized:Boolean = false;
    model_internal var _dischargeValidationFailureMessages:Array;
    
    model_internal var _followupIsValid:Boolean;
    model_internal var _followupValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _followupIsValidCacheInitialized:Boolean = false;
    model_internal var _followupValidationFailureMessages:Array;
    
    model_internal var _firstnameIsValid:Boolean;
    model_internal var _firstnameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _firstnameIsValidCacheInitialized:Boolean = false;
    model_internal var _firstnameValidationFailureMessages:Array;
    
    model_internal var _lastnameIsValid:Boolean;
    model_internal var _lastnameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _lastnameIsValidCacheInitialized:Boolean = false;
    model_internal var _lastnameValidationFailureMessages:Array;
    
    model_internal var _dobIsValid:Boolean;
    model_internal var _dobValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dobIsValidCacheInitialized:Boolean = false;
    model_internal var _dobValidationFailureMessages:Array;
    
    model_internal var _ssnIsValid:Boolean;
    model_internal var _ssnValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _ssnIsValidCacheInitialized:Boolean = false;
    model_internal var _ssnValidationFailureMessages:Array;
    
    model_internal var _intakestaffIsValid:Boolean;
    model_internal var _intakestaffValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _intakestaffIsValidCacheInitialized:Boolean = false;
    model_internal var _intakestaffValidationFailureMessages:Array;
    
    model_internal var _createddateIsValid:Boolean;
    model_internal var _createddateValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _createddateIsValidCacheInitialized:Boolean = false;
    model_internal var _createddateValidationFailureMessages:Array;

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
            model_internal::dependentsOnMap["gpras"] = new Array();
            model_internal::dependentsOnMap["intake"] = new Array();
            model_internal::dependentsOnMap["discharge"] = new Array();
            model_internal::dependentsOnMap["followup"] = new Array();
            model_internal::dependentsOnMap["firstname"] = new Array();
            model_internal::dependentsOnMap["lastname"] = new Array();
            model_internal::dependentsOnMap["dob"] = new Array();
            model_internal::dependentsOnMap["ssn"] = new Array();
            model_internal::dependentsOnMap["intakestaff"] = new Array();
            model_internal::dependentsOnMap["createddate"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
            model_internal::collectionBaseMap["gpras"] = "Object";
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["autoid"] = "int";
        model_internal::propertyTypeMap["gpras"] = "ArrayCollection";
        model_internal::propertyTypeMap["intake"] = "valueObjects.GpraVO";
        model_internal::propertyTypeMap["discharge"] = "valueObjects.GpraVO";
        model_internal::propertyTypeMap["followup"] = "valueObjects.GpraVO";
        model_internal::propertyTypeMap["firstname"] = "String";
        model_internal::propertyTypeMap["lastname"] = "String";
        model_internal::propertyTypeMap["dob"] = "String";
        model_internal::propertyTypeMap["ssn"] = "String";
        model_internal::propertyTypeMap["intakestaff"] = "String";
        model_internal::propertyTypeMap["createddate"] = "String";

        model_internal::_instance = value;
        model_internal::_gprasValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForGpras);
        model_internal::_gprasValidator.required = true;
        model_internal::_gprasValidator.requiredFieldError = "gpras is required";
        //model_internal::_gprasValidator.source = model_internal::_instance;
        //model_internal::_gprasValidator.property = "gpras";
        model_internal::_intakeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIntake);
        model_internal::_intakeValidator.required = true;
        model_internal::_intakeValidator.requiredFieldError = "intake is required";
        //model_internal::_intakeValidator.source = model_internal::_instance;
        //model_internal::_intakeValidator.property = "intake";
        model_internal::_dischargeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDischarge);
        model_internal::_dischargeValidator.required = true;
        model_internal::_dischargeValidator.requiredFieldError = "discharge is required";
        //model_internal::_dischargeValidator.source = model_internal::_instance;
        //model_internal::_dischargeValidator.property = "discharge";
        model_internal::_followupValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForFollowup);
        model_internal::_followupValidator.required = true;
        model_internal::_followupValidator.requiredFieldError = "followup is required";
        //model_internal::_followupValidator.source = model_internal::_instance;
        //model_internal::_followupValidator.property = "followup";
        model_internal::_firstnameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForFirstname);
        model_internal::_firstnameValidator.required = true;
        model_internal::_firstnameValidator.requiredFieldError = "firstname is required";
        //model_internal::_firstnameValidator.source = model_internal::_instance;
        //model_internal::_firstnameValidator.property = "firstname";
        model_internal::_lastnameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLastname);
        model_internal::_lastnameValidator.required = true;
        model_internal::_lastnameValidator.requiredFieldError = "lastname is required";
        //model_internal::_lastnameValidator.source = model_internal::_instance;
        //model_internal::_lastnameValidator.property = "lastname";
        model_internal::_dobValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDob);
        model_internal::_dobValidator.required = true;
        model_internal::_dobValidator.requiredFieldError = "dob is required";
        //model_internal::_dobValidator.source = model_internal::_instance;
        //model_internal::_dobValidator.property = "dob";
        model_internal::_ssnValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForSsn);
        model_internal::_ssnValidator.required = true;
        model_internal::_ssnValidator.requiredFieldError = "ssn is required";
        //model_internal::_ssnValidator.source = model_internal::_instance;
        //model_internal::_ssnValidator.property = "ssn";
        model_internal::_intakestaffValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIntakestaff);
        model_internal::_intakestaffValidator.required = true;
        model_internal::_intakestaffValidator.requiredFieldError = "intakestaff is required";
        //model_internal::_intakestaffValidator.source = model_internal::_instance;
        //model_internal::_intakestaffValidator.property = "intakestaff";
        model_internal::_createddateValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCreateddate);
        model_internal::_createddateValidator.required = true;
        model_internal::_createddateValidator.requiredFieldError = "createddate is required";
        //model_internal::_createddateValidator.source = model_internal::_instance;
        //model_internal::_createddateValidator.property = "createddate";
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
    public function get isGprasAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIntakeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDischargeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFollowupAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFirstnameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLastnameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDobAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSsnAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIntakestaffAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCreateddateAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnGpras():void
    {
        if (model_internal::_gprasIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfGpras = null;
            model_internal::calculateGprasIsValid();
        }
    }
    public function invalidateDependentOnIntake():void
    {
        if (model_internal::_intakeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIntake = null;
            model_internal::calculateIntakeIsValid();
        }
    }
    public function invalidateDependentOnDischarge():void
    {
        if (model_internal::_dischargeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDischarge = null;
            model_internal::calculateDischargeIsValid();
        }
    }
    public function invalidateDependentOnFollowup():void
    {
        if (model_internal::_followupIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfFollowup = null;
            model_internal::calculateFollowupIsValid();
        }
    }
    public function invalidateDependentOnFirstname():void
    {
        if (model_internal::_firstnameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfFirstname = null;
            model_internal::calculateFirstnameIsValid();
        }
    }
    public function invalidateDependentOnLastname():void
    {
        if (model_internal::_lastnameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLastname = null;
            model_internal::calculateLastnameIsValid();
        }
    }
    public function invalidateDependentOnDob():void
    {
        if (model_internal::_dobIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDob = null;
            model_internal::calculateDobIsValid();
        }
    }
    public function invalidateDependentOnSsn():void
    {
        if (model_internal::_ssnIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfSsn = null;
            model_internal::calculateSsnIsValid();
        }
    }
    public function invalidateDependentOnIntakestaff():void
    {
        if (model_internal::_intakestaffIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIntakestaff = null;
            model_internal::calculateIntakestaffIsValid();
        }
    }
    public function invalidateDependentOnCreateddate():void
    {
        if (model_internal::_createddateIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCreateddate = null;
            model_internal::calculateCreateddateIsValid();
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
    public function get gprasStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get gprasValidator() : StyleValidator
    {
        return model_internal::_gprasValidator;
    }

    model_internal function set _gprasIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_gprasIsValid;         
        if (oldValue !== value)
        {
            model_internal::_gprasIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "gprasIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get gprasIsValid():Boolean
    {
        if (!model_internal::_gprasIsValidCacheInitialized)
        {
            model_internal::calculateGprasIsValid();
        }

        return model_internal::_gprasIsValid;
    }

    model_internal function calculateGprasIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_gprasValidator.validate(model_internal::_instance.gpras)
        model_internal::_gprasIsValid_der = (valRes.results == null);
        model_internal::_gprasIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::gprasValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::gprasValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get gprasValidationFailureMessages():Array
    {
        if (model_internal::_gprasValidationFailureMessages == null)
            model_internal::calculateGprasIsValid();

        return _gprasValidationFailureMessages;
    }

    model_internal function set gprasValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_gprasValidationFailureMessages;

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
            model_internal::_gprasValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "gprasValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get intakeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get intakeValidator() : StyleValidator
    {
        return model_internal::_intakeValidator;
    }

    model_internal function set _intakeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_intakeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_intakeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get intakeIsValid():Boolean
    {
        if (!model_internal::_intakeIsValidCacheInitialized)
        {
            model_internal::calculateIntakeIsValid();
        }

        return model_internal::_intakeIsValid;
    }

    model_internal function calculateIntakeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_intakeValidator.validate(model_internal::_instance.intake)
        model_internal::_intakeIsValid_der = (valRes.results == null);
        model_internal::_intakeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::intakeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::intakeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get intakeValidationFailureMessages():Array
    {
        if (model_internal::_intakeValidationFailureMessages == null)
            model_internal::calculateIntakeIsValid();

        return _intakeValidationFailureMessages;
    }

    model_internal function set intakeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_intakeValidationFailureMessages;

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
            model_internal::_intakeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get dischargeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dischargeValidator() : StyleValidator
    {
        return model_internal::_dischargeValidator;
    }

    model_internal function set _dischargeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dischargeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dischargeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dischargeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dischargeIsValid():Boolean
    {
        if (!model_internal::_dischargeIsValidCacheInitialized)
        {
            model_internal::calculateDischargeIsValid();
        }

        return model_internal::_dischargeIsValid;
    }

    model_internal function calculateDischargeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dischargeValidator.validate(model_internal::_instance.discharge)
        model_internal::_dischargeIsValid_der = (valRes.results == null);
        model_internal::_dischargeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dischargeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dischargeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dischargeValidationFailureMessages():Array
    {
        if (model_internal::_dischargeValidationFailureMessages == null)
            model_internal::calculateDischargeIsValid();

        return _dischargeValidationFailureMessages;
    }

    model_internal function set dischargeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dischargeValidationFailureMessages;

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
            model_internal::_dischargeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dischargeValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get followupStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get followupValidator() : StyleValidator
    {
        return model_internal::_followupValidator;
    }

    model_internal function set _followupIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_followupIsValid;         
        if (oldValue !== value)
        {
            model_internal::_followupIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "followupIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get followupIsValid():Boolean
    {
        if (!model_internal::_followupIsValidCacheInitialized)
        {
            model_internal::calculateFollowupIsValid();
        }

        return model_internal::_followupIsValid;
    }

    model_internal function calculateFollowupIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_followupValidator.validate(model_internal::_instance.followup)
        model_internal::_followupIsValid_der = (valRes.results == null);
        model_internal::_followupIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::followupValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::followupValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get followupValidationFailureMessages():Array
    {
        if (model_internal::_followupValidationFailureMessages == null)
            model_internal::calculateFollowupIsValid();

        return _followupValidationFailureMessages;
    }

    model_internal function set followupValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_followupValidationFailureMessages;

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
            model_internal::_followupValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "followupValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get firstnameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get firstnameValidator() : StyleValidator
    {
        return model_internal::_firstnameValidator;
    }

    model_internal function set _firstnameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_firstnameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_firstnameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstnameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get firstnameIsValid():Boolean
    {
        if (!model_internal::_firstnameIsValidCacheInitialized)
        {
            model_internal::calculateFirstnameIsValid();
        }

        return model_internal::_firstnameIsValid;
    }

    model_internal function calculateFirstnameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_firstnameValidator.validate(model_internal::_instance.firstname)
        model_internal::_firstnameIsValid_der = (valRes.results == null);
        model_internal::_firstnameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::firstnameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::firstnameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get firstnameValidationFailureMessages():Array
    {
        if (model_internal::_firstnameValidationFailureMessages == null)
            model_internal::calculateFirstnameIsValid();

        return _firstnameValidationFailureMessages;
    }

    model_internal function set firstnameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_firstnameValidationFailureMessages;

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
            model_internal::_firstnameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstnameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get lastnameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get lastnameValidator() : StyleValidator
    {
        return model_internal::_lastnameValidator;
    }

    model_internal function set _lastnameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_lastnameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_lastnameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastnameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get lastnameIsValid():Boolean
    {
        if (!model_internal::_lastnameIsValidCacheInitialized)
        {
            model_internal::calculateLastnameIsValid();
        }

        return model_internal::_lastnameIsValid;
    }

    model_internal function calculateLastnameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_lastnameValidator.validate(model_internal::_instance.lastname)
        model_internal::_lastnameIsValid_der = (valRes.results == null);
        model_internal::_lastnameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::lastnameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::lastnameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get lastnameValidationFailureMessages():Array
    {
        if (model_internal::_lastnameValidationFailureMessages == null)
            model_internal::calculateLastnameIsValid();

        return _lastnameValidationFailureMessages;
    }

    model_internal function set lastnameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_lastnameValidationFailureMessages;

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
            model_internal::_lastnameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastnameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get dobStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dobValidator() : StyleValidator
    {
        return model_internal::_dobValidator;
    }

    model_internal function set _dobIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dobIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dobIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dobIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dobIsValid():Boolean
    {
        if (!model_internal::_dobIsValidCacheInitialized)
        {
            model_internal::calculateDobIsValid();
        }

        return model_internal::_dobIsValid;
    }

    model_internal function calculateDobIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dobValidator.validate(model_internal::_instance.dob)
        model_internal::_dobIsValid_der = (valRes.results == null);
        model_internal::_dobIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dobValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dobValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dobValidationFailureMessages():Array
    {
        if (model_internal::_dobValidationFailureMessages == null)
            model_internal::calculateDobIsValid();

        return _dobValidationFailureMessages;
    }

    model_internal function set dobValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dobValidationFailureMessages;

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
            model_internal::_dobValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dobValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get ssnStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get ssnValidator() : StyleValidator
    {
        return model_internal::_ssnValidator;
    }

    model_internal function set _ssnIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_ssnIsValid;         
        if (oldValue !== value)
        {
            model_internal::_ssnIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ssnIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get ssnIsValid():Boolean
    {
        if (!model_internal::_ssnIsValidCacheInitialized)
        {
            model_internal::calculateSsnIsValid();
        }

        return model_internal::_ssnIsValid;
    }

    model_internal function calculateSsnIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_ssnValidator.validate(model_internal::_instance.ssn)
        model_internal::_ssnIsValid_der = (valRes.results == null);
        model_internal::_ssnIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::ssnValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::ssnValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get ssnValidationFailureMessages():Array
    {
        if (model_internal::_ssnValidationFailureMessages == null)
            model_internal::calculateSsnIsValid();

        return _ssnValidationFailureMessages;
    }

    model_internal function set ssnValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_ssnValidationFailureMessages;

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
            model_internal::_ssnValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ssnValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get intakestaffStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get intakestaffValidator() : StyleValidator
    {
        return model_internal::_intakestaffValidator;
    }

    model_internal function set _intakestaffIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_intakestaffIsValid;         
        if (oldValue !== value)
        {
            model_internal::_intakestaffIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakestaffIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get intakestaffIsValid():Boolean
    {
        if (!model_internal::_intakestaffIsValidCacheInitialized)
        {
            model_internal::calculateIntakestaffIsValid();
        }

        return model_internal::_intakestaffIsValid;
    }

    model_internal function calculateIntakestaffIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_intakestaffValidator.validate(model_internal::_instance.intakestaff)
        model_internal::_intakestaffIsValid_der = (valRes.results == null);
        model_internal::_intakestaffIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::intakestaffValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::intakestaffValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get intakestaffValidationFailureMessages():Array
    {
        if (model_internal::_intakestaffValidationFailureMessages == null)
            model_internal::calculateIntakestaffIsValid();

        return _intakestaffValidationFailureMessages;
    }

    model_internal function set intakestaffValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_intakestaffValidationFailureMessages;

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
            model_internal::_intakestaffValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakestaffValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get createddateStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get createddateValidator() : StyleValidator
    {
        return model_internal::_createddateValidator;
    }

    model_internal function set _createddateIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_createddateIsValid;         
        if (oldValue !== value)
        {
            model_internal::_createddateIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "createddateIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get createddateIsValid():Boolean
    {
        if (!model_internal::_createddateIsValidCacheInitialized)
        {
            model_internal::calculateCreateddateIsValid();
        }

        return model_internal::_createddateIsValid;
    }

    model_internal function calculateCreateddateIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_createddateValidator.validate(model_internal::_instance.createddate)
        model_internal::_createddateIsValid_der = (valRes.results == null);
        model_internal::_createddateIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::createddateValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::createddateValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get createddateValidationFailureMessages():Array
    {
        if (model_internal::_createddateValidationFailureMessages == null)
            model_internal::calculateCreateddateIsValid();

        return _createddateValidationFailureMessages;
    }

    model_internal function set createddateValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_createddateValidationFailureMessages;

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
            model_internal::_createddateValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "createddateValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
            case("gpras"):
            {
                return gprasValidationFailureMessages;
            }
            case("intake"):
            {
                return intakeValidationFailureMessages;
            }
            case("discharge"):
            {
                return dischargeValidationFailureMessages;
            }
            case("followup"):
            {
                return followupValidationFailureMessages;
            }
            case("firstname"):
            {
                return firstnameValidationFailureMessages;
            }
            case("lastname"):
            {
                return lastnameValidationFailureMessages;
            }
            case("dob"):
            {
                return dobValidationFailureMessages;
            }
            case("ssn"):
            {
                return ssnValidationFailureMessages;
            }
            case("intakestaff"):
            {
                return intakestaffValidationFailureMessages;
            }
            case("createddate"):
            {
                return createddateValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
