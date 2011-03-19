package
{
	import flash.display.Sprite;
	import flash.text.TextField;

	[SWF(width="800", height="450", frameRate="60", backgroundColor="0x999999")]
	public class SDKInstallTest extends Sprite
	{

		public function SDKInstallTest()
		{
			var tf:TextField = new TextField();
			tf.text = "Hello World";
			addChild(tf);
			tf.width=300;
			tf.height=20;
//			tf.textColor=0xffffff;
			tf.x=50;
			tf.y=50;
		}

	}
}