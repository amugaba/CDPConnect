package components.skips
{
	import components.questions.QuestionClass;

	public class SkipMultipleHandler
	{
		public var targetQuestions:Array; //list of Questions that will be skipped
		public var skipPatterns:Array = new Array();
		public var isSkipping:Boolean; //whether total skip is active currently
		public var allMustSkip:Boolean = false; //all skip patterns must be skipping to trigger this
		
		public function SkipMultipleHandler(targetQuestions:Array)
		{
			this.targetQuestions = targetQuestions;
			isSkipping = false;
		}
		
		public function addSkipPattern(skipPattern:SkipPattern):void
		{
			skipPatterns.push(skipPattern);
		}
		
		public function processSkip():void
		{	
			var doSkip:Boolean;
			var pattern:SkipPattern;
			if(!allMustSkip)
			{
				//if any patterns are skipping, then isSkipping is true
				doSkip = false;			
				for each(pattern in skipPatterns)
				{
					if(pattern.isSkipping)
					{
						doSkip = true;
						break;
					}
				}
			}
			else
			{
				//if any patterns are not skipping, then isSkipping is false
				doSkip = true;			
				for each(pattern in skipPatterns)
				{
					if(!pattern.isSkipping)
					{
						doSkip = false;
						break;
					}
				}
			}
			
			//if the handler wasn't currently skipping, but it now is, do the skip
			if(!isSkipping && doSkip)
			{
				isSkipping = true;
				for each (var q:QuestionClass in targetQuestions)
				{
					q.restoreDefault();
					q.disable();
				}
			}
			else if(isSkipping && !doSkip)
			{
				isSkipping = false;
				for each (var r:QuestionClass in targetQuestions)
				{
					r.enable();
				}
			}
		}
	}
}