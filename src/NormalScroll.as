package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.setInterval;
	
	[SWF(width="1280",height="720",frameRate="30")]
	public class NormalScroll extends Sprite
	{
		private var tfY:int;
		
		private var pixelPerSecond:int = 3;
		
		private var tfPool:Vector.<TextField>;
		
		public function NormalScroll()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			tfPool = new Vector.<TextField>();
			
			setInterval(makeTF,50);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for each (var tf:TextField in tfPool)
			{
				tf.x -= pixelPerSecond;
				if (tf.x <= -tf.width)
				{
					removeChild(tf);
					tfPool.splice(0,1);
					trace(tfPool.length);
				}
			}
		}
		
		private function makeTF():void
		{
			var tf:TextField = new TextField();
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.defaultTextFormat = new TextFormat("黑体",25,0xff0000);			
			tf.text = "111111";
			tf.x = 1280;
			tf.y = tfY;
			tfY += 40;
			tfY %= 720;
			addChild(tf);
			tfPool.push(tf);
		}
	}
}