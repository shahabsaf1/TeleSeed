local function run(msg, matches)
  local htp = http.request('http://api.magic-team.ir/alexas.php?site='..URL.escape(matches[1]))
  local data = json:decode(htp)
if not data then
return 'Not Found !'
else
local lrank = data.lrank
if not lrank then
lrank = '---'
end
local lc = data.lcountry
if not lc then
lc = '---'
end
local text = '<b>Globally rank</b> : <code>'..data.grank..'</code>\n<b>Country</b> : <code>'..lc..'</code>\n<b>Country rank</b> : <code>'..lrank..'</code>\n<b>Information</b> : <code>'..data.info..'</code>'
 local text = text..'\n\n <a href="http://telegram.me/beatbot_team">BeatBotTeam</a> '
send_api_msg(msg, get_receiver_api(msg), text, true, 'html')
end
end
return {
  usage = {'<code>!alexa [site]</code>\ncheck sites rank in alexa.com'},patterns = {
    "^[!/#]alexa (.*)$"
  },
  run = run 
} 
