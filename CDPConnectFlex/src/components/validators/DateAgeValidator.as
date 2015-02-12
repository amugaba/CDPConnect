package components.validators
{
	import mx.controls.DateField;
	import mx.validators.DateValidator;
	import mx.validators.ValidationResult;
	
	public class DateAgeValidator extends DateValidator
	{
		public static const DAY:String = "day";
		public static const MONTH:String = "month";
		public static const YEAR:String = "year";
		private var minUnit:String;
		public var min:int;
		private var maxUnit:String;
		public var max:int;
		private var results:Array;
		
		public function DateAgeValidator()
		{
			super();
		}
		
		public function set minType(type:String):void
		{
			if(type == DAY || type == MONTH || type == YEAR)
				minUnit = type;
		}
		public function set maxType(type:String):void
		{
			if(type == DAY || type == MONTH || type == YEAR)
				maxUnit = type;
		}
		
		protected override function doValidation(value:Object):Array
		{
			results = []; 
			results = super.doValidation(value); 
			if (results.length > 0)
				return results; 
			
			var inputValue:Date = DateField.stringToDate(String(value),"MM/DD/YYYY");
			var timeDiff:Number = new Date().time - inputValue.time; //difference in miliseconds
			var daysDiff:int = timeDiff / 1000 / 60 / 60 / 24;
			var monthsDiff:int = daysDiff / 30;
			var yearsDiff:int = daysDiff / 365;
			
			if(!isNaN(min) && minUnit != null)
			{
				if(minUnit == DAY && daysDiff < min)
					results.push(new ValidationResult(true,null, "tooYoung","Date must be at least "+min+" days old."));
				else if(minUnit == MONTH && monthsDiff < min)
					results.push(new ValidationResult(true,null, "tooYoung","Date must be at least "+min+" months old."))
				else if(minUnit == YEAR && yearsDiff < min)
					results.push(new ValidationResult(true,null, "tooYoung","Date must be at least "+min+" years old."))	
			}
			if(!isNaN(max) && maxUnit != null)
			{
				if(maxUnit == DAY && daysDiff >= max)
					results.push(new ValidationResult(true,null, "tooOld","Date must be less than "+max+" days old."));
				else if(maxUnit == MONTH && monthsDiff >= max)
					results.push(new ValidationResult(true,null, "tooOld","Date must be less than "+max+" months old."))
				else if(maxUnit == YEAR && yearsDiff >= max)
					results.push(new ValidationResult(true,null, "tooOld","Date must be less than "+max+" years old."))	
			}

			return results;
		}
	}
}