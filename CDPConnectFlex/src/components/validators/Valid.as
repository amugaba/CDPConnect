package components.validators
{
	import components.questions.QuestionClass;
	import components.questions.QuestionList;
	import components.questions.QuestionText;
	import components.questions.QuestionTextRefusable;
	
	import mx.validators.NumberValidator;
	import mx.validators.StringValidator;
	import mx.validators.Validator;

	public class Valid
	{
		public function Valid()
		{
		}
		
		public static function addDateAgeValidator(q:QuestionClass, min:Number, minType:String, max:Number, maxType:String, required:Boolean = true):void
		{
			var dv1:DateAgeValidator = new DateAgeValidator();
			dv1.required = true;
			dv1.source = q.inputControl;
			dv1.property = "text";
			dv1.minType = minType;
			if(!isNaN(min))
				dv1.min = min;
			if(!isNaN(max))
				dv1.max = max;
			dv1.maxType = maxType;
			q.validators.push(dv1);
		}
		
		public static function addNumberValidator(q:QuestionClass, min:Number = Number.NaN, max:Number = Number.NaN, isInt:Boolean = false, required:Boolean = true):void
		{
			var nv:NumberValidator = new NumberValidator();
			nv.required = required;
			nv.source = q.inputControl;
			if(q is QuestionText || q is QuestionTextRefusable)
				nv.property = "text";
			else if(q is QuestionList)
				nv.property = "selectedIndex";
			if(!isNaN(min))
				nv.minValue = min;
			if(!isNaN(max))
				nv.maxValue = max;
			if(isInt)
				nv.domain = "int";
			q.validators.push(nv);
		}
		
		public static function addDropDownValidator(q:QuestionClass, validAnswers:Array):void
		{
			var dv:DropDownValidator = new DropDownValidator();
			dv.required = true;
			dv.source = q.inputControl;
			dv.property = "selectedItem";
			dv.validAnswers = validAnswers;
			q.validators.push(dv);
		}
		
		public static function addRequiredValidator(q:QuestionClass):void
		{
			var v:Validator = new Validator();
			v.required = true;
			v.source = q.inputControl;
			if(q is QuestionText || q is QuestionTextRefusable)
				v.property = "text";
			else if(q is QuestionList)
				v.property = "selectedItem";
			q.validators.push(v);
		}
		
		public static function addStringValidator(q:QuestionText, min:int = Number.NaN, max:int = Number.NaN, required:Boolean = true):void
		{
			var sv:StringValidator = new StringValidator();
			sv.required = required;
			sv.source = q.inputControl;
			sv.property = "text";
			if(!isNaN(min))
				sv.minLength = min;
			if(!isNaN(max))
				sv.maxLength = max;
			q.validators.push(sv);
		}
	}
}