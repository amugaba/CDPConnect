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
import valueObjects.GpraVO;

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
        valueObjects.GpraVO.initRemoteClassAliasSingleChild();
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
    private var _internal_gpras : ArrayCollection;
    private var _internal_intake : valueObjects.GpraVO;
    private var _internal_discharge : valueObjects.GpraVO;
    private var _internal_followup : valueObjects.GpraVO;
    private var _internal_firstname : String;
    private var _internal_lastname : String;
    private var _internal_dob : String;
    private var _internal_ssn : String;
    private var _internal_intakestaff : String;
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
    public function get gpras() : ArrayCollection
    {
        return _internal_gpras;
    }

    [Bindable(event="propertyChange")]
    public function get intake() : valueObjects.GpraVO
    {
        return _internal_intake;
    }

    [Bindable(event="propertyChange")]
    public function get discharge() : valueObjects.GpraVO
    {
        return _internal_discharge;
    }

    [Bindable(event="propertyChange")]
    public function get followup() : valueObjects.GpraVO
    {
        return _internal_followup;
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
    public function get intakestaff() : String
    {
        return _internal_intakestaff;
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

    public function set gpras(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_gpras;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_gpras = value;
            }
            else if (value is Array)
            {
                _internal_gpras = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_gpras = null;
            }
            else
            {
                throw new Error("value of gpras must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "gpras", oldValue, _internal_gpras));
        }
    }

    public function set intake(value:valueObjects.GpraVO) : void
    {
        var oldValue:valueObjects.GpraVO = _internal_intake;
        if (oldValue !== value)
        {
            _internal_intake = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intake", oldValue, _internal_intake));
        }
    }

    public function set discharge(value:valueObjects.GpraVO) : void
    {
        var oldValue:valueObjects.GpraVO = _internal_discharge;
        if (oldValue !== value)
        {
            _internal_discharge = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "discharge", oldValue, _internal_discharge));
        }
    }

    public function set followup(value:valueObjects.GpraVO) : void
    {
        var oldValue:valueObjects.GpraVO = _internal_followup;
        if (oldValue !== value)
        {
            _internal_followup = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "followup", oldValue, _internal_followup));
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

    public function set intakestaff(value:String) : void
    {
        var oldValue:String = _internal_intakestaff;
        if (oldValue !== value)
        {
            _internal_intakestaff = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "intakestaff", oldValue, _internal_intakestaff));
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
