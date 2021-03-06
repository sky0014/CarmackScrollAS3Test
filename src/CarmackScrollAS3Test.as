//试用卡马克卷轴算法
package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.setInterval;
	
	[SWF(width="1280",height="720",frameRate="60")]
	public class CarmackScrollAS3Test extends Sprite
	{
		
		private var tfY:int;
		
		private var show:BitmapData;
		
		private var memory:BitmapData;
		
		private var frame:Bitmap;
		
		private var pixelPerSecond:int = 3;
		
		public function CarmackScrollAS3Test()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			show = new BitmapData(1280,720);
			memory = new BitmapData(1280,720);
			frame = new Bitmap(show);
			addChild(frame);
			
			setInterval(makeTF,20);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			show.lock();
			show.scroll(-pixelPerSecond,0);			
			show.copyPixels(memory,new Rectangle(0,0,pixelPerSecond,720),new Point(1280-pixelPerSecond,0));
			show.unlock();
			memory.scroll(-pixelPerSecond,0);
		}
		
		private function makeTF():void
		{
			var tf:TextField = new TextField();
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.defaultTextFormat = new TextFormat("黑体",25,0xff0000);			
			tf.text = "1111111111111111";
			tf.x = 1280;
			tf.y = tfY;
			tfY += 40;
			tfY %= 720;
			memory.draw(tf,new Matrix(1,0,0,1,0,tfY));
		}
	}
}