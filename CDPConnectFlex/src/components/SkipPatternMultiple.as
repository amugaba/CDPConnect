package components
{
	public class SkipPatternMultiple extends SkipPattern
	{
		public var handler:SkipMultipleHandler;
		
		public function SkipPatternMultiple(handler:SkipMultipleHandler, sourceQuestion:QuestionClass, skipAnswers:Array, skipEvents:Array)
		{
			this.handler = handler;
			handler.addSkipPattern(this);
			super(sourceQuestion, handler.targetQuestions, skipAnswers, skipEvents);
		}
		
		public override function doSkip():void
		{
			if(!isSkipping)
			{
				isSkipping = true;
				handler.processSkip();
			}				
		}
		public override function undoSkip():void
		{
			if(isSkipping)
			{
				isSkipping = false;
				handler.processSkip();
			}
		}
	}
}