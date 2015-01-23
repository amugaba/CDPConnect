package components
{
	import mx.events.ValidationResultEvent;
	import flash.events.Event;
	
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
			if(sourceQuestion.validator != null)
			{
				var ev:ValidationResultEvent = sourceQuestion.validator.validate();
				if(ev.results != null)
					return;
			}
			
			if((Number(sourceQuestion.answer) >= skipMin && Number(sourceQuestion.answer) <= skipMax) != skipInvert)
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