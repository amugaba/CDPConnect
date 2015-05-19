package components.questions
{
	import mx.containers.FormItem;
	import mx.controls.Text;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	public class BetterFormItem extends FormItem {
		public var maxLabelWidth:Number = 200;
		public var text:Text;
		public var selectable:Boolean = false;
		public var multiline:Boolean = false;
		
		public function BetterFormItem() {
			super();
		}
		override protected function createChildren():void {
			super.createChildren();
			itemLabel.maxWidth = maxLabelWidth;
			if (multiline) {
				itemLabel.visible = false;
				text = new Text();
				text.tabEnabled = false;
				text.tabFocusEnabled = false;
				text.setStyle("textAlign", "right");
				text.setStyle("paddingTop",4);
				text.selectable = selectable;
				
				rawChildren.addChild(text);
			} else {
				itemLabel.selectable = selectable;
			}
		}
		override protected function commitProperties():void {
			super.commitProperties();
			if (multiline) {
				text.text = itemLabel.text;
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
	}
}