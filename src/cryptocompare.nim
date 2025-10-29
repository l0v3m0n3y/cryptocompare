import asyncdispatch, httpclient, json

proc price_exchange*(fsym:string,tsym:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    let url = "https://min-api.cryptocompare.com/data/price?fsym=" & fsym & "&tsyms=" & tsym
    client.headers = newHttpHeaders({"Connection": "keep-alive", "Accept": "application/json, text/plain, */*","host": "min-api.cryptocompare.com", "referer": "https://www.cryptocompare.com/", "origin": "https://www.cryptocompare.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc top_coins*(page:int,tsym:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    let url = "https://min-api.cryptocompare.com/data/top/totaltoptiervol?ascending=true&assetClass=ALL&extraParams=https:%2F%2Fwww.cryptocompare.com&limit=10&page=" & $page & "&tsym=" & tsym
    client.headers = newHttpHeaders({"Connection": "keep-alive", "Accept": "application/json, text/plain, */*","host": "min-api.cryptocompare.com", "referer": "https://www.cryptocompare.com/", "origin": "https://www.cryptocompare.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
    
