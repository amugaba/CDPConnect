package components.questions
{
	import flash.display.InteractiveObject;
	
	import mx.collections.ArrayList;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;
	import spark.events.IndexChangeEvent;
	
	public class QuestionTextRefusable extends QuestionText
	{
		public var refuseInput:DropDownList;
		
		public function QuestionTextRefusable(codeName:String, label:String, defaultValue:String, editable:Boolean=true)
		{
			super(codeName, label, defaultValue, editable);
			this.input.width = 50;
			refuseInput = new DropDownList();
			refuseInput.dataProvider = new ArrayList(["","Refused","Don't Know","Missing Data"]);
			this.addElement(refuseInput);
			refuseInput.width = 90;
			this.direction = "horizontal";
			refuseInput.addEventListener(IndexChangeEvent.CHANGE,refusedHandler);
		}
		
		public override function restoreDefault():void
		{
			input.text = defaultValue;
			refuseInput.selectedIndex = 0;
			input.enabled = true;
		}
		
		public function refusedHandler(event:IndexChangeEvent):void
		{
			if(refuseInput.selectedIndex > 0)
			{
				input.text = defaultValue;
				input.enabled = false;
			}
			else
			{
				if(!isSkipped)
					input.enabled = true;
			}
		}
		
		public override function enable():void
		{
			isSkipped = false;
			if(!inline)
				enabled = true;
			else
			{
				if(refuseInput.selectedIndex == 0)
					input.enabled = true;
				refuseInput.enabled = true;
			}
		}
		public override function disable():void
		{
			isSkipped = true;
			if(!inline)
				enabled = false;
			else
			{
				input.enabled = false;
				refuseInput.enabled = false;
			}
		}
	}
}