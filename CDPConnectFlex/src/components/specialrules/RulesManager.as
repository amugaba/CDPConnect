package components.specialrules
{
	public class RulesManager
	{
		public var sbirtEnabled:Boolean = false;
		protected var sbirt:SbirtRules;
		
		public function RulesManager(global:CDPConnectFlex)
		{
			sbirt = new SbirtRules(global);
		}
		
		public function createClient():void
		{
			if(sbirtEnabled)
				sbirt.createClient();
		}
		
		public function episodeCreated():void
		{
			if(sbirtEnabled)
				sbirt.episodeCreated();
		}
		
		public function initAssessments():void
		{
			if(sbirtEnabled)
				sbirt.initAssessments();
		}
		
		public function loadAssessments():void
		{
			if(sbirtEnabled)
				sbirt.loadAssessments();
		}
		
		public function assessmentCreated():void
		{
			if(sbirtEnabled)
				sbirt.assessmentCreated();
		}
		
		public function assessmentChanged():void
		{
			if(sbirtEnabled)
				sbirt.assessmentChanged();
		}
		
		public function createDCI():void
		{
			if(sbirtEnabled)
				sbirt.createDCI();
		}
		
		public function dciCreated():void
		{
			if(sbirtEnabled)
				sbirt.dciCreated();
		}
	}
}