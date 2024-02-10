local module -- path to print module
local object = require(module).new()

--testing custom say
object:Say('Hello, world!')

object:SayMessage('man')
object:SayMessage('hello','man')
--testing hello and goodbye
object:SayHello()
object:SayGoodbye()
--testing with usernames
object:SayHello('roblick')
object:SayGoodbye('roblick')

