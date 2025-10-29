# cryptocompare
nim-lang library for cryptocompare.com
# Example
```nim
import asyncdispatch, cryptocompare,json
let data = waitFor price_exchange("ton", "USD")
echo data["USD"]
```
# Launch (your script)
```
nim c -d:ssl your_app.nim
```
