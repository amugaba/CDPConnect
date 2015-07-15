package components.questions
{
	import flash.display.InteractiveObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.controls.ToolTip;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ValidationResultEvent;
	import mx.managers.ToolTipManager;
	import mx.validators.Validator;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;
	
	public class QuestionText extends QuestionClass
	{
		public var input:TextInput;
		public var defaultValue:String;
		public var errorToolTip:ToolTip;
		
		public function QuestionText(codeName:String,label:String,defaultValue:String,editable:Boolean=true)
		{
			super(codeName,label);
			input = new TextInput();
			this.addElement(input);
			this.defaultValue = defaultValue;
			input.text = defaultValue;
			this.enabled = editable;
			BindingUtils.bindSetter(showErrorsNow, input, "errorString");
		}
		
		public override function get answer():String
		{
			return input.text;
		}
		public override function set answer(value:String):void
		{
			input.text = value;
		}
		
		public override function get answerNumber():Number
		{
			return nf.parseNumber(input.text);
		}
		
		public override function set answerNumber(value:Number):void
		{
			input.text = value.toString();
		}
		
		public override function restoreDefault():void
		{
			input.text = defaultValue;
		}
		
		public override function get inputControl():UIComponent
		{
			return input;
		}
		
		public override function removeErrorMessage():void
		{
			input.errorString = "";
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
		
		public override function bindFunction(func:Function):void
		{
			var watcherSetter:ChangeWatcher = BindingUtils.bindSetter(func, input, "text");
		}
		
		protected function showErrorsNow(val:String):void
		{
			input.callLater(showDeferred, [input]);
		}
		
		private function showDeferred(target:UIComponent):void
		{
			if(input.errorString != "" && errorToolTip == null)
			{
				var pt:Point = new Point(input.x, input.y);
				pt = contentToGlobal(pt);
				errorToolTip = ToolTipManager.createToolTip(input.errorString,pt.x+input.width,pt.y,null,input) as ToolTip;
				errorToolTip.setStyle("styleName", "errorTip");
				//if(errorToolTip.width + pt.x + input.width > global.width) display error above, below, or to the left
				if(errorToolTip.width + pt.x + input.width > global.width) //it's not pointing to the right
				{ //set padding too
					var newX:int = pt.x - errorToolTip.width;
					ToolTipManager.destroyToolTip(errorToolTip);
					errorToolTip = ToolTipManager.createToolTip(input.errorString,newX,pt.y,"errorTipAbove",input) as ToolTip;
					errorToolTip.setStyle("styleName", "errorTip");
				}
			}
			else if(input.errorString != "" && errorToolTip.text != input.errorString)
			{
				errorToolTip.text = input.errorString;
			}
			else if(input.errorString == "" && errorToolTip != null)
			{
				ToolTipManager.destroyToolTip(errorToolTip);
				errorToolTip = null;
			}
		}
	}
}