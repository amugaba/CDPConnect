
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
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _AssessmentVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("autoid", "client_autoid", "type", "subtype", "date", "complete", "data");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("autoid", "client_autoid", "type", "subtype", "date", "complete", "data");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("autoid", "client_autoid", "type", "subtype", "date", "complete", "data");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("autoid", "client_autoid", "type", "subtype", "date", "complete", "data");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("autoid", "client_autoid", "type", "subtype", "date", "complete", "data");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array("data");
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "AssessmentVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _dateIsValid:Boolean;
    model_internal var _dateValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dateIsValidCacheInitialized:Boolean = false;
    model_internal var _dateValidationFailureMessages:Array;
    
    model_internal var _dataIsValid:Boolean;
    model_internal var _dataValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dataIsValidCacheInitialized:Boolean = false;
    model_internal var _dataValidationFailureMessages:Array;

    model_internal var _instance:_Super_AssessmentVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _AssessmentVOEntityMetadata(value : _Super_AssessmentVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["autoid"] = new Array();
            model_internal::dependentsOnMap["client_autoid"] = new Array();
            model_internal::dependentsOnMap["type"] = new Array();
            model_internal::dependentsOnMap["subtype"] = new Array();
            model_internal::dependentsOnMap["date"] = new Array();
            model_internal::dependentsOnMap["complete"] = new Array();
            model_internal::dependentsOnMap["data"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
            model_internal::collectionBaseMap["data"] = "Object";
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["autoid"] = "int";
        model_internal::propertyTypeMap["client_autoid"] = "int";
        model_internal::propertyTypeMap["type"] = "int";
        model_internal::propertyTypeMap["subtype"] = "int";
        model_internal::propertyTypeMap["date"] = "String";
        model_internal::propertyTypeMap["complete"] = "int";
        model_internal::propertyTypeMap["data"] = "ArrayCollection";

        model_internal::_instance = value;
        model_internal::_dateValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDate);
        model_internal::_dateValidator.required = true;
        model_internal::_dateValidator.requiredFieldError = "date is required";
        //model_internal::_dateValidator.source = model_internal::_instance;
        //model_internal::_dateValidator.property = "date";
        model_internal::_dataValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForData);
        model_internal::_dataValidator.required = true;
        model_internal::_dataValidator.requiredFieldError = "data is required";
        //model_internal::_dataValidator.source = model_internal::_instance;
        //model_internal::_dataValidator.property = "data";
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
            throw new Error(propertyName + " is not a data property of entity AssessmentVO");
            
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
            throw new Error(propertyName + " is not a collection property of entity AssessmentVO");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of AssessmentVO");

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
            throw new Error(propertyName + " does not exist for entity AssessmentVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity AssessmentVO");
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
            throw new Error(propertyName + " does not exist for entity AssessmentVO");
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
    public function get isClient_autoidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTypeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSubtypeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDateAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCompleteAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDataAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnDate():void
    {
        if (model_internal::_dateIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDate = null;
            model_internal::calculateDateIsValid();
        }
    }
    public function invalidateDependentOnData():void
    {
        if (model_internal::_dataIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfData = null;
            model_internal::calculateDataIsValid();
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
    public function get client_autoidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get typeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get subtypeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dateStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dateValidator() : StyleValidator
    {
        return model_internal::_dateValidator;
    }

    model_internal function set _dateIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dateIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dateIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dateIsValid():Boolean
    {
        if (!model_internal::_dateIsValidCacheInitialized)
        {
            model_internal::calculateDateIsValid();
        }

        return model_internal::_dateIsValid;
    }

    model_internal function calculateDateIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dateValidator.validate(model_internal::_instance.date)
        model_internal::_dateIsValid_der = (valRes.results == null);
        model_internal::_dateIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dateValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dateValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dateValidationFailureMessages():Array
    {
        if (model_internal::_dateValidationFailureMessages == null)
            model_internal::calculateDateIsValid();

        return _dateValidationFailureMessages;
    }

    model_internal function set dateValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dateValidationFailureMessages;

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
            model_internal::_dateValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get completeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dataStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dataValidator() : StyleValidator
    {
        return model_internal::_dataValidator;
    }

    model_internal function set _dataIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dataIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dataIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dataIsValid():Boolean
    {
        if (!model_internal::_dataIsValidCacheInitialized)
        {
            model_internal::calculateDataIsValid();
        }

        return model_internal::_dataIsValid;
    }

    model_internal function calculateDataIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dataValidator.validate(model_internal::_instance.data)
        model_internal::_dataIsValid_der = (valRes.results == null);
        model_internal::_dataIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dataValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dataValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dataValidationFailureMessages():Array
    {
        if (model_internal::_dataValidationFailureMessages == null)
            model_internal::calculateDataIsValid();

        return _dataValidationFailureMessages;
    }

    model_internal function set dataValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dataValidationFailureMessages;

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
            model_internal::_dataValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataValidationFailureMessages", oldValue, value));
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
            case("date"):
            {
                return dateValidationFailureMessages;
            }
            case("data"):
            {
                return dataValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
