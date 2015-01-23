package components
{
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	public class DropDownValidator extends Validator
	{
		public var validAnswers:Array;
		private var results:Array;
		public var errorMessage:String = "The chosen answer is not valid.";
		
		public function DropDownValidator()
		{
			super();
		}
		
		protected override function doValidation(value:Object):Array
		{
			results = []; 
			results = super.doValidation(value); 
			if (results.length > 0)
				return results; 
			
			if(validAnswers.indexOf(String(value)) == -1)
			{
				results.push(new ValidationResult(true,null, "invalidChoice",errorMessage));	
			}

			return results;
		}
	}
}