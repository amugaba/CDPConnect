package components.questions
{
	import flash.display.InteractiveObject;
	
	import mx.collections.ArrayList;
	import mx.core.UIComponent;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;
	
	public class QuestionText extends QuestionClass
	{
		public var input:TextInput;
		public var defaultValue:String;
		
		public function QuestionText(codeName:String,label:String,defaultValue:String,editable:Boolean=true)
		{
			super(codeName,label);
			input = new TextInput();
			this.addElement(input);
			this.defaultValue = defaultValue;
			input.text = defaultValue;
			this.enabled = editable;
		}
		
		public override function get answer():String
		{
			return input.text;
		}
		public override function set answer(value:String):void
		{
			input.text = value;
		}
		
		public override function restoreDefault():void
		{
			input.text = defaultValue;
		}
		
		public override function get inputControl():UIComponent
		{
			return input;
		}
		
		public override function enable():void
		{
			isSkipped = false;
			if(!inline)
				enabled = true;
			else
				input.enabled = true;
		}
		public override function disable():void
		{
			isSkipped = true;
			if(!inline)
				enabled = false;
			else
				input.enabled = false;
			for each(var val:Validator in validators)
				val.dispatchEvent(new ValidationResultEvent(ValidationResultEvent.VALID));
		}
	}
}