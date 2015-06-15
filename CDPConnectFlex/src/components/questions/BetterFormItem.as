package components.questions
{
	/**
	 * Version 2.0
	 * Text input is HTML rendered as RichText.
	 * By default, no linking in the text is enabled.
	 * If linkFunction is assigned a value, then that linking will be enabled
	 * and will execute that value/function.
	 * 
	 * */
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.FlowElement;
	import flashx.textLayout.elements.FlowGroupElement;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import mx.containers.FormItem;
	import mx.controls.Text;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	import spark.components.RichText;
	
	public class BetterFormItem extends FormItem {
		public var maxLabelWidth:Number = 200;
		public var text:RichText;
		public var selectable:Boolean = false;
		public var multiline:Boolean = false;
		public var linkEnabled:Boolean = false;
		public var linkFunction:Function = null;
		
		public function BetterFormItem() {
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
			itemLabel.maxWidth = maxLabelWidth;
			if (multiline) {
				itemLabel.visible = false;
				text = new RichText();
				text.tabEnabled = false;
				text.tabFocusEnabled = false;
				text.setStyle("textAlign", "right");
				text.setStyle("paddingTop",4);
				rawChildren.addChild(text);
			} else {
				itemLabel.selectable = selectable;
				itemLabel.tabEnabled = false;
				itemLabel.tabFocusEnabled = false;
			}
		}
		override protected function commitProperties():void {
			super.commitProperties();
			if (multiline) {
				text.textFlow = TextConverter.importToFlow(itemLabel.text, TextConverter.TEXT_FIELD_HTML_FORMAT);
				if(linkEnabled)
					addLinkClickHandler(linkFunction);
			}
			
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			if (multiline) {
				text.explicitWidth = itemLabel.width;
				text.validateNow();
				text.setActualSize(itemLabel.width, text.measuredHeight + 3);
				text.validateSize();
			}
		}
		override protected function measure():void {
			super.measure();
			if (multiline) {
				measuredMinHeight = Math.max(measuredMinHeight, text.measuredMinHeight);
				measuredHeight = Math.max(measuredHeight, text.measuredHeight);
			}
		}
		
		public function addLinkClickHandler(linkClickedHandler:Function):void {
			var link:LinkElement = findLinkElement(text.textFlow);
			link.addEventListener(FlowElementMouseEvent.CLICK, linkClickedHandler, false, 0, true);
		}
		
		private static function findLinkElement(group:FlowGroupElement):LinkElement {
			var childGroups:Array = [];
			// First check all the child elements of the current group,
			// Also save any children that are FlowGroupElement
			for (var i:int = 0; i < group.numChildren; i++) {
				var element:FlowElement = group.getChildAt(i);
				if (element is LinkElement) {
					return (element as LinkElement);
				} else if (element is FlowGroupElement) {
					childGroups.push(element);
				}
			}
			// Recursively check the child FlowGroupElements now
			for (i = 0; i < childGroups.length; i++) {
				var childGroup:FlowGroupElement = childGroups[i];
				var link:LinkElement = findLinkElement(childGroup);
				if (link != null) {
					return link;
				}
			}
			return null;
		}
		
		public function enableLinking(funcToRun:Function):void
		{
			linkEnabled = true;
			linkFunction = funcToRun;
		}
	}
}