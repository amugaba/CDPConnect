package components.questions
{
	import components.skips.SkipPattern;
	
	import flash.display.InteractiveObject;
	import flash.globalization.NumberFormatter;
	
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.core.UIComponent;
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
		public static var nf:NumberFormatter = new NumberFormatter( "en-US" );
		
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
	}
}