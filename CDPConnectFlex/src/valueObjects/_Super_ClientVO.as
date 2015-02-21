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
    private var _internal_firstname : String;
    private var _internal_lastname : String;
    private var _internal_dob : String;
    private var _internal_ssn : String;
    private var _internal_createddate : String;
    private var _internal_notes : String;

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
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "firstname", model_internal::setterListenerFirstname));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "lastname", model_internal::setterListenerLastname));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "dob", model_internal::setterListenerDob));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "ssn", model_internal::setterListenerSsn));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "createddate", model_internal::setterListenerCreateddate));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "notes", model_internal::setterListenerNotes));

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
    public function get firstname() : String
    {
        return _internal_firstname;
    }

    [Bindable(event="propertyChange")]
    public function get lastname() : String
    {
        return _internal_lastname;
    }

    [Bindable(event="propertyChange")]
    public function get dob() : String
    {
        return _internal_dob;
    }

    [Bindable(event="propertyChange")]
    public function get ssn() : String
    {
        return _internal_ssn;
    }

    [Bindable(event="propertyChange")]
    public function get createddate() : String
    {
        return _internal_createddate;
    }

    [Bindable(event="propertyChange")]
    public function get notes() : String
    {
        return _internal_notes;
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

    public function set firstname(value:String) : void
    {
        var oldValue:String = _internal_firstname;
        if (oldValue !== value)
        {
            _internal_firstname = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstname", oldValue, _internal_firstname));
        }
    }

    public function set lastname(value:String) : void
    {
        var oldValue:String = _internal_lastname;
        if (oldValue !== value)
        {
            _internal_lastname = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastname", oldValue, _internal_lastname));
        }
    }

    public function set dob(value:String) : void
    {
        var oldValue:String = _internal_dob;
        if (oldValue !== value)
        {
            _internal_dob = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dob", oldValue, _internal_dob));
        }
    }

    public function set ssn(value:String) : void
    {
        var oldValue:String = _internal_ssn;
        if (oldValue !== value)
        {
            _internal_ssn = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ssn", oldValue, _internal_ssn));
        }
    }

    public function set createddate(value:String) : void
    {
        var oldValue:String = _internal_createddate;
        if (oldValue !== value)
        {
            _internal_createddate = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "createddate", oldValue, _internal_createddate));
        }
    }

    public function set notes(value:String) : void
    {
        var oldValue:String = _internal_notes;
        if (oldValue !== value)
        {
            _internal_notes = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "notes", oldValue, _internal_notes));
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

    model_internal function setterListenerFirstname(value:flash.events.Event):void
    {
        _model.invalidateDependentOnFirstname();
    }

    model_internal function setterListenerLastname(value:flash.events.Event):void
    {
        _model.invalidateDependentOnLastname();
    }

    model_internal function setterListenerDob(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDob();
    }

    model_internal function setterListenerSsn(value:flash.events.Event):void
    {
        _model.invalidateDependentOnSsn();
    }

    model_internal function setterListenerCreateddate(value:flash.events.Event):void
    {
        _model.invalidateDependentOnCreateddate();
    }

    model_internal function setterListenerNotes(value:flash.events.Event):void
    {
        _model.invalidateDependentOnNotes();
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
        if (!_model.firstnameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_firstnameValidationFailureMessages);
        }
        if (!_model.lastnameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_lastnameValidationFailureMessages);
        }
        if (!_model.dobIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_dobValidationFailureMessages);
        }
        if (!_model.ssnIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_ssnValidationFailureMessages);
        }
        if (!_model.createddateIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_createddateValidationFailureMessages);
        }
        if (!_model.notesIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_notesValidationFailureMessages);
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
    
    model_internal var _doValidationCacheOfFirstname : Array = null;
    model_internal var _doValidationLastValOfFirstname : String;

    model_internal function _doValidationForFirstname(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfFirstname != null && model_internal::_doValidationLastValOfFirstname == value)
           return model_internal::_doValidationCacheOfFirstname ;

        _model.model_internal::_firstnameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isFirstnameAvailable && _internal_firstname == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "firstname is required"));
        }

        model_internal::_doValidationCacheOfFirstname = validationFailures;
        model_internal::_doValidationLastValOfFirstname = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfLastname : Array = null;
    model_internal var _doValidationLastValOfLastname : String;

    model_internal function _doValidationForLastname(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfLastname != null && model_internal::_doValidationLastValOfLastname == value)
           return model_internal::_doValidationCacheOfLastname ;

        _model.model_internal::_lastnameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLastnameAvailable && _internal_lastname == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "lastname is required"));
        }

        model_internal::_doValidationCacheOfLastname = validationFailures;
        model_internal::_doValidationLastValOfLastname = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfDob : Array = null;
    model_internal var _doValidationLastValOfDob : String;

    model_internal function _doValidationForDob(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfDob != null && model_internal::_doValidationLastValOfDob == value)
           return model_internal::_doValidationCacheOfDob ;

        _model.model_internal::_dobIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDobAvailable && _internal_dob == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "dob is required"));
        }

        model_internal::_doValidationCacheOfDob = validationFailures;
        model_internal::_doValidationLastValOfDob = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfSsn : Array = null;
    model_internal var _doValidationLastValOfSsn : String;

    model_internal function _doValidationForSsn(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfSsn != null && model_internal::_doValidationLastValOfSsn == value)
           return model_internal::_doValidationCacheOfSsn ;

        _model.model_internal::_ssnIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isSsnAvailable && _internal_ssn == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "ssn is required"));
        }

        model_internal::_doValidationCacheOfSsn = validationFailures;
        model_internal::_doValidationLastValOfSsn = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfCreateddate : Array = null;
    model_internal var _doValidationLastValOfCreateddate : String;

    model_internal function _doValidationForCreateddate(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfCreateddate != null && model_internal::_doValidationLastValOfCreateddate == value)
           return model_internal::_doValidationCacheOfCreateddate ;

        _model.model_internal::_createddateIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCreateddateAvailable && _internal_createddate == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "createddate is required"));
        }

        model_internal::_doValidationCacheOfCreateddate = validationFailures;
        model_internal::_doValidationLastValOfCreateddate = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfNotes : Array = null;
    model_internal var _doValidationLastValOfNotes : String;

    model_internal function _doValidationForNotes(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfNotes != null && model_internal::_doValidationLastValOfNotes == value)
           return model_internal::_doValidationCacheOfNotes ;

        _model.model_internal::_notesIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isNotesAvailable && _internal_notes == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "notes is required"));
        }

        model_internal::_doValidationCacheOfNotes = validationFailures;
        model_internal::_doValidationLastValOfNotes = value;

        return validationFailures;
    }
    

}

}
