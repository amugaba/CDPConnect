package components
{
	import flash.events.Event;
	
	import mx.events.ValidationResultEvent;

	public class SkipPattern
	{
		public var sourceQuestion:QuestionClass; //Question that triggers the skip
		public var targetQuestions:Array; //list of Questions that will be skipped
		public var skipAnswers:Array; //list of answers on source that cause skip
		public var skipEvents:Array; //source listens for these event type
		public var isSkipping:Boolean; //whether the pattern is currently skipping or not
		public var skipWhenInvalid:Boolean = false; //do skip even when answer is invalid
		public var inverse:Boolean = false;//skip when one of the given answers is NOT selected
		
		public function SkipPattern(sourceQuestion:QuestionClass,targetQuestions:Array,skipAnswers:Array,skipEvents:Array,inverse:Boolean = false)
		{
			this.sourceQuestion = sourceQuestion;
			this.targetQuestions = targetQuestions;
			this.skipAnswers = skipAnswers;
			this.skipEvents = skipEvents;
			this.inverse = inverse;
			for each(var s:String in skipEvents)
			{
				sourceQuestion.inputControl.addEventListener(s,skipHandler);
			}
			isSkipping = false;
			//invoke skip handler to see whether pattern should start as skipping or not
			skipHandler(null);
		}
		
		public function skipHandler(event:Event):void
		{
			if(sourceQuestion.validator != null)
			{
				var ev:ValidationResultEvent = sourceQuestion.validator.validate();
				if(ev.results != null && !skipWhenInvalid)
					return;
			}
				
			if((skipAnswers.indexOf(sourceQuestion.answer) >= 0) != inverse)
			{
				doSkip();
			}
			else
			{
				undoSkip();
			}
		}
		
		public function doSkip():void
		{
			if(!isSkipping)
			{
				isSkipping = true;
				for each (var q:QuestionClass in targetQuestions)
				{
					q.restoreDefault();
					q.disable();
				}
			}				
		}
		public function undoSkip():void
		{
			if(isSkipping)
			{
				isSkipping = false;
				for each (var q:QuestionClass in targetQuestions)
				{
					q.enable();
				}
			}
		}
	}
}