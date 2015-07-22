package components.questions
{
	import components.skips.SkipPattern;
	
	import flash.display.InteractiveObject;
	import flash.geom.Point;
	import flash.globalization.NumberFormatter;
	
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.controls.ToolTip;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.managers.ToolTipManager;
	import mx.validators.Validator;
	
	import spark.components.FormItem;
	import spark.components.Label;
	
	public class QuestionClass extends BetterFormItem
	{
		public var codeName:String;
		public var skipQuestions:Array = new Array();
		public var skipAnswers:Array = new Array();
		public var skipPatterns:Vector.<SkipPattern> = new Vector.<SkipPattern>();
		public var validators:Vector.<Validator> = new Vector.<Validator>();
		public var inline:Boolean = false;
		public var isSkipped:Boolean = false;
		public var answerType:Class = int;
		public var baseLabel:String;
		protected var helpText:String;
		protected var errorToolTip:ToolTip;
		public static var nf:NumberFormatter = new NumberFormatter( "en-US" );
		protected var global:CDPConnectFlex = FlexGlobals.topLevelApplication as CDPConnectFlex;
		
		public function QuestionClass(codeName:String, questionLabel:String = "")
		{
			super();
			baseLabel = questionLabel;
			this.label = questionLabel;
			this.codeName = codeName;
		}
		
		public function get answer():String
		{
			return "";
		}
		
		public function set answer(value:String):void
		{
			//to be overidden
		}
		
		public function get answerNumber():Number
		{
			return Number.NaN;
		}
		
		public function set answerNumber(value:Number):void
		{
			//to be overidden
		}
		
		public function get validator():Validator
		{
			return validators[0];
		}
		
		public function restoreDefault():void
		{
			//to be overridden
		}
		
		public function get inputControl():UIComponent
		{
			return null;
		}
		
		public function refreshSkips():void
		{
			for each(var s:SkipPattern in skipPatterns)
				s.skipHandler(null);
		}
		
		public function removeErrorMessage():void
		{
			//to be overridden
		}
		
		public function enable():void
		{
			isSkipped = false;
		}
		public function disable():void
		{
			isSkipped = true;	
		}
		
		public function reset():void
		{
			restoreDefault();
			enable();
			for each(var s:SkipPattern in skipPatterns)
			s.isSkipping = false;
			removeErrorMessage();
		}
		
		public function bindFunction(func:Function):void
		{
			//to be overwritten
		}
		
		public function addHelpText(txt:String):void
		{
			helpText = txt;
			enableLinking(helpPopup);
		}
		
		protected function helpPopup(evt:FlowElementMouseEvent):void {
			var linkEl:LinkElement = evt.flowElement as LinkElement;
			Alert.show(helpText);
			evt.stopImmediatePropagation();
			evt.preventDefault();
		}
		
		protected function showErrorsNow(val:String):void
		{
			//To be overridden
		}
		
		protected function showErrorDeferred(input:UIComponent):void
		{
			if(input.errorString != "" && errorToolTip == null)
			{
				//Get the location of the input in global coordinates
				var pt:Point = new Point(input.x, input.y);
				if(this == input.parent)
					pt = contentToGlobal(pt);
				else
					pt = (input.parent as QuestionClass).contentToGlobal(pt);
				
				//First try creating the tip to the right
				errorToolTip = ToolTipManager.createToolTip(input.errorString,pt.x+input.width,pt.y-2,"errorTipRight",input) as ToolTip;
				//errorToolTip.setStyle("styleName", "errorTip");
				
				//if the error runs off the screen display error above instead
				if(errorToolTip.width + pt.x + input.width > global.width)
				{ 
					ToolTipManager.destroyToolTip(errorToolTip);
					errorToolTip = ToolTipManager.createToolTip(input.errorString,pt.x,pt.y-34,"errorTipAbove",input) as ToolTip;
					//errorToolTip.setStyle("styleName", "errorTip");
				}
				
				//set padding to make error narrower
				errorToolTip.setStyle("paddingTop",1);
				errorToolTip.setStyle("paddingBottom",1);
			}
				//If the error message changed, change the text
				//but you also need to reevaluate maybe to see if it needs to be above or right
			else if(input.errorString != "" && errorToolTip.text != input.errorString)
			{
				errorToolTip.text = input.errorString;
			}
				//If there is no error, remove the tool tip
			else if(input.errorString == "" && errorToolTip != null)
			{
				ToolTipManager.destroyToolTip(errorToolTip);
				errorToolTip = null;
			}
		}
	}
}