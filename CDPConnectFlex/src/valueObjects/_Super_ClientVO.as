/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ClientVO.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_ClientVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("ClientVO") == null)
            {
                flash.net.registerClassAlias("ClientVO", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("ClientVO", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _ClientVOEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_autoid : int;
    private var _internal_clientid : String;
    private var _internal_intakeExists : Boolean;
    private var _internal_intakeDate : String;
    private var _internal_dischargeExists : Boolean;
    private var _internal_followupExists : Boolean;
    private var _internal_followupSelected : Boolean;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ClientVO()
    {
        _model = new _ClientVOEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "clientid", model_internal::setterListenerClientid));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "intakeDate", model_internal::setterListenerIntakeDate));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get autoid() : int
    {
        return _internal_autoid;
    }

    [Bindable(event="propertyChange")]
    public function get clientid() : String
    {
        return _internal_clientid;
    }

    [Bindable(event="propertyChange")]
    public function get intakeExists() : Boolean
    {
        return _internal_intakeExists;
    }

    [Bindable(event="propertyChange")]
    public function get intakeDate() : String
    {
        return _internal_intakeDate;
    }

    [Bindable(event="propertyChange")]
    public function get dischargeExists() : Boolean
    {
        return _internal_dischargeExists;
    }

    [Bindable(event="propertyChange")]
    public function get followupExists() : Boolean
    {
        return _internal_followupExists;
    }

    [Bindable(event="propertyChange")]
    public function get followupSelected() : Boolean
    {
        return _internal_followupSelected;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set autoid(value:int) : void
    {
        var oldValue:int = _internal_autoid;
        if (oldValue !== value)
        {
            _internal_autoid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "autoid", oldValue, _internal_autoid));
        }
    }

    public function set clientid(value:String) : void
    {
        var oldValue:String = _internal_clientid;
        if (oldValue !== value)
        {
            _internal_clientid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "clientid", oldValue, _internal_clientid));
        }
    }

    public function set intakeExists(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_intakeExists;
        if (oldValue !== value)
        {
            _internal_intakeExists = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeExists", oldValue, _internal_intakeExists));
        }
    }

    public function set intakeDate(value:String) : void
    {
        var oldValue:String = _internal_intakeDate;
        if (oldValue !== value)
        {
            _internal_intakeDate = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakeDate", oldValue, _internal_intakeDate));
        }
    }

    public function set dischargeExists(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_dischargeExists;
        if (oldValue !== value)
        {
            _internal_dischargeExists = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dischargeExists", oldValue, _internal_dischargeExists));
        }
    }

    public function set followupExists(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_followupExists;
        if (oldValue !== value)
        {
            _internal_followupExists = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "followupExists", oldValue, _internal_followupExists));
        }
    }

    public function set followupSelected(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_followupSelected;
        if (oldValue !== value)
        {
            _internal_followupSelected = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "followupSelected", oldValue, _internal_followupSelected));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerClientid(value:flash.events.Event):void
    {
        _model.invalidateDependentOnClientid();
    }

    model_internal function setterListenerIntakeDate(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIntakeDate();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.clientidIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_clientidValidationFailureMessages);
        }
        if (!_model.intakeDateIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_intakeDateValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _ClientVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ClientVOEntityMetadata) : void
    {
        var oldValue : _ClientVOEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfClientid : Array = null;
    model_internal var _doValidationLastValOfClientid : String;

    model_internal function _doValidationForClientid(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfClientid != null && model_internal::_doValidationLastValOfClientid == value)
           return model_internal::_doValidationCacheOfClientid ;

        _model.model_internal::_clientidIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isClientidAvailable && _internal_clientid == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "clientid is required"));
        }

        model_internal::_doValidationCacheOfClientid = validationFailures;
        model_internal::_doValidationLastValOfClientid = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfIntakeDate : Array = null;
    model_internal var _doValidationLastValOfIntakeDate : String;

    model_internal function _doValidationForIntakeDate(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfIntakeDate != null && model_internal::_doValidationLastValOfIntakeDate == value)
           return model_internal::_doValidationCacheOfIntakeDate ;

        _model.model_internal::_intakeDateIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIntakeDateAvailable && _internal_intakeDate == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "intakeDate is required"));
        }

        model_internal::_doValidationCacheOfIntakeDate = validationFailures;
        model_internal::_doValidationLastValOfIntakeDate = value;

        return validationFailures;
    }
    

}

}
