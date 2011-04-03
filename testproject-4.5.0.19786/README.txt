This test project build has been tested on OS X with maven 3.0.3. This is the minimum version required by Flex mojos 4 beta 7. The command to perform the test was

mvn install -Dflex.flashPlayer.command=/Users/conrad/Downloads/FlashPlayerDebugger.app/Contents/MacOS/Flash\ Player\ Debugger

Where "flex.flashPlayer.command" is the (undocumented) replacement for "flashPLayer.command" and the flash player debugger location is where I had a 10.2 debug flash player installed.