package components.questions
{
	import components.skips.SkipPattern;
	
	import flash.display.InteractiveObject;
	
	import mx.collections.ArrayList;
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
		
		public function QuestionClass(codeName:String,label:String)
		{
			super();
			this.label = label;
			this.codeName = codeName;
			this.multiline = true;
		}
		
		public function get answer():String
		{
			return "";
		}
		
		public function set answer(value:String):void
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
		
		public function doSkip():void
		{
			for each (var q:QuestionClass in skipQuestions)
			{
				q.restoreDefault();
				q.disable();
			}
		}
		public function undoSkip():void
		{
			for each (var q:QuestionClass in skipQuestions)
			{
				q.enable();
			}
		}
		
		public function enable():void
		{
			isSkipped = false;
		}
		public function disable():void
		{
			isSkipped = true;	
		}
	}
}