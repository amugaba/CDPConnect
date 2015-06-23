package components.validators
{
	import mx.controls.DateField;
	import mx.validators.DateValidator;
	import mx.validators.ValidationResult;
	
	public class DateValidatorSimple extends DateValidator
	{
		private var results:Array;
		
		public function DateValidatorSimple()
		{
			super();
		}
		
		protected override function doValidation(value:Object):Array
		{
			results = []; 
			results = super.doValidation(value); 
			if (results.length > 0)
				results = [new ValidationResult(true,null, "invalid","MM/DD/YYYY")]; 

			return results;
		}
	}
}