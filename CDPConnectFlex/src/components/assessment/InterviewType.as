package components.assessment
{
	public class InterviewType
	{
		public static var INTAKE_NEG:int = 1;
		public static var INTAKE_BI:int = 2;
		public static var INTAKE_RT:int = 3;
		public static var DISCHARGE_ADMIN:int = 4;
		public static var DISCHARGE_BI:int = 5;
		public static var DISCHARGE_RT:int = 6;
		public static var FOLLOWUP_BI:int = 7;
		public static var FOLLOWUP_RT:int = 8;
		
		public function InterviewType()
		{
		}
		
		public static function isIntake(subtype:int):Boolean
		{
			return subtype == INTAKE_NEG || subtype == INTAKE_BI || subtype == INTAKE_RT;
		}
		
		public static function isDischarge(subtype:int):Boolean
		{
			return subtype == DISCHARGE_ADMIN || subtype == DISCHARGE_BI || subtype == DISCHARGE_RT;
		}
		
		public static function isFollowup(subtype:int):Boolean
		{
			return subtype == FOLLOWUP_BI || subtype == FOLLOWUP_RT;
		}
	}
}