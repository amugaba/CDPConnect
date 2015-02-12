package components.skips
{
	import components.questions.QuestionClass;
	
	import flash.events.Event;
	
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	public class SkipPatternRange extends SkipPattern
	{
		public var skipMin:int;
		public var skipMax:int;
		public var skipInvert:Boolean;
		
		public function SkipPatternRange(sourceQuestion:QuestionClass, targetQuestions:Array, skipMin:int,skipMax:int,skipInvert:Boolean, skipEvents:Array)
		{
			super(sourceQuestion, targetQuestions, [], skipEvents);
			this.skipMin = skipMin;
			this.skipMax = skipMax;
			this.skipInvert = skipInvert;
		}
		
		public override function skipHandler(event:Event):void
		{
			for each(var val:Validator in sourceQuestion.validators)
			{
				var ev:ValidationResultEvent = val.validate();
				if(ev.results != null)
					return;
			}
			
			if(sourceQuestion.answer.length == 0 || (Number(sourceQuestion.answer) >= skipMin && Number(sourceQuestion.answer) <= skipMax) != skipInvert)
			{
				doSkip();
			}
			else
			{
				undoSkip();
			}
		}
	}
}