------------------------------------------------
-- This Source Was Developed By (AEKAN) @A3KON.--
--   This Is The ๐๐๐ ๐๐ฉ๐ข๐ฏ๐ฏ๐ฆ๐ญ @SoalfLove .   --
--                - AEK -                 --
--        -- https://t.me/SoalfLove --         --
------------------------------------------------ 
LibsNumber = 0
for v in io.popen('ls libs'):lines() do
if v:match(".lua$") then
LibsNumber = LibsNumber + 1
end
end
if LibsNumber ~= 0 then
URL = dofile("./libs/url.lua")
json = dofile("./libs/JSON.lua")
JSON = dofile("./libs/dkjson.lua")
serpent = dofile("./libs/serpent.lua")
DevAek = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
else 
redis = require('redis') 
URL = require('socket.url') 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
DevAek = redis.connect('127.0.0.1', 6379)
end
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
User = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
ServerAEK = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
Ip = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source AEK     --
local AutoSet = function() 
if not DevAek:get(ServerAEK.."IdAEK") then 
io.write('\27[1;35m\nุงูุงู ุงุฑุณู ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู โซ โค\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู\n27[0;39;49m') 
DevAek:set(ServerAEK.."IdAEK",DevId) 
else 
print('\27[1;31mโโโโโโปใโปโโโโโ\nูู ูุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู ุงุฑุณูู ูุฑู ุงุฎุฑู\nโโโโโโปใโปโโโโโ') 
end 
os.execute('lua AEK.lua') 
end 
if not DevAek:get(ServerAEK.."TokenAEK") then 
io.write('\27[1;35m\nุงูุงู ูู ุจุงุฑุณุงู ุชููู ุงูุจูุช โซ โค\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31mโโโโโโปใโปโโโโโ\nุงูุชููู ุบูุฑ ุตุญูุญ ุชุงูุฏ ููู ุซู ุงุฑุณูู\nโโโโโโปใโปโโโโโ') 
else 
io.write('\27[1;36mุชู ุญูุธ ุชููู ุงูุจูุช ุจูุฌุงุญ\n27[0;39;49m') 
DevAek:set(ServerAEK.."TokenAEK",TokenBot) 
end  
else 
print('\27[1;31mโโโโโโปใโปโโโโโ\nูู ูุชู ุญูุธ ุชููู ุงูุจูุช ุงุฑุณูู ูุฑู ุงุฎุฑู\nโโโโโโปใโปโโโโโ') 
end  
os.execute('lua AEK.lua') 
end
DevAek:set(DevAek:get(ServerAEK.."TokenAEK"):match("(%d+)")..'Aek:Update',true)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAek:get(ServerAEK.."IdAEK"),
TokenBot = DevAek:get(ServerAEK.."TokenAEK"),
AEK = DevAek:get(ServerAEK.."TokenAEK"):match("(%d+)"),
SudoIds = {DevAek:get(ServerAEK.."IdAEK")},
}
Create(Config, "./config.lua")
file = io.open("AEK.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/AEK
token="]]..DevAek:get(ServerAEK.."TokenAEK")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ"
echo "~ The tg File Was Not Found In The Bot Files"
echo "โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ"
exit 1
fi
if [ ! $token ]; then
echo "โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ"
echo "~ The Token Was Not Found In The config.lua File"
echo "โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ"
exit 1
fi
./tg -s ./AEK.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/AEK
while(true) do
rm -fr ../.telegram-cli
screen -S AEK -X kill
screen -S AEK ./AEK.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_AEK = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAek:del(ServerAEK.."IdAEK");DevAek:del(ServerAEK.."TokenAEK")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_AEK() 
print("\27[36m"..[[                                           
---------------------------------------------
โโโโโโโโโโโโโโโ 
โโโโโโโโโโโโโโโยฆ Source AEK By @A3KON
โโโโโโโโโโโโโโโ 
โโโโโโโโโโโโโโโยฆ Dev : @A3KON
โโโโโโโโโโโโโโโ 
โโโโโโโโโโโโโโโยฆ Source AEK By @A3KON
|-------------------------------------------|
|This Source Was Developed By (AEKAN) @A3KON.|
|  This Is The Source Channel @SoalfLove .   |
|               - AEK -                 |
---------------------------------------------
]]..'\27[m'.."\n\27[35mServer Information โฌ โค \nโโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35mโโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,152221858}
AEK = Config.AEK
TokenBot = Config.TokenBot
NameBot = (DevAek:get(AEK..'Aek:NameBot') or 'ุงููุงู')
--     Source AEK     --
FilesPrint = "\27[35m".."\nAll Source Files Started โฌ โค \nโโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."โโโโโโปใโปโโโโโ ใ โโโโโโปใโปโโโโโ\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source AEK     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source AEK     --
function dl_cb(arg, data)
end
--     Source AEK     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source AEK     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAek:sismember(AEK..'Aek:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(AEK) then  
var = true  
end  
return var  
end 
--     Source AEK     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAek:sismember(AEK..'Aek:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAek:sismember(AEK..'Aek:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAek:sismember(AEK..'Aek:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
------ VIP MEMBER ALL ------
function VipAll(msg) 
local Status = DevAek:sismember(AEK..'Aek:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
----   AekConstructor   ----
function AekConstructor(msg) 
local Status = DevAek:sismember(AEK..'Aek:AekConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAek:sismember(AEK..'Aek:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AekConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAek:sismember(AEK..'Aek:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AekConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAek:sismember(AEK..'Aek:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AekConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAek:sismember(AEK..'Aek:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AekConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAek:sismember(AEK..'Aek:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AekConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AEK     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAek:sismember(AEK..'Aek:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source AEK     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAek:sismember(AEK..'Aek:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source AEK     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAek:sismember(AEK..'Aek:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source AEK     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAek:sismember(AEK..'Aek:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source AEK     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source AEK     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source AEK     --
function AEKFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.AEK and msg then
FilesText = plugin.AEK(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source AEK     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source AEK     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= AEK:lower() then 
send(chat,msg.id_,"ใโ ุนุฐุฑุง ูุฐุง ุงูููู ููุณ ุชุงุจุน ููุฐุง ุงูุจูุช")   
return false 
end
send(chat,msg.id_,"ใโ ุฌุงุฑู ุฑูุน ุงูููู ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"ใโ ุนุฐุฑุง ุงูููู ููุณ ุจุตูุบุฉ โซ Json ูุฑุฌู ุฑูุน ุงูููู ุงูุตุญูุญ")
end
local info_file = io.open('./'..AEK..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAek:set(AEK.."Aek:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAek:sadd(AEK.."Aek:Groups",IdGps) 
DevAek:set(AEK.."Aek:Lock:Bots"..IdGps,"del") DevAek:hset(AEK.."Aek:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Aek:Lock:Links','Aek:Lock:Contact','Aek:Lock:Forwards','Aek:Lock:Videos','Aek:Lock:Gifs','Aek:Lock:EditMsgs','Aek:Lock:Stickers','Aek:Lock:Farsi','Aek:Lock:Spam','Aek:Lock:WebLinks','Aek:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAek:set(AEK..Lock..IdGps,true)
end
if v.AekConstructors then
for k,IdAekConstructors in pairs(v.AekConstructors) do
DevAek:sadd(AEK..'Aek:AekConstructor:'..IdGps,IdAekConstructors)  
print('ุชู ุฑูุน ููุดุฆูู ุงููุฌููุนุงุช')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAek:sadd(AEK..'Aek:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู ุงุณุงุณููู')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAek:sadd(AEK..'Aek:Constructor:'..IdGps,IdConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAek:sadd(AEK..'Aek:Managers:'..IdGps,IdManagers)  
print('ุชู ุฑูุน ( '..k..' ) ูุฏุฑุงุก')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAek:sadd(AEK..'Aek:Admins:'..IdGps,IdAdmins)  
print('ุชู ุฑูุน ( '..k..' ) ุงุฏูููู')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAek:sadd(AEK..'Aek:VipMem:'..IdGps,IdVips)  
print('ุชู ุฑูุน ( '..k..' ) ูููุฒูู')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAek:set(AEK.."Aek:Groups:Links"..IdGps,v.LinkGroups)   
print('( ุชู ูุถุน ุฑูุงุจุท ุงููุฌููุนุงุช )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAek:set(AEK.."Aek:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( ุชู ูุถุน ุชุฑุญูุจ ุงููุฌููุนุงุช )')
end
end
end
send(chat,msg.id_,"ใโ ุชู ุฑูุน ุงููุณุฎู ุจูุฌุงุญ \nใโ ุชู ุชูุนูู ุฌููุน ุงููุฌููุนุงุช \nใโ ุชู ุงุณุชุฑุฌุงุน ูุดุฑููู ุงููุฌููุนุงุช \nใโ ุชู ุงุณุชุฑุฌุงุน ุงูุงูุฑ ุงูููู ูุงููุชุญ ูู ุฌููุน ูุฌููุนุงุช ุงูุจูุช ")
end
--     Source AEK     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source AEK     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     Source AEK     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source AEK     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source AEK     --
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source AEK     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source AEK     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source AEK     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source AEK     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source AEK     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source AEK     --
function Dev_Aek(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source AEK     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source AEK     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source AEK     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source AEK     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source AEK     --
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source AEK     --
local AekRank = function(msg) if SudoId(msg.sender_user_id_) then AEKTEAM  = "ุงููุทูุฑ" elseif SecondSudo(msg) then AEKTEAM = "ุงููุทูุฑ" elseif SudoBot(msg) then AEKTEAM = "ุงููุทูุฑ" elseif ManagerAll(msg) then AEKTEAM = "ุงููุฏูุฑ" elseif AdminAll(msg) then AEKTEAM = "ุงูุงุฏูู" elseif AekConstructor(msg) then AEKTEAM = "ุงูููุดุฆ" elseif BasicConstructor(msg) then AEKTEAM = "ุงูููุดุฆ" elseif Constructor(msg) then AEKTEAM = "ุงูููุดุฆ" elseif Manager(msg) then AEKTEAM = "ุงููุฏูุฑ" elseif Admin(msg) then AEKTEAM = "ุงูุงุฏูู" else AEKTEAM = "ุงูุนุถู" end return AEKTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(152221858) then AEKTEAM = 'ูุจุฑูุฌ ุงูุณูุฑุณ' elseif tonumber(user_id) == tonumber(AEK) then AEKTEAM = 'ุงูุจูุช' elseif SudoId(user_id) then AEKTEAM = 'ุงููุทูุฑ ุงูุงุณุงุณู' elseif DevAek:sismember(AEK..'Aek:SecondSudo:', user_id) then AEKTEAM = 'ุงููุทูุฑ ุงูุซุงููู' elseif DevAek:sismember(AEK..'Aek:SudoBot:', user_id) then AEKTEAM = DevAek:get(AEK.."Aek:SudoBot:Rd"..chat_id) or 'ุงููุทูุฑ' elseif DevAek:sismember(AEK..'Aek:ManagerAll:', user_id) then AEKTEAM = DevAek:get(AEK.."Aek:Managers:Rd"..chat_id) or 'ุงููุฏูุฑ ุงูุนุงู' elseif DevAek:sismember(AEK..'Aek:AdminAll:', user_id) then AEKTEAM = DevAek:get(AEK.."Aek:Admins:Rd"..chat_id) or 'ุงูุงุฏูู ุงูุนุงู' elseif DevAek:sismember(AEK..'Aek:VipAll:', user_id) then AEKTEAM = DevAek:get(AEK.."Aek:VipMem:Rd"..chat_id) or 'ุงููููุฒ ุงูุนุงู' elseif DevAek:sismember(AEK..'Aek:AekConstructor:'..chat_id, user_id) then AEKTEAM = 'ููุดุฆ ุงููุฌููุนู' elseif DevAek:sismember(AEK..'Aek:BasicConstructor:'..chat_id, user_id) then AEKTEAM = DevAek:get(AEK.."Aek:BasicConstructor:Rd"..chat_id) or 'ุงูููุดุฆ ุงูุงุณุงุณู' elseif DevAek:sismember(AEK..'Aek:Constructor:'..chat_id, user_id) then AEKTEAM = DevAek:get(AEK.."Aek:Constructor:Rd"..chat_id) or 'ุงูููุดุฆ' elseif DevAek:sismember(AEK..'Aek:Managers:'..chat_id, user_id) then AEKTEAM = DevAek:get(AEK.."Aek:Managers:Rd"..chat_id) or 'ุงููุฏูุฑ' elseif DevAek:sismember(AEK..'Aek:Admins:'..chat_id, user_id) then AEKTEAM = DevAek:get(AEK.."Aek:Admins:Rd"..chat_id) or 'ุงูุงุฏูู' elseif DevAek:sismember(AEK..'Aek:VipMem:'..chat_id, user_id) then  AEKTEAM = DevAek:get(AEK.."Aek:VipMem:Rd"..chat_id) or 'ุงููููุฒ' elseif DevAek:sismember(AEK..'Aek:Cleaner:'..chat_id, user_id) then  AEKTEAM = DevAek:get(AEK.."Aek:Cleaner:Rd"..chat_id) or 'ุงูููุธู' else AEKTEAM = DevAek:get(AEK.."Aek:mem:Rd"..chat_id) or 'ุงูุนุถู' end return AEKTEAM end
--     Source AEK     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(AEK) then  
var = true  
elseif DevAek:sismember(AEK..'Aek:SecondSudo:', user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:SudoBot:', user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:ManagerAll:', user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:AdminAll:', user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:VipAll:', user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:AekConstructor:'..chat_id, user_id) then
var = true
elseif DevAek:sismember(AEK..'Aek:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAek:sismember(AEK..'Aek:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:Managers:'..chat_id, user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:Admins:'..chat_id, user_id) then
var = true  
elseif DevAek:sismember(AEK..'Aek:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AekDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAek:sismember(AEK..'Aek:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAek:sismember(AEK..'Aek:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAek:sismember(AEK..'Aek:AekConstructor:'..chat_id, user_id) then
var = 'Aekconstructor'
elseif DevAek:sismember(AEK..'Aek:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAek:sismember(AEK..'Aek:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAek:sismember(AEK..'Aek:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source AEK     --
local function Filters(msg, value)
local Aek = (AEK..'Aek:Filters:'..msg.chat_id_)
if Aek then
local names = DevAek:hkeys(Aek)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "SoalfLove")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุนุฐุฑุง ุนุฒูุฒู โซ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงูุนุถู โซ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุจูุงุณุทุฉ โซ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงูุญุณุงุจ ูุญุฐูู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู", 1, 'md')
end
end,nil)   
end
--     Source AEK     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "ุงููุงูู"
elseif GetInfo.result.status == "administrator" then 
Status = "ูุดุฑู"
else
Status = false
end
if GetInfo.result.custom_title then 
Aek = GetInfo.result.custom_title
else 
Aek = Status
end
end
return Aek
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'ใโ ูุงูู ุงููุฌููุนู')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'ใโ ูุฌุฑุฏ ุนุถู ููุง')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'ใโ ุงูุดุฎุต ุบูุฑ ููุฌูุฏ ููุง')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
send(msg.chat_id_,msg.id_,'ใโ ุตูุงุญูุงุช '..GetCustomTitle(user_id,msg.chat_id_)..' ูู โซ โค\nโโโโโโปใโปโโโโโ\nใโ ุญุฐู ุงูุฑุณุงุฆู โซ '..DEL..'\nใโ ุฏุนูุฉ ุงููุณุชุฎุฏููู โซ '..INV..'\nใโ ุญุธุฑ ุงููุณุชุฎุฏููู โซ '..BAN..'\nใโ ุชุซุจูุช ุงูุฑุณุงุฆู โซ '..PIN..'\nใโ ุชุบููุฑ ุงููุนูููุงุช โซ '..EDT..'\nใโ ุงุถุงูุฉ ูุดุฑููู โซ '..VIP..'\nโโโโโโปใโปโโโโโ')
end
end
end
--     Source AEK     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Aek = GetInfo.result.bio
else 
Aek = "ูุง ููุฌุฏ"
end
end
return Aek
end
--     Source AEK     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'ุฌุฏุง ุถุนูู' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ุถุนูู' 
elseif tonumber(msgs) < 500 then 
MsgText = 'ุบูุฑ ูุชูุงุนู' 
elseif tonumber(msgs) < 750 then 
MsgText = 'ูุชูุณุท' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'ูุชูุงุนู' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'ููุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ููู ุงูุชูุงุนู'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'ุงุณุทูุฑุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'ูุชูุงุนู ูุงุฑ' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'ูุฌุฏุญ ุฌุฏุญ' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'ุฎูุงูู' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'ุฑุจ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'ูุงูุฑ ุจุงูุชูุงุนู' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "ูุนูู ูุฑุจู" 
end 
return MsgText
end
--     Source AEK     --
function Aekmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAek:get(AEK..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source AEK     --
function ChCheck(msg)
local var = true 
if DevAek:get(AEK.."DevAek2") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAek:get(AEK..'DevAek2')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAek:get(AEK..'Aek:textch:user') then
local textchuser = DevAek:get(AEK..'Aek:textch:user')
send(msg.chat_id_,msg.id_,'['..textchuser..']')
else
send(msg.chat_id_,msg.id_,"ใโ ุนููู ุงูุงุดุชุฑุงู ูู ููุงุฉ ุงูุจูุช \nใโ ููุงุฉ ุงูุจูุช โซ ["..DevAek:get(AEK..'DevAek3').."]")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAek:get(AEK..'yes'..data.sender_user_id_) == 'delyes' then
DevAek:del(AEK..'yes'..data.sender_user_id_, 'delyes')
DevAek:del(AEK..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "ใโ ูุง ุงุณุชุทูุน ุทุฑุฏ โซ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "ใโ ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุทุฑุฏู ูู ุงููุฌููุนู") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAek:get(AEK..'no'..data.sender_user_id_) == 'delno' then
DevAek:del(AEK..'yes'..data.sender_user_id_, 'delyes')
DevAek:del(AEK..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงุทุฑุฏูู") 
end
--     Source AEK     --
if DataText == '/yesdel' and DevAek:get(AEK..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAek:del(AEK..'yesdel'..data.sender_user_id_, 'delyes')
DevAek:del(AEK..'nodel'..data.sender_user_id_, 'delno')
if DevAek:sismember(AEK..'Aek:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAek:sismember(AEK..'Aek:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'ุงููุฏุฑุงุก โข ' else Managers = '' end
if DevAek:sismember(AEK..'Aek:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAek:sismember(AEK..'Aek:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAek:sismember(AEK..'Aek:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = '' end
if DevAek:sismember(AEK..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'ุงููุทุงูู โข ' else donky = '' end
if DevAek:sismember(AEK..'Aek:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAek:sismember(AEK..'Aek:Managers:'..data.chat_id_, data.sender_user_id_) or DevAek:sismember(AEK..'Aek:Admins:'..data.chat_id_, data.sender_user_id_) or DevAek:sismember(AEK..'Aek:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAek:sismember(AEK..'Aek:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAek:sismember(AEK..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAek:srem(AEK..'Aek:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..data.chat_id_,data.sender_user_id_)
DevAek:srem(AEK..'Aek:Admins:'..data.chat_id_,data.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAek:srem(AEK..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุชูุฒููู ูู โซ โค\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'ุงูุนุถู' then
EditMsg(Chat_Id2, Msg_Id2, "ใโ ููุณ ูุฏูู ุฑุชุจู ูู ุงูุจูุช") 
else 
EditMsg(Chat_Id2, Msg_Id2, "ใโ ูุง ุงุณุชุทูุน ุชูุฒูู โซ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAek:get(AEK.."Aek:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู") 
DevAek:del(AEK.."Aek:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAek:get(AEK.."Aek:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุงููุทูุฑ ุงูุฌุฏูุฏ โซ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nใโ ุชู ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู ุจูุฌุงุญ") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"ใโ ุจูุงุณุทุฉ โซ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nใโ ููุฏ ุงุตุจุญุช ุงูุช ูุทูุฑ ูุฐุง ุงูุจูุช",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
AEK = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAek:del(AEK.."Aek:NewDev"..data.sender_user_id_)
dofile('AEK.lua') 
end
end
if DataText == '/nodel' and DevAek:get(AEK..'nodel'..data.sender_user_id_) == 'delno' then
DevAek:del(AEK..'yesdel'..data.sender_user_id_, 'delyes')
DevAek:del(AEK..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุงูุบุงุก ุงูุฑ ูุฒููู") 
end
if DataText == '/YesRolet' and DevAek:get(AEK.."Aek:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAek:smembers(AEK..'Aek:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAek:incrby(AEK..'Aek:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAek:del(AEK..'Aek:ListRolet'..data.chat_id_) 
DevAek:del(AEK.."Aek:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "ใโ *ุตุงุญุจ ุงูุญุธ* โซ ["..UserName.."]\nใโ *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*")
end
if DataText == '/NoRolet' then
DevAek:del(AEK..'Aek:ListRolet'..data.chat_id_) 
DevAek:del(AEK.."Aek:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAek:del(AEK.."Aek:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "ใโ ุชู ุงูุบุงุก ุงููุนุจู ูุงุนุงุฏุฉ ุงููุนุจ ุงุฑุณู ุงูุงูุนุงุจ") 
end
if DataText == '/ListRolet' then
local List = DevAek:smembers(AEK..'Aek:ListRolet'..data.chat_id_) 
local Text = 'ใโ ูุงุฆูุฉ ุงููุงุนุจูู โซ โค\nโโโโโโปใโปโโโโโ\n' 
local Textt = 'โโโโโโปใโปโโโโโ\nใโ ุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/YesRolet"},{text="ูุง",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevAek:sismember(AEK..'Aek:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAek:srem(AEK..'Aek:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("ใโ ุชู ุงูุบุงุก ุชูููุฏู ูู ุงููุฌููุนู ุจูุฌุงุญ .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("ใโ ุนุฐุฑุง ูุฐุง ุงูุงูุฑ ููุดู ุงูุฑูุจูุช ูููุณ ูู .")..'&show_alert=true')
end 
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevAek:get(AEK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAek:get(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAek:del(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAek:del(AEK.."Set:Cmd:Group:New"..msg.chat_id_)
DevAek:srem(AEK.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุงูุงูุฑ ูู ุงููุฌููุนู", 1, 'html')  
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุงููุฌุฏ ุงูุฑ ุจูุฐุง ุงูุงุณู", 1, 'html')
end
DevAek:del(AEK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAek:get(AEK..'Aek:NameBot') or "ุงููุงู")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAek:get(AEK..'Aek:NameBot') or "ุงููุงู")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAek:get(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAek:get(AEK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAek:set(AEK.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ุงูุงูุฑ ุงูุฌุฏูุฏ", 1, 'html')
DevAek:del(AEK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAek:set(AEK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAek:get(AEK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAek:get(AEK.."Set:Cmd:Group:New"..msg.chat_id_)
DevAek:set(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAek:sadd(AEK.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงูุงูุฑ", 1, 'html')
DevAek:del(AEK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevAek:smembers(AEK.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "ใโ ูุงุฆูุฉ ุงูุงูุงูุฑ ุงููุถุงูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
Cmds = DevAek:get(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") โข {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "ใโ ูุงุชูุฌุฏ ุงูุงูุฑ ูุถุงูู ูู ุงููุฌููุนู"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู" or text == "ุญุฐู ุงูุงูุงูุฑ" or text == "ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevAek:smembers(AEK.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAek:del(AEK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAek:del(AEK.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู ูู ุงููุฌููุนู", 1, 'html')
end
if text == "ุงุถู ุงูุฑ" or text == "ุงุถุงูุฉ ุงูุฑ" or text == "ุงุถุงูู ุงูุฑ" and ChCheck(msg) then
DevAek:set(AEK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ุงูุงูุฑ ุงููุฏูู", 1, 'html')
return false
end
if text == "ุญุฐู ุงูุฑ" or text == "ูุณุญ ุงูุฑ" and ChCheck(msg) then 
DevAek:set(AEK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ุงูุงูุฑ ุงูุฐู ููุช ุจุงุถุงูุชู ูุฏููุง", 1, 'html')
return false
end
end
--     Source AEK     --
if text == "ุงูุตูุงุญูุงุช" or text == "ุตูุงุญูุงุช" and ChCheck(msg) then 
local List = DevAek:smembers(AEK.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุงุชูุฌุฏ ุตูุงุญูุงุช ูุถุงูู", 1, 'html')
return false
end
t = "ใโ ูุงุฆูุฉ ุงูุตูุงุญูุงุช ุงููุถุงูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
var = DevAek:get(AEK.."Comd:New:rt:Aek:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." โข ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "ุญุฐู ุงูุตูุงุญูุงุช" and ChCheck(msg) or text == "ูุณุญ ุงูุตูุงุญูุงุช" and ChCheck(msg) then
local List = DevAek:smembers(AEK.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAek:del(AEK.."Comd:New:rt:Aek:"..v..msg.chat_id_)
DevAek:del(AEK.."Coomds"..msg.chat_id_)
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุงูุตูุงุญูุงุช ุงููุถุงูู", 1, 'html')
end
end
if text and text:match("^ุงุถู ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุงุถู ุตูุงุญูู (.*)$")
DevAek:set(AEK.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAek:sadd(AEK.."Coomds"..msg.chat_id_,ComdNew)  
DevAek:setex(AEK.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ููุน ุงูุตูุงุญูู \n{ ุนุถู โข ูููุฒ  โข ุงุฏูู  โข ูุฏูุฑ }\nใโ ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, 'html')
end
if text and text:match("^ุญุฐู ุตูุงุญูู (.*)$") and ChCheck(msg) or text and text:match("^ูุณุญ ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุญุฐู ุตูุงุญูู (.*)$") or text:match("^ูุณุญ ุตูุงุญูู (.*)$")
DevAek:del(AEK.."Comd:New:rt:Aek:"..ComdNew..msg.chat_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุงูุตูุงุญูู", 1, 'html')
end
if DevAek:get(AEK.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุงูุฑ", 1, 'html')
DevAek:del(AEK.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "ูุฏูุฑ" then
if not Constructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ  โข ุงุฏูู )\nใโ ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ุงุฏูู" then
if not Manager(msg) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ )\nใโ ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ูููุฒ" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู )\nใโ ุงุฑุณุงู ููุน ุงูุตูุงุญูู ูุฑู ุงุฎุฑู", 1, 'html')
return false
end
end
if text == "ูุฏูุฑ" or text == "ุงุฏูู" or text == "ูููุฒ" or text == "ุนุถู" then
local textn = DevAek:get(AEK.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAek:set(AEK.."Comd:New:rt:Aek:"..textn..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุถุงูุฉ ุงูุตูุงุญูู", 1, 'html')
DevAek:del(AEK.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("ุฑูุน (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_AEEKAN = text:match("ุฑูุน (.*)")
if DevAek:sismember(AEK.."Coomds"..msg.chat_id_,DEV_AEEKAN) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAek = DevAek:get(AEK.."Comd:New:rt:Aek:"..DEV_AEEKAN..msg.chat_id_)
if mrAek == "ูููุฒ" and VipMem(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_AEEKAN) 
DevAek:sadd(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrAek == "ุงุฏูู" and Admin(msg) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_AEEKAN)
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrAek == "ูุฏูุฑ" and Manager(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_AEEKAN)  
DevAek:sadd(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrAek == "ุนุถู" then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("ุชูุฒูู (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_AEEKAN = text:match("ุชูุฒูู (.*)")
if DevAek:sismember(AEK.."Coomds"..msg.chat_id_,DEV_AEEKAN) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAek = DevAek:get(AEK.."Comd:New:rt:Aek:"..DEV_AEEKAN..msg.chat_id_)
if mrAek == "ูููุฒ" and VipMem(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAek == "ุงุฏูู" and Admin(msg) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAek == "ูุฏูุฑ" and Manager(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAek == "ุนุถู" then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..DEV_AEEKAN..' โฉ ุจูุฌุงุญ', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^ุฑูุน (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุฑูุน) (.*) @(.*)$")}
if DevAek:sismember(AEK.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAek = DevAek:get(AEK.."Comd:New:rt:Aek:"..text1[2]..msg.chat_id_)
if mrAek == "ูููุฒ" and VipMem(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:sadd(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAek == "ุงุฏูู" and Admin(msg) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAek == "ูุฏูุฑ" and Manager(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:sadd(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:set(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAek == "ุนุถู" then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุฑูุนู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^ุชูุฒูู (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุชูุฒูู) (.*) @(.*)$")}
if DevAek:sismember(AEK.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAek = DevAek:get(AEK.."Comd:New:rt:Aek:"..text1[2]..msg.chat_id_)
if mrAek == "ูููุฒ" and VipMem(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAek == "ุงุฏูู" and Admin(msg) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAek == "ูุฏูุฑ" and Manager(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:del(AEK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAek == "ุนุถู" then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู โซ โจ ['..result.title_..'](t.me/'..(text1[3] or 'SoalfLove')..')'..' โฉ\nใโ ุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุจูุฌุงุญ', 1, 'md')
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source AEK     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAek:incr(AEK..'Aek:UsersMsgs'..AEK..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAek:incr(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAek:incr(AEK..'Aek:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAek:sismember(AEK.."Aek:Users",msg.chat_id_) then
DevAek:sadd(AEK.."Aek:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source AEK     --
if ChatType == 'pv' then 
if text == '/start' or text == 'ุฑุฌูุน ุ๐โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'ใโ ูุฑุญุจุง ุนุฒูุฒู ุงููุทูุฑ \nใโ ุงูุช ุงููุทูุฑ ุงูุงุณุงุณู ููุง \nใโ ุงููู ุงุฒุฑุงุฑ ุณูุฑุณ ุงููุงู \nใโ ุชุณุชุทูุน ุงูุชุญูู ุจูู ุงูุงูุงูุฑ ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {
{'ูุถุน ุงุณู ุงูุจูุช','โซ ุชุญุฏูุซ ใ','ูุถุน ูููุดู ุงููุทูุฑ'},
{'โซ ุงููุทูุฑูู ใ','โซ ุงูุงุญุตุงุฆูุงุช ใ'},
{'โซ ุงููุฌููุนุงุช ใ','ุฑูุงุจุท ุงููุฑูุจุงุช','โซ ุงููุดุชุฑููู ใ'},
{'โซ ุชุนุทูู ุงูุชูุงุตู ใ','โซ ุชูุนูู ุงูุชูุงุตู ใ'},
{'ุชูุธูู ุงููุฑูุจุงุช','โซ ูุงุฆูู ุงูุนุงู ใ','ุชูุธูู ุงููุดุชุฑููู'},
{'โซ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู ใ'},
{'ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช','ุชูุนูู ุชุฑุญูุจ ุงูุจูุช'},
{'โซ ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ ใ'},
{'โซ ุชุนุทูู ุงููุบุงุฏุฑู ใ','โซ ุชูุนูู ุงููุบุงุฏุฑู ใ'},
{'โซ ุชุนุทูู ุงูุงุฐุงุนู ใ','โซ ุชูุนูู ุงูุงุฐุงุนู ใ'},
{'โซ ุงุฐุงุนู ุจุงูุชุซุจูุช ใ'},
{'โซ ุงุฐุงุนู ุนุงู ใ','โซ ุงุฐุงุนู ุฎุงุต ใ'},
{'โซ ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู ใ','โซ ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู ใ'},
{'~ ุชุนููู ููุงูุด ุงูุงูุงูุฑ ~'},
{'ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู','ุชูุนูู ุงูุจูุช ุงูุฎุฏูู'},
{'ุฌูุจ ูุณุฎู ุงูุณูุฑุณ','ุชุญุฏูุซ ุงูุณูุฑุณ','ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช'},
{'โซ ุญุฐู ุฑุฏ ุนุงู ใ','โซ ุงูุฑุฏูุฏ ุงูุนุงู ใ','โซ ุงุถู ุฑุฏ ุนุงู ใ'},
{'โซ ุญุฐู ุฑุฏ ุงูุฎุงุต ใ','โซ ุชุนููู ุฑุฏ ุงูุฎุงุต ใ'},
{'ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู','ููุงุฉ ุงูุงุดุชุฑุงู','ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู'},
{'ุญุฐู ูููุดู ุงูุงุดุชุฑุงู','ูููุดู ุงูุงุดุชุฑุงู','ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ ุชุนููู ููุงูุด ุงูุงูุงูุฑ ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'ใโ ุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nใโ ุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุชุนุฏูู ูุชุบููุฑ ููุงูุด ุณูุฑุณ ุงููุงู ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {
{'ุญุฐู ูููุดุฉ ุงูุงูุฏู','ุชุนููู ูููุดุฉ ุงูุงูุฏู'},
{'ุชุนููู ุงูุฑ ุงูุงูุงูุฑ'},
{'ุชุนููู ุงูุฑ ู3','ุชุนููู ุงูุฑ ู2','ุชุนููู ุงูุฑ ู1'},
{'ุชุนููู ุงูุฑ ู6','ุชุนููู ุงูุฑ ู5','ุชุนููู ุงูุฑ ู4'},
{'ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ'},
{'ุฑุฌูุน ุ๐โ'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAek:get(AEK..'Aek:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="ใ ุงููุทูุฑ .",url="t.me/"..(dp.username_ or "SoalfLove")}}}
local start = DevAek:get(AEK.."Aek:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "ใโ ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nใโ ุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nใโ ูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nใโ ุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ โซ ุชูุนูู\nใโ ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAek:setex(AEK..'Aek:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source AEK     --
if not SecondSudo(msg) and not DevAek:sismember(AEK..'Aek:Ban:Pv',msg.sender_user_id_) and not DevAek:get(AEK..'Aek:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Aek(msg.sender_user_id_, msg.id_, 1, 'ใโ ุชู ุงุฑุณุงู ุฑุณุงูุชู ุงูู [ุงููุทูุฑ](t.me/'..(chat.username_ or "SoalfLove")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'ใโ ุชู ุงุฑุณุงู ุงูููุตู ูู โซ โค\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'ุญุธุฑ' or text == 'ุญุถุฑ' then
local Text = 'ใโ ุงูุนุถู โซ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nใโ ุชู ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAek:sadd(AEK..'Aek:Ban:Pv',data.id_)  
return false  
end 
if text == 'ุงูุบุงุก ุงูุญุธุฑ' or text == 'ุงูุบุงุก ุญุธุฑ' then
local Text = 'ใโ ุงูุนุถู โซ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nใโ ุชู ุงูุบุงุก ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAek:srem(AEK..'Aek:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู ูุงู ุจุญุธุฑ ุงูุจูุช ูุง ุชุณุชุทูุน ุงุฑุณุงู ุงูุฑุณุงุฆู ูู', 1, 'md')
return false  
end 
if text then
Dev_Aek(id_user, 0, 1, text, 1, "md")  
Text = 'ใโ ุชู ุงุฑุณุงู ุงูุฑุณุงูู ุงูู โซ โค'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = 'ใโ ุชู ุงุฑุณุงู ุงูููุตู ุงูู โซ โค'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = 'ใโ ุชู ุงุฑุณุงู ุงูุตูุฑู ุงูู โซ โค'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = 'ใโ ุชู ุงุฑุณุงู ุงููุชุญุฑูู ุงูู โซ โค'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = 'ใโ ุชู ุงุฑุณุงู ุงูุจุตูู ุงูู โซ โค'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source AEK     --
if text and DevAek:get(AEK..'Aek:Start:Bots'..msg.sender_user_id_) then
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevAek:del(AEK..'Aek:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAek:set(AEK.."Aek:Start:Bot",text)  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevAek:del(AEK..'Aek:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'ุชุนููู ุฑุฏ ุงูุฎุงุต' or text == 'ุถุน ูููุดู ุณุชุงุฑุช' or text == 'โซ ุชุนููู ุฑุฏ ุงูุฎุงุต ใ' then 
DevAek:set(AEK..'Aek:Start:Bots'..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ูููุดุฉ ุงูุณุชุงุฑุช ุงูุงู', 1, 'md')
return false
end
if text == 'ุญุฐู ุฑุฏ ุงูุฎุงุต' or text == 'ุญุฐู ูููุดู ุณุชุงุฑุช' or text == 'โซ ุญุฐู ุฑุฏ ุงูุฎุงุต ใ' then 
DevAek:del(AEK..'Start:Bot') 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ูููุดุฉ ุงูุณุชุงุฑุช ุจูุฌุงุญ', 1, 'md')
end
if text == 'ุฌูุจ ุฑุฏ ุงูุฎุงุต' then  
local start = DevAek:get(AEK.."Aek:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "ใโ ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nใโ ุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nใโ ูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nใโ ุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ โซ ุชูุนูู\nใโ ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'ุชูุนูู ุงูุชูุงุตู' or text == 'โซ ุชูุนูู ุงูุชูุงุตู ใ' then   
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุชูุงุตู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Texting:Pv') 
end
if text == 'ุชุนุทูู ุงูุชูุงุตู' or text == 'โซ ุชุนุทูู ุงูุชูุงุตู ใ' then  
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุชูุงุตู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Texting:Pv',true) 
end
end
--     Source AEK     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAek:incr(AEK..'Aek:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAek:set(AEK.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAek:get(AEK.."Aek:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(AEK) then 
DevAek:srem(AEK.."Aek:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) then
SendText(DevId,"ใโ ุชู ุทุฑุฏ ุงูุจูุช ูู ุงููุฌููุนู โซ โค \nโโโโโโปใโปโโโโโ\nใโ ุจูุงุณุทุฉ โซ "..Name.."\nใโ ุงุณู ุงููุฌููุนู โซ ["..NameChat.."]\nใโ ุงูุฏู ุงููุฌููุนู โซ โค \nโจ `"..msg.chat_id_.."` โฉ\nโโโโโโปใโปโโโโโ\nใโ ุงูููุช โซ "..os.date("%I:%M%p").."\nใโ ุงูุชุงุฑูุฎ โซ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAek:incr(AEK..'Aek:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAek:incr(AEK..'Aek:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source AEK     --
if text ==('ุชูุนูู') and not SudoBot(msg) and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:FreeBot'..AEK) then
if ChatType == 'pv' then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุงุชุณุชุทูุน ุชูุนููู ููุง ูุฑุฌู ุงุถุงูุชู ูู ูุฌููุนู ุงููุง', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'ููุดุฆ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ุงุฏูู'
else 
status = 'ุนุถู'
end
DevAek:del(AEK..'Aek:AekConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Aekan) 
local admins = Aekan.members_
for i=0 , #admins do
if Aekan.members_[i].bot_info_ == false and Aekan.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if Aekan.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAek:sadd(AEK.."Aek:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAek:sadd(AEK.."Aek:AekConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAek:srem(AEK.."Aek:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAek:srem(AEK.."Aek:AekConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAek:sismember(AEK..'Aek:Groups',msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAek:get(AEK..'Aek:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู โซ *'..(DevAek:get(AEK..'Aek:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","ใโ ุชู ุชูุนูู ุงููุฌููุนู "..dp.title_)  
DevAek:sadd(AEK.."Aek:Groups",msg.chat_id_)
DevAek:sadd(AEK..'Aek:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAek:set(AEK.."Aek:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"ใโ ุชู ุชูุนูู ูุฌููุนู ุฌุฏูุฏู โซ โค \nโโโโโโปใโปโโโโโ\nใโ ุจูุงุณุทุฉ โซ "..Name.."\nใโ ูููุนู ูู ุงููุฌููุนู โซ "..status.."\nใโ ุงุณู ุงููุฌููุนู โซ ["..NameChat.."]\nใโ ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู โซ โจ *"..NumMem.."* โฉ\nใโ ุงูุฏู ุงููุฌููุนู โซ โค \nโจ `"..msg.chat_id_.."` โฉ\nใโ ุฑุงุจุท ุงููุฌููุนู โซ โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโปใโปโโโโโ\nใโ ุงูููุช โซ "..os.date("%I:%M%p").."\nใโ ุงูุชุงุฑูุฎ โซ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชูุนูู ูุฐู ุงููุฌููุนู ุจุณุจุจ ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู', 1, 'md') 
end 
end 
--     Source AEK     --
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source AEK     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAek:set(AEK..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source AEK     --
local ReFalse = tostring(msg.chat_id_)
if not DevAek:sismember(AEK.."Aek:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source AEK     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAek:get(AEK..'Aek:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, dp.id_)
local Text = 'ใโ ุงููุง ุนุฒูุฒู โซ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\nใโ ูุฌุจ ุนูููุง ุงูุชุฃูุฏ ุฃูู ูุณุช ุฑูุจูุช\nใโ ุชู ุชูููุฏู ุงุถุบุท ุงูุฒุฑ ุจุงูุงุณูู ูููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงุถุบุท ููุง ููู ุชูููุฏู",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevAek:get(AEK.."Aek:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAek:smembers(AEK.."Aek:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ุงูุตูุฑู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAek:smembers(AEK.."Aek:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ุงููุชุญุฑูู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAek:smembers(AEK.."Aek:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ุงูููุตู ุงูุฐู ุงุฑุณูุชู ุชู ููุนู ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source AEK     --
if text and text:match("^(.*)$") then
local DelGpRed = DevAek:get(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if DelGpRed == 'DelGpRed' then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงููููู โซ '..msg.content_.text_..' ุชู ุญุฐููุง',  1, "html")
DevAek:del(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAek:srem(AEK..'Aek:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAek:get(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงููููู โซ '..msg.content_.text_..' ุชู ุญุฐููุง',  1, "html")
DevAek:del(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
DevAek:del(AEK.."Aek:Gif:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Voice:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Audio:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Photo:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Stecker:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Video:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:File:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Text:AllRed"..msg.content_.text_)
DevAek:del(AEK.."Aek:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source AEK     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAek:get(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SaveGpRed == 'SaveGpRed' then 
if text == 'ุงูุบุงุก' then
local DelManagerRep = DevAek:get(AEK..'DelManagerRep'..msg.chat_id_..'')
DevAek:srem(AEK..'Aek:Manager:GpRed'..msg.chat_id_..'',DelManagerRep)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevAek:del(AEK..'Aek:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAek:del(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_)
DevAek:del(AEK..'DelManagerRep'..msg.chat_id_..'')
return false
end
DevAek:del(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
local SaveGpRed = DevAek:get(AEK..'Aek:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevAek:set(AEK..'Aek:Video:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAek:set(AEK..'Aek:File:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAek:set(AEK..'Aek:Stecker:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAek:set(AEK..'Aek:Voice:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAek:set(AEK..'Aek:Audio:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAek:set(AEK..'Aek:Photo:GpRed'..SaveGpRed..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevAek:set(AEK..'Aek:Gif:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAek:set(AEK..'Aek:Text:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevAek:del(AEK..'Aek:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAek:del(AEK..'DelManagerRep'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevAek:get(AEK..'Aek:Lock:GpRed'..msg.chat_id_) then 
if DevAek:get(AEK..'Aek:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK..'Aek:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAek:get(AEK..'Aek:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK..'Aek:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAek:get(AEK..'Aek:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK..'Aek:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAek:get(AEK..'Aek:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK..'Aek:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAek:get(AEK..'Aek:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK..'Aek:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAek:get(AEK..'Aek:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK..'Aek:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAek:get(AEK..'Aek:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK..'Aek:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevAek:get(AEK..'Aek:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then
function AEKTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevAek:get(AEK..'Aek:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAek:get(AEK..'Aek:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, AEKTEAM)
end
end
--     Source AEK     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAek:get(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'ุงูุบุงุก' then
local DelSudoRep = DevAek:get(AEK..'DelSudoRep')
DevAek:del(AEK.."Aek:Sudo:AllRed",DelSudoRep)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevAek:del(AEK.."Aek:Add:AllText"..msg.sender_user_id_)
DevAek:del(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
DevAek:del(AEK.."DelSudoRep")
return false
end
DevAek:del(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAek:get(AEK.."Aek:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAek:set(AEK.."Aek:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAek:set(AEK.."Aek:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAek:set(AEK.."Aek:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAek:set(AEK.."Aek:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAek:set(AEK.."Aek:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAek:set(AEK.."Aek:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAek:set(AEK.."Aek:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAek:set(AEK.."Aek:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevAek:del(AEK.."Aek:Add:AllText"..msg.sender_user_id_)
DevAek:del(AEK..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAek:get(AEK..'Aek:Lock:AllRed'..msg.chat_id_) then
if DevAek:get(AEK.."Aek:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK.."Aek:Video:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK.."Aek:File:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK.."Aek:Voice:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK.."Aek:Audio:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK.."Aek:Photo:AllRed"..msg.content_.text_))
end
if  DevAek:get(AEK.."Aek:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAek:get(AEK.."Aek:Gif:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAek:get(AEK.."Aek:Stecker:AllRed"..msg.content_.text_))
end
if DevAek:get(AEK.."Aek:Text:AllRed"..msg.content_.text_) then
function AEKTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevAek:get(AEK..'Aek:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAek:get(AEK.."Aek:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, AEKTEAM)
end
end 
--     Source AEK     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'ใโ ุงูุนุถู โซ '..GetName..' \nใโ ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุทุฑุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAek:sismember(AEK..'Aek:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'ใโ ุงูุนุถู โซ '..GetName..' \nใโ ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุชููุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAek:sadd(AEK..'Aek:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'ใโ ุงูุนุถู โซ '..GetName..' \nใโ ูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ูุชูู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions AEK --
--     Source AEK     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= AEK then
floods = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAek:get(AEK.."Aek:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAek:setex(AEK.."Aek:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source AEK     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(AEK) then
DevAek:set(AEK..'Aek:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAek:get(AEK..'Aek:PinnedMsg'..msg.chat_id_)
if pin_id and DevAek:get(AEK..'Aek:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAek:get(AEK..'Aek:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAek:del(AEK..'Aek:viewget'..msg.sender_user_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ูุดุงูุฏุงุช ุงูููุดูุฑ ูู โซ ('..msg.views_..')', 1, 'md')
DevAek:del(AEK..'Aek:viewget'..msg.sender_user_id_)
end
end
--     Source AEK     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAek:get(AEK..'Aek:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AEK     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAek:get(AEK..'Aek:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AEK     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAek:get(AEK..'Aek:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAek:get(AEK..'Aek:Groups:Welcomes'..msg.chat_id_) then
text = DevAek:get(AEK..'Aek:Groups:Welcomes'..msg.chat_id_)
else
text = 'โข ููุฑุช ุญุจู \nโข [firstname lastname] \nโข [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'SoalfLove'))
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevAek:get(AEK.."Aek:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source AEK     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAek:get(AEK..'Aek:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = AEK,offset_ = 0,limit_ = 1},function(extra,Aekan,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(AEK) then 
if DevAek:sismember(AEK..'Aek:Groups',msg.chat_id_) then
BotText = "ููุนูู ูู ุงูุณุงุจู\nใโ ุงุฑุณู โซ ุงูุงูุงูุฑ ูุงุณุชูุชุน ุจุงููููุฒูุงุช"
else 
BotText = "ูุนุทูู ูุฌุจ ุฑูุนู ูุดุฑู\nใโ ุจุนุฏ ุฐูู ูุฑุฌู ุงุฑุณุงู ุงูุฑ โซ ุชูุนูู\nใโ ุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
local AekText = (DevAek:get(AEK.."Aek:Text:BotWelcome") or "ใโ ูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nใโ ุญุงูุฉ ุงููุฌููุนู โซ "..BotText.."\nโโโโโโปใโปโโโโโ")
local AekPhoto = (DevAek:get(AEK.."Aek:Photo:BotWelcome") or Aekan.photos_[0].sizes_[1].photo_.persistent_id_)
if DevAek:get(AEK.."Aek:Photo:BotWelcome") or Aekan.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AekPhoto,AekText)
else 
send(msg.chat_id_,msg.id_,AekText)
end 
end   
end
end,nil)
end
if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAek:get(AEK.."Aek:Lock:Welcome"..msg.chat_id_) then
if DevAek:get(AEK..'Aek:Groups:Welcomes'..msg.chat_id_) then
text = DevAek:get(AEK..'Aek:Groups:Welcomes'..msg.chat_id_)
else
text = 'โข ููุฑุช ุญุจู \nโข [firstname lastname] \nโข [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'SoalfLove'))
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source AEK     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AEK     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAek:get(AEK..'Aek:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AEK     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAek:get(AEK..'Aek:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAek:get(AEK..'Aek:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAek:get(AEK..'Aek:Spam:Text'..msg.chat_id_))
end
if DevAek:get(AEK..'Aek:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source AEK     --
if DevAek:get(AEK.."Aek:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "ุงูุบุงุก" then
send(msg.chat_id_,msg.id_,"ใโ ุชู ุงูุบุงุก ุญูุธ ุงูุฑุงุจุท")       
DevAek:del(AEK.."Aek:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAek:set(AEK.."Aek:Groups:Links"..msg.chat_id_,Link)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ุงูุฑุงุจุท ุจูุฌุงุญ', 1, 'md')
DevAek:del(AEK.."Aek:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end
--     Source AEK     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAek:get('AEKTEAM:'..AEK.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevAek:del('AEKTEAM:'..AEK..'id:user'..msg.chat_id_)  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevAek:del('AEKTEAM:'..AEK.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAek:del('AEKTEAM:'..AEK.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAek:get('AEKTEAM:'..AEK..'id:user'..msg.chat_id_)  
DevAek:incrby(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Aek(msg.chat_id_, msg.id_,  1, "ใโ ุชู ุงุถุงูุฉ "..numadded..' ุฑุณุงูู', 1, 'md')
DevAek:del('AEKTEAM:'..AEK..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAek:get('AEKTEAM:'..AEK.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevAek:del('AEKTEAM:'..AEK..'ids:user'..msg.chat_id_)  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevAek:del('AEKTEAM:'..AEK.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAek:del('AEKTEAM:'..AEK.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAek:get('AEKTEAM:'..AEK..'ids:user'..msg.chat_id_)  
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Aek(msg.chat_id_, msg.id_,  1, "ใโ ุชู ุงุถุงูุฉ "..numadded..' ููุทู', 1, 'md')
DevAek:del('AEKTEAM:'..AEK..'ids:user'..msg.chat_id_)  
end
end
--     Source AEK     --
if text and (text:match("ุทูุฒ") or text:match("ุฏูุณ") or text:match("ุงููุฌูู") or text:match("ุงููุฌ") or text:match("ููุฌ") or text:match("ุฏููุณ") or text:match("ููุงููุฌ") or text:match("ุนูุฑ") or text:match("ูุณุฎุชู") or text:match("ูุณูู") or text:match("ูุณุฑุจู") or text:match("ุจูุงุน") or text:match("ุงุจู ุงูุนููุฑู") or text:match("ููููุฌ") or text:match("ูุญุจู") or text:match("ูุญุงุจ") or text:match("ุงุฎ ุงููุญุจู") or text:match("ุงุฎู ุงููุญุจู") or text:match("ููุงุฏ") or text:match("ููุงุฏู") or text:match("ุงููุญุจู") or text:match("ูุณู") or text:match("ุทูุฒู") or text:match("ุนูุฑ ุจุทูุฒู") or text:match("ูุณ ุงูู") or text:match("ุงูู ุงููุญุจู") or text:match("ุตุฑู") or text:match("ุนูุฑู") or text:match("ุนูุฑ ุจูู") or text:match("ุตุฑูู")) then
if not DevAek:get(AEK.."Aek:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ููููุน ุงููุดุงุฑ ูู ุงููุฌููุนู")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุณฺฉุณ") or text:match("ุณฺฉุณ?") or text:match("ฺฉุณ?") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("?") or text:match("ฺฒ") or text:match("ฺณ") or text:match("ฺด") or text:match("ฺฑ") or text:match("ฺฐ") or text:match("ฺฎ") or text:match("ฺญ") or text:match("ฺฌ") or text:match("ฺฉ") or text:match("ฺซ") or text:match("?") or text:match("?") or text:match("ูท") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฎ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฏ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺป") or text:match("ฺฝ") or text:match("ฺน") or text:match("ฺบ") or text:match("ูฟ") or text:match("ูฝ") or text:match("ูบ") or text:match("ูต") or text:match("ฺธ") or text:match("ฺท") or text:match("ฺต") or text:match("ฺ")  or text:match("ูฎ") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ูธ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?บ") or text:match("ฺ") or text:match("ฺ") or text:match("?ต") or text:match("?ถ") or text:match("ุจ?ุงู") or text:match("ุฑุงุญุช?") or text:match("ุจุฑู") or text:match("ุฎุณุชู") or text:match("ุดุงุฏ?") or text:match("ุฏูุณุชุงู") or text:match("ุฎูุจู") or text:match("ุฒ?ุจุงุชุฑ?ู") or text:match("ุฎูุดฺฉูู") or text:match("ุฒ?ุจุงุชูู") or text:match("ุจ?ุง") or text:match("ู?ุงุฑ?") or text:match("ุฏุงุฏุงุด") or text:match("ู?ุฎูุง?") or text:match("ููุง?ู") or text:match("ุชุฎูุงุชู") or text:match("ุงููุฏู") or text:match("ุจุงูุงุงุงุงุณ") or text:match("ุจูุงูููู") or text:match("ุตุจุฌุชูู") or text:match("ุจฺฉุด?") or text:match("ุฑููุง") or text:match("ูููููุง?โูุงูู") or text:match("ูุฑุงููุด") or text:match("ุงุณุช?ฺฉุฑ") or text:match("ุจุด?ู") or text:match("ุฏุฑููู?") or text:match("ู?ุน") or text:match("ฺฉุฑุฏู")  or text:match("ุงุฏุฏ") or text:match("ุดูุงุฑู") or text:match("ุดูุงุฑุชู") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฎูุจ?") or text:match("ุฌุฐุงุจ?ุชุช") or text:match("ุฏ?ุดุจ") or text:match("ูุดููุช") or text:match("ฺฉ?") or text:match("ุฎูุฏุชูู") or text:match("ุจ?ุง??ู") or text:match("ุณุฑุงุบ") or text:match("ุฎูุฏู") or text:match("ุตฺฉุต?") or text:match("ุง?ูุฌุง") or text:match("ูุดููุช") or text:match("ููุฑูุงูโ") or text:match("ุฏ?ูุฏู") or text:match("ุฎูุจ") or text:match("ูุฑุงููุด") or text:match("ูุงุดููโ") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ุดุจ") or text:match("ฺฉุฌุง??ู") or text:match("ุจุฒูู") or text:match("?ู?") or text:match("ุจ?ุงู") or text:match("ุฏ?ูู") or text:match("ุฌุงูู") or text:match("ุงุตูุดู") or text:match("ูููุดู") or text:match("ู?ุงุฒ") or text:match("ูุฏุงุฑู") or text:match("ุนุฒ?ุฒู") or text:match("ุนุดูู") or text:match("ุฒุฏู") or text:match("ูุณุช") or text:match("ุฏุฑููู?") or text:match("ุจุด?ู") or text:match("ุบูุบุง?") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฌุฏ?ุฏุงูู") or text:match("ฺฉุตู") or text:match("ู?ุฎุงุฑู") or text:match("ูุฒุงุดุชู") or text:match("ุฏุงุฑ?") or text:match("ุดูุงุฑุช") or text:match("?ฺฉ?")) then
if DevAek:get(AEK.."Aek:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุณฺฉุณ") or text:match("ุณฺฉุณ?") or text:match("ฺฉุณ?") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("?") or text:match("ฺฒ") or text:match("ฺณ") or text:match("ฺด") or text:match("ฺฑ") or text:match("ฺฐ") or text:match("ฺฎ") or text:match("ฺญ") or text:match("ฺฌ") or text:match("ฺฉ") or text:match("ฺซ") or text:match("?") or text:match("?") or text:match("ูท") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฎ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฏ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺป") or text:match("ฺฝ") or text:match("ฺน") or text:match("ฺบ") or text:match("ูฟ") or text:match("ูฝ") or text:match("ูบ") or text:match("ูต") or text:match("ฺธ") or text:match("ฺท") or text:match("ฺต") or text:match("ฺ")  or text:match("ูฎ") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ูธ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?บ") or text:match("ฺ") or text:match("ฺ") or text:match("?ต") or text:match("?ถ") or text:match("ุจ?ุงู") or text:match("ุฑุงุญุช?") or text:match("ุจุฑู") or text:match("ุฎุณุชู") or text:match("ุดุงุฏ?") or text:match("ุฏูุณุชุงู") or text:match("ุฎูุจู") or text:match("ุฒ?ุจุงุชุฑ?ู") or text:match("ุฎูุดฺฉูู") or text:match("ุฒ?ุจุงุชูู") or text:match("ุจ?ุง") or text:match("ู?ุงุฑ?") or text:match("ุฏุงุฏุงุด") or text:match("ู?ุฎูุง?") or text:match("ููุง?ู") or text:match("ุชุฎูุงุชู") or text:match("ุงููุฏู") or text:match("ุจุงูุงุงุงุงุณ") or text:match("ุจูุงูููู") or text:match("ุตุจุฌุชูู") or text:match("ุจฺฉุด?") or text:match("ุฑููุง") or text:match("ูููููุง?โูุงูู") or text:match("ูุฑุงููุด") or text:match("ุงุณุช?ฺฉุฑ") or text:match("ุจุด?ู") or text:match("ุฏุฑููู?") or text:match("ู?ุน") or text:match("ฺฉุฑุฏู")  or text:match("ุงุฏุฏ") or text:match("ุดูุงุฑู") or text:match("ุดูุงุฑุชู") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฎูุจ?") or text:match("ุฌุฐุงุจ?ุชุช") or text:match("ุฏ?ุดุจ") or text:match("ูุดููุช") or text:match("ฺฉ?") or text:match("ุฎูุฏุชูู") or text:match("ุจ?ุง??ู") or text:match("ุณุฑุงุบ") or text:match("ุฎูุฏู") or text:match("ุตฺฉุต?") or text:match("ุง?ูุฌุง") or text:match("ูุดููุช") or text:match("ููุฑูุงูโ") or text:match("ุฏ?ูุฏู") or text:match("ุฎูุจ") or text:match("ูุฑุงููุด") or text:match("ูุงุดููโ") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ุดุจ") or text:match("ฺฉุฌุง??ู") or text:match("ุจุฒูู") or text:match("?ู?") or text:match("ุจ?ุงู") or text:match("ุฏ?ูู") or text:match("ุฌุงูู") or text:match("ุงุตูุดู") or text:match("ูููุดู") or text:match("ู?ุงุฒ") or text:match("ูุฏุงุฑู") or text:match("ุนุฒ?ุฒู") or text:match("ุนุดูู") or text:match("ุฒุฏู") or text:match("ูุณุช") or text:match("ุฏุฑููู?") or text:match("ุจุด?ู") or text:match("ุบูุบุง?") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฌุฏ?ุฏุงูู") or text:match("ฺฉุตู") or text:match("ู?ุฎุงุฑู") or text:match("ูุฒุงุดุชู") or text:match("ุฏุงุฑ?") or text:match("ุดูุงุฑุช") or text:match("?ฺฉ?")) then
if DevAek:get(AEK.."Aek:Lock:FarsiWarn"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ููููุน ุงูุชููู ุจุงููุบู ุงููุงุฑุณูู ููุง")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุณฺฉุณ") or text:match("ุณฺฉุณ?") or text:match("ฺฉุณ?") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("?") or text:match("ฺฒ") or text:match("ฺณ") or text:match("ฺด") or text:match("ฺฑ") or text:match("ฺฐ") or text:match("ฺฎ") or text:match("ฺญ") or text:match("ฺฌ") or text:match("ฺฉ") or text:match("ฺซ") or text:match("?") or text:match("?") or text:match("ูท") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฎ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?ฏ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺป") or text:match("ฺฝ") or text:match("ฺน") or text:match("ฺบ") or text:match("ูฟ") or text:match("ูฝ") or text:match("ูบ") or text:match("ูต") or text:match("ฺธ") or text:match("ฺท") or text:match("ฺต") or text:match("ฺ")  or text:match("ูฎ") or text:match("?") or text:match("?") or text:match("?") or text:match("?") or text:match("ูธ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺ") or text:match("?บ") or text:match("ฺ") or text:match("ฺ") or text:match("?ต") or text:match("?ถ") or text:match("ุจ?ุงู") or text:match("ุฑุงุญุช?") or text:match("ุจุฑู") or text:match("ุฎุณุชู") or text:match("ุดุงุฏ?") or text:match("ุฏูุณุชุงู") or text:match("ุฎูุจู") or text:match("ุฒ?ุจุงุชุฑ?ู") or text:match("ุฎูุดฺฉูู") or text:match("ุฒ?ุจุงุชูู") or text:match("ุจ?ุง") or text:match("ู?ุงุฑ?") or text:match("ุฏุงุฏุงุด") or text:match("ู?ุฎูุง?") or text:match("ููุง?ู") or text:match("ุชุฎูุงุชู") or text:match("ุงููุฏู") or text:match("ุจุงูุงุงุงุงุณ") or text:match("ุจูุงูููู") or text:match("ุตุจุฌุชูู") or text:match("ุจฺฉุด?") or text:match("ุฑููุง") or text:match("ูููููุง?โูุงูู") or text:match("ูุฑุงููุด") or text:match("ุงุณุช?ฺฉุฑ") or text:match("ุจุด?ู") or text:match("ุฏุฑููู?") or text:match("ู?ุน") or text:match("ฺฉุฑุฏู")  or text:match("ุงุฏุฏ") or text:match("ุดูุงุฑู") or text:match("ุดูุงุฑุชู") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฎูุจ?") or text:match("ุฌุฐุงุจ?ุชุช") or text:match("ุฏ?ุดุจ") or text:match("ูุดููุช") or text:match("ฺฉ?") or text:match("ุฎูุฏุชูู") or text:match("ุจ?ุง??ู") or text:match("ุณุฑุงุบ") or text:match("ุฎูุฏู") or text:match("ุตฺฉุต?") or text:match("ุง?ูุฌุง") or text:match("ูุดููุช") or text:match("ููุฑูุงูโ") or text:match("ุฏ?ูุฏู") or text:match("ุฎูุจ") or text:match("ูุฑุงููุด") or text:match("ูุงุดููโ") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ุดุจ") or text:match("ฺฉุฌุง??ู") or text:match("ุจุฒูู") or text:match("?ู?") or text:match("ุจ?ุงู") or text:match("ุฏ?ูู") or text:match("ุฌุงูู") or text:match("ุงุตูุดู") or text:match("ูููุดู") or text:match("ู?ุงุฒ") or text:match("ูุฏุงุฑู") or text:match("ุนุฒ?ุฒู") or text:match("ุนุดูู") or text:match("ุฒุฏู") or text:match("ูุณุช") or text:match("ุฏุฑููู?") or text:match("ุจุด?ู") or text:match("ุบูุบุง?") or text:match("ู?ุชุฑุดฺฉู") or text:match("ุฌุฏ?ุฏุงูู") or text:match("ฺฉุตู") or text:match("ู?ุฎุงุฑู") or text:match("ูุฒุงุดุชู") or text:match("ุฏุงุฑ?") or text:match("ุดูุงุฑุช") or text:match("?ฺฉ?")) then
if DevAek:get(AEK.."Aek:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end
if text and (text:match("ุฎุฑู ุจุงููู") or text:match("ุฎุจุฑุจู") or text:match("ูุณุฏููุฑุจู") or text:match("ุฎุฑุจ ุจุงููู") or text:match("ุฎุฑุจ ุงููู") or text:match("ุฎุฑู ุจุฑุจู") or text:match("ุงููู ุงูููุงุฏ") or text:match("ุฎุฑู ุจูุญูุฏ") or text:match("ูุณู ุงููู") or text:match("ูุณู ุฑุจู") or text:match("ูุณุฑุจู") or text:match("ูุณุฎุชุงููู") or text:match("ูุณุฎุช ุงููู") or text:match("ุฎุฑู ุจุฏููู") or text:match("ุฎุฑูุจุฏููู") or text:match("ูุณุงููู") or text:match("ุฎุฑุจุงููู")) then
if not DevAek:get(AEK.."Aek:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ููููุน ุงูููุฑ ูู ุงููุฌููุนู") 
end end
if text and (text:match("ุดูุนู ููุณ") or text:match("ุณูู ููุณ") or text:match("ุดูุนู") or text:match("ุงูุดูุนู") or text:match("ุทุงุฆูุชูู") or text:match("ุดูุนู") or text:match("ุงูุง ุณูู") or text:match("ุงูุง ุดูุนู") or text:match("ูุณูุญู") or text:match("ูููุฏู") or text:match("ุตุงุจุฆู") or text:match("ููุญุฏ") or text:match("ุจุงูุดูุนู") or text:match("ุดูุนุฉ")) then
if not DevAek:get(AEK.."Aek:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","ใโ ููููุน ุงูุชููู ุจุงูุทุงุฆููู ููุง") 
end end
--     Source AEK     --
if SecondSudo(msg) then
if text == 'ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช' and ChCheck(msg) or text == 'ุฌูุจ ูุณุฎู ุงุญุชูุงุทูู' and ChCheck(msg) then
local List = DevAek:smembers(AEK..'Aek:Groups') 
local BotName = (DevAek:get(AEK.."Aek:NameBot") or 'ุงููุงู')
local GetJson = '{"BotId": '..AEK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAek:get(AEK.."Aek:Groups:Links"..v)
Welcomes = DevAek:get(AEK..'Aek:Groups:Welcomes'..v) or ''
AekConstructors = DevAek:smembers(AEK..'Aek:AekConstructor:'..v)
Constructors = DevAek:smembers(AEK..'Aek:BasicConstructor:'..v)
BasicConstructors = DevAek:smembers(AEK..'Aek:Constructor:'..v)
Managers = DevAek:smembers(AEK..'Aek:Managers:'..v)
Admis = DevAek:smembers(AEK..'Aek:Admins:'..v)
Vips = DevAek:smembers(AEK..'Aek:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AekConstructors ~= 0 then
GetJson = GetJson..'"AekConstructors":['
for k,v in pairs(AekConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..AEK..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..AEK..'.json', 'ใโ ูุญุชูู ุงูููู ุนูู โซ '..#List..' ูุฌููุนู',dl_cb, nil)
io.popen('rm -rf ./'..AEK..'.json')
end
if text == 'ุฑูุน ุงููุณุฎู' and tonumber(msg.reply_to_message_id_) > 0 or text == 'ุฑูุน ุงููุณุฎู ุงูุงุญุชูุงุทูู' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source AEK     --
if DevAek:get(AEK.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Aek( msg.chat_id_, msg.id_, 1,"ใโ ููุฌุฏ ููุท ( 6 ) ุงุฎุชูุงุฑุงุช\nใโ ุงุฑุณู ุงุฎุชูุงุฑู ูุฑู ุงุฎุฑู", 1, "md")    
return false  end 
local GETNUM = DevAek:get(AEK.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAek:del(AEK.."SET:GAME"..msg.chat_id_)   
Dev_Aek( msg.chat_id_, msg.id_, 1,'ใโ *ุงููุญูุจุณ ุจุงููุฏ ุฑูู* โซ '..NUM..'\nใโ *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, "md") 
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAek:del(AEK.."SET:GAME"..msg.chat_id_)   
Dev_Aek( msg.chat_id_, msg.id_, 1,'ใโ *ุงููุญูุจุณ ุจุงููุฏ ุฑูู* โซ '..GETNUM..'\nใโ *ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ูุฑู ุงุฎุฑู ููุนุซูุฑ ุนูู ุงููุญูุจุณ*', 1, "md")
end
end
end
if DevAek:get(AEK..'DevAek4'..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_, "ใโ ุชู ุงูุบุงุก ุงูุงูุฑ")
DevAek:del(AEK..'DevAek4'..msg.sender_user_id_)
return false  end 
DevAek:del(AEK..'DevAek4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 'ใโ ุงููุนุฑู ูุง ููุฌุฏ ููู ููุงุฉ')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, 'ใโ ุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ุญุณุงุจุงุช ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, 'ใโ ุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ูุฌููุนู ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'ใโ ุงูุจูุช ุงุฏูู ูู ุงูููุงุฉ \nใโ ุชู ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nใโ ุงูุฏู ุงูููุงุฉ โซ '..data.id_..'\nใโ ูุนุฑู ุงูููุงุฉ โซ [@'..data.type_.channel_.username_..']')
DevAek:set(AEK..'DevAek2',data.id_)
DevAek:set(AEK..'DevAek3','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'ใโ ุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูู ุงูููุงุฉ')
end
return false  
end
end,nil)
end
--     Source AEK     --
if DevAek:get(AEK.."Aek:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
DevAek:del(AEK.."Aek:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
DevAek:del(AEK.."Aek:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAek:set(AEK.."DevText", DevText)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ูููุดุฉ ุงููุทูุฑ", 1, "md")
end
if DevAek:get(AEK..'Aek:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^ุงูุบุงุก$") then 
DevAek:del(AEK..'Aek:NameBot'..msg.sender_user_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ุงุณู ุงูุจูุช ', 1, 'html')
DevAek:del(AEK..'Aek:NameBot'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:NameBot', text)
return false 
end
--     Source AEK     --
if text == "ุงูุฑุงุจุท" then
if not DevAek:get(AEK.."Aek:Lock:GpLinks"..msg.chat_id_) then 
if DevAek:get(AEK.."Aek:Groups:Links"..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ๐๐๐๐๐ ๐๐๐๐ โฌ โค \nโโโโโโปใโปโโโโโ\n"..DevAek:get(AEK.."Aek:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุงููุฌุฏ ุฑุงุจุท ุงุฑุณู โซ ุถุน ุฑุงุจุท ุงู ุงุฑุณู โซ ุงูุดุงุก ุฑุงุจุท ููุงูุดุงุก', 1, 'md')
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฌูุจ ุฑุงุจุท ุงููุฌููุนู ูุนุทู', 1, 'md')
end
end
--     Source AEK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'ุจูุช' or text == 'ุจูุชุช' then 
NameBot = (DevAek:get(AEK..'Aek:NameBot') or 'ุงููุงู')
local AEKTEAM = {"ูุชููู ุจูุช ุงุณูู "..NameBot.." ๐๐ช","ุงุณูู ุงููููู "..NameBot.." ๐โฅ๏ธ","ุนูุฏู ุงุณู ุชุฑู ๐๐","ุตูุญููู "..NameBot.." ูุงูู ุจูุช ๐๐ช","ุงูุช ุงูุจูุช ูู ๐๐"} 
DevAek2 = math.random(#AEKTEAM) 
Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM[DevAek2] , 1, 'html') 
return false
end
if text == 'ุงุณู ุงูุจูุช' or text == 'ุงูุจูุช ุดูู ุงุณูู' or text == 'ุดุณูู ุงูุจูุช' or text == 'ุงูุจูุช ุดุณูู' then
NameBot = (DevAek:get(AEK..'Aek:NameBot') or 'ุงููุงู') 
local AEKTEAM = {"ุงุณูู ุงููููู "..NameBot.." ๐โฅ๏ธ","ููุงุง ูุฑูุญูู ููุงูู "..NameBot.." ๐ปโฅ๏ธ"} 
DevAek2 = math.random(#AEKTEAM) 
Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM[DevAek2] , 1, 'html') 
return false
end
if text and text == (DevAek:get(AEK..'Aek:NameBot') or 'ุงููุงู') then 
NameBot = (DevAek:get(AEK..'Aek:NameBot') or 'ุงููุงู')
local namebot = {'๐ธโฅ๏ธ ููุง ููุจู ููุงู '..NameBot..' ุชูุถู','ุนูุฑู ูุฏุงู '..NameBot..' ุญุจ','ุงุญุชุฑููุง ุฃูู '..NameBot..' ุดุชุฑูุฏ','ุชุฑุฉู ูุตุฎุชูุงุง ุงุญุฌูู ุดุฑุงูุฏ ๐๐๐',' ุดุชุฑูุฏ ุญุจู ุงูู '..NameBot..' ','ุฏุง ุงุดุฑุจ ุงุฑูููู ุชุนุงู ุบูุฑ ููุช','ูุงูู ุบูุฑู ุจุงููุฑูุจ ุชุตูุญ ุนููู','ูุง ูุนูุฑู ููุงู '..NameBot..' ',' ูุนู ูุนุทุฑู ุงูู '..NameBot..' ','ุงุทููู ูุงุญุฏุฏ ูุตูุญ '..NameBot..' ๐ปโฅ๏ธ','ููุงุชูู ููุจู','ุฎุจุตุชุช ุงููุฉุฉ ุดุชุฑูุฏุฏ ุนุงุงุฏ ๐คง๐๐'} 
name = math.random(#namebot) 
Dev_Aek(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='ููุงุทู' and ChCheck(msg) then 
if tonumber((DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูู ุชุฑุจุญ ุงู ููุทู\nใโ ุงุฑุณู โซ ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุนุฏุฏ ุงูููุงุท ุงูุชู ุฑุจุญุชูุง โซ '..(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'ุญุฐู ุฑุณุงุฆูู' and ChCheck(msg) or text ==  'ูุณุญ ุฑุณุงุฆูู' and ChCheck(msg) then DevAek:del(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ุฌููุน ุฑุณุงุฆูู', 1, 'md') end
if text ==  'ุญุฐู ููุงุทู' and ChCheck(msg) or text ==  'ูุณุญ ููุงุทู' and ChCheck(msg) then DevAek:del(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ุฌููุน ููุงุทู', 1, 'md') end
--     Source AEK     --
if text == 'ุณูุงููุงุช' and ChCheck(msg) or text == 'ุงูุณูุงููุงุช' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฅฅ','๐ฅ','๐','๐','๐ฅ','๐ฅฆ','๐ฅ','๐ถ','๐ฝ','๐ฅ','๐ฅ','๐?','๐ฅ','๐','๐ฅ','๐ฅจ','๐ง','๐ฅ','๐ณ','๐ฅ','๐ฅ','๐ฅฉ','๐','๐','๐ญ','๐','๐','๐','๐ฅช','๐ฅ','๐ผ','โ๏ธ','๐ต','๐ฅค','๐ถ','๐บ','๐ป','๐','โฝ๏ธ','๐','โพ๏ธ','๐พ','๐','๐','๐ฑ','๐','๐ธ','๐ฅ','๐ฐ','๐ฎ','๐ณ','๐ฏ','๐','๐ป','๐ธ','๐บ','๐ฅ','๐น','๐ผ','๐ง','๐ค','๐ฌ','๐จ','๐ญ','๐ช','๐','๐ค','๐','๐ต','๐','๐','๐ฅ','๐ท','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฎ๐ถ','โ๏ธ','๐ก','๐ฎ','๐ก','๐ฃ','โฑ','๐ข','๐','๐','๐','๐','๐ช','๐ซ','๐ฌ','๐ญ','โฐ','๐บ','๐','โ๏ธ','๐ก'}
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅจ','๐ฅจ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฉ','๐ฅฉ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅช','๐ฅช')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐ฅค','๐ฅค')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅฅ','๐ฅฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฆ','๐ฅฆ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐ฝ','๐ฝ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐?','๐?')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โฝ๏ธ','โฝ๏ธ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โพ๏ธ','โพ๏ธ')
name = string.gsub(name,'๐พ','๐พ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฑ','๐ฑ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฐ','๐ฐ')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฏ','๐ฏ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐น','๐น')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐จ','๐จ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ท','๐ท')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฎ๐ถ','๐ฎ๐ถ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฃ','๐ฃ')
name = string.gsub(name,'โฑ','โฑ')
name = string.gsub(name,'๐ข','๐ข')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐ซ','๐ซ')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'โฐ','โฐ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
AEKTEAM = 'ใโ ุงูู ูุงุญุฏ ูุฏุฒ ูุฐุง ุงูุณูุงูู ูุฑุจุญ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุณูุงููุงุช ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end
if text == 'ุชุฑุชูุจ' and ChCheck(msg) or text == 'ุงูุชุฑุชูุจ' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ุณุญูุฑ','ุณูุงุฑู','ุงุณุชูุจุงู','ูููู','ุงูููู','ุจุฒููู','ูุทุจุฎ','ูุฑุณุชูุงูู','ุฏุฌุงุฌู','ูุฏุฑุณู','ุงููุงู','ุบุฑูู','ุซูุงุฌู','ูููู','ุณูููู','ุงูุนุฑุงู','ูุญุทู','ุทูุงุฑู','ุฑุงุฏุงุฑ','ููุฒู','ูุณุชุดูู','ููุฑุจุงุก','ุชูุงุญู','ุงุฎุทุจูุท','ุณูููู','ูุฑูุณุง','ุจุฑุชูุงูู','ุชูุงุญ','ูุทุฑูู','ุจุชูุชู','ููุงูู','ุดุจุงู','ุจุงุต','ุณููู','ุฐุจุงุจ','ุชููุงุฒ','ุญุงุณูุจ','ุงูุชุฑููุช','ุณุงุญู','ุฌุณุฑ'};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุณุญูุฑ','ุณ ุฑ ู ุญ')
name = string.gsub(name,'ุณูุงุฑู','ู ุฑ ุณ ู ุง')
name = string.gsub(name,'ุงุณุชูุจุงู','ู ุจ ุง ุช ู ุณ ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุงูููู','ู ู ู ุง')
name = string.gsub(name,'ุจุฒููู','ุฒ ู ู ู')
name = string.gsub(name,'ูุทุจุฎ','ุฎ ุจ ุท ู')
name = string.gsub(name,'ูุฑุณุชูุงูู','ุณ ุช ุง ู ู ู ุฑ ู')
name = string.gsub(name,'ุฏุฌุงุฌู','ุฌ ุฌ ุง ุฏ ู')
name = string.gsub(name,'ูุฏุฑุณู','ู ู ุฏ ุฑ ุณ')
name = string.gsub(name,'ุงููุงู','ู ุง ู ุง ู')
name = string.gsub(name,'ุบุฑูู','ุบ ู ุฑ ู')
name = string.gsub(name,'ุซูุงุฌู','ุฌ ู ุช ู ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ุงูุนุฑุงู','ู ุน ุง ู ุฑ ุง')
name = string.gsub(name,'ูุญุทู','ู ุท ู ุญ')
name = string.gsub(name,'ุทูุงุฑู','ุฑ ุง ุท ู ู')
name = string.gsub(name,'ุฑุงุฏุงุฑ','ุฑ ุง ุฑ ุง ุฏ')
name = string.gsub(name,'ููุฒู','ู ุฒ ู ู')
name = string.gsub(name,'ูุณุชุดูู','ู ุด ุณ ู ุช ู')
name = string.gsub(name,'ููุฑุจุงุก','ุฑ ุจ ู ู ุง ุก')
name = string.gsub(name,'ุชูุงุญู','ุญ ู ุง ุช ู')
name = string.gsub(name,'ุงุฎุทุจูุท','ุท ุจ ู ุง ุฎ ุท')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ูุฑูุณุง','ู ู ุฑ ุณ ุง')
name = string.gsub(name,'ุจุฑุชูุงูู','ุฑ ุช ู ุจ ุง ู ู')
name = string.gsub(name,'ุชูุงุญ','ุญ ู ุง ุช')
name = string.gsub(name,'ูุทุฑูู','ู ุท ู ุฑ ู')
name = string.gsub(name,'ุจุชูุชู','ุจ ุช ุช ู ู')
name = string.gsub(name,'ููุงูู','ู ู ู ู ู')
name = string.gsub(name,'ุดุจุงู','ุจ ุด ุง ู')
name = string.gsub(name,'ุจุงุต','ุต ุง ุจ')
name = string.gsub(name,'ุณููู','ู ุณ ู ู')
name = string.gsub(name,'ุฐุจุงุจ','ุจ ุง ุจ ุฐ')
name = string.gsub(name,'ุชููุงุฒ','ุช ู ู ุฒ ุง')
name = string.gsub(name,'ุญุงุณูุจ','ุณ ุง ุญ ู ุจ')
name = string.gsub(name,'ุงูุชุฑููุช','ุง ุช ู ุฑ ู ู ุช')
name = string.gsub(name,'ุณุงุญู','ุญ ุง ู ุณ')
name = string.gsub(name,'ุฌุณุฑ','ุฑ ุฌ ุณ')
AEKTEAM = 'ใโ ุงูู ูุงุญุฏ ูุฑุชุจูุง ูุฑุจุญ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุชุฑุชูุจ ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end
if text == 'ูุญูุจุณ' and ChCheck(msg) or text == 'ุจุงุช' and ChCheck(msg) or text == 'ุงููุญูุจุณ' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAek:set(AEK.."GAMES"..msg.chat_id_,Num) 
TEST = [[
โ     โ     โ     โ     โ     โ
โ     โ     โ     โ     โ     โ
๐ โนโบ ๐๐ป โนโบ ๐๐ผ โนโบ ๐๐ฝ โนโบ ๐๐พ โนโบ ๐๐ฟ

ใโ ุงุฎุชุฑ ุฑูู ูุงุณุชุฎุฑุงุฌ ุงููุญูุจุณ
ใโ ุงููุงุฆุฒ ูุญุตู ุนูู (5) ููุงุท
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAek:setex(AEK.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'ุญุฒูุฑู' and ChCheck(msg) or text == 'ุงูุญุฒูุฑู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ุงูุฌุฑุณ','ุนูุฑุจ ุงูุณุงุนู','ุงูุณูู','ุงููุทุฑ','5','ุงููุชุงุจ','ุงูุจุณูุงุฑ','7','ุงููุนุจู','ุจูุช ุงูุดุนุฑ','ููุงูู','ุงูุง','ุงูู','ุงูุงุจุฑู','ุงูุณุงุนู','22','ุบูุท','ูู ุงูุณุงุนู','ุงูุจูุชูุฌุงู','ุงูุจูุถ','ุงููุฑุงูู','ุงูุถูุก','ุงูููุงุก','ุงูุถู','ุงูุนูุฑ','ุงูููู','ุงููุดุท','ุงูุญูุฑู','ุงูุจุญุฑ','ุงูุซูุฌ','ุงูุงุณููุฌ','ุงูุตูุช','ุจูู'};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูุฌุฑุณ','ุดูุฆ ุงุฐุง ููุณุชู ุตุฑุฎ ูุง ููู ุ')
name = string.gsub(name,'ุนูุฑุจ ุงูุณุงุนู','ุงุฎูุงู ูุง ูุณุชุทูุนุงู ุชูุถูู ุงูุซุฑ ูู ุฏูููู ูุนุง ููุง ููุง ุ')
name = string.gsub(name,'ุงูุณูู','ูุง ูู ุงูุญููุงู ุงูุฐู ูู ูุตุนุฏ ุงูู ุณูููุฉ ููุญ ุนููู ุงูุณูุงู ุ')
name = string.gsub(name,'ุงููุทุฑ','ุดูุฆ ูุณูุท ุนูู ุฑุฃุณู ูู ุงูุงุนูู ููุง ูุฌุฑุญู ููุง ูู ุ')
name = string.gsub(name,'5','ูุง ุงูุนุฏุฏ ุงูุฐู ุงุฐุง ุถุฑุจุชู ุจููุณู ูุงุถูุช ุนููู 5 ูุตุจุญ ุซูุงุซูู ')
name = string.gsub(name,'ุงููุชุงุจ','ูุง ุงูุดูุฆ ุงูุฐู ูู ุงูุฑุงู ูููุณ ูู ุฌุฐูุฑ ุ')
name = string.gsub(name,'ุงูุจุณูุงุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุง ููุดู ุงูุง ุจุงูุถุฑุจ ุ')
name = string.gsub(name,'7','ุนุงุฆูู ูุคููู ูู 6 ุจูุงุช ูุงุฎ ููู ูููู .ููู ุนุฏุฏ ุงูุฑุงุฏ ุงูุนุงุฆูู ')
name = string.gsub(name,'ุงููุนุจู','ูุง ูู ุงูุดูุฆ ุงูููุฌูุฏ ูุณุท ููุฉ ุ')
name = string.gsub(name,'ุจูุช ุงูุดุนุฑ','ูุง ูู ุงูุจูุช ุงูุฐู ููุณ ููู ุงุจูุงุจ ููุง ููุงูุฐ ุ ')
name = string.gsub(name,'ููุงูู','ูุญุฏู ุญููู ููุบุฑูุฑู ุชูุจุณ ููุฉ ุชููุฑู .ูู ููู ุ ')
name = string.gsub(name,'ุงูุง','ุงุจู ุงูู ูุงุจู ุงุจูู ูููุณ ุจุงุฎุชู ููุง ุจุงุฎูู ููู ูููู ุ')
name = string.gsub(name,'ุงูู','ุงุฎุช ุฎุงูู ูููุณุช ุฎุงูุชู ูู ุชููู ุ ')
name = string.gsub(name,'ุงูุงุจุฑู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููุง ุฎุทุง ุฎุทูู ููุฏ ุดูุฆุง ูู ุฐููู ุ ')
name = string.gsub(name,'ุงูุณุงุนู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููู ุงูุตุฏู ููููู ุงุฐุง ุฌุงุน ูุฐุจ ุ')
name = string.gsub(name,'22','ูู ูุฑู ููุทุจู ุนูุฑุจุง ุงูุณุงุนู ุนูู ุจุนุถููุง ูู ุงูููู ุงููุงุญุฏ ')
name = string.gsub(name,'ุบูุท','ูุง ูู ุงููููู ุงููุญูุฏู ุงูุชู ุชููุถ ุบูุท ุฏุงุฆูุง ุ ')
name = string.gsub(name,'ูู ุงูุณุงุนู','ูุง ูู ุงูุณุคุงู ุงูุฐู ุชุฎุชูู ุงุฌุงุจุชู ุฏุงุฆูุง ุ')
name = string.gsub(name,'ุงูุจูุชูุฌุงู','ุฌุณู ุงุณูุฏ ูููุจ ุงุจูุถ ูุฑุงุณ ุงุฎุธุฑ ููุง ูู ุ')
name = string.gsub(name,'ุงูุจูุถ','ูุงูู ุงูุดูุฆ ุงูุฐู ุงุณูู ุนูู ูููู ุ')
name = string.gsub(name,'ุงููุฑุงูู','ุงุฑู ูู ุดูุฆ ูู ุฏูู ุนููู ูู ุงููู ุ ')
name = string.gsub(name,'ุงูุถูุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฎุชุฑู ุงูุฒุฌุงุฌ ููุง ููุณุฑู ุ')
name = string.gsub(name,'ุงูููุงุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุณูุฑ ุงูุงูู ููุง ุชุฑุงู ุ')
name = string.gsub(name,'ุงูุถู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุงุญูู ุงูููุง ุชุฐูุจ ุ ')
name = string.gsub(name,'ุงูุนูุฑ','ูุง ูู ุงูุดูุก ุงูุฐู ูููุง ุทุงู ูุตุฑ ุ ')
name = string.gsub(name,'ุงูููู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุชุจ ููุง ููุฑุฃ ุ')
name = string.gsub(name,'ุงููุดุท','ูู ุฃุณูุงู ููุง ูุนุถ ูุง ูู ุ ')
name = string.gsub(name,'ุงูุญูุฑู','ูุง ูู ุงูุดูุฆ ุงุฐุง ุฃุฎุฐูุง ููู ุงุฒุฏุงุฏ ููุจุฑ ุ')
name = string.gsub(name,'ุงูุจุญุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฑูุน ุงุซูุงู ููุง ููุฏุฑ ูุฑูุน ูุณูุงุฑ ุ')
name = string.gsub(name,'ุงูุซูุฌ','ุงูุง ุงุจู ุงููุงุก ูุงู ุชุฑูููู ูู ุงููุงุก ูุช ููู ุงูุง ุ')
name = string.gsub(name,'ุงูุงุณููุฌ','ููู ุซููุจ ููุน ุฐุงูู ุงุญูุถ ุงููุงุก ููู ุงููู ุ')
name = string.gsub(name,'ุงูุตูุช','ุงุณูุฑ ุจูุง ุฑุฌููู ููุง ุงุฏุฎู ุงูุง ุจุงูุงุฐููู ููู ุงูุง ุ')
name = string.gsub(name,'ุจูู','ุญุงูู ููุญููู ูุตู ูุงุดู ููุตู ูุจููู ููู ุงููู ุ ')
AEKTEAM = 'ใโ ุงูู ูุงุญุฏ ูุญููุง ูุฑุจุญ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุญุฒูุฑู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุนุงูู' and ChCheck(msg) or text == 'ูุนุงูู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ูุฑุฏ','ุฏุฌุงุฌู','ุจุทุฑูู','ุถูุฏุน','ุจููู','ูุญูู','ุฏูู','ุฌูู','ุจูุฑู','ุฏููููู','ุชูุณุงุญ','ูุฑุด','ููุฑ','ุงุฎุทุจูุท','ุณููู','ุฎูุงุด','ุงุณุฏ','ูุฃุฑ','ุฐุฆุจ','ูุฑุงุดู','ุนูุฑุจ','ุฒุฑุงูู','ูููุฐ','ุชูุงุญู','ุจุงุฐูุฌุงู'}
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum2'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ูุฑุฏ','๐')
name = string.gsub(name,'ุฏุฌุงุฌู','๐')
name = string.gsub(name,'ุจุทุฑูู','๐ง')
name = string.gsub(name,'ุถูุฏุน','๐ธ')
name = string.gsub(name,'ุจููู','๐ฆ')
name = string.gsub(name,'ูุญูู','๐')
name = string.gsub(name,'ุฏูู','๐')
name = string.gsub(name,'ุฌูู','๐ซ')
name = string.gsub(name,'ุจูุฑู','๐')
name = string.gsub(name,'ุฏููููู','๐ฌ')
name = string.gsub(name,'ุชูุณุงุญ','๐')
name = string.gsub(name,'ูุฑุด','๐ฆ')
name = string.gsub(name,'ููุฑ','๐')
name = string.gsub(name,'ุงุฎุทุจูุท','๐')
name = string.gsub(name,'ุณููู','๐')
name = string.gsub(name,'ุฎูุงุด','๐ฆ')
name = string.gsub(name,'ุงุณุฏ','๐ฆ')
name = string.gsub(name,'ูุฃุฑ','๐ญ')
name = string.gsub(name,'ุฐุฆุจ','๐บ')
name = string.gsub(name,'ูุฑุงุดู','๐ฆ')
name = string.gsub(name,'ุนูุฑุจ','๐ฆ')
name = string.gsub(name,'ุฒุฑุงูู','๐ฆ')
name = string.gsub(name,'ูููุฐ','๐ฆ')
name = string.gsub(name,'ุชูุงุญู','๐')
name = string.gsub(name,'ุจุงุฐูุฌุงู','๐')
AEKTEAM = 'ใโ ูุง ูุนูู ูุฐุง ุงูุณูุงูู :ุ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum2'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงููุนุงูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงูุนูุณ' and ChCheck(msg) or text == 'ุนูุณ' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ุจุงู','ูููุช','ููุฒูู','ุงุณูุนู','ุงุญุจู','ููุญูู','ูุถูู','ุญุงุฑู','ูุงุตู','ุฌูู','ุณุฑูุน','ููุณู','ุทููู','ุณููู','ุถุนูู','ุดุฑูู','ุดุฌุงุน','ุฑุญุช','ุนุฏู','ูุดูุท','ุดุจุนุงู','ููุนุทุดุงู','ุฎูุด ููุฏ','ุงูู','ูุงุฏุฆ'}
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum3'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุจุงู','ููู')
name = string.gsub(name,'ูููุช','ูุงูููุช')
name = string.gsub(name,'ููุฒูู','ุฒูู')
name = string.gsub(name,'ุงุณูุนู','ูุงุณูุนู')
name = string.gsub(name,'ุงุญุจู','ูุงุญุจู')
name = string.gsub(name,'ูุญูู','ุญูู')
name = string.gsub(name,'ูุถูู','ูุตุฎ')
name = string.gsub(name,'ุญุงุฑู','ุจุงุฑุฏู')
name = string.gsub(name,'ูุงุตู','ุนุงูู')
name = string.gsub(name,'ุฌูู','ููู')
name = string.gsub(name,'ุณุฑูุน','ุจุทูุก')
name = string.gsub(name,'ููุณู','ุถูุฌู')
name = string.gsub(name,'ุทููู','ูุฒู')
name = string.gsub(name,'ุณููู','ุถุนูู')
name = string.gsub(name,'ุถุนูู','ููู')
name = string.gsub(name,'ุดุฑูู','ููุงุฏ')
name = string.gsub(name,'ุดุฌุงุน','ุฌุจุงู')
name = string.gsub(name,'ุฑุญุช','ุงุฌูุช')
name = string.gsub(name,'ุญู','ููุช')
name = string.gsub(name,'ูุดูุท','ูุณูู')
name = string.gsub(name,'ุดุจุนุงู','ุฌูุนุงู')
name = string.gsub(name,'ููุนุทุดุงู','ุนุทุดุงู')
name = string.gsub(name,'ุฎูุด ููุฏ','ููุฎูุด ููุฏ')
name = string.gsub(name,'ุงูู','ูุทู')
name = string.gsub(name,'ูุงุฏุฆ','ุนุตุจู')
AEKTEAM = 'ใโ ูุง ูู ุนูุณ ูููุฉ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum3'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงูุนูุณ ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุฎุชูู' and ChCheck(msg) or text == 'ูุฎุชูู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'๐ธ','โ?','๐ผ','๐','๐','๐','โญ๏ธ','๐ฅ','โ','๐ฅ','โ๏ธ','๐จโ๐ฌ','๐จโ๐ป','๐จโ๐ง','๐ฉโ๐ณ','๐งโโ','๐งโโ๏ธ','๐งโโ','๐โโ','๐งโโ','๐ฌ','๐จโ๐จโ๐ง','๐','๐ค','โ๏ธ','๐','๐ฉโโ๏ธ','๐จโ๐จ'};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum4'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐ธ','๐น๐น๐น๐ธ๐น๐น๐น๐น')
name = string.gsub(name,'โ?๏ธ','๐๐๐โ?๏ธ๐๐๐๐')
name = string.gsub(name,'๐ผ','๐ป๐ป๐ป๐ป๐ป๐ป๐ป๐ผ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'โญ๏ธ','๐๐๐๐๐๐โญ๏ธ๐')
name = string.gsub(name,'๐ฅ','๐ซ๐ซ๐ซ๐ฅ๐ซ๐ซ๐ซ๐ซ')
name = string.gsub(name,'โ','๐จ๐จ๐จโ๐จ๐จ๐จ๐จ')
name = string.gsub(name,'๐ฅ','โ๏ธโ๏ธโ๏ธ๐ฅโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'โ๏ธ','โ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'๐จโ๐ฌ','๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐จโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ')
name = string.gsub(name,'๐จโ๐ป','๐ฉโ๐ป๐ฉโ๐ป๐จโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป')
name = string.gsub(name,'๐จโ๐ง','๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐จโ๐ง๐ฉโ๐ง')
name = string.gsub(name,'๐ฉโ๐ณ','๐จโ๐ณ๐จโ๐ณ๐ฉโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐โโ๏ธ','๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐ฌ','๐ญ๐ญ๐ญ๐ญ๐ฌ๐ญ๐ญ๐ญ')
name = string.gsub(name,'๐จโ๐จโ๐ง','๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ง๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ค','๐ฅ๐ฅ๐ฅ๐ฅ๐ฅ๐ค๐ฅ๐ฅ')
name = string.gsub(name,'โ๏ธ','โณโณโณโณโณโ๏ธโณโณ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ฉโโ๏ธ','๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐ฉโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ')
name = string.gsub(name,'๐จโ๐จ','๐ฉโ๐จ๐ฉโ๐จ๐จโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ')
AEKTEAM = 'ใโ ุงูู ูุงุญุฏ ูุทูุน ุงููุฎุชูู ูุฑุจุญ\n{'..name..'} '
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum4'..msg.chat_id_) and not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงููุฎุชูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุซูู' and ChCheck(msg) or text == 'ุงูุงูุซูู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {
'ุฌูุฒ','ุถุฑุงุทู','ุงูุญุจู','ุงูุญุงูู','ุดูุฑู','ุจูุฏู','ุณูุงูู','ุงููุฎูู','ุงูุฎูู','ุญุฏุงุฏ','ุงููุจูู','ูุฑูุต','ูุฑุฏ','ุงูุนูุจ','ุงูุนูู','ุงูุฎุจุฒ','ุจุงูุญุตุงุฏ','ุดูุฑ','ุดูู','ููุญูู',
};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum5'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฌูุฒ','ููุทู ___ ูููุงุนูุฏู ุณููู')
name = string.gsub(name,'ุถุฑุงุทู','ุงูู ูุณูู ุงููุทู ูุชุญูู ___ ')
name = string.gsub(name,'ุจูุฏู','ุงูู ___ ูุญุฏ ูููุฏู')
name = string.gsub(name,'ุงูุญุงูู','ุชุฌุฏู ูู ___ ูุนุงู')
name = string.gsub(name,'ุดูุฑู','ูุน ุงูุฎูู ูุง ___ ')
name = string.gsub(name,'ุงููุฎูู','ุงูุทูู ุทูู ___ ูุงูุนูู ุนูู ุงูุตุฎูุฉ')
name = string.gsub(name,'ุณูุงูู','ุจุงููุฌู ุงูุฑุงูุฉ ูุจุงูุธูุฑ ___ ')
name = string.gsub(name,'ุงูุฎูู','ูู ููุฉ ___ ุดุฏู ุนูู ุงูฺูุงุจ ุณุฑูุฌ')
name = string.gsub(name,'ุญุฏุงุฏ','ูููู ูู ุตุฎู ูุฌูู ูุงู ุขูู ___ ')
name = string.gsub(name,'ุงููุจูู',' ___ ูุง ูุฎุงู ูู ุงููุทุฑ')
name = string.gsub(name,'ุงูุญุจู','ุงููู ุชูุฏุบุฉ ุงูุญูุฉ ูุฎุงู ูู ุฌุฑุฉ ___ ')
name = string.gsub(name,'ูุฑูุต','ุงููุงูุนุฑู ___ ูููู ุงููุงุน ุนูุฌู')
name = string.gsub(name,'ุงูุนูุจ','ุงููุงูููุญ ___ ูููู ุญุงูุถ')
name = string.gsub(name,'ุงูุนูู','___ ุฅุฐุง ุญุจุช ุงูฺูุฉ ุงุจููุณ ูุฏุฎู ุงูุฌูุฉ')
name = string.gsub(name,'ุงูุฎุจุฒ','ุงูุทู ___ ููุฎุจุงุฒ ุญุชู ูู ูุงูู ูุตู')
name = string.gsub(name,'ุจุงูุญุตุงุฏ','ุงุณูุฉ ___ ูููุฌูู ููุณูุฑ')
name = string.gsub(name,'ุดูุฑ','ุงูุดู ___ ููุง ุชุนุจุฑ ููุฑ')
name = string.gsub(name,'ุดูู','ูุงูู ุชุนุจ ูุงูู ___ ูุง ูู ุนูู ุงูุญุงุถุฑ ููุฉ')
name = string.gsub(name,'ุงููุฑุฏ',' ___ ุจุนูู ุงูู ุบุฒุงู')
name = string.gsub(name,'ููุญูู','ุงุฌู ___ ุนูุงูุง')
AEKTEAM = 'ใโ ุงููู ุงููุซุงู ุงูุชุงูู โซ ['..name..']'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum5'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAek:del(AEK..'Aek:GameNum5'..msg.chat_id_)
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงูุซูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุฑูุงุถูุงุช' and ChCheck(msg) or text == 'ุงูุฑูุงุถูุงุช' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum6'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 รท 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 รท 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
AEKTEAM = 'ใโ ุงููู ุงููุนุงุฏูู ุงูุชุงููู โซ โค\n{'..name..'} '
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum6'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAek:del(AEK..'Aek:GameNum6'..msg.chat_id_)
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุฑูุงุถูุงุช ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุงููููุฒู' and ChCheck(msg) or text == 'ุงูุงูุฌููุฒูู' and ChCheck(msg) or text == 'ุงููููุฒูู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ูุนูููุงุช','ูููุงุช','ูุฌููุนุงุช','ูุชุงุจ','ุชูุงุญู','ุณุฏูู','ูููุฏ','ุงุนูู','ุฐุฆุจ','ุชูุณุงุญ','ุฐูู','ุดุงุทุฆ','ุบุจู',};
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum7'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฐุฆุจ','Wolf')
name = string.gsub(name,'ูุนูููุงุช','Information')
name = string.gsub(name,'ูููุงุช','Channels')
name = string.gsub(name,'ูุฌููุนุงุช','Groups')
name = string.gsub(name,'ูุชุงุจ','Book')
name = string.gsub(name,'ุชูุงุญู','Apple')
name = string.gsub(name,'ูููุฏ','money')
name = string.gsub(name,'ุงุนูู','I know')
name = string.gsub(name,'ุชูุณุงุญ','crocodile')
name = string.gsub(name,'ุดุงุทุฆ','Beach')
name = string.gsub(name,'ุบุจู','Stupid')
name = string.gsub(name,'ุตุฏุงูู','Friendchip')
AEKTEAM = 'ใโ ูุง ูุนูู ูููุฉ โซ '..name
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum7'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAek:del(AEK..'Aek:GameNum7'..msg.chat_id_)
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงููููุฒูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end  
--     Source AEK     --
if text == 'ุงุณุฆูู' and ChCheck(msg) or text == 'ุงุฎุชูุงุฑุงุช' and ChCheck(msg) or text == 'ุงูุงุณุฆูู' and ChCheck(msg) or text == 'ุงุณุงูู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek2 = {'ุงูููู','14','ุงููู','11','30','ุจูุชูู','ุณุชูู ุฌูุจุฑ','ุจุงุฑูุณ','10','ุงูููู','ุญุฑู ุงููุงู','ุงูุดุนุฑ','ุณุญุงุจ','ุงูุงุณู','ุฐูุจ','ุญุฑู ุงูุงู','ุงูุนุฒุงุฆู','ุงูุณุงุช','ุงูููุฌููู','ุงุณูุง','6','ุงูุงุณุฏ','ููุฑ','ุงูุฏููููู','ุงูุฑูุจุง','ุงูุฒุฆุจู','ููุฏู','ุงูุงูุณุงู','ุทูููู','ุฎุฏูุฌู',}
name = DevAek2[math.random(#DevAek2)]
DevAek:set(AEK..'Aek:GameNum8'..msg.chat_id_,name)
DevAek:del(AEK..'Aek:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูููู','ใโ ูุงูู ุงุทูู ููุฑ ูู ุงูุนุงูู ุ\n1- ุงูููู\n2- ุงููุฑุงุช\n3- ููุฑ ุงููููุบู')
name = string.gsub(name,'14','ใโ ูุงุนุฏุฏ ุนุธุงู ุงููุฌู ุ\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'ุงููู','ใโ ูุฑุงุณู ุจูุถุงุก ูุฌุฏุฑุงู ูุฑุฏูู ุงุฐุง ุงุบููุชู ุงุตุจุญ ุธูุงู  ููู ุงููู ุ\n1- ุงููู\n2- ุงูุงุฐู\n3- ุงูุซูุงุฌู')
name = string.gsub(name,'11','ใโ ูู ุฌุฒุก ูุญุชูู ูุณูุณู ูุงุฏู ุงูุฐุฆุงุจ ุ\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','ใโ ูู ุฌุฒุก ูุญุชูู ุงููุฑุงู ุงููุฑูู ุ\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'ุจูุชูู','ใโ ูู ููู ุงุบูู ุฑุฆูุณ ูู ุงูุนุงูู ุ\n1- ุชุฑุงูุจ\n2- ุงูุจุงูุง\n3- ุจูุชูู')
name = string.gsub(name,'ุณุชูู ุฌูุจุฑ','ใโ ูู ููู ูุคุณุณ ุดุฑูู ุงุจู ุงูุนุงูููู  ุ\n1- ูุงุฑู ุจุงูุฌ\n2- ุจูู ุฌูุชุณ\n3- ุณุชูู ุฌูุจุฑ')
name = string.gsub(name,'ุจุงุฑูุณ','ูุงูู ุนุงุตูู ูุฑูุณุง ุ\n1- ุจุงุฑูุณ\n2- ูููู\n3- ููุณูู')
name = string.gsub(name,'10','ใโ ูุงุนุฏุฏ ุฏูู ุงูุนุฑุจูู ุงูุชู ุชูุฌุฏ ูู ุงูุฑูููุง ุ\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'ุงูููู','ใโ ูุงูู ุงูุญููุงู ุงูุฐู ูุญูู 50 ููู ูุฒูู ุ\n1- ุงูููู\n2- ุงูููู\n3- ุงูุซูุฑ')
name = string.gsub(name,'ุญุฑู ุงููุงู','ใโ ูุงุฐุง ููุฌุฏ ุจููู ูุจููู ุ\n1- ุงูุถู\n2- ุงูุงุฎูุงู\n3- ุญุฑู ุงููุงู')
name = string.gsub(name,'ุงูุดุนุฑ','ใโ ูุงูู ุงูุดูุก ุงููุจุงุช ููุจุช ููุงูุณุงู ุจูุง ุจุฐุฑ ุ\n1- ุงูุงุถุงูุฑ\n2- ุงูุงุณูุงู\n3- ุงูุดุนุฑ')
name = string.gsub(name,'ุณุญุงุจ','ใโ ูุง ูู ุงูุดููุก ุงูุฐู ูุณุชุทูุน ุงููุดู ุจุฏูู ุฃุฑุฌู ูุงูุจูุงุก ุจุฏูู ุฃุนูู ุ\n1- ุณุญุงุจ\n2- ุจุฆุฑ\n3- ููุฑ')
name = string.gsub(name,'ุงูุงุณู','ใโ ูุง ุงูุดูุก ุงูุฐู ููุชููู , ูููู ุบูุฑูุง ูุณุชุนููู ุฃูุซุฑ ูููุง ุ\n1- ุงูุนูุฑ\n2- ุณุงุนู\n3- ุงูุงุณู')
name = string.gsub(name,'ุฐูุจ','ใโ ุงุตูุฑ ุงูููู ุณุงุฑู ุนููู ุงูู ุงูููู ูุญุงุฑููู ูุฐูุฐ ุงูููู ุ\n1- ูุญุงุณ\n2- ุงููุงุณ\n3- ุฐูุจ')
name = string.gsub(name,'ุญุฑู ุงูุงู','ใโ ูู ุงูููู ุซูุงุซุฉ ูููู ูู ุงูููุงุฑ ูุงุญุฏู ููุง ูู ุ\n1- ุญุฑู ุงูุจุงุก\n2- ุญุฑู ุงูุงู\n3- ุญุฑู ุงูุฑุงุก')
name = string.gsub(name,'ุงูุนุฒุงุฆู','ใโ ุนูู ูุฏุฑ ุงุตู ุงูุนุฒู ุชุฃุชู ุ\n1- ุงูุนุฒุงุฆู\n2- ุงูููุงุฑู\n3- ุงููุจุงุฆุจ')
name = string.gsub(name,'ุงูุณุงุช','ใโ ูุงูู ุฌูุน ูููู ุงูุณู ุ\n1- ุณูุฏุงุช\n2- ุงูุณุงุช\n3- ููุงูุต')
name = string.gsub(name,'ุงูููุฌููู','ใโ ุงูู ุงุชุณุนููุช ูุฏููุง ูู ุงูุญุฑูุจ ุ\n1- ุงูุตุงุฑูุฎ\n2- ุงููุณุฏุณ\n3- ุงูููุฌููู')
name = string.gsub(name,'ุงุณูุง','ใโ ุชูุน ูุจูุงู ูู ูุงุฑู ุ\n1- ุงูุฑูููุง\n2- ุงุณูุง\n3- ุงูุฑููุง ุงูุดูุงููู')
name = string.gsub(name,'6','ใโ ูู ุตูุฑุง ููููููู ุ\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'ุงูุงุณุฏ','ใโ ูุงูู ุงูุญููุงู ุงูุฐู ูููุจ ุจููู ุงูุบุงุจู ุ\n1- ุงูููู\n2- ุงูุงุณุฏ\n3- ุงูููุฑ')
name = string.gsub(name,'ููุฑ','ใโ ูุง ุงุณู ุตุบูุฑ ุงูุญุตุงู ุ\n1- ููุฑ\n2- ุฌุฑู\n3- ุนุฌู')
name = string.gsub(name,'ุงูุฏููููู','ใโ ูุง ุงูุญููุงู ุงูุฐู ููุงู ูุงุญุฏู ุนููู ููุชูุญู ุ\n1- ุงููุฑุด\n2- ุงูุฏููููู\n3- ุงูุซุนูุจ\n')
name = string.gsub(name,'ุงูุฑูุจุง','ใโ ูุงูู ุงููุงุฑู ุงูุชู ุชููุจ ุจุงููุงุฑู ุงูุนุฌูุฒ ุ\n1- ุงูุฑูุจุง\n2- ุงูุฑููุง ุงูุดูุงููู\n3- ุงูุฑูููุง')
name = string.gsub(name,'ุงูุฒุฆุจู','ใโ ูุง ุงุณู ุงููุนุฏู ุงูููุฌูุฏ ููู ุงูุญุงูู ุงูุณุงุฆูู ุ\n1- ุงููุญุงุณ\n2- ุงูุญุฏูุฏ\n3- ุงูุฒุฆุจู')
name = string.gsub(name,'ููุฏู','ใโ ูุงูู ุนุงุตูู ุงูุฌูุชุฑุง ุ\n1- ููุฏู\n2- ููุฑุณูู\n3- ุชุฑููุง')
name = string.gsub(name,'ุงูุงูุณุงู','ใโ ูุงูู ุงูุดุฆ ุงูุฐู ุจุฑุฃุณู ุณุจุน ูุชุญุงุช ุ\n1- ุงููุงุชู\n2- ุงูุชููุงุฒ\n3- ุงูุงูุณุงู')
name = string.gsub(name,'ุทูููู','ใโ ูุงูู ุนุงุตูู ุงููุงุจุงู ุ\n1- ุจุงูููู\n2- ููู ุฏููู\n3- ุทูููู')
name = string.gsub(name,'ุฎุฏูุฌู','ใโ ูู ูู ุฒูุฌู ุงูุฑุณูู ุงูุงูุจุฑ ููู ุณูุข ุ\n1- ุญูุถู\n2- ุฒููุจ\n3- ุฎุฏูุฌู')
AEKTEAM = name..'\nใโ ุงุฑุณู ุงูุฌูุงุจ ุงูุตุญูุญ ููุท'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
return false
end end
if text == DevAek:get(AEK..'Aek:GameNum8'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Games:Ids'..msg.chat_id_) then 
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAek:del(AEK..'Aek:GameNum8'..msg.chat_id_)
AEKTEAM = 'ใโ ูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nใโ ุงุฑุณู โซ ุงูุงุณุฆูู ููุนุจ ูุฑู ุงุฎุฑู'
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md')
end
DevAek:set(AEK..'Aek:Games:Ids'..msg.chat_id_,true)
end  
--     Source AEK     --
if DevAek:get(AEK.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Aek(msg.chat_id_, msg.id_, 1,"ใโ ุนุฐุฑุง ูุง ููููู ุชุฎููู ุนุฏุฏ ุงูุจุฑ ูู ุงูู20 ุฎูู ุฑูู ูุง ุจูู ุงูู1 ูุงูู20", 1, 'md')
return false  end 
local GETNUM = DevAek:get(AEK.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAek:del(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAek:del(AEK.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ *ุงูุชุฎููู ุงูุตุญูุญ ูู* โซ '..NUM..'\nใโ *ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAek:incrby(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAek:get(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAek:del(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAek:del(AEK.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ *ุงูุชุฎููู ุงูุตุญูุญ ูู* โซ '..GETNUM..'\nใโ *ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ูุฑู ุงุฎุฑู ูุชุฎููู ุงูุฑูู ุงูุตุญูุญ*', 1, 'md')
else
if tonumber(DevAek:get(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'ูุญุงููุชุงู ููุท'
elseif tonumber(DevAek:get(AEK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'ูุญุงููู ูุงุญุฏู ููุท'
end
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุฏ ุฎููุช ุงูุฑูู ุงูุฎุทุง ูุชุจูู ูุฏูู '..SetNum..' ุงุฑุณู ุฑูู ุชุฎููู ูุฑู ุงุฎุฑู ููููุฒ', 1, 'md')
end
end
end
end
if text == 'ุฎูู' and ChCheck(msg) or text == 'ุชุฎููู' and ChCheck(msg) then   
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAek:set(AEK.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงููุง ุจู ุนุฒูุฒู ูู ูุนุจุฉ ุงูุชุฎููู โซ โค\n โโโโโโปใโปโโโโโ\nใโ ุณูุชู ุชุฎููู ุนุฏุฏ ูุง ุจูู ุงูู1 ูุงูู20 ุงุฐุง ุชุนุชูุฏ ุงูู ุชุณุชุทูุน ุงูููุฒ ุฌุฑุจ ูุงููุนุจ ุงูุงู .\nใโ ููุงุญุธู ูุฏูู ุซูุงุซ ูุญุงููุงุช ููุท ููุฑ ูุจู ุงุฑุณุงู ุชุฎูููู !', 1, 'md')
DevAek:setex(AEK.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source AEK     --
if text == 'ุฑูููุช' then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
DevAek:del(AEK.."Aek:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAek:del(AEK..'Aek:ListRolet'..msg.chat_id_)  
DevAek:setex(AEK.."Aek:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุญุณูุง ูููุนุจ , ุงุฑุณู ุนุฏุฏ ุงููุงุนุจูู ููุฑูููุช .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAek:get(AEK.."Aek:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "ใโ ูุง ุงุณุชุทูุน ุจุฏุก ุงููุนุจู ุจูุงุนุจ ูุงุญุฏ ููุท"
else
DevAek:set(AEK.."Aek:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = 'ใโ ุชู ุจุฏุก ุชุณุฌูู ุงููุณุชู ูุฑุฌู ุงุฑุณุงู ุงููุนุฑูุงุช \nใโ ุงููุงุฆุฒ ูุญุตู ุนูู 5 ููุงุท ุนุฏุฏ ุงููุทููุจูู โซ '..text..' ูุงุนุจ'
end
DevAek:del(AEK.."Aek:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAek:get(AEK.."Aek:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAek:sismember(AEK..'Aek:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'ใโ ุงููุนุฑู โซ ['..text..'] ููุฌูุฏ ุงุณุงุณุง')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงููุนุฑู ุบูุฑ ุตุญูุญ ูุฑุฌู ุงุฑุณุงู ูุนุฑู ุตุญูุญ', 1, 'md')
return false 
end
DevAek:sadd(AEK..'Aek:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAek:get(AEK.."Aek:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAek:scard(AEK..'Aek:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAek:del(AEK.."Aek:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAek:setex(AEK.."Aek:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "ใโ ุชู ุงุฏุฎุงู ุงููุนุฑู โซ ["..text.."]\nใโ ูุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/YesRolet"},{text="ูุง",callback_data="/NoRolet"}},{{text="ุงููุงุนุจูู",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "ใโ ุชู ุงุฏุฎุงู ุงููุนุฑู โซ ["..text.."] ูุชุจูู โซ "..CountUser.." ูุงุนุจูู ูููุชูู ุงูุนุฏุฏ ุงุฑุณู ุงููุนุฑู ุงูุงุฎุฑ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="ุงูุบุงุก",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source AEK     --
if text == 'ุตุฑุงุญู' and ChCheck(msg) or text == 'ุงูุตุฑุงุญู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
local AEKTEAM = {"ูู ุชุนุฑุถุช ูุบุฏุฑ ูู ุญูุงุชูุโข","ูู ุชุนุฑู ุนููุจูุโข","ูู ุชุนุฑุถุช ููุฎูุงูุฉ ูู ูููู ูุงุโข","ูุง ูู ุงููุฑุงุฑ ุงูุฐู ุงุชุฎุฐุชูู ููู ุชูุฏู ุนูููุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ุชูููุฑ ุจู ุฏุงุฆูุงูุโข","ูู ุชุชุฏุฎู ุฅุฐุง ูุฌุฏุช ุดุฎุต ูุชุนุฑุถ ูุญุงุฏุซุฉ ุณูุฑ ุฃู ุชุชุฑูู ูุชุฑุญูุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ูุง ุชุณุชุทูุน ุฃู ุชุฑูุถ ูู ุฃู ุทูุจุโข","ุฅุฐุง ุฃุนุฌุจุช ุจุดุฎุตู ูุง ููู ุชูุธูุฑ ูู ูุฐุง ุงูุฅุนุฌุงุจ ุฃู ูุง ูู ุงูุทุฑููุฉ ุงูุชู ุณุชุชุจุนูุง ูุชุธูุฑ ุฅุนุฌุงุจู ุจูุโข","ูู ุชุฑู ููุณู ููุชูุงูุถูุโข","ูุง ูู ุงููููู ุงูุฐู ุชุนุฑุถุช ููู ุฅูู ุงูุงุญุฑุงุฌ ุงูููุจุฑุญุโข","ูุง ูู ุงููููู ุงูุฐู ุฌุนูู ุชุจูู ุฃูุงู ูุฌููุนุฉ ูู ุงููุงุณ ุฑุบูุงู ุนููุโข","ุฅุฐุง ูุฌุฏุช ูุฑูุฉ ุจูุถุงุก ููุงุฐุง ุชุฑุณู ูุชุนุจุฑ ุนู ุญุงูุชู ุงูููุณูุฉุโข","ูู ุญุงุฑุจุช ูู ุฃุฌู ุดุฎุตุโข","ูุง ูู ุงููููุฉ ุงูุชู ุชูุฑุจููุโข","ุฅุฐุง ุชุฑูู ูู ุชุญุจุ ูู ุชุนูุฏ ุฅููู ูุฑุฉ ุฃุฎุฑู ุฃู ุชุชุฑููู ูุชูุชุธุฑ ููุช ุนูุฏุชูุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ุชูุตุจุญ ุฃูุงูู ุถุนููุ","โูู ุชุญุจ ุงูููุดุงุฑูุฉ ุงูุงุฌุชูุงุนูุฉ ุฃู ุฃูุช ุดุฎุต ูููุทููุโข","ูู ุชูุงุฒูุช ุนู ูุจุฏุฃู ูู ุงูุญูุงุฉุโข","ุงุฎุชุตุฑ ุญูุงุชู ูู ูููุฉ ูุงุญุฏุฉุโข","ูุง ูู ุงุณูุฃ ุฎุจุฑ ุณูุนุชู ุจุญูุงุชูุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ูุง ุชูุฏู ุนููู ุฅุฐุง ุชุฑูู ูุฎุฑุฌ ูู ุญูุงุชูุโข","ูู ููุช ููุงู ููุนูู ุชุชููู ุฃูุง ุชููููุโข","ูู ุชุดุนุฑ ุจุญุจ ุงูุชูููุโข","ุฅุฐุง ูุฌุฏุช ุงูุดุฎุต ุงูุฐู ุฃุญุจุจุชูู ูู ูููู ูุง ููุณู ุจุทููู ูู ูุฐุง ุณูุดุนุฑู ุจุงูุฃููุโข","ูุง ุงูุฐู ูุฌุนูู ุชูุตุงุจ ุจุงูุบุถุจ ุงูุดุฏูุฏุโข","ูู ุชุชุฐูุฑ ุงูุณุจุจ ุงูุฐู ุจููุช ูู ุฃุฌูู ุฃุฎุฑ ูุฑุฉุโข","ูู ููุช ุณุจุจ ูู ุชุฏููุฑ ุญูุงุฉ ุฃุญุฏ ุงูุฃุดุฎุงุต ุงููููุฑุจูู ุฅูููุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ุชุณุชุทูุน ุฃู ุชุญูู ูู ุฃู ูุดููุฉ ุจุฏูู ุฎุฌูุโข","ูู ุฃูุช ุดุฎุต ุตุฑูุญ ุฃู ูููุงููุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ุฑุญู ุนู ุงูุญูุงุฉ ูุนูุฏูุง ุชุชุฐูุฑู ุชุดุนุฑ ุจุงูุฃููุโข","ุญููุฉ ุชุคูู ุจูุง ุโข","ูู ุดุนุฑุช ุจุฃูู ุชุชููู ุฃู ุชููุช ููุงูู ุงูุณุจุจุโข","ุงุฐุง ุงุญุจุจุช ุดุฎุตุงู ูู ุงูููุช ุงูุฎุทุฃ ููู ุงูููุงู ุงูุฎุทุฃ ููุงุฐุง ุชูุนู ุโข","ูู ูู ุงูุดุฎุต ุงูุฐู ุฎุฐููุโข","ูู ุชุณุชุทูุน ุฃู ุชุนูุด ุจุฏูู ุฃุตุฏูุงุกุโข","ูุนูุช ุดุฆ ุฌุนูู ุชุดุนุฑ ุจุงูู ุบุจู ูุฌูุณุช ุชุณุจ ููุณู ูุงููุโข","ูู ุชุญูู ุนูู ุงู ุจูุช ุจูุฌุฑุฏ ุงููุธุฑ ุงูู ูุจุณูุงุ ููุงูู ุญุฏ ุงูุญุดูุฉ ุนูุฏูุโข","ูุงุฐุง ุณุชูุชุจ ููุง ูุชุนุจุฑ ุนู ุญูุงุชู ุงูุชู ุนุดุชูุง ุงูู ุงูุงู ูู ูููุงุช ููููู ุโข","ูู ูุฒูู ุญุฒูู ูู ูููุงู ูู ุงูุงูุงูุโข ","ุงูุช ูู ุดูุก ุจุญูุงุชู ููู ุชููููุง ุ","ูู ุชูุฑู ุดุฎุต ุจุดุฏู ูู ุญูุงุชู ุโข"}
Dev_Aek(msg.chat_id_, msg.id_, 1, ''..AEKTEAM[math.random(#AEKTEAM)]..'' , 1, 'md')  
return false
end
end
--     Source AEK     --
if text == 'ุงูุงูุนุงุจ' and ChCheck(msg) or text == 'ุงูุนุงุจ' and ChCheck(msg) or text == 'ุงููุนุจู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Games'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1,[[
ใโ ูุงุฆูุฉ ุงูุนุงุจ ุงููุฌููุนู โซ โค
โโโโโโปใโปโโโโโ
ใโ ูุนุจุฉ ุงูุชุฎููู โซ ุฎูู
ใโ ูุนุจุฉ ุงูุงูุซูู โซ ุงูุซูู
ใโ ูุนุจุฉ ุงูุนูุณ โซ ุงูุนูุณ
ใโ ูุนุจุฉ ุงูุงุณุฆูู โซ ุงุณุฆูู
ใโ ูุนุจุฉ ุงูุฑูููุช โซ ุฑูููุช
ใโ ูุนุจุฉ ุงูุญุฒูุฑู โซ ุญุฒูุฑู
ใโ ูุนุจุฉ ุงูุชุฑุชูุจ โซ ุชุฑุชูุจ
ใโ ูุนุจุฉ ุงููุนุงูู โซ ูุนุงูู
ใโ ูุนุจุฉ ุงูุตุฑุงุญู โซ ุตุฑุงุญู
ใโ ูุนุจุฉ ุงููุฎุชูู โซ ุงููุฎุชูู
ใโ ูุนุจุฉ ุงูุณูุงููุงุช โซ ุณูุงููุงุช
ใโ ูุนุจุฉ ุงููุญูุจุณ โซ ุงููุญูุจุณ
ใโ ูุนุจุฉ ุงูุฑูุงุถูุงุช โซ ุฑูุงุถูุงุช
ใโ ูุนุจุฉ ุงูุงููููุฒูู โซ ุงููููุฒูู
โโโโโโปใโปโโโโโ
ใโ ููุงุทู โข ุจูุน ููุงุทู
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]], 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฐุฑุง ุงูุงูุนุงุจ ูุนุทูู ูู ุงููุฌููุนู', 1, 'md')
end
end
--     Source AEK     --
if text == 'ุจูุน ููุงุทู' and ChCheck(msg) then
if tonumber((DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูู ุชุฑุจุญ ุงู ููุทู\nใโ ุงุฑุณู โซ ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else
DevAek0 = (DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAek:incrby(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAek0)
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุชู ุจูุน '..(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' ูู ููุงุทู\nใโ ูู ููุทู ุชุณุงูู 50 ุฑุณุงูู', 'md')
DevAek:del(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source AEK     --
if text == 'ุฑูุน ุงููุดุฑููู' and Manager(msg) and ChCheck(msg) or text == 'ุฑูุน ุงูุงุฏูููู' and Manager(msg) and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,Aekan) 
DevAek:del(AEK..'Aek:AekConstructor:'..msg.chat_id_)
local num = 0
local admins = Aekan.members_  
for i=0 , #admins do   
if Aekan.members_[i].bot_info_ == false and Aekan.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if Aekan.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAek:sadd(AEK..'Aek:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAek:sadd(AEK..'Aek:AekConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุง ููุฌุฏ ุงุฏูููู ููุชู ุฑูุนูู\nใโ ุชู ุฑูุน ููุดุฆ ุงููุฌููุนู", 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุฑูุน '..num..' ูู ุงูุงุฏูููู \nใโ ุชู ุฑูุน ููุดุฆ ุงููุฌููุนู', 1, 'md')
end
end,nil) 
end
--     Source AEK     --
if text == 'ุบุงุฏุฑ' and SudoBot(msg) then
if DevAek:get(AEK.."Aek:Left:Bot"..AEK) and not SecondSudo(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, "ใโ ุงููุบุงุฏุฑู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false  
end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ูุบุงุฏุฑุฉ ุงููุฌููุนู \nใโ ุชู ุญุฐู ุฌููุน ุจูุงูุงุชูุง ', 1, 'md')
ChatLeave(msg.chat_id_, AEK)
DevAek:srem(AEK.."Aek:Groups",msg.chat_id_)
end
--     Source AEK     --
if text ==('ูููุนู') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'ุงูููุดุฆ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ุงูุงุฏูู'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'ุนุถู'
end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุนู โซ '..rtpa, 1, 'md')
end,nil)
end
--     Source AEK     --
if text == "ูุนูููุงุชู" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAek:get(AEK..'Aek:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'ูุง ููุฌุฏ' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุณูู โซ โจ ['..result.first_name_..'] โฉ\nใโ ูุนุฑูู โซ โจ ['..username..'] โฉ\nใโ ุงูุฏูู โซ โจ `'..result.id_..'` โฉ\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุฌูุงุชู โซ โจ '..cont..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(msguser)..'\nใโ ุฑุชุจุชู โซ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source AEK     --
if text == "ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุบููุฑ ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุนููู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "ูุถุน ููุงุฉ ุงูุงุดุชุฑุงู" then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAek:setex(AEK..'DevAek4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, 'ใโ ุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู')
end
return false  
end
if text == "ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" then  
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
if DevAek:get(AEK..'DevAek2') then
local DevCh = DevAek:get(AEK..'DevAek3')
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู ููุนู \nใโ ุนูู ุงูููุงุฉ โซ ["..DevCh.."]")
else
DevAek:setex(AEK..'DevAek4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"ใโ ูุงุชูุฌุฏ ููุงุฉ ูุชูุนูู ุงูุงุดุชุฑุงู\nใโ ุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู")
end
end
return false  
end
if text == "ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" then  
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAek:del(AEK..'DevAek2') DevAek:del(AEK..'DevAek3')
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุญุฐู ููุงู ุงูุงุดุชุฑุงู" then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAek:del(AEK..'DevAek2') DevAek:del(AEK..'DevAek3')
Dev_Aek(msg.chat_id_, msg.id_, 1,"ใโ ุชู ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'ุฌูุจ ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' then
if DevAek:get(AEK..'DevAek3') then
local DevCh = DevAek:get(AEK..'DevAek3')
send(msg.chat_id_, msg.id_, "ใโ ููุงุฉ ุงูุงุดุชุฑุงู โซ ["..DevCh.."]")
else
send(msg.chat_id_, msg.id_, "ใโ ูุงุชูุฌุฏ ููุงุฉ ูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู")
end
return false  
end end
--     Source AEK     --
if SudoBot(msg) then
if text == 'ุงุฐุงุนู ูููู ุจุงูุชูุฌูู' and tonumber(msg.reply_to_message_id_) > 0 then
function AEKTEAM(extra,result,success)
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
local GpList = DevAek:smembers(AEK.."Aek:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAek:smembers(AEK.."Aek:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nใโ โูู โซ โจ '..#GpList..' โฉ ูุฌููุนู \nใโ ูุงูู โซ โจ '..#PvList..' โฉ ูุดุชุฑู \n โ', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),AEKTEAM)
end
end
--     Source AEK     --
if text:match('^ุงูุญุณุงุจ (%d+)$') and ChCheck(msg) then
local id = text:match('^ุงูุญุณุงุจ (%d+)$')
local text = 'ุงุถุบุท ููุดุงูุฏุฉ ุงูุนุถู โ ใ'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
if text == "ูุดุงูุฏู ุงูููุดูุฑ" and ChCheck(msg) or text == "ูุดุงูุฏุงุช ุงูููุดูุฑ" and ChCheck(msg) or text == "ุนุฏุฏ ุงููุดุงูุฏุงุช" and ChCheck(msg) then
DevAek:set(AEK..'Aek:viewget'..msg.sender_user_id_,true)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุญุณูุง ูู ุจุงุนุงุฏุฉ ุชูุฌูู ููููุดูุฑ ุงูุฐู ุชุฑูุฏูู ุญุณุงุจ ูุดุงูุฏุงุชู', 1, 'md')
end
--     Source AEK     --
if text == "ุงูุณูุฑุณ" and ChCheck(msg) or text == "ุณูุฑุณ" and ChCheck(msg) then 
local text =  [[
๐ช๐๐๐๐ข๐?๐ ๐ง๐ข ๐ฆ๐ข๐จ๐ฅ๐๐
 
โโโโโโโ โโโโโโโโโ
  ๐ฆ.๐ช.๐ฐ.๐ดใ๐ป.๐ฎ.๐ต
โโโโโโโ โโโโโโโโโ

ใโ [๐ซ๐ฌ๐ฝ๐ฌ๐ณ๐ถ๐ท๐ฌ๐น](https://t.me/A3kon)

ใโ [๐จ๐ฌ๐ฒ๐ถ ๐ช๐ฏ](https://t.me/SoalfLove)

ใโ [๐ท๐น๐ถ๐ฎ๐น๐จ๐ด๐ด๐ฌ๐น](https://t.me/A3kon)

ใโ [๐ฌ๐ฟ๐ท ๐บ๐ถ๐ผ๐น๐ช๐ฌ](https://t.me/Aeko100k)
โโโโโโปใโปโโโโโ
ใโ [๐๐๐ ๐ผ๐๐๐](https://t.me/AekanBot)
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source AEK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "ุงุทุฑุฏูู" and ChCheck(msg) or text == "ุงุฏูุฑูู" and ChCheck(msg) then
if DevAek:get(AEK.."Aek:Kick:Me"..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevAek:set(AEK..'yes'..msg.sender_user_id_..'', 'delyes')
DevAek:set(AEK..'no'..msg.sender_user_id_..'', 'delno')
local Text = 'ใโ ูู ุงูุช ูุชุฃูุฏ ูู ุงููุบุงุฏุฑู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/delyes"},{text="ูุง",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source AEK     --
if text == 'ุชุนุทูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevAek:set(AEK.."Aek:Kick:Me"..msg.chat_id_, true)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุฑ ุงุทุฑุฏูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevAek:del(AEK.."Aek:Kick:Me"..msg.chat_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุฑ ุงุทุฑุฏูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source AEK     --
if text == "ูุฒููู" and ChCheck(msg) then
if DevAek:get(AEK.."Aek:Del:Me"..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevAek:set(AEK..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAek:set(AEK..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = 'ใโ ูู ุงูุช ูุชุฃูุฏ ูู ุชูุฒููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/yesdel"},{text="ูุง",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source AEK     --
if text == 'ุชุนุทูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevAek:set(AEK.."Aek:Del:Me"..msg.chat_id_, true)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุฑ ูุฒููู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevAek:del(AEK.."Aek:Del:Me"..msg.chat_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุฑ ูุฒููู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source AEK     --
if Admin(msg) then
if text == "ุชุงู ูููู" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "ใโ ูุงุฆูุฉ ุงูุงุนุถุงุก \nโโโโโโปใโปโโโโโ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAek:get(AEK..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAek:get(AEK..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     Source AEK     --
if text and text:match("^ููููู (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(ููููู) (.*)$")}
function TagAll(dp1,dp2)
local text = "ใโ "..txt[2].." \nโโโโโโปใโปโโโโโ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAek:get(AEK..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAek:get(AEK..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source AEK     --
if text == "ุฑุณุงุฆูู" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุนุฏุฏ ุฑุณุงุฆูู ููุง โซ *โจ "..user_msgs.." โฉ*", 1, 'md')
end
if text == "ุงูุชูุงุนู" and ChCheck(msg) or text == "ุชูุงุนู ุงููุฑูุจ" and ChCheck(msg) or text == "ุชูุงุนู ุงููุฌููุนู" and ChCheck(msg) or text == "ุงุญุตุงุฆูุงุช ุงูุชูุงุนู" and ChCheck(msg) then
local EntryNumber = (DevAek:get(AEK..'Aek:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAek:get(AEK..'Aek:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAek:get(AEK..'Aek:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงูุถูุงู ุงูุงุนุถุงุก ุงูููู โซ *"..EntryNumber.."*\nใโ ูุบุงุฏุฑุฉ ุงูุงุนุถุงุก ุงูููู โซ *"..ExitNumber.."*\nใโ ุนุฏุฏ ุงูุฑุณุงุฆู ุงูููู โซ *"..MsgNumberDay.."*\nใโ ูุณุจุฉ ุงูุชูุงุนู ุงูููู โซ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source AEK     --
if text == "ูุนุฑูู" and ChCheck(msg) then
function get_username(extra,result,success)
text = 'ใโ ูุนุฑูู โซ โจ User โฉ'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "ุงุณูู" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = 'ใโ ุงุณูู โซ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source AEK     --
if text == "ุงููุณ" or text == "ููุณู" or text == "ุจูุช ุงูููุณู" or text == "ุงุฑูุฏ ุจูุช ุงูููุณู" or text == "ุฏุฒูู ุจูุช ุงูููุณู" or text == "ุฏุฒููู ุจูุช ุงูููุณู" then  Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ @hmosabot', 1, 'md') end
if text == "ุฑุงุจุท ุญุฐู" or text == "ุฑุงุจุท ุงูุญุฐู" or text == "ุงุฑูุฏ ุฑุงุจุท ุงูุญุฐู" or text == "ุดูุฑูู ุฑุงุจุท ุงูุญุฐู" or text == "ุงุดูุฑูู ุฑุงุจุท ุงูุญุฐู" or text == "ุงุฑูุฏ ุฑุงุจุท ุญุฐู" or text == "ุฑุงุจุท ุญุฐู ุญุณุงุจุงุช" or text == "ุฑุงุญ ุงุญุฐู" then local inline = {{{text="ุงุถุบุท ููุง",url="https://my.telegram.org/auth?to=delete"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุงูุฑุงุจุท',nil,inline) return false end
if text == "ุจูุช ุฑููุดู" or text == "ุงุฑูุฏ ุจูุช ุฑููุดู" or text == "ูุนุฑู ุจูุช ุฑููุดู" or text == "ูุนุฑู ุฑููุดู" or text == "ุจูุช ุฑุฏูุฏ" or text == "ุจูุช ุฑููุดุฉ" then local inline = {{{text="ุงุถุบุท ููุง",url="https://t.me/RnoshaBot"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุฑููุดู',nil,inline) return false end
if text == "ุจูุช ุฑุชูุดู" or text == "ุงุฑูุฏ ุจูุช ุฑุชูุดู" or text == "ูุนุฑู ุจูุช ุฑุชูุดู" or text == "ูุนุฑู ุฑุชูุดู" or text == "ุจูุช ุงูุฑุฏูุฏ" or text == "ุจูุช ุฑุชูุดุฉ" then local inline = {{{text="ุงุถุบุท ููุง",url="https://t.me/RtoshaBot"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุงูุจูุช',nil,inline) return false end
if text == "ุจูุช ูุงูููู" or text == "ุงุฑูุฏ ุจูุช ูุงูููู" or text == "ูุนุฑู ุจูุช ูุงูููู" or text == "ูุนุฑู ูุงูููู" or text == "ุจูุช ุงุบุงูู" or text == "ุจูุช ุฃุบุงูู" then local inline = {{{text="ุงุถุบุท ููุง",url="https://t.me/KanonhBot"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุงูุจูุช',nil,inline) return false end
if text == "ุจูุช ุณููู" or text == "ุงุฑูุฏ ุจูุช ุณููู" or text == "ูุนุฑู ุจูุช ุณููู" or text == "ูุนุฑู ุณููู" or text == "ุจูุช ุงูุญูุงูู" or text == "ุจูุช ุงูุญูุงูุฉ" then local inline = {{{text="ุงุถุบุท ููุง",url="https://t.me/Sn7kebot"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุงูุจูุช',nil,inline) return false end
if text == "ุจูุช ุฌุจู" or text == "ุงุฑูุฏ ุจูุช ุฌุจู" or text == "ูุนุฑู ุจูุช ุฌุจู" or text == "ูุนุฑู ุฌุจู" or text == "ุจูุช ุญูุงูู" or text == "ุจูุช ุญูุงูุฉ" then local inline = {{{text="ุงุถุบุท ููุง",url="https://t.me/Jbllbot"}}} SendInline(msg.chat_id_,'ใโ ุงุถุบุท ููุญุตูู ุนูู ุงูุจูุช',nil,inline) return false end
if text == "ุฌูุงุชู" and ChCheck(msg) or text == "ุงุถุงูุงุชู" and ChCheck(msg) then add = (tonumber(DevAek:get(AEK..'Aek:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุนุฏุฏ ุฌูุงุชู ุงููุถุงูู โซ *โจ "..add.." โฉ* ", 1, 'md') end
if text == "ุชุนุฏููุงุชู" or text == "ุณุญูุงุชู" and ChCheck(msg) then local edit_msg = DevAek:get(AEK..'Aek:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุนุฏุฏ ุชุนุฏููุงุชู โซ *โจ "..edit_msg.." โฉ* ", 1, 'md') end
if text == "ุงูุฏูู" and ChCheck(msg) then Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงูุฏูู โซ โจ `'..msg.sender_user_id_..'` โฉ', 1, 'md') end
if text == "ุฑุชุจุชู" and ChCheck(msg) then Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฑุชุจุชู โซ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ุงูุฏู ุงููุฌููุนู" and ChCheck(msg) then Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงูุฏู ุงููุฌููุนู โซ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'ูุณุญ ุณุญูุงุชู' or text == 'ูุณุญ ุชุนุฏููุงุชู' or text == 'ุญุฐู ุณุญูุงุชู' or text == 'ุญุฐู ุชุนุฏููุงุชู' then DevAek:del(AEK..'Aek:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ุฌููุน ุชุนุฏููุงุชู ุจูุฌุงุญ' , 1, 'md') end
if text == 'ูุณุญ ุฌูุงุชู' or text == 'ูุณุญ ุงุถุงูุงุชู' or text == 'ุญุฐู ุฌูุงุชู' or text == 'ุญุฐู ุงุถุงูุงุชู' then DevAek:del(AEK..'Aek:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ุฌููุน ุฌูุงุชู ุงููุถุงูู' , 1, 'md') end
--     Source AEK     --
if text == "ุงููุทูุฑ" then 
local DevCh1 = DevAek:get(AEK.."DevAek3")
local DevText = DevAek:get(AEK.."DevText")
if DevCh1 then DevCh = '\nใโ *Dev Ch* โฌ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Aek(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *Dev User* โฌ ['..DevUser..']\nใโ *Dev Id* โฌ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
--     Source AEK     --
if text and text:match('^ูููู @(.*)') and ChCheck(msg) or text and text:match('^ููููุง @(.*)') then 
if not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ูููู @(.*)') or text:match('^ููููุง @(.*)') 
function AEKTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(152221858) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if DevAek:sismember(AEK.."Aek:AekConstructor:"..msg.chat_id_,result.id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local AEKTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md') 
local AEKTEAM = { "ููู ุฌุฑุฌู @"..username.." ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ููู ูุงุดู @"..username.." ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุญุจูุจู @"..username.." ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช","ุฏูุดู ูู @"..username.." ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน @"..username.." ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช",}
Dev_Aek(msg.chat_id_, result.id_, 1,''..AEKTEAM[math.random(#AEKTEAM)]..'', 1, 'html') 
else  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,AEKTEAM)
end
end
--     Source AEK     --
if text == ("ูููู") or text == ("ุจุนุฏ ูููู") or text == ("ูููู ุจุนุฏ") or text == ("ูู ูููู") or text == ("ููููุง") or text == ("ููููู") or text == ("ุฑุฒูู") or text == ("ุฑุฒููู") or text == ("ุฑุฒููุง") then
if not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(AEK) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(152221858) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if DevAek:sismember(AEK.."Aek:AekConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local AEKTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md') 
local AEKTEAM = {"ููู ุฌุฑุฌู ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ูุงุดู ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุฏูุดู ูู ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช","ุญุจูุจู ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช"} 
Dev_Aek(msg.chat_id_, result.id_, 1,''..AEKTEAM[math.random(#AEKTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("ุจูุณู") or text == ("ุจุนุฏ ุจูุณู") or text == ("ุถู ุจูุณ") or text == ("ุจูุณู ุจุนุฏ") or text == ("ุจูุณูุง") or text == ("ุจุนุฏ ุจูุณูุง") or text == ("ุถู ุจูุณ") or text == ("ุจูุณูุง ุจุนุฏ") or text == ("ุจูุณูู") then
if not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(AEK) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุจูุณ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Aek(msg.chat_id_, result.id_, 1, 'ููุงุญุญุญ ุงุญูุงุง ุจูุณุฉุฉ ุงููุทูุฑูู๐ป๐ฅ๐', 1, 'html')
return false
end 
local AEKTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md') 
local AEKTEAM = {"ููุงุญุญุญ ุงููุด ุนุงููููู๐๐ฅ๐","ุงูููููุงุงูุญุญ ุดููุนุณู๐ฅบ๐ฏ๐","ููุงุญุญุญุุกููู ุงุฐูุจ๐คค๐"} 
Dev_Aek(msg.chat_id_, result.id_, 1,''..AEKTEAM[math.random(#AEKTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("ุตูุญู") or text == ("ุตูุญูุง") or text == ("ุตูุญูู") or text == ("ุตูุญ") then
if not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(AEK) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Aek(msg.chat_id_, result.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ', 1, 'html')
return false
end 
local AEKTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md') 
local AEKTEAM = {"ุชุชุนุงู ุญุญุจ ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู ุฏูุตูุญูู๐๐ค"} 
Dev_Aek(msg.chat_id_, result.id_, 1,''..AEKTEAM[math.random(#AEKTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source AEK     --
if text and text:match('^ุตูุญู @(.*)') and ChCheck(msg) or text and text:match('^ุตูุญ @(.*)') and ChCheck(msg) then 
if not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ุตูุญู @(.*)') or text:match('^ุตูุญ @(.*)') 
function AEKTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ @'..username, 1, 'html') 
return false  
end  
local AEKTEAM = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Aek(msg.chat_id_, msg.id_, 1,AEKTEAM, 1, 'md') 
local AEKTEAM = { "ุชุชุนุงู ุญุญุจ @"..username.." ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู @"..username.." ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ @"..username.." ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู @"..username.." ุฏูุตูุญูู๐๐ค",}
Dev_Aek(msg.chat_id_, result.id_, 1,''..AEKTEAM[math.random(#AEKTEAM)]..'', 1, 'html') 
else  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,AEKTEAM)
end
end
end
--     Source AEK     --
if text == ("ุชูุฒูู ุงููู") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.sender_user_id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevAek:sismember(AEK..'Aek:SudoBot:',result.sender_user_id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevAek:sismember(AEK..'Aek:ManagerAll:',result.sender_user_id_) then
managerall = 'ุงููุฏุฑุงุก ุงูุนุงููู โข ' else managerall = '' end
if DevAek:sismember(AEK..'Aek:AdminAll:',result.sender_user_id_) then
adminall = 'ุงูุงุฏูููู ุงูุนุงููู โข ' else adminall = '' end
if DevAek:sismember(AEK..'Aek:VipAll:',result.sender_user_id_) then
vpall = 'ุงููููุฒูู ุงูุนุงููู โข ' else vpall = '' end
if DevAek:sismember(AEK..'Aek:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevAek:sismember(AEK..'Aek:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAek:sismember(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevAek:sismember(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAek:sismember(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAek:sismember(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู โซ โค\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end
if AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAek:srem(AEK..'Aek:SecondSudo:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:SudoBot:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:ManagerAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAek:srem(AEK..'Aek:SudoBot:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:ManagerAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAek:srem(AEK..'Aek:ManagerAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'Aekconstructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ุงููู @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(ุชูุฒูู ุงููู) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevAek:sismember(AEK..'Aek:SudoBot:',result.id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevAek:sismember(AEK..'Aek:ManagerAll:',result.id_) then
managerall = 'ุงููุฏุฑุงุก ุงูุนุงููู โข ' else managerall = '' end
if DevAek:sismember(AEK..'Aek:AdminAll:',result.id_) then
adminall = 'ุงูุงุฏูููู ุงูุนุงููู โข ' else adminall = '' end
if DevAek:sismember(AEK..'Aek:VipAll:',result.id_) then
vpall = 'ุงููููุฒูู ุงูุนุงููู โข ' else vpall = '' end
if DevAek:sismember(AEK..'Aek:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevAek:sismember(AEK..'Aek:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevAek:sismember(AEK..'Aek:Managers:'..msg.chat_id_, result.id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevAek:sismember(AEK..'Aek:Admins:'..msg.chat_id_, result.id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevAek:sismember(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevAek:sismember(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู โซ โค\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","ใโ ูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end 
if AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAek:srem(AEK..'Aek:SecondSudo:', result.id_)
DevAek:srem(AEK..'Aek:SudoBot:', result.id_)
DevAek:srem(AEK..'Aek:ManagerAll:', result.id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.id_)
DevAek:srem(AEK..'Aek:VipAll:', result.id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAek:srem(AEK..'Aek:SudoBot:', result.id_)
DevAek:srem(AEK..'Aek:ManagerAll:', result.id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.id_)
DevAek:srem(AEK..'Aek:VipAll:', result.id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAek:srem(AEK..'Aek:ManagerAll:', result.id_)
DevAek:srem(AEK..'Aek:AdminAll:', result.id_)
DevAek:srem(AEK..'Aek:VipAll:', result.id_)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'Aekconstructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
DevAek:srem(AEK..'Aek:Cleaner:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_, result.id_)
elseif AekDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, result.id_)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source AEK     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('ุงุถู ูุทูุฑ ุซุงููู') and ChCheck(msg) or text ==('ุฑูุน ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุฑูุน ูุทูุฑ ุซุงููู (%d+)')
DevAek:sadd(AEK..'Aek:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end
--     Source AEK     --
--     Rem SecondSudo     --
if text ==('ุญุฐู ูุทูุฑ ุซุงููู') and ChCheck(msg) or text ==('ุชูุฒูู ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')
DevAek:srem(AEK..'Aek:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end end
--     Source AEK     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('ุงุถู ูุทูุฑ') and ChCheck(msg) or text ==('ุฑูุน ูุทูุฑ') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ (%d+)') or text:match('^ุฑูุน ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ (%d+)') or text:match('ุฑูุน ูุทูุฑ (%d+)')
DevAek:sadd(AEK..'Aek:SudoBot:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end
--     Source AEK     --
--       Rem SudoBot      --
if text ==('ุญุฐู ูุทูุฑ') and ChCheck(msg) or text ==('ุชูุฒูู ูุทูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ (%d+)') or text:match('ุชูุฒูู ูุทูุฑ (%d+)')
DevAek:srem(AEK..'Aek:SudoBot:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end end
--     Source AEK     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('ุฑูุน ูุฏูุฑ ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูุฏูุฑ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุฏูุฑ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูุฏูุฑ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุฏูุฑ ุนุงู (%d+)')
DevAek:sadd(AEK..'Aek:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end
--     Source AEK     --
--      Rem ManagerAll    --
if text ==('ุชูุฒูู ูุฏูุฑ ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุฏูุฑ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุฏูุฑ ุนุงู (%d+)')
DevAek:srem(AEK..'Aek:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู")  
end end
--     Source AEK     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('ุฑูุน ุงุฏูู ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ุงุฏูู ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ุงุฏูู ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ุงุฏูู ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ุงุฏูู ุนุงู (%d+)')
DevAek:sadd(AEK..'Aek:AdminAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end
--     Source AEK     --
--      Rem adminall      --
if text ==('ุชูุฒูู ุงุฏูู ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ุงุฏูู ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ุงุฏูู ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ุงุฏูู ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ุงุฏูู ุนุงู (%d+)')
DevAek:srem(AEK..'Aek:AdminAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู")  
end end
--     Source AEK     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('ุฑูุน ูููุฒ ุนุงู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูููุฒ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูููุฒ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูููุฒ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูููุฒ ุนุงู (%d+)')
DevAek:sadd(AEK..'Aek:VipAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end
--     Source AEK     --
--       Rem Vipall       --
if text ==('ุชูุฒูู ูููุฒ ุนุงู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูููุฒ ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูููุฒ ุนุงู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูููุฒ ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูููุฒ ุนุงู (%d+)')
DevAek:srem(AEK..'Aek:VipAll:',user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู")  
end end
--     Source AEK     --
--  Set BasicConstructor  --
if ChatType == 'sp' or ChatType == 'gp'  then
if AekConstructor(msg) then
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)')
DevAek:sadd(AEK..'Aek:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end
--     Source AEK     --
--  Rem BasicConstructor  --
if text ==('ุชูุฒูู ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)')
DevAek:srem(AEK..'Aek:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end end
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and not AekConstructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูููุดุฆ ุงููุฌููุนู ูุงููุทูุฑูู ููุท', 1, 'md')
end
--     Source AEK     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('ุฑูุน ููุดุฆ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ (%d+)')
DevAek:sadd(AEK..'Aek:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end
--     Source AEK     --
--    Rem  Constructor    --
if text ==('ุชูุฒูู ููุดุฆ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ (%d+)')
DevAek:srem(AEK..'Aek:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
end
--     Source AEK     --
--      Set Manager       --
if Constructor(msg) then
if text ==('ุฑูุน ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:sadd(AEK..'Aek:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:sadd(AEK..'Aek:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^ุฑูุน ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุฏูุฑ (%d+)')
DevAek:sadd(AEK..'Aek:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end
--     Source AEK     --
--       Rem Manager      --
if text ==('ุชูุฒูู ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุฏูุฑ (%d+)')
DevAek:srem(AEK..'Aek:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end end
--     Source AEK     --
--       Set admin        --
if Manager(msg) then
if text ==('ุฑูุน ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ุงุฏูู @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
if result.id_ then
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ุงุฏูู (%d+)')
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end
--     Source AEK     --
--        Rem admin       --
if text ==('ุชูุฒูู ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ุงุฏูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ุงุฏูู (%d+)')
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end end
--     Source AEK     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('ุฑูุน ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAek:sadd(AEK..'Aek:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูููุฒ @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
if result.id_ then
DevAek:sadd(AEK..'Aek:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูููุฒ (%d+)')
if not BasicConstructor(msg) and DevAek:get(AEK.."Aek:Lock:ProSet"..msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน ูู ูุจู ุงูููุดุฆููู', 1, 'md')
return false
end
DevAek:sadd(AEK..'Aek:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end
--     Source AEK     --
--       Rem Vipmem       --
if text ==('ุชูุฒูู ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูููุฒ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูููุฒ (%d+)')
DevAek:srem(AEK..'Aek:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end end 
--     Source AEK     --
if BasicConstructor(msg) then
if text and text:match("^ุฑูุน ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..AEK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูุดุฑู ูู ุงููุฌููุนู")  
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..AEK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุดุฑููู ุงููุฌููุนู")  
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^ุฑูุน ุจูู ุงูุตูุงุญูุงุช$") or text:match("^ุฑูุน ุจูู ุตูุงุญูุงุช$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..AEK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูุดุฑู ูู ุฌููุน ุงูุตูุงุญูุงุช")  
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")) and ChCheck(msg) then
local Aek = text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..AEK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุงุถุงูุฉ โซ "..Aek.." ูููุจ ูู")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..Aek)
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
--     Source AEK     --
if text == "ุตูุงุญูุชู" and ChCheck(msg) or text == "ุตูุงุญูุงุชู" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('ุตูุงุญูุชู') and ChCheck(msg) or text ==('ุตูุงุญูุงุชู') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^ุตูุงุญูุชู (%d+)') or text:match('^ุตูุงุญูุงุชู (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('ุตูุงุญูุชู (%d+)') or text:match('ุตูุงุญูุงุชู (%d+)')
Validity(msg,ValidityId)  
end
--     Source AEK     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^ูุณุญ$") or text:match("^ุญุฐู$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ุงูุฑุณุงูู ูุน ุฑุณุงูุฉ ุงูุงูุฑ', 1, 'md')
end end end
--     Source AEK     --
if Constructor(msg) then
if text == "ุชูุนูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชูุนูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevAek:del(AEK.."Aek:Lock:KickBan"..msg.chat_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุทุฑุฏ ูุงูุญุธุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชุนุทูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevAek:set(AEK.."Aek:Lock:KickBan"..msg.chat_id_,"true")
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชูุนูู ุงููุชู" and ChCheck(msg) or text == "ุชูุนูู ุงูุชูููุฏ" and ChCheck(msg) then
DevAek:del(AEK.."Aek:Lock:MuteTked"..msg.chat_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงููุชู ูุงูุชููุฏ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงููุชู" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชูููุฏ" and ChCheck(msg) then
DevAek:set(AEK.."Aek:Lock:MuteTked"..msg.chat_id_,"true")
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text == "ุชูุนูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชูุนูู ุงูุชุฑููู" and ChCheck(msg) then
DevAek:del(AEK.."Aek:Lock:ProSet"..msg.chat_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชูุนูู ุฑูุน โซ ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
if text == "ุชุนุทูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชุฑููู" and ChCheck(msg) then
DevAek:set(AEK.."Aek:Lock:ProSet"..msg.chat_id_,"true")
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชุนุทูู ุฑูุน โซ ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
end
--     Source AEK     --
--          Kick          --
if Admin(msg) then
if text ==('ุทุฑุฏ') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุทุฑุฏ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^ุทุฑุฏ @(.*)') and ChCheck(msg) then
local username = text:match('^ุทุฑุฏ @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุทุฑุฏ โซ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^ุทุฑุฏ (%d+)') and ChCheck(msg) then
local user = text:match('ุทุฑุฏ (%d+)')
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุทุฑุฏ โซ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
end
end 
--     Source AEK     --
--          Ban           --
if Admin(msg) then
if text ==('ุญุถุฑ') and ChCheck(msg) or text ==('ุญุธุฑ') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุญุธุฑ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAek:sadd(AEK..'Aek:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุญุธุฑู ูู ุงููุฌููุนู") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุญุธุฑ โซ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAek:sadd(AEK..'Aek:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^ุญุถุฑ (%d+)') or text:match('^ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุถุฑ (%d+)') or text:match('ุญุธุฑ (%d+)')
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุญุธุฑ โซ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"ใโ ููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"ใโ ูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAek:sadd(AEK..'Aek:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
end
--     Source AEK     --
--         UnBan          --
if text ==('ุงูุบุงุก ุงูุญุธุฑ') and ChCheck(msg) or text ==('ุงูุบุงุก ุญุธุฑ') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('^ุงูุบุงุก ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('ุงูุบุงุก ุญุธุฑ (%d+)')
DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","ใโ ุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
end 
--     Source AEK     --
--          Mute          --
if Admin(msg) then
if text ==('ูุชู') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ูุชู โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAek:sadd(AEK..'Aek:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ูุชูู ูู ุงููุฌููุนู")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^ูุชู @(.*)') and ChCheck(msg) then
local username = text:match('^ูุชู @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ูุชู โซ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","ใโ ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAek:sadd(AEK..'Aek:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^ูุชู (%d+)') and ChCheck(msg) then
local user = text:match('ูุชู (%d+)')
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ูุชู โซ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","ใโ ูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevAek:sadd(AEK..'Aek:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
end
--     Source AEK     --
--         UnMute         --
if text ==('ุงูุบุงุก ุงููุชู') and ChCheck(msg) or text ==('ุงูุบุงุก ูุชู') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","ใโ ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^ุงูุบุงุก ุงููุชู (%d+)') or text:match('^ุงูุบุงุก ูุชู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงููุชู (%d+)') or text:match('ุงูุบุงุก ูุชู (%d+)')
if not DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","ใโ ูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
end 
--     Source AEK     --
--          Tkeed           --
if Admin(msg) then
if text ==('ุชูููุฏ') and ChCheck(msg) or text ==('ุชููุฏ') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^ุชูููุฏ (%d+)') or text:match('^ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุชูููุฏ (%d+)') or text:match('ุชููุฏ (%d+)')
if not Constructor(msg) and DevAek:get(AEK.."Aek:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'ใโ ููุฏ ุชู ุชุนุทูู ุงููุชู ูุงูุชููุฏ ูู ูุจู ุงูููุดุฆูู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
end
--     Source AEK     --
--         UnTkeed          --
if text ==('ุงูุบุงุก ุชูููุฏ') and ChCheck(msg) or text ==('ุงูุบุงุก ุชููุฏ') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('^ุงูุบุงุก ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('ุงูุบุงุก ุชููุฏ (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
end 
end
--     Source AEK     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('ุญุถุฑ ุนุงู') or text ==('ุญุธุฑ ุนุงู') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAek:sadd(AEK..'Aek:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')) then
local username = text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAek:sadd(AEK..'Aek:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^ุญุถุฑ ุนุงู (%d+)') or text:match('^ุญุธุฑ ุนุงู (%d+)')) then
local user = text:match('ุญุถุฑ ุนุงู (%d+)') or text:match('ุญุธุฑ ุนุงู (%d+)')
if tonumber(user) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',user) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAek:sadd(AEK..'Aek:BanAll:', user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     Source AEK     --
--         MuteAll        --
if text ==('ูุชู ุนุงู') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
DevAek:sadd(AEK..'Aek:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^ูุชู ุนุงู @(.*)') then
local username = text:match('^ูุชู ุนุงู @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
if result.id_ then
DevAek:sadd(AEK..'Aek:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^ูุชู ุนุงู (%d+)') then
local user = text:match('ูุชู ุนุงู (%d+)')
if tonumber(user) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevAek:sismember(AEK..'Aek:SecondSudo:',user) and not Sudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุซุงููู*", 1, 'md')
return false 
end
DevAek:sadd(AEK..'Aek:MuteAll:', user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     Source AEK     --
--         UnAll          --
if text ==('ุงูุบุงุก ุนุงู') or text ==('ุงูุบุงุก ุงูุนุงู') then
function UnAllReply(extra, result, success)
DevAek:srem(AEK..'Aek:BanAll:', result.sender_user_id_)
DevAek:srem(AEK..'Aek:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')) then
local username = text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAek:srem(AEK..'Aek:BanAll:', result.id_)
DevAek:srem(AEK..'Aek:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^ุงูุบุงุก ุนุงู (%d+)') or text:match('^ุงูุบุงุก ุงูุนุงู (%d+)')) then
local user = text:match('ุงูุบุงุก ุนุงู (%d+)') or text:match('ุงูุบุงุก ุงูุนุงู (%d+)')
DevAek:srem(AEK..'Aek:BanAll:', user)
DevAek:srem(AEK..'Aek:MuteAll:', user)
ReplyStatus(msg,user,"Reply","ใโ ุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end
end
end
--     Source AEK     --
if (text == "ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "ููู ููููู ุงูุจูุช" or text == "ุชุบููุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "โซ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู ใ") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'ใโ ูุฌุจ ุงูุชุงูุฏ ุงู ุงููุทูุฑ ุงูุฌุฏูุฏ ุงุฑุณู start ูุฎุงุต ุงูุจูุช ุจุนุฏ ุฐูู ููููู ุงุฑุณุงู ุงูุฏู ุงููุทูุฑ')
DevAek:setex(AEK.."Aek:EditDev"..msg.sender_user_id_,300,true)
end
if DevAek:get(AEK.."Aek:EditDev"..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_,'ใโ ุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู')
DevAek:del(AEK.."Aek:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAek:del(AEK.."Aek:EditDev"..msg.sender_user_id_)
DevAek:set(AEK.."Aek:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\nใโ ุงููุนุฑู โซ [@'..dp.username_..']' else DevUser = '' end
local Text = 'ใโ ุงูุงูุฏู โซ '..dp.id_..DevUser..'\nใโ ุงูุงุณู โซ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\nใโ ุชู ุญูุธ ุงููุนูููุงุช ุจูุฌุงุญ\nใโ ุงุณุชุฎุฏู ุงูุงุฒุฑุงุฑ ููุชุงููุฏ โซ โค'
keyboard = {} 
keyboard.inline_keyboard = {{{text="ูุนู",callback_data="/setyes"},{text="ูุง",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"ใโ ุงููุนูููุงุช ุฎุงุทุฆู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู")
DevAek:del(AEK.."Aek:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source AEK     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุฑูุน ูุทู$") and not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAek:sismember(AEK..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ูู ูุทู ุดุฑูุน ููู ุจุนุฏ๐น๐") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทุงูู") 
DevAek:sadd(AEK..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source AEK     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^ุชูุฒูู ูุทู$") and not DevAek:get(AEK..'Aek:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAek:sismember(AEK..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ูู ููุณ ูุทู ููุชู ุชูุฒููู") 
else
DevAek:srem(AEK..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทุงูู") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source AEK     --
if Admin(msg) then
if text and (text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชููุฏู ููุฏุฉ โซ "..mutept.." ุฏ") 
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชููุฏู ููุฏุฉ โซ "..mutept.." ุณ") 
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ุชุณุชุทูุน ุชููุฏ โซ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุชููุฏู ููุฏุฉ โซ "..mutept.." ู") 
DevAek:sadd(AEK..'Aek:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source AEK     --
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
DevAek:set('AEKTEAM:'..AEK..'id:user'..msg.chat_id_,TXT)  
DevAek:setex('AEKTEAM:'..AEK.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ุนุฏุฏ ุงูุฑุณุงุฆู ุงูุงู \nใโ ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Aek(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
function Reply(extra, result, success)
DevAek:del(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAek:incrby(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุถุงูุฉ "..Num..' ุฑุณุงูู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ููุงุท (%d+)$")
DevAek:set('AEKTEAM:'..AEK..'ids:user'..msg.chat_id_,TXT)  
DevAek:setex('AEKTEAM:'..AEK.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ุนุฏุฏ ุงูููุงุท ุงูุงู \nใโ ุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Aek(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ููุงุท (%d+)$")
function Reply(extra, result, success)
DevAek:incrby(AEK..'Aek:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุถุงูุฉ "..Num..' ููุทู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุชุซุจูุช$") and ChCheck(msg) then 
if DevAek:sismember(AEK.."Aek:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, "ใโ ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAek:set(AEK..'Aek:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุซุจูุช ุงูุฑุณุงูู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงูุจูุช ููุณ ุงุฏูู ููุง !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source AEK     --
if Admin(msg) then
if text == "ุงููููุฒูู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:VipMem:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงููููุฒูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ูููุฒูู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AEK     --
if Manager(msg) then
if text == "ุงูุงุฏูููู" and ChCheck(msg) or text == "ุงูุงุฏูููุฉ" and ChCheck(msg) then 
local Aek =  'Aek:Admins:'..msg.chat_id_
local List = DevAek:smembers(AEK..Aek)
text = "ใโ ูุงุฆูุฉ ุงูุงุฏูููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "ใโ *ูุง ููุฌุฏ ุงุฏูููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source AEK     -- 
if Constructor(msg) then
if text == "ุงููุฏุฑุงุก" and ChCheck(msg) or text == "ูุฏุฑุงุก" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:Managers:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงููุฏุฑุงุก โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ูุฏุฑุงุก*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AEK     --
if BasicConstructor(msg) then
if text == "ุงูููุดุฆูู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:Constructor:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงูููุดุฆูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ููุดุฆูู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AEK     --
if AekConstructor(msg) then
if text == "ุงูููุดุฆูู ุงูุงุณุงุณููู" and ChCheck(msg) or text == "ููุดุฆูู ุงุณุงุณููู" and ChCheck(msg) or text == "ุงูููุดุฆูู ุงูุงุณุงุณูู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:BasicConstructor:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงูููุดุฆูู ุงูุงุณุงุณููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ููุดุฆูู ุงุณุงุณููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("ุงูููุดุฆ") and ChCheck(msg) or text ==("ุงููุงูู") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
local UserName = (dp.username_ or "SoalfLove")
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ููุดุฆ ุงููุฌููุนู โซ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source AEK     --
if Admin(msg) then
if text == "ุงูููุชูููู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:Muted:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงูููุชูููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ููุชูููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     --
if text == "ุงููููุฏูู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:Tkeed:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงููููุฏูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "ใโ *ูุง ููุฌุฏ ูููุฏูู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     --
if text == "ุงููุญุธูุฑูู" and ChCheck(msg) or text == "ุงููุญุถูุฑูู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:Ban:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงููุญุธูุฑูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ูุญุธูุฑูู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "ูุงุฆูู ุงูููุน" and ChCheck(msg) then
local List = DevAek:hkeys(AEK..'Aek:Filters:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ุงูููุน โซ โค \nโโโโโโปใโปโโโโโ\n"
for k, v in pairs(List) do
text = text..k..'~ โจ '..v..' โฉ\n'
end
if #List == 0 then
text = "ใโ ูุง ุชูุฌุฏ ูููุงุช ููููุนู"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source AEK     --
if text == "ุงููุทุงูู" and ChCheck(msg) or text == "ุงููุทุงูุฉ" and ChCheck(msg) then
local List = DevAek:smembers(AEK..'User:Donky:'..msg.chat_id_)
text = "ใโ ูุงุฆูุฉ ูุทุงูุฉ ุงููุฌููุนู ๐น๐ โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "ใโ *ูุง ููุฌุฏ ูุทุงูู ูููุง ุงูุงุฏู* ๐น๐"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source AEK     --
if text == "ุงููุทูุฑูู ุงูุซุงููููู" and SecondSudo(msg) or text == "ุงูุซุงููููู" and SecondSudo(msg) then 
local List = DevAek:smembers(AEK..'Aek:SecondSudo:')
text = "ใโ ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "ใโ *ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู ุซุงููููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     --
if SudoBot(msg) then
if text == "ูุงุฆูู ุงูุนุงู" and ChCheck(msg) or text == "ุงููุญุธูุฑูู ุนุงู" and ChCheck(msg) or text == "ุงูููุชูููู ุนุงู" and ChCheck(msg) or text == "โซ ูุงุฆูู ุงูุนุงู ใ" and ChCheck(msg) then 
local BanAll = DevAek:smembers(AEK..'Aek:BanAll:')
local MuteAll = DevAek:smembers(AEK..'Aek:MuteAll:')
if #BanAll ~= 0 then 
text = "ใโ ูุงุฆูุฉ ุงููุญุธูุฑูู ุนุงู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(BanAll) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."ใโ ูุงุฆูุฉ ุงูููุชูููู ุนุงู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(MuteAll) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "ใโ *ูู ูุชู ุญุธุฑ ุงู ูุชู ุงู ุนุถู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     --
if text == "ุงููุทูุฑูู" and ChCheck(msg) or text == "โซ ุงููุทูุฑูู ใ" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:SudoBot:')
text = "ใโ ูุงุฆูุฉ ุงููุทูุฑูู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local sudouser = DevAek:get(AEK..'Aek:Sudos'..v) 
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."] โฌ Gps : "..(sudouser or 0).."\n"
else
text = text..""..k.."~ : `"..v.."` โฌ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "ใโ *ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     --
if text == "ุงููุฏุฑุงุก ุงูุนุงููู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:ManagerAll:')
text = "ใโ ูุงุฆูุฉ ุงููุฏุฑุงุก ุงูุนุงููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ูุฏุฑุงุก ุนุงููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source AEK     --
if text == "ุงููููุฒูู ุนุงู" and ChCheck(msg) or text == "ุงููููุฒูู ุงูุนุงููู" and ChCheck(msg) then 
local List = DevAek:smembers(AEK..'Aek:VipAll:')
text = "ใโ ูุงุฆูุฉ ุงููููุฒูู ุงูุนุงู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "ใโ *ูุง ููุฌุฏ ูููุฒูู ุนุงู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AEK     -- 
if text == "ุงูุงุฏูููู ุงูุนุงููู" and ChCheck(msg) then 
local Aek =  'Aek:AdminAll:'
local List = DevAek:smembers(AEK..Aek)
text = "ใโ ูุงุฆูุฉ ุงูุงุฏูููู ุงูุนุงููู โซ โค \nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local username = DevAek:get(AEK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "ใโ *ูุง ููุฌุฏ ุงุฏูููู ุนุงููู*"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source AEK     --
if text ==("ุฑูุน ุงูููุดุฆ") and ChCheck(msg) or text ==("ุฑูุน ุงููุงูู") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
DevAek:del(AEK..'Aek:AekConstructor:'..msg.chat_id_)
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
local UserName = (dp.username_ or "SoalfLove")
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุฑูุน ููุดุฆ ุงููุฌููุนู โซ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAek:sadd(AEK.."Aek:AekConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source AEK     --
if Manager(msg) then
if text == 'ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAek:sadd(AEK.."Aek:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ููุน ุงูููุตู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงูู ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAek:sadd(AEK.."Aek:FilterPhoto"..msg.chat_id_,photo)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ููุน ุงูุตูุฑู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAek:sadd(AEK.."Aek:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ููุน ุงููุชุญุฑูู ุจูุฌุงุญ ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source AEK     --
if text == 'ุงูุบุงุก ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAek:srem(AEK.."Aek:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ููุน ุงูููุตู ูููููู ุงุฑุณุงูู ุงูุงู', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAek:srem(AEK.."Aek:FilterPhoto"..msg.chat_id_,photo)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ููุน ุงูุตูุฑู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAek:srem(AEK.."Aek:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ููุน ุงููุชุญุฑูู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source AEK     --
if text and (text == "ุชูุนูู ุชุญููู ุงูุตูุบ" or text == "ุชูุนูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุชุญููู ุงูุตูุบ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Thwel:Aek'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุชุญููู ุงูุตูุบ" or text == "ุชุนุทูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุชุญููู ุงูุตูุบ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Thwel:Aek'..msg.chat_id_,true)  
end
if text == 'ุชุญููู' and not DevAek:get(AEK..'Aek:Thwel:Aek'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Aek = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Aek.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Aek = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Aek.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','ใโ ุชู ุชุญููู ุงูููุตู ุงูู ุตูุฑู')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Aek = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Aek.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"ใโ ุชู ุชุญููู ุงููMp3 ุงูู ุจุตูู")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Aek = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Aek.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source AEK     --
if text ==("ูุดู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ุงูุฏู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAek:sismember(AEK..'Aek:BanAll:',result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAek:sismember(AEK..'Aek:MuteAll:',result.sender_user_id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAek:sismember(AEK..'Aek:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ููุชูู'
elseif DevAek:sismember(AEK..'Aek:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nใโ ุงููููุฏ โซ '..Tkeed
else 
Tked = '' 
end
if DevAek:sismember(AEK..'Aek:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\nใโ ุนุฏุฏ ุงููุฑูุจุงุช โซ '..(DevAek:get(AEK..'Aek:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\nใโ ููุจู โซ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'ใโ ุงุณูู โซ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\nใโ ุงูุฏูู โซ โจ `'..result.sender_user_id_..'` โฉ\nใโ ุฑุชุจุชู โซ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(user_msgs)..''..CustomTitle..'\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุนุฑูู โซ [@'..data.username_..']\nใโ ุงูุฏูู โซ โจ `'..result.sender_user_id_..'` โฉ\nใโ ุฑุชุจุชู โซ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(user_msgs)..''..CustomTitle..'\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^ูุดู @(.*)') and ChCheck(msg) or text and text:match('^ุงูุฏู @(.*)') and ChCheck(msg) then 
local username = text:match('^ูุดู @(.*)') or text:match('^ุงูุฏู @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'ููุงุฉ'
local chn = 'ใโ ููุน ุงูุญุณุงุจ โซ โจ '..ch..' โฉ\nใโ ุงูุงูุฏู โซ โจ `'..res.id_..'` โฉ\nใโ ุงููุนุฑู โซ โจ [@'..username..'] โฉ\nใโ ุงูุงุณู โซ โจ ['..res.title_..'] โฉ'
Dev_Aek(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'ูุฌููุนู'
local grr = 'ใโ ููุน ุงูุญุณุงุจ โซ โจ '..gr..' โฉ\nใโ ุงูุงูุฏู โซ โจ '..res.id_..' โฉ\nใโ ุงููุนุฑู โซ โจ [@'..username..'] โฉ\nใโ ุงูุงุณู โซ โจ ['..res.title_..'] โฉ'
Dev_Aek(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAek:sismember(AEK..'Aek:BanAll:',res.id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAek:sismember(AEK..'Aek:MuteAll:',res.id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAek:sismember(AEK..'Aek:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'ููุชูู'
elseif DevAek:sismember(AEK..'Aek:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nใโ ุงููููุฏ โซ '..Tkeed
else 
Tked = '' 
end
if DevAek:sismember(AEK..'Aek:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\nใโ ุนุฏุฏ ุงููุฑูุจุงุช โซ '..(DevAek:get(AEK..'Aek:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\nใโ ููุจู โซ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุนุฑูู โซ [@'..data.username_..']\nใโ ุงูุฏูู โซ โจ `'..res.id_..'` โฉ\nใโ ุฑุชุจุชู โซ '..IdRank(res.id_, msg.chat_id_)..''..sudobot..'\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(user_msgs)..''..CustomTitle..'\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('ูุดู (%d+)') and ChCheck(msg) or text and text:match('ุงูุฏู (%d+)') and ChCheck(msg) then 
local iduser = text:match('ูุดู (%d+)') or text:match('ุงูุฏู (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูู ูุชู ุงูุชุนุฑู ุนูู ุงูุญุณุงุจ', 1, 'md')
return false  
end
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAek:sismember(AEK..'Aek:BanAll:',iduser) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevAek:sismember(AEK..'Aek:MuteAll:',iduser) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevAek:sismember(AEK..'Aek:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'ูุญุธูุฑ'
elseif DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'ููุชูู'
elseif DevAek:sismember(AEK..'Aek:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nใโ ุงููููุฏ โซ '..Tkeed
else 
Tked = '' 
end
if DevAek:sismember(AEK..'Aek:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\nใโ ุนุฏุฏ ุงููุฑูุจุงุช โซ '..(DevAek:get(AEK..'Aek:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\nใโ ููุจู โซ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'ใโ ุงุณูู โซ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\nใโ ุงูุฏูู โซ โจ `'..result.sender_user_id_..'` โฉ\nใโ ุฑุชุจุชู โซ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(user_msgs)..''..CustomTitle..'\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ูุนุฑูู โซ [@'..data.username_..']\nใโ ุงูุฏูู โซ โจ `'..iduser..'` โฉ\nใโ ุฑุชุจุชู โซ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\nใโ ุฑุณุงุฆูู โซ โจ '..user_msgs..' โฉ\nใโ ุชูุงุนูู โซ '..formsgs(user_msgs)..''..CustomTitle..'\nใโ ููุงุทู โซ โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source AEK     --
if text == 'ูุดู ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevAek:sismember(AEK..'Aek:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevAek:sismember(AEK..'Aek:BanAll:',result.sender_user_id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevAek:sismember(AEK..'Aek:MuteAll:',result.sender_user_id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevAek:sismember(AEK..'Aek:Tkeed:',result.sender_user_id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุญุธุฑ ุงูุนุงู โซ '..banall..'\nใโ ุงููุชู ุงูุนุงู โซ '..muteall..'\nใโ ุงูุญุธุฑ โซ '..banned..'\nใโ ุงููุชู โซ '..muted..'\nใโ ุงูุชููุฏ โซ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^ูุดู ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^ูุดู ุงููููุฏ @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAek:sismember(AEK..'Aek:Muted:'..msg.chat_id_,result.id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevAek:sismember(AEK..'Aek:Ban:'..msg.chat_id_,result.id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevAek:sismember(AEK..'Aek:BanAll:',result.id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevAek:sismember(AEK..'Aek:MuteAll:',result.id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevAek:sismember(AEK..'Aek:Tkeed:',result.id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุญุธุฑ ุงูุนุงู โซ '..banall..'\nใโ ุงููุชู ุงูุนุงู โซ '..muteall..'\nใโ ุงูุญุธุฑ โซ '..banned..'\nใโ ุงููุชู โซ '..muted..'\nใโ ุงูุชููุฏ โซ '..tkeed..'', 1, 'md')  
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'ุฑูุน ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","ใโ ุชู ุฑูุน ูููุฏู")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_,result.sender_user_id_) DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^ุฑูุน ุงููููุฏ (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('ุฑูุน ุงููููุฏ (%d+)') 
if tonumber(user) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","ใโ ุชู ุฑูุน ูููุฏู")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_,user) DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_,user) DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_,user)   
end,nil)  
end
if text and text:match('^ุฑูุน ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('ุฑูุน ุงููููุฏ @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ูุนุฑู ููุงุฉ ูููุณ ูุนุฑู ุญุณุงุจ', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(AEK) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","ใโ ุชู ุฑูุน ูููุฏู")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_,result.id_) DevAek:srem(AEK..'Aek:Ban:'..msg.chat_id_,result.id_) DevAek:srem(AEK..'Aek:Muted:'..msg.chat_id_,result.id_)   
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source AEK     --
if Manager(msg) then
if text and text:match("^ุชุบููุฑ ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุบูุฑ ุงูุงูุฏู$") and ChCheck(msg) then 
local List = {
[[
ใ?๐๐๐ด๐ ๐จ #username ๐ฅฒ .
ใ?๐ผ๐๐ถ ๐จ #msgs ๐ฅฒ .
ใ?๐๐๐ฐ ๐จ #stast ๐ฅฒ .
ใ?๐ธ๐ณ ๐จ #id ๐ฅฒ .
]],
[[
โญ- ๐๐๐๐ #stast ๐ฏ. ๐
โฎ- ๐๐๐๐๐ #username ๐ฏ. ๐
โญ- ๐๐๐๐๐ #msgs ๐ฏ. ๐
โญ- ๐๐ ๐ #id ๐ฏ. ๐
]],
[[
โ ๐ฐ ๐พ๐๐๐๐๐๐ ๐ป๐ ๐ฎ๐๐๐๐ โ
โข ๐ค | ๐ผ๐ฌ๐บ : #username โโโโ
โข ๐ค | ๐บ๐ป๐จ : #stast ๐ง๐ปโโ๏ธ โฅ
โข ๐ค | ๐ฐ๐ซ : #id โโโโ
โข ๐ค | ๐ด๐บ๐ฎ : #msgs ๐
]],
[[
โ ๐๐๐๐ ๐คฑ #username ๐ฆด .
โ ๐๐๐ ๐คฑ #msgs ๐ฆด .
โ ๐๐๐ ๐คฑ #stast ๐ฆด .
โ ๐๐ ๐คฑ #id ๐ฆด .
]],
[[
๐ผ๐ฎ๐ถ ๐ผ๐๐๐๐ต๐๐๐ : #username 
๐ผ๐ฎ๐ถ ๐บ๐๐๐๐ : #stast 
๐ผ๐ฎ๐ถ ๐๐ : #id 
๐ผ๐ฎ๐ถ ๐ฎ๐๐๐๐บ : #game 
๐ผ๐ฎ๐ถ ๐ด๐๐๐ : #msgs
]],
[[
โ: ๐๐๐๐ #stast ๐ฏโธ๐.
โ: ๐๐๐๐๐ #username ๐ฏโธ๐.
โ: ๐๐๐๐๐ #msgs ๐ฏโธ๐.
โ: ๐๐ ๐ #id ๐ฏโธ๐.
]],
[[
โโข๐ฎ๐ฌ๐๐ซ : #username ๐ฃฌ  
โโข๐ฆ๐ฌ๐?  : #msgs ๐ฃฌ 
โโข๐ฌ๐ญ๐ : #stast ๐ฃฌ 
โโข๐ข๐  : #id ๐ฃฌ
]],
[[
- ๐ฌ ๐๐ฌ๐๐ซ : #username ๐ .
- ๐ฌ ๐๐ฌ๐  : #msgs ๐ .
- ๐ฌ ๐๐ญ๐ : #stast ๐ .
- ๐ฌ ๐๐ : #id ๐ .
]],
[[
.๐ฃ ๐ช๐จ๐๐ง๐ฃ๐๐ข๐ , #username  
.๐ฃ ๐จ๐ฉ๐๐จ๐ฉ , #stast  
.๐ฃ ๐ก๐ฟ , #id  
.๐ฃ ๐๐๐ข๐จ , #game 
.๐ฃ ๐ข๐จ๐๐จ , #msgs
]],
[[
ใโ ๐๐๐๐ โฌ #username 
ใโ ๐๐ โฌ #id
ใโ ๐๐๐๐๐ โฌ #stast
ใโ ๐๐๐๐ โฌ #cont 
ใโ ๐๐๐๐ โฌ #msgs
ใโ ๐๐๐๐ โฌ #game
]],
[[
แฏ ๐จ๐ฆ๐๐ฅ๐ก๐ฎ๐บ๐ . #username ๐บ๐ธ ๊ฐ
แฏ ๐ฆ๐ง๐ฎ๐ฆ๐ง . #stast ๐บ๐ธ ๊ฐ
แฏ ๐๐ . #id ๐บ๐ธ ๊ฐ
แฏ ๐๐ฎ๐บ๐๐ฆ . #game ๐บ๐ธ ๊ฐ
แฏ ๐บ๐ฆ๐๐ฆ . #msgs ๐บ๐ธ ๊ฐ
]],
[[
- แดัแดสษดแดแดแด โฅโข #username .
- แดัษขั โฅโข #msgs .
- ัแดแดแดั โฅโข #stast .
- สแดแดส ษชแด โฅโข #id  .
- แดแดษชแด แดsษข โฅโข #edit .
- แดแดแดแดษชสs โฅโข #auto . 
- ษขแดแดแด โฅโข #game .
]]}
local Text_Rand = List[math.random(#List)]
DevAek:set(AEK.."Aek:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุชุบูุฑ ูููุดุฉ ุงูุงูุฏู")  
end
--     Source AEK     --
if SecondSudo(msg) then
if text and text:match("^ุชุนููู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนูู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนููู ูููุดุฉ ุงูุงูุฏู$") then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nใโ ูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู โซ โค\nโโโโโโปใโปโโโโโ\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\nโโโโโโปใโปโโโโโ', 1, 'md')
DevAek:set("AEK:New:id:"..AEK..msg.sender_user_id_,'AEKTEAM')
return "AEKTEAM"
end
if text and DevAek:get("AEK:New:id:"..AEK..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevAek:del("AEK:New:id:"..AEK..msg.sender_user_id_)
return false
end
DevAek:del("AEK:New:id:"..AEK..msg.sender_user_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู', 1, 'md')
DevAek:set(AEK.."Aek:AllIds:Text",text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ูุณุญ ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุญุฐู ูููุดุฉ ุงูุงูุฏู$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู")  
DevAek:del(AEK.."Aek:AllIds:Text")
end
end
--     Source AEK     --
if text and text:match("^ุชุนููู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุนูู ุงูุงูุฏู$") and ChCheck(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nใโ ูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู โซ โค\nโโโโโโปใโปโโโโโ\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\nโโโโโโปใโปโโโโโ', 1, 'md')
DevAek:set("AEK:New:id:"..AEK..msg.chat_id_..msg.sender_user_id_,'AEKTEAM')
return "AEKTEAM"
end
if text and Manager(msg) and DevAek:get("AEK:New:id:"..AEK..msg.chat_id_..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevAek:del("AEK:New:id:"..AEK..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAek:del("AEK:New:id:"..AEK..msg.chat_id_..msg.sender_user_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู', 1, 'md')
DevAek:set(AEK.."Aek:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุงูุฏู$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู")  
DevAek:del(AEK.."Aek:GpIds:Text"..msg.chat_id_)
end
end
--     Source AEK     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ุงูุฏู$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function AEKTEAM(extra,Aekan,success)
if Aekan.username_ then username = '@'..Aekan.username_ else username = 'ูุง ููุฌุฏ' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'ูุง ููุฌุฏ' end
local function getpro(extra, Aekan, success) 
local msgsday = DevAek:get(AEK..'Aek:UsersMsgs'..AEK..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAek:get(AEK..'Aek:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAek:get(AEK..'Aek:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAek:get(AEK..'Aek:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAek:get(AEK..'Aek:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"ุจูุจูู ุญููู","ุฌูุงูู ูุงุฎุฐ ุงูุฃูู","ูุฏูุช ุงูุตุงู","ุดูู ุงูุฌูุงู","ุฎูููู ุงุญุจู","ุจุจูู ููุจู","ุดูู ุงูฺฏููุฑ","ุดุงุนู ุงูุฏููุง ุจุญูุงุชู","ุดูู ุงูุนุณู","ูุฏูุช ุงูุญูู","ูููุฑ ุงูููู ูุทูุชู","ุดูู ุงูุตูุฑู ุชุฎูุจุด","ูุง ูููู ููููุฑ ุงูุงู ูุฌูู","ุงุฑูุญ ููุฏูู ูููุญูููููู","ูู ุตูุฑู ุธูู ุจุงููุจู ุ๐คค๐","ููุชูุน ุจุตูุฑุชู !ุ ๐น๐ค","ููุงู ููุงุณูู ุจูุฑูุจูู ุ๐คค๐","ูุดุฎู ุจุฑุจ ุ๐๐ค","ูุฒูุช ุจููุง ุฏุบูุฑูุง ุนุงุฏ ุ๐๐","ุตูุฑุชู ูุงูุฑุชุงุญุชููุง ุ๐๐ถ","ุญูุบูู ูุงููู ุ๐ฅบ๐","ูู ุตูุฑู ุบูุจูู ุจุฑุงุณูุง ูฆู? ุญุธ ุ๐น๐ค"}
local Description = Texting[math.random(#Texting)]
if Aekan.photos_[0] then
if not DevAek:get(AEK..'Aek:Lock:Id'..msg.chat_id_) then 
if not DevAek:get(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_) then 
if DevAek:get(AEK.."Aek:AllIds:Text") then
newpicid = DevAek:get(AEK.."Aek:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#photos',(Aekan.total_count_ or 'ูุง ููุฌุฏ')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newpicid = "ใโ "..Description.."\nใโ ูุนุฑูู โซ โจ "..username.." โฉ\nใโ ุงูุฏูู โซ โจ "..msg.sender_user_id_.." โฉ\nใโ ุฑุชุจุชู โซ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nใโ ุฑุณุงุฆูู โซ โจ "..user_msgs.." โฉ\nใโ ุณุญูุงุชู โซ โจ "..edit_msg.." โฉ\nใโ ุชูุงุนูู โซ "..formsgs(msguser).."\nใโ ููุงุทู โซ โจ "..user_nkt.." โฉ\nโโโโโโปใโปโโโโโ\n"
end 
if not DevAek:get(AEK.."Aek:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Aekan.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAek:get(AEK.."Aek:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(Aekan.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Aekan.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAek:get(AEK.."Aek:AllIds:Text") then
newallid = DevAek:get(AEK.."Aek:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#photos',(Aekan.total_count_ or 'ูุง ููุฌุฏ')) 
newallid = newallid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newallid = "ใโ ูุนุฑูู โซ โจ "..username.." โฉ\nใโ ุงูุฏูู โซ โจ "..msg.sender_user_id_.." โฉ\nใโ ุฑุชุจุชู โซ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nใโ ุฑุณุงุฆูู โซ โจ "..user_msgs.." โฉ\nใโ ุณุญูุงุชู โซ โจ "..edit_msg.." โฉ\nใโ ุชูุงุนูู โซ "..formsgs(msguser).."\nใโ ููุงุทู โซ โจ "..user_nkt.." โฉ"
end 
if not DevAek:get(AEK.."Aek:GpIds:Text"..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAek:get(AEK.."Aek:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(Aekan.total_count_ or 'ูุง ููุฌุฏ')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
Dev_Aek(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฐุฑุง ุงูุงูุฏู ูุนุทู ', 1, 'md')
end
else
if DevAek:get(AEK.."Aek:AllIds:Text") then
notpicid = DevAek:get(AEK.."Aek:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#photos',(Aekan.total_count_ or 'ูุง ููุฌุฏ')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
notpicid = "ใโ ูุง ุงุณุชุทูุน ุนุฑุถ ุตูุฑุชู ูุงูู ููุช ุจุญุธุฑ ุงูุจูุช ุงู ุงูู ูุงุชูุชูู ุตูุฑู ูู ุจุฑููุงููู\nโโโโโโปใโปโโโโโ\nใโ ูุนุฑูู โซ โจ "..username.." โฉ\nใโ ุงูุฏูู โซ โจ "..msg.sender_user_id_.." โฉ\nใโ ุฑุชุจุชู โซ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nใโ ุฑุณุงุฆูู โซ โจ "..user_msgs.." โฉ\nใโ ุณุญูุงุชู โซ โจ "..edit_msg.." โฉ\nใโ ุชูุงุนูู โซ "..formsgs(msguser).."\nใโ ููุงุทู โซ โจ "..user_nkt.." โฉ\nโโโโโโปใโปโโโโโ\n"
end 
if not DevAek:get(AEK..'Aek:Lock:Id'..msg.chat_id_) then
if not DevAek:get(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุนุฑูู โซ โจ "..username.." โฉ\nใโ ุงูุฏูู โซ โจ "..msg.sender_user_id_.." โฉ\nใโ ุฑุชุจุชู โซ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nใโ ุฑุณุงุฆูู โซ โจ "..user_msgs.." โฉ\nใโ ุณุญูุงุชู โซ โจ "..edit_msg.." โฉ\nใโ ุฑุณุงุฆูู โซ โจ "..user_msgs.." โฉ\nใโ ุชูุงุนูู โซ "..formsgs(msguser).."\nใโ ููุงุทู โซ โจ "..user_nkt.." โฉ", 1, 'md')
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฐุฑุง ุงูุงูุฏู ูุนุทู', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, AEKTEAM)
end
end 
--     Source AEK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ููู (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุชุนุฏูู" then
if not DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชุนุฏูู")  
DevAek:set(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชุนุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or LockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if not DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุชุนุฏูู ุงูููุฏูุง")  
DevAek:set(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู" then
if not DevAek:get(AEK..'Aek:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุงุฑุณูู")  
DevAek:set(AEK..'Aek:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ" then
if not DevAek:get(AEK..'Aek:Lock:FarsiWarn'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ")  
DevAek:set(AEK..'Aek:Lock:FarsiWarn'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุดุงุฑ" then
if DevAek:get(AEK..'Aek:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุดุงุฑ")  
DevAek:del(AEK..'Aek:Lock:Fshar'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุดุงุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุทุงุฆููู" then
if DevAek:get(AEK..'Aek:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุทุงุฆููู")  
DevAek:del(AEK..'Aek:Lock:Taf'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุทุงุฆููู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฑ" then
if DevAek:get(AEK..'Aek:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูููุฑ")  
DevAek:del(AEK..'Aek:Lock:Kfr'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if not DevAek:get(AEK..'Aek:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevAek:set(AEK..'Aek:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููููู ', 1, 'md')
end
end
if LockText[2] == "ุงูุจูุชุงุช" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุญุฐู" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุจูุชุงุช ุจุงูุญุฐู")  
DevAek:set(AEK.."Aek:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุจูุชุงุช ุจุงูุทุฑุฏ")  
DevAek:set(AEK.."Aek:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุจูุชุงุช ุจุงูุชููุฏ")  
DevAek:set(AEK.."Aek:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุญุฐู" then 
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุญุฐู")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ" then 
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชููุฏ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชูููุฏ" then 
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูุฑุงุฑ ุจุงูุชููุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงููุชู" then 
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูุฑุงุฑ ุจุงููุชู")  
end
if BasicConstructor(msg) then
if LockText[2] == "ุงูุชุซุจูุช" then
if not DevAek:get(AEK..'Aek:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAek:set(AEK.."Aek:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชุซุจูุช")  
DevAek:set(AEK..'Aek:Lock:Pin'..msg.chat_id_,true)
DevAek:sadd(AEK.."Aek:Lock:Pinpin",msg.chat_id_) 
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชุซุจูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
end
--     Source AEK     --
if Admin(msg) then
if text and (text:match("^ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุชูุฑุงุฑ (%d+)$")) then   
local TextSpam = text:match("ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุชูุฑุงุฑ (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุชุญุฏูุฏ ุนุฏุฏ ุงูุจุฑ ูู 2 ููุชูุฑุงุฑ', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ูุถุน ุนุฏุฏ ุงูุชูุฑุงุฑ โซ '..TextSpam, 1, 'md')
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")) then  
local TextSpam = text:match("ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")
DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ูุถุน ุฒูู ุงูุชูุฑุงุฑ โซ '..TextSpam, 1, 'md')
end
--     Source AEK     --
if Manager(msg) then
if text and text == 'ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ููุนู', 1, 'md')
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if DevAek:get(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ูุนุทู', 1, 'md')
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'ุชูุนูู ุงูุงูุฏู' and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Lock:Id'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูุฏู ุจุงูุชุงููุฏ ููุนู ', 1, 'md')
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงูุฏู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'ุชุนุทูู ุงูุงูุฏู' and ChCheck(msg) then
if DevAek:get(AEK..'Aek:Lock:Id'..msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูุฏู ุจุงูุชุงููุฏ ูุนุทู ', 1, 'md')
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงูุฏู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source AEK     --
if text == 'ุถุน ุฑุงุจุท' or text == 'ูุถุน ุฑุงุจุท' or text == 'ุถุน ุงูุฑุงุจุท' or text == 'ูุถุน ุงูุฑุงุจุท' then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevAek:setex(AEK.."Aek:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
if text == 'ุงูุดุงุก ุฑุงุจุท' or text == 'ุงูุดุงุก ุงูุฑุงุจุท' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAek:get(AEK.."Aek:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAek:set(AEK.."Aek:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุดุงุก ุฑุงุจุท ุฌุฏูุฏ ุงุฑุณู โซ ุงูุฑุงุจุท', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุฏุนูุฉ ุงููุณุชุฎุฏููู ุนุจุฑ ุงูุฑุงุจุท ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevAek:setex(AEK.."Aek:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
end
end
--     Source AEK     --
if Admin(msg) then
if text and text:match("^ุชูุนูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุชุฑุญูุจ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK.."Aek:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^ุชุนุทูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุชุฑุญูุจ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK.."Aek:Lock:Welcome"..msg.chat_id_)
end
if DevAek:get(AEK..'Aek:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
DevAek:del(AEK..'Aek:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAek:del(AEK..'Aek:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Groups:Welcomes'..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
return false   
end
if text and text:match("^ุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ูุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงุถู ุชุฑุญูุจ$") and ChCheck(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ุงูุชุฑุญูุจ ุงูุงู\nใโ ุชุณุชุทูุน ุงุถุงูุฉ ูุงููู โซ โค\nใโ ุฏุงูุฉ ุนุฑุถ ุงูุงุณู โซ firstname\nใโ ุฏุงูุฉ ุนุฑุถ ุงููุนุฑู โซ username', 1, 'md')
DevAek:set(AEK..'Aek:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^ุญุฐู ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุญุฐู ุชุฑุญูุจ$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูุชุฑุญูุจ")  
DevAek:del(AEK..'Aek:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^ุฌูุจ ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุฌูุจ ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local wel = DevAek:get(AEK..'Aek:Groups:Welcomes'..msg.chat_id_)
if wel then
Dev_Aek(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ูุชู ูุถุน ุงูุชุฑุญูุจ \nใโ ุงุฑุณู โซ ุถุน ุชุฑุญูุจ ููุญูุธ ', 1, 'md')
end
end
--     Source AEK     --
if DevAek:get(AEK..'Aek:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุญูุธ ุงููุตู", 1, 'md')
DevAek:del(AEK..'Aek:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAek:del(AEK..'Aek:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชุบููุฑ ูุตู ุงููุฌููุนู', 1, 'md')
return false  
end 
if text and text:match("^ุถุน ูุตู$") and ChCheck(msg) or text and text:match("^ูุถุน ูุตู$") and ChCheck(msg) then  
DevAek:set(AEK..'Aek:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ุงููุตู ุงูุงู', 1, 'md')
end
--     Source AEK     --
if text and text == "ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevAek:set(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAek:get(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูููุน', 1, 'md')
DevAek:del(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ููุน ุงููููู โซ "..text, 1, 'html')
DevAek:del(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAek:hset(AEK..'Aek:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "ุงูุบุงุก ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevAek:set(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAek:get(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุบุงุก ุงูููุน', 1, 'md')
DevAek:del(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAek:hget(AEK..'Aek:Filters:'..msg.chat_id_, text) then  
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงููููู โซ "..text.." ุบูุฑ ููููุนู", 1, 'html')
DevAek:del(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAek:hdel(AEK..'Aek:Filters:'..msg.chat_id_, text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงููููู โซ "..text.." ุชู ุงูุบุงุก ููุนูุง", 1, 'html')
DevAek:del(AEK.."Aek:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source AEK     --
if SudoBot(msg) then
if text and text == "ุงูุงุญุตุงุฆูุงุช" and ChCheck(msg) or text and text == "โซ ุงูุงุญุตุงุฆูุงุช ใ" then
local gps = DevAek:scard(AEK.."Aek:Groups") local users = DevAek:scard(AEK.."Aek:Users") 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุญุตุงุฆูุงุช ุงูุจูุช โซ โค\nใโ ุนุฏุฏ ุงููุดุชุฑููู โซ โจ '..users..' โฉ\nใโ ุนุฏุฏ ุงููุฌููุนุงุช โซ โจ '..gps..' โฉ', 1, 'md')
end
if text and text == "ุงููุดุชุฑููู" and ChCheck(msg) or text and text == "โซ ุงููุดุชุฑููู ใ" then
local users = DevAek:scard(AEK.."Aek:Users")
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ุงููุดุชุฑููู โซ โจ '..users..' โฉ', 1, 'md')
end
if text and text == 'ุงููุฌููุนุงุช' and ChCheck(msg) or text and text == 'โซ ุงููุฌููุนุงุช ใ' then
local gps = DevAek:scard(AEK.."Aek:Groups")
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ุงููุฌููุนุงุช โซ โจ '..gps..' โฉ', 1, 'md')
end
end
--     Source AEK     --
if text and text:match('^ุชูุธูู (%d+)$') and ChCheck(msg) then  
if not DevAek:get(AEK..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^ุชูุธูู (%d+)$')) 
if Number > 1000 then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุงุชุณุชุทูุน ุชูุธูู ุงูุซุฑ ูู 1000 ุฑุณุงูู', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชูุธูู *'..Number..'* ูู ุงูุฑุณุงุฆู', 1, 'md')
DevAek:setex(AEK..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "ุชูุธูู ุงููุดุชุฑููู" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAek:smembers(AEK.."Aek:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAek:srem(AEK.."Aek:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ *ูุง ููุฌุฏ ูุดุชุฑููู ูููููู*', 1, 'md')
else
local ok = #pv - sendok
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ุงููุดุชุฑููู ุงูุงู โซ { '..#pv..' }\nใโ ุชู ุญุฐู โซ { '..sendok..' } ูู ุงููุดุชุฑููู\nใโ ุงูุนุฏุฏ ุงูุญูููู ุงูุงู  โซ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source AEK     --
if text == "ุชูุธูู ุงููุฑูุจุงุช" and SecondSudo(msg) and ChCheck(msg) or text == "ุชูุธูู ุงููุฌููุนุงุช" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAek:smembers(AEK.."Aek:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAek:srem(AEK.."Aek:Groups",group[i]) 
changeChatMemberStatus(group[i], AEK, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAek:srem(AEK.."Aek:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAek:srem(AEK.."Aek:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAek:srem(AEK.."Aek:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ *ูุงุชูุฌุฏ ูุฌููุนุงุช ููููู*', 1, 'md')   
else
local AEKgp2 = (w + q)
local AEKgp3 = #group - AEKgp2
if q == 0 then
AEKgp2 = ''
else
AEKgp2 = '\nใโ ุชู ุญุฐู โซ { '..q..' } ูุฌููุนู ูู ุงูุจูุช'
end
if w == 0 then
AEKgp1 = ''
else
AEKgp1 = '\nใโ ุชู ุญุฐู โซ { '..w..' } ูุฌููุนู ุจุณุจุจ ุชูุฒูู ุงูุจูุช ุงูู ุนุถู'
end
Dev_Aek(msg.chat_id_, msg.id_, 1,'ใโ ุนุฏุฏ ุงููุฑูุจุงุช ุงูุงู โซ { '..#group..' }'..AEKgp1..''..AEKgp2..'\nใโ ุงูุนุฏุฏ ุงูุญูููู ุงูุงู  โซ ( '..AEKgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source AEK     --
if Admin(msg) then
if text == "ุชูุธูู ุชุนุฏูู" and ChCheck(msg) or text == "ุชูุธูู ุงูุชุนุฏูู" and ChCheck(msg) then   
Aek_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Aek_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Aek_Del},function(arg,data)
new = 0
Aek_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Aek_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Aek_Del2)
end,nil)  
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชูุธูู 100 ูู ุงูุฑุณุงุฆู ุงููุนุฏูู', 1, 'md')
end
--     Source AEK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุชุนุฏูู" then
if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุชุนุฏูู")  
DevAek:del(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชุนุฏูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or UnLockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุชุนุฏูู ุงูููุฏูุง")  
DevAek:del(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู" then
if DevAek:get(AEK..'Aek:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุงุฑุณูู")  
DevAek:del(AEK..'Aek:Lock:Farsi'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ" then
if DevAek:get(AEK..'Aek:Lock:FarsiWarn'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ")  
DevAek:del(AEK..'Aek:Lock:FarsiWarn'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุดุงุฑ" then
if not DevAek:get(AEK..'Aek:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุดุงุฑ")  
DevAek:set(AEK..'Aek:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุดุงุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุทุงุฆููู" then
if not DevAek:get(AEK..'Aek:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุทุงุฆููู")  
DevAek:set(AEK..'Aek:Lock:Taf'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุทุงุฆููู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฑ" then
if not DevAek:get(AEK..'Aek:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูููุฑ")  
DevAek:set(AEK..'Aek:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if DevAek:get(AEK..'Aek:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevAek:del(AEK..'Aek:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููุชูุญู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุจูุชุงุช" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุจูุชุงุช")  
DevAek:del(AEK.."Aek:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "ุงูุชูุฑุงุฑ" then 
DevAek:hdel(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุชูุฑุงุฑ")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "ุงูุชุซุจูุช" then
if DevAek:get(AEK..'Aek:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุชุซุจูุช")  
DevAek:del(AEK..'Aek:Lock:Pin'..msg.chat_id_)
DevAek:srem(AEK.."Aek:Lock:Pinpin",msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชุซุจูุช ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
--     Source AEK     --
if Admin(msg) then
if text and text:match("^ููู (.*)$") then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุฏุฑุฏุดู" then
if not DevAek:get(AEK..'Aek:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุฏุฑุฏุดู")  
DevAek:set(AEK..'Aek:Lock:Text'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฏุฑุฏุดู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงูููุงูู" then
if not DevAek:get(AEK..'Aek:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุงูููุงูู")  
DevAek:set(AEK..'Aek:Lock:Inline'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูููุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุฑ" then
if not DevAek:get(AEK..'Aek:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุตูุฑ")  
DevAek:set(AEK..'Aek:Lock:Photo'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุตูุฑ ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุด" then
if not DevAek:get(AEK..'Aek:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูููุงูุด")  
DevAek:set(AEK..'Aek:Lock:Spam'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุงูุด ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฏุฎูู" then
if not DevAek:get(AEK..'Aek:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุฏุฎูู")  
DevAek:set(AEK..'Aek:Lock:Join'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฏุฎูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฏูู" then
if not DevAek:get(AEK..'Aek:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูููุฏูู")  
DevAek:set(AEK..'Aek:Lock:Videos'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุชุญุฑูู" then
if not DevAek:get(AEK..'Aek:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุชุญุฑูู")  
DevAek:set(AEK..'Aek:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุชุญุฑูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุบุงูู" then
if not DevAek:get(AEK..'Aek:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุงุบุงูู")  
DevAek:set(AEK..'Aek:Lock:Music'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงุบุงูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุช" then
if not DevAek:get(AEK..'Aek:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุตูุช")  
DevAek:set(AEK..'Aek:Lock:Voice'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุตูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฑูุงุจุท" then
if not DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุฑูุงุจุท")  
DevAek:set(AEK..'Aek:Lock:Links'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฑูุงุจุท ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุน" then
if not DevAek:get(AEK..'Aek:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูููุงูุน")  
DevAek:set(AEK..'Aek:Lock:Location'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุงูุน ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุนุฑู" or LockText[2] == "ุงููุนุฑูุงุช" then
if not DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุนุฑูุงุช")  
DevAek:set(AEK..'Aek:Lock:Tags'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุนุฑูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููููุงุช" then
if not DevAek:get(AEK..'Aek:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููููุงุช")  
DevAek:set(AEK..'Aek:Lock:Document'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููููุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุดุชุงู" or LockText[2] == "ุงูุชุงู" then
if not DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุงุดุชุงู")  
DevAek:set(AEK..'Aek:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุดุชุงู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฌูุงุช" then
if not DevAek:get(AEK..'Aek:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุฌูุงุช")  
DevAek:set(AEK..'Aek:Lock:Contact'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, '๏ธใโ ุงูุฌูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุดุจูุงุช" then
if not DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุดุจูุงุช")  
DevAek:set(AEK..'Aek:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุดุจูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุนุฑุจูู" then
if not DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุนุฑุจูู")  
DevAek:set(AEK..'Aek:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุฑุจูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงููููุฒูู" then
if not DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุงููููุฒูู")  
DevAek:set(AEK..'Aek:Lock:English'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงููููุฒูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุตูุงุช" then
if not DevAek:get(AEK..'Aek:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูููุตูุงุช")  
DevAek:set(AEK..'Aek:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุตูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑูุฏุงูู" then
if not DevAek:get(AEK..'Aek:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงููุงุฑูุฏุงูู")  
DevAek:set(AEK..'Aek:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑูุฏุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if not DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุงุดุนุงุฑุงุช")  
DevAek:set(AEK..'Aek:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงุดุนุงุฑุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชูุฌูู" then
if not DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูุฌูู")  
DevAek:set(AEK..'Aek:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชูุฌูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     Source AEK     --
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุฏุฑุฏุดู" then
if DevAek:get(AEK..'Aek:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุฏุฑุฏุดู")  
DevAek:del(AEK..'Aek:Lock:Text'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฏุฑุฏุดู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุฑ" then
if DevAek:get(AEK..'Aek:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุตูุฑ")  
DevAek:del(AEK..'Aek:Lock:Photo'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุตูุฑ ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุด" then
if DevAek:get(AEK..'Aek:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูููุงูุด")  
DevAek:del(AEK..'Aek:Lock:Spam'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุงูุด ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฏุฎูู" then
if DevAek:get(AEK..'Aek:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุฏุฎูู")  
DevAek:del(AEK..'Aek:Lock:Join'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฏุฎูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฏูู" then
if DevAek:get(AEK..'Aek:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูููุฏูู")  
DevAek:del(AEK..'Aek:Lock:Videos'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุฏูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููููุงุช" then
if DevAek:get(AEK..'Aek:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููููุงุช")  
DevAek:del(AEK..'Aek:Lock:Document'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููููุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงูููุงูู" then
if DevAek:get(AEK..'Aek:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุงูููุงูู")  
DevAek:del(AEK..'Aek:Lock:Inline'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงูููุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑูุฏุงูู" then
if DevAek:get(AEK..'Aek:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุงุฑูุฏุงูู")  
DevAek:del(AEK..'Aek:Lock:Markdown'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุฑูุฏุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุชุญุฑูู" then
if DevAek:get(AEK..'Aek:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุชุญุฑูู")  
DevAek:del(AEK..'Aek:Lock:Gifs'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุชุญุฑูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุบุงูู" then
if DevAek:get(AEK..'Aek:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุงุบุงูู")  
DevAek:del(AEK..'Aek:Lock:Music'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงุบุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุช" then
if DevAek:get(AEK..'Aek:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุตูุช")  
DevAek:del(AEK..'Aek:Lock:Voice'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุตูุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฑูุงุจุท" then
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุฑูุงุจุท")  
DevAek:del(AEK..'Aek:Lock:Links'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฑูุงุจุท ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุน" then
if DevAek:get(AEK..'Aek:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูููุงูุน")  
DevAek:del(AEK..'Aek:Lock:Location'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุงูุน ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุนุฑู" or UnLockText[2] == "ุงููุนุฑูุงุช" then
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุนุฑูุงุช")  
DevAek:del(AEK..'Aek:Lock:Tags'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุนุฑูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุดุชุงู" or UnLockText[2] == "ุงูุชุงู" then
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงููุงุดุชุงู")  
DevAek:del(AEK..'Aek:Lock:Hashtak'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุงุดุชุงู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฌูุงุช" then
if DevAek:get(AEK..'Aek:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุฌูุงุช")  
DevAek:del(AEK..'Aek:Lock:Contact'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุฌูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุดุจูุงุช" then
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุดุจูุงุช")  
DevAek:del(AEK..'Aek:Lock:WebLinks'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุดุจูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุนุฑุจูู" then
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุนุฑุจูู")  
DevAek:del(AEK..'Aek:Lock:Arabic'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุนุฑุจูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงููููุฒูู" then
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุงููููุฒูู")  
DevAek:del(AEK..'Aek:Lock:English'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงููููุฒูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุงุดุนุงุฑุงุช")  
DevAek:del(AEK..'Aek:Lock:TagServr'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุงุดุนุงุฑุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุตูุงุช" then
if DevAek:get(AEK..'Aek:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูููุตูุงุช")  
DevAek:del(AEK..'Aek:Lock:Stickers'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูููุตูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชูุฌูู" then
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุชูุฌูู")  
DevAek:del(AEK..'Aek:Lock:Forwards'..msg.chat_id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุชูุฌูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     Source AEK     --
if text and text:match("^ููู ุงูุชูููุด$") or text and text:match("^ุชูุนูู ุงูุญูุงูู ุงููุตูู$") then
if not Constructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููููุดุฆูู ููุท', 1, 'md')
else
DevAek:set(AEK.."Aek:Lock:Bots"..msg.chat_id_,"del") DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Aek:Lock:Links','Aek:Lock:Contact','Aek:Lock:Forwards','Aek:Lock:Videos','Aek:Lock:Gifs','Aek:Lock:EditMsgs','Aek:Lock:Stickers','Aek:Lock:Farsi','Aek:Lock:Spam','Aek:Lock:WebLinks','Aek:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAek:set(AEK..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุงูุชูููุด")  
end
end
if text and text:match("^ูุชุญ ุงูุชูููุด$") then
if not Constructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููููุดุฆูู ููุท', 1, 'md')
else
DevAek:hdel(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Aek:Lock:Links','Aek:Lock:Contact','Aek:Lock:Forwards','Aek:Lock:Videos','Aek:Lock:Gifs','Aek:Lock:EditMsgs','Aek:Lock:Stickers','Aek:Lock:Farsi','Aek:Lock:Spam','Aek:Lock:WebLinks','Aek:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAek:del(AEK..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุงูุชูููุด")  
end
end
--     Source AEK     --
if text and text:match("^ููู ุงููู$") then
if not Constructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููููุดุฆูู ููุท', 1, 'md')
else
DevAek:del(AEK..'Aek:Lock:Fshar'..msg.chat_id_) DevAek:del(AEK..'Aek:Lock:Taf'..msg.chat_id_) DevAek:del(AEK..'Aek:Lock:Kfr'..msg.chat_id_) 
DevAek:set(AEK.."Aek:Lock:Bots"..msg.chat_id_,"del") DevAek:hset(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Aek:Lock:EditMsgs','Aek:Lock:Farsi','Aek:Lock:TagServr','Aek:Lock:Inline','Aek:Lock:Photo','Aek:Lock:Spam','Aek:Lock:Videos','Aek:Lock:Gifs','Aek:Lock:Music','Aek:Lock:Voice','Aek:Lock:Links','Aek:Lock:Location','Aek:Lock:Tags','Aek:Lock:Stickers','Aek:Lock:Markdown','Aek:Lock:Forwards','Aek:Lock:Document','Aek:Lock:Contact','Aek:Lock:Hashtak','Aek:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAek:set(AEK..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ููู ุฌููุน ุงูุงูุงูุฑ")  
end
end
if text and text:match("^ูุชุญ ุงููู$") then
if not Constructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููููุดุฆูู ููุท', 1, 'md')
else
DevAek:set(AEK..'Aek:Lock:Fshar'..msg.chat_id_,true) DevAek:set(AEK..'Aek:Lock:Taf'..msg.chat_id_,true) DevAek:set(AEK..'Aek:Lock:Kfr'..msg.chat_id_,true) DevAek:hdel(AEK.."Aek:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Aek:Lock:EditMsgs','Aek:Lock:Text','Aek:Lock:Arabic','Aek:Lock:English','Aek:Lock:Join','Aek:Lock:Bots','Aek:Lock:Farsi','Aek:Lock:FarsiBan','Aek:Lock:TagServr','Aek:Lock:Inline','Aek:Lock:Photo','Aek:Lock:Spam','Aek:Lock:Videos','Aek:Lock:Gifs','Aek:Lock:Music','Aek:Lock:Voice','Aek:Lock:Links','Aek:Lock:Location','Aek:Lock:Tags','Aek:Lock:Stickers','Aek:Lock:Markdown','Aek:Lock:Forwards','Aek:Lock:Document','Aek:Lock:Contact','Aek:Lock:Hashtak','Aek:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAek:del(AEK..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ูุชุญ ุฌููุน ุงูุงูุงูุฑ")  
end
end
--     Source AEK     --
if Admin(msg) then
if text and (text:match("^ุถุน ุณุจุงู (%d+)$") or text:match("^ูุถุน ุณุจุงู (%d+)$")) then
local SetSpam = text:match("ุถุน ุณุจุงู (%d+)$") or text:match("ูุถุน ุณุจุงู (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฎุชุฑ ุนุฏุฏ ุงูุจุฑ ูู 40 ุญุฑู ', 1, 'md')
else
DevAek:set(AEK..'Aek:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ูุถุน ุนุฏุฏ ุงูุณุจุงู โซ'..SetSpam, 1, 'md')
end
end
end
--     Source AEK     --
if Manager(msg) then
if text == "ูุญุต" and ChCheck(msg) or text == "ูุญุต ุงูุจูุช" and ChCheck(msg) then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..AEK)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุตูุงุญูุงุช ุงูุจูุช ูู โซ โค\nโโโโโโปใโปโโโโโ\nใโ ุญุฐู ุงูุฑุณุงุฆู โซ '..DEL..'\nใโ ุฏุนูุฉ ุงููุณุชุฎุฏููู โซ '..INV..'\nใโ ุญุธุฑ ุงููุณุชุฎุฏููู โซ '..BAN..'\nใโ ุชุซุจูุช ุงูุฑุณุงุฆู โซ '..PIN..'\nใโ ุชุบููุฑ ุงููุนูููุงุช โซ '..EDT..'\nใโ ุงุถุงูุฉ ูุดุฑููู โซ '..VIP..'\nโโโโโโปใโปโโโโโ', 1, 'md')
end end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") 
DevAek:set(AEK.."Aek:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงููุทูุฑ ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") 
DevAek:set(AEK.."Aek:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูุงุณุงุณู ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") 
DevAek:set(AEK.."Aek:Constructor:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") 
DevAek:set(AEK.."Aek:Managers:Rd"..msg.chat_id_,Text) 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") 
DevAek:set(AEK.."Aek:Admins:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงูุงุฏูู ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") 
DevAek:set(AEK.."Aek:VipMem:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงููููุฒ ุงูู โซ "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") 
DevAek:set(AEK.."Aek:mem:Rd"..msg.chat_id_,Text)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุบูุฑ ุฑุฏ ุงูุนุถู ุงูู โซ "..Text, 1, 'md')
end
if text == "ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ" and ChCheck(msg) or text == "ูุณุญ ุฑุฏูุฏ ุงูุฑุชุจ" and ChCheck(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุฌููุน ุฑุฏูุฏ ุงูุฑุชุจ", 1, 'md')
DevAek:del(AEK.."Aek:mem:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:Cleaner:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:VipMem:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:Admins:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:Managers:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:Constructor:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:BasicConstructor:Rd"..msg.chat_id_)
DevAek:del(AEK.."Aek:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source AEK     --
if text == "ูุดู ุงูุจูุชุงุช" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = 'ใโ *ูุงุฆูุฉ ุงูุจูุชุงุช* โซ โค \nโโโโโโปใโปโโโโโ\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' โฏ'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
return false end
if #admins == i then 
local a = 'โโโโโโปใโปโโโโโ\nใโ *ุนุฏุฏ ุงูุจูุชุงุช ููุง* โซ '..n..'\n'
local f = 'ใโ *ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* โซ '..t..'\nใโ *ููุงุญุถู ุนูุงูุฉ ุงูู*โฏ *ุชุนูู ุงู ุงูุจูุช ุงุฏูู ูู ูุฐู ุงููุฌููุนู*'
Dev_Aek(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'ุญุฐู ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ุทุฑุฏ ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ูุณุญ ุงูุจูุชุงุช' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(AEK) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ *ุนุฏุฏ ุงูุจูุชุงุช ููุง* โซ "..c.."\nใโ *ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* โซ "..x.."\nใโ *ุชู ุทุฑุฏ* โซ "..(c - x).." *ูู ุงูุจูุชุงุช*", 1, 'md')
end 
end,nil)  
end 
--     Source AEK     --
end
--     Source AEK     --
if Admin(msg) then
if text and text:match("^ุญุฐู (.*)$") or text and text:match("^ูุณุญ (.*)$") then
local txts = {string.match(text, "^(ุญุฐู) (.*)$")}
local txtss = {string.match(text, "^(ูุณุญ) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'ุงูุซุงููููู' or txtss[2] == 'ุงูุซุงููููู' or txts[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' or txtss[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' then
DevAek:del(AEK..'Aek:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุทูุฑูู ุงูุซุงููููู")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'ุงููุทูุฑูู' or txtss[2] == 'ุงููุทูุฑูู' then
DevAek:del(AEK..'Aek:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุทูุฑูู")  
end
if txts[2] == 'ูุงุฆูู ุงูุนุงู' or txtss[2] == 'ูุงุฆูู ุงูุนุงู' then
DevAek:del(AEK..'Aek:BanAll:')
DevAek:del(AEK..'Aek:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูุงุฆูุฉ ุงูุนุงู")  
end
end
if SudoBot(msg) then
if txts[2] == 'ุงูุงุฏูููู ุงูุนุงููู' or txts[2] == 'ุงูุงุฏูููู ุงูุนุงู' or txtss[2] == 'ุงูุงุฏูููู ุงูุนุงููู' or txtss[2] == 'ุงูุงุฏูููู ุงูุนุงู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูุงุฏูููู ุงูุนุงููู")  
DevAek:del(AEK..'Aek:AdminAll:')
end
if txts[2] == 'ุงููููุฒูู ุนุงู' or txts[2] == 'ุงููููุฒูู ุงูุนุงููู' or txtss[2] == 'ุงููููุฒูู ุนุงู' or txtss[2] == 'ุงููููุฒูู ุงูุนุงููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููููุฒูู ุนุงู")  
DevAek:del(AEK..'Aek:VipAll:')
end
if txts[2] == 'ุงููุฏุฑุงุก ุงูุนุงููู' or txts[2] == 'ุงููุฏุฑุงุก ุงูุนุงู' or txtss[2] == 'ุงููุฏุฑุงุก ุงูุนุงููู' or txtss[2] == 'ุงููุฏุฑุงุก ุงูุนุงู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุฏุฑุงุก ุงูุนุงููู")  
DevAek:del(AEK..'Aek:ManagerAll:')
end
end
if AekConstructor(msg) then
if txts[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' or txtss[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู")  
DevAek:del(AEK..'Aek:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'ุงูููุดุฆูู' or txtss[2] == 'ุงูููุดุฆูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูููุดุฆูู")  
DevAek:del(AEK..'Aek:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'ุงููุฏุฑุงุก' or txtss[2] == 'ุงููุฏุฑุงุก' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุฏุฑุงุก")  
DevAek:del(AEK..'Aek:Managers:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'ุงูุงุฏูููู' or txtss[2] == 'ุงูุงุฏูููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูุงุฏูููู")  
DevAek:del(AEK..'Aek:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'ุงููุทุงูู' or txtss[2] == 'ุงููุทุงูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุทุงูู")  
DevAek:del(AEK..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'ุงูุฑุงุจุท' or txtss[2] == 'ุงูุฑุงุจุท' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุฑุงุจุท ุงููุฌููุนู")  
DevAek:del(AEK.."Aek:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'ุงููููุฒูู' or txtss[2] == 'ุงููููุฒูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููููุฒูู")  
DevAek:del(AEK..'Aek:VipMem:'..msg.chat_id_)
end
if txts[2] == 'ุงูููุชูููู' or txtss[2] == 'ุงูููุชูููู' then
DevAek:del(AEK..'Aek:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงูููุชูููู")  
end
if txts[2] == 'ุงููููุฏูู' or txtss[2] == 'ุงููููุฏูู' then     
local List = DevAek:smembers(AEK..'Aek:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAek:srem(AEK..'Aek:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููููุฏูู")  
end
if txts[2] == 'ูุงุฆูู ุงูููุน' or txtss[2] == 'ูุงุฆูู ุงูููุน' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูุงุฆูุฉ ุงูููุน")  
DevAek:del(AEK..'Aek:Filters:'..msg.chat_id_)
end
if txts[2] == 'ููุงุฆู ุงูููุน' or txtss[2] == 'ููุงุฆู ุงูููุน' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ููุงุฆู ุงูููุน")  
DevAek:del(AEK..'Aek:Filters:'..msg.chat_id_)
DevAek:del(AEK.."Aek:FilterAnimation"..msg.chat_id_)
DevAek:del(AEK.."Aek:FilterPhoto"..msg.chat_id_)
DevAek:del(AEK.."Aek:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' then     
DevAek:del(AEK.."Aek:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงููุชุญุฑูุงุช")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' or txtss[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' then     
DevAek:del(AEK.."Aek:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูุตูุฑ")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' then     
DevAek:del(AEK.."Aek:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูููุตูุงุช")  
end
end
end
--     Source AEK     --
if text and text:match("^ุญุฐู ุงูููุงุฆู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูููุงุฆู$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ููููุดุฆ ุงูุงุณุงุณู ููุท', 1, 'md')
else
DevAek:del(AEK..'Aek:Ban:'..msg.chat_id_) DevAek:del(AEK..'Aek:Admins:'..msg.chat_id_) DevAek:del(AEK..'User:Donky:'..msg.chat_id_) DevAek:del(AEK..'Aek:VipMem:'..msg.chat_id_) DevAek:del(AEK..'Aek:Filters:'..msg.chat_id_) DevAek:del(AEK..'Aek:Muted:'..msg.chat_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู โซ โจ ูุงุฆูุฉ ุงูููุน โข ุงููุญุธูุฑูู โข ุงูููุชูููู โข ุงูุงุฏูููู โข ุงููููุฒูู โข ุงููุทุงูู โฉ ุจูุฌุงุญ \n โ", 1, 'md')
end end
--     Source AEK     --
if text and text:match("^ุญุฐู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ูุณุญ ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ุชูุฒูู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) then
if not AekConstructor(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุดุฆ ุงููุฌููุนู ููุท', 1, 'md')
else
local basicconstructor = DevAek:smembers(AEK..'Aek:BasicConstructor:'..msg.chat_id_)
local constructor = DevAek:smembers(AEK..'Aek:Constructor:'..msg.chat_id_)
local Managers = DevAek:smembers(AEK..'Aek:Managers:'..msg.chat_id_)
local admins = DevAek:smembers(AEK..'Aek:Admins:'..msg.chat_id_)
local vipmem = DevAek:smembers(AEK..'Aek:VipMem:'..msg.chat_id_)
local donky = DevAek:smembers(AEK..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'ุงูููุดุฆูู โข ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'ุงููุฏุฑุงุก โข ' else Managerst = '' end
if #admins ~= 0 then adminst = 'ุงูุงุฏูููู โข ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'ุงููููุฒูู โข ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'ุงููุทุงูู โข ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAek:del(AEK..'Aek:BasicConstructor:'..msg.chat_id_)
DevAek:del(AEK..'Aek:Constructor:'..msg.chat_id_)
DevAek:del(AEK..'Aek:Managers:'..msg.chat_id_)
DevAek:del(AEK..'Aek:Admins:'..msg.chat_id_)
DevAek:del(AEK..'Aek:VipMem:'..msg.chat_id_)
DevAek:del(AEK..'User:Donky:'..msg.chat_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ุฌููุน ุงูุฑุชุจ ุงูุชุงููู โซ โจ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..donkyt.." โฉ ุจูุฌุงุญ \n โ", 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุงุชูุฌุฏ ุฑุชุจ ููุง", 1, 'md')
end 
end 
end
--     Source AEK     --
if Admin(msg) then 
if text and text:match("^ุงูุงุนุฏุงุฏุงุช$") and ChCheck(msg) then
if not DevAek:get(AEK..'Aek:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAek:get(AEK..'Aek:Spam:Text'..msg.chat_id_)
end
--     Source AEK     --
if DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "ุจุงูุทุฑุฏ"     
elseif DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "ุจุงูุชููุฏ"     
elseif DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "ุจุงููุชู"           
elseif DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "ุจุงูุญุฐู"
else     
flood = "ููุชูุญ"     
end
--     Source AEK     --
if DevAek:get(AEK.."Aek:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "ุจุงูุญุฐู"
elseif DevAek:get(AEK.."Aek:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "ุจุงูุชููุฏ"   
elseif DevAek:get(AEK.."Aek:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "ุจุงูุทุฑุฏ"    
else
lock_bots = "ููุชูุญู"    
end
--     Source AEK     --
if DevAek:get(AEK..'Aek:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู'end
if DevAek:get(AEK..'Aek:Lock:Photo'..msg.chat_id_) then mute_photo = 'ููููู' else mute_photo = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Videos'..msg.chat_id_) then mute_video = 'ููููู' else mute_video = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ููููู' else mute_gifs = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Music'..msg.chat_id_) then mute_music = 'ููููู' else mute_music = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Inline'..msg.chat_id_) then mute_in = 'ููููู' else mute_in = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ููููู' else mute_edit = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Pin'..msg.chat_id_) then lock_pin = 'ููููู' else lock_pin = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ููููู' else lock_sticker = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ููููู' else lock_tgservice = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ููููู' else lock_wp = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ููููู' else lock_htag = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then lock_tag = 'ููููู' else lock_tag = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Location'..msg.chat_id_) then lock_location = 'ููููู' else lock_location = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Contact'..msg.chat_id_) then lock_contact = 'ููููู' else lock_contact = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then lock_english = 'ููููู' else lock_english = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ููููู' else lock_arabic = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ููููู' else lock_forward = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Document'..msg.chat_id_) then lock_file = 'ููููู' else lock_file = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Markdown'..msg.chat_id_) then markdown = 'ููููู' else markdown = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Spam'..msg.chat_id_) then lock_spam = 'ููููู' else lock_spam = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Join'..msg.chat_id_) then lock_Join = 'ูููู' else lock_Join = 'ููุชูุญ' end
if DevAek:get(AEK.."Aek:Lock:Welcome"..msg.chat_id_) then send_welcome = 'ููููู' else send_welcome = 'ููุชูุญู' end
if DevAek:get(AEK..'Aek:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end
if DevAek:get(AEK..'Aek:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end
if DevAek:get(AEK..'Aek:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end
if DevAek:get(AEK..'Aek:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'ููููู' else lock_farsi = 'ููุชูุญู' end
local Flood_Num = DevAek:hget(AEK.."Aek:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source AEK     --
local TXTE = "ใโ ุงุนุฏุงุฏุงุช ุงููุฌููุนู โซ โค\nโโโโโโปใโปโโโโโ\n"
.."ใโ ุงูุฑูุงุจุท โซ "..mute_links.."\n"
.."ใโ ุงููุนุฑู โซ "..lock_tag.."\n"
.."ใโ ุงูุจูุชุงุช โซ "..lock_bots.."\n"
.."ใโ ุงููุชุญุฑูู โซ "..mute_gifs.."\n"
.."ใโ ุงูููุตูุงุช โซ "..lock_sticker.."\n"
.."ใโ ุงููููุงุช โซ "..lock_file.."\n"
.."ใโ ุงูุตูุฑ โซ "..mute_photo.."\n"
.."ใโ ุงูููุฏูู โซ "..mute_video.."\n"
.."ใโ ุงูุงูููุงูู โซ "..mute_in.."\n"
.."ใโ ุงูุฏุฑุฏุดู โซ "..mute_text.."\n"
.."ใโ ุงูุชูุฌูู โซ "..lock_forward.."\n"
.."ใโ ุงูุงุบุงูู โซ "..mute_music.."\n"
.."ใโ ุงูุตูุช โซ "..mute_voice.."\n"
.."ใโ ุงูุฌูุงุช โซ "..lock_contact.."\n"
.."ใโ ุงููุงุฑูุฏุงูู โซ "..markdown.."\n"
.."ใโ ุงููุงุดุชุงู โซ "..lock_htag.."\n"
.."ใโ ุงูุชุนุฏูู โซ "..mute_edit.."\n"
.."ใโ ุงูุชุซุจูุช โซ "..lock_pin.."\n"
.."ใโ ุงูุงุดุนุงุฑุงุช โซ "..lock_tgservice.."\n"
.."ใโ ุงูููุงูุด โซ "..lock_spam.."\n"
.."ใโ ุงูุฏุฎูู โซ "..lock_Join.."\n"
.."ใโ ุงูุดุจูุงุช โซ "..lock_wp.."\n"
.."ใโ ุงูููุงูุน โซ "..lock_location.."\n"
.."ใโ ุงููุดุงุฑ โซ "..lock_fshar.."\n"
.."ใโ ุงูููุฑ โซ "..lock_kaf.."\n"
.."ใโ ุงูุทุงุฆููู โซ "..lock_taf.."\n"
.."ใโ ุงูุนุฑุจูู โซ "..lock_arabic.."\n"
.."ใโ ุงูุงููููุฒูู โซ "..lock_english.."\n"
.."ใโ ุงููุงุฑุณูู โซ "..lock_farsi.."\n"
.."ใโ ุงูุชูุฑุงุฑ โซ "..flood.."\n"
.."ใโ ุนุฏุฏ ุงูุชูุฑุงุฑ โซ "..Flood_Num.."\n"
.."ใโ ุนุฏุฏ ุงูุณุจุงู โซ "..spam_c.."\n"
.."โโโโโโปใโปโโโโโ\nใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค\n"
Dev_Aek(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source AEK     --
if text and text:match("^ููู (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(ููู) (.*)$")}
Dev_Aek(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source AEK     --
if DevAek:get(AEK..'Aek:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
DevAek:del(AEK..'Aek:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAek:del(AEK..'Aek:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:rules'..msg.chat_id_,text)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
return false   
end
if text and text:match("^ุถุน ููุงููู$") and ChCheck(msg) or text and text:match("^ูุถุน ููุงููู$") and ChCheck(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ุงูููุงููู ุงูุงู', 1, 'md')
DevAek:set(AEK..'Aek:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^ุงูููุงููู$") then
local rules = DevAek:get(AEK..'Aek:rules'..msg.chat_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source AEK     --
if text == 'ุฑููู' then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "ใโุฑููู โซ +"..result.phone_number_
else
MyNumber = "ใโุชู ูุถุน ุฑููู ูุฌูุงุช ุงุชุตุงูู ููุท"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source AEK     --
if text == "ุชูุนูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุฒุฎุฑูู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Zrf:Aek'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุฒุฎุฑูู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Zrf:Aek'..msg.chat_id_,true)  
end
if DevAek:get(AEK..'Zrf:Aek'..msg.chat_id_..''..msg.sender_user_id_) then 
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุฒุฎุฑูู', 1, 'md')
DevAek:del(AEK..'Zrf:Aek'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "ใโ ูุงุฆูุฉ ุงูุฒุฎุฑูู โซ โค\nโโโโโโปใโปโโโโโ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAek:del(AEK..'Zrf:Aek'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not DevAek:get(AEK..'Aek:Zrf:Aek'..msg.chat_id_) then
if text == 'ุฒุฎุฑูู' and ChCheck(msg) or text == 'ุงูุฒุฎุฑูู' and ChCheck(msg) then  
DevAek:setex(AEK.."Zrf:Aek"..msg.chat_id_..""..msg.sender_user_id_,300,true)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ุงููููู ูุฒุฎุฑูุชูุง \nููููู ุงูุฒุฎุฑูุฉ ุจุงููุบู { en } ~ { ar } ', 1, 'md')
end
end
if not DevAek:get(AEK..'Aek:Zrf:Aek'..msg.chat_id_) then
if text and text:match("^ุฒุฎุฑูู (.*)$") and ChCheck(msg) or text and text:match("^ุฒุฎุฑู (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^ุฒุฎุฑูู (.*)$") or text:match("^ุฒุฎุฑู (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "ใโ ูุงุฆูุฉ ุงูุฒุฎุฑูู โซ โค\nโโโโโโปใโปโโโโโ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source AEK     --
if text == "ุชูุนูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงุจุฑุงุฌ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Brg:Aek'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงุจุฑุงุฌ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Brg:Aek'..msg.chat_id_,true)  
end
if not DevAek:get(AEK..'Aek:Brg:Aek'..msg.chat_id_) then
if text and text:match("^ุจุฑุฌ (.*)$") and ChCheck(msg) or text and text:match("^ุจุฑุฌู (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^ุจุฑุฌ (.*)$") or text:match("^ุจุฑุฌู (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AEK     --
if text and (text == "ุชูุนูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชูุนูู ูุณุจู ุงูุญุจ" or text == "ุชูุนูู ูุณุจู ุงููุฑู" or text == "ุชูุนูู ูุณุจู ุงูุฑุฌููู" or text == "ุชูุนูู ูุณุจู ุงูุงููุซู" or text == "ุชูุนูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงูุฑ ุงููุณุจ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Nsba:Aek'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชุนุทูู ูุณุจู ุงูุญุจ" or text == "ุชุนุทูู ูุณุจู ุงููุฑู" or text == "ุชุนุทูู ูุณุจู ุงูุฑุฌููู" or text == "ุชุนุทูู ูุณุจู ุงูุงููุซู" or text == "ุชุนุทูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงูุฑ ุงููุณุจ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Nsba:Aek'..msg.chat_id_,true)  
end
if not DevAek:get(AEK..'Aek:Nsba:Aek'..msg.chat_id_) then
if text == "ูุณุจู ุงูุญุจ" and ChCheck(msg) or text == "ูุณุจุฉ ุงูุญุจ" and ChCheck(msg) then
DevAek:set(AEK..'LoveNsba:Aek'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงูุญุจ ุจููููุง ููุซุงู โซ ุฌุงู ูุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุญุจ" and text ~= "ูุณุจุฉ ุงูุญุจ" and DevAek:get(AEK..'LoveNsba:Aek'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุญุจ ', 1, 'md')
DevAek:del(AEK..'LoveNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Aek = math.random(0,100);
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุณุจุฉ ุงูุญุจ ุจูู '..text..' ูู : '..Aek..'%', 1, 'md')
DevAek:del(AEK..'LoveNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAek:get(AEK..'Aek:Nsba:Aek'..msg.chat_id_) then
if text == "ูุณุจู ุงููุฑู" and ChCheck(msg) or text == "ูุณุจุฉ ุงููุฑู" and ChCheck(msg) then
DevAek:set(AEK..'HataNsba:Aek'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงููุฑู ุจููููุง ููุซุงู โซ ุฌุงู ูุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงููุฑู" and text ~= "ูุณุจุฉ ุงููุฑู" and DevAek:get(AEK..'HataNsba:Aek'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงููุฑู ', 1, 'md')
DevAek:del(AEK..'HataNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Aek = math.random(0,100);
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุณุจุฉ ุงููุฑู ุจูู '..text..' ูู : '..Aek..'%', 1, 'md')
DevAek:del(AEK..'HataNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAek:get(AEK..'Aek:Nsba:Aek'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุฑุฌููู" or text == "ูุณุจุฉ ุงูุฑุฌููู" or text == "ูุณุจู ุฑุฌููู" or text == "ูุณุจุฉ ุฑุฌููู") and ChCheck(msg) then
DevAek:set(AEK..'RjolaNsba:Aek'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุฑุฌููุชู ููุซุงู โซ ุฌุงู', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุฑุฌููู" and text ~= "ูุณุจุฉ ุงูุฑุฌููู" and text ~= "ูุณุจู ุฑุฌููู" and text ~= "ูุณุจุฉ ุฑุฌููู" and DevAek:get(AEK..'RjolaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุฑุฌููู ', 1, 'md')
DevAek:del(AEK..'RjolaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Aek = math.random(0,100);
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุณุจุฉ ุฑุฌููุฉ '..text..' ูู : '..Aek..'%', 1, 'md')
DevAek:del(AEK..'RjolaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAek:get(AEK..'Aek:Nsba:Aek'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุงููุซู" or text == "ูุณุจุฉ ุงูุงููุซู" or text == "ูุณุจู ุงููุซู" or text == "ูุณุจุฉ ุงููุซู") and ChCheck(msg) then
DevAek:set(AEK..'AnothaNsba:Aek'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุงููุซุชู ููุซุงู โซ ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุงููุซู" and text ~= "ูุณุจุฉ ุงูุงููุซู" and text ~= "ูุณุจู ุงููุซู" and text ~= "ูุณุจุฉ ุงููุซู" and DevAek:get(AEK..'AnothaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุงููุซู ', 1, 'md')
DevAek:del(AEK..'AnothaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Aek = math.random(0,100);
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุณุจุฉ ุงููุซุฉ '..text..' ูู : '..Aek..'%', 1, 'md')
DevAek:del(AEK..'AnothaNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAek:get(AEK..'Aek:Nsba:Aek'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุบุจุงุก" or text == "ูุณุจุฉ ุงูุบุจุงุก") and ChCheck(msg) then
DevAek:set(AEK..'StupidNsba:Aek'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุบุจุงุฆู ููุซุงู โซ ุฌุงู ุงู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุบุจุงุก" and text ~= "ูุณุจุฉ ุงูุบุจุงุก" and DevAek:get(AEK..'StupidNsba:Aek'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุบุจุงุก ', 1, 'md')
DevAek:del(AEK..'StupidNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Aek = math.random(0,100);
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุณุจุฉ ุบุจุงุก '..text..' ูู : '..Aek..'%', 1, 'md')
DevAek:del(AEK..'StupidNsba:Aek'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source AEK     --
if text == "ุชูุนูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุญุณุงุจ ุงูุนูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Age:Aek'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุญุณุงุจ ุงูุนูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Age:Aek'..msg.chat_id_,true)  
end
if not DevAek:get(AEK..'Aek:Age:Aek'..msg.chat_id_) then
if text and text:match("^ุงุญุณุจ (.*)$") and ChCheck(msg) or text and text:match("^ุนูุฑู (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^ุงุญุณุจ (.*)$") or text:match("^ุนูุฑู (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AEK     --
if text == "ุชูุนูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ูุนุงูู ุงูุงุณูุงุก'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Mean:Aek'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ูุนุงูู ุงูุงุณูุงุก'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Mean:Aek'..msg.chat_id_,true)  
end
if not DevAek:get(AEK..'Aek:Mean:Aek'..msg.chat_id_) then
if text and text:match("^ูุนูู ุงูุงุณู (.*)$") and ChCheck(msg) or text and text:match("^ูุนูู ุงุณู (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^ูุนูู ุงูุงุณู (.*)$") or text:match("^ูุนูู ุงุณู (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Aek(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AEK     --
if text == "ุบูููู" and ChCheck(msg) or text == "ุบูู" and ChCheck(msg) then
data,res = https.request('https://apiabs.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='ใโ ุชู ุงุฎุชูุงุฑ ุงูููุทุน ุงูุตูุชู ูู'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'ใโ ๐ฆ.๐ช.๐ฐ.๐ดใ๐ป.๐ฎ.๐ต',url="t.me/SoalfLove"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     Source AEK     --
if Admin(msg) then
if DevAek:get(AEK..'Aek:LockSettings'..msg.chat_id_) then 
if text == "ุงูุฑูุงุจุท" then if DevAek:get(AEK..'Aek:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุฑูุงุจุท โซ "..mute_links.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงููุนุฑู" or text == "ุงููุนุฑูุงุช" then if DevAek:get(AEK..'Aek:Lock:Tags'..msg.chat_id_) then lock_tag = 'ูููููู' else lock_tag = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงููุนุฑู โซ "..lock_tag.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงููุชุญุฑูู" or text == "ุงูููุตูุงุช ุงููุชุญุฑูู" then if DevAek:get(AEK..'Aek:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ูููููู' else mute_gifs = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงููุชุญุฑูู โซ "..mute_gifs.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูููุตูุงุช" then if DevAek:get(AEK..'Aek:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ูููููู' else lock_sticker = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูููุตูุงุช โซ "..lock_sticker.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุตูุฑ" then if DevAek:get(AEK..'Aek:Lock:Photo'..msg.chat_id_) then mute_photo = 'ูููููู' else mute_photo = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุตูุฑ โซ "..mute_photo.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูููุฏูู" or text == "ุงูููุฏูููุงุช" then if DevAek:get(AEK..'Aek:Lock:Videos'..msg.chat_id_) then mute_video = 'ูููููู' else mute_video = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูููุฏูู โซ "..mute_video.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุงูููุงูู" then if DevAek:get(AEK..'Aek:Lock:Inline'..msg.chat_id_) then mute_in = 'ูููู' else mute_in = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุงูููุงูู โซ "..mute_in.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุฏุฑุฏุดู" then if DevAek:get(AEK..'Aek:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุฏุฑุฏุดู โซ "..mute_text.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุชูุฌูู" or text == "ุงุนุงุฏู ุงูุชูุฌูู" then if DevAek:get(AEK..'Aek:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ูููู' else lock_forward = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุชูุฌูู โซ "..lock_forward.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุงุบุงูู" then if DevAek:get(AEK..'Aek:Lock:Music'..msg.chat_id_) then mute_music = 'ูููููู' else mute_music = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุงุบุงูู โซ "..mute_music.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุตูุช" or text == "ุงูุตูุชูุงุช" then if DevAek:get(AEK..'Aek:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุตูุช โซ "..mute_voice.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุฌูุงุช" or text == "ุฌูุงุช ุงูุงุชุตุงู" then if DevAek:get(AEK..'Aek:Lock:Contact'..msg.chat_id_) then lock_contact = 'ูููููู' else lock_contact = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุฌูุงุช โซ "..lock_contact.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงููุงุฑูุฏุงูู" then if DevAek:get(AEK..'Aek:Lock:Markdown'..msg.chat_id_) then markdown = 'ูููู' else markdown = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงููุงุฑูุฏุงูู โซ "..markdown.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงููุงุดุชุงู" then if DevAek:get(AEK..'Aek:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ูููู' else lock_htag = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงููุงุดุชุงู โซ "..lock_htag.."\n"Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุชุนุฏูู" then if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ูููู' else mute_edit = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุชุนุฏูู โซ "..mute_edit.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุชุซุจูุช" then if DevAek:get(AEK..'Aek:Lock:Pin'..msg.chat_id_) then lock_pin = 'ูููู' else lock_pin = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุชุซุจูุช โซ "..lock_pin.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุงุดุนุงุฑุงุช" then if DevAek:get(AEK..'Aek:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ูููููู' else lock_tgservice = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุงุดุนุงุฑุงุช โซ "..lock_tgservice.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูููุงูุด" then if DevAek:get(AEK..'Aek:Lock:Spam'..msg.chat_id_) then lock_spam = 'ูููููู' else lock_spam = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูููุงูุด โซ "..lock_spam.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุฏุฎูู" then if DevAek:get(AEK..'Aek:Lock:Join'..msg.chat_id_) then lock_Join = 'ููููู' else lock_Join = 'ููุชูุญ' end local AEKTEAM = "\n" .."ใโ ุงูุฏุฎูู โซ "..lock_Join.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุดุจูุงุช" then if DevAek:get(AEK..'Aek:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ูููููู' else lock_wp = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุดุจูุงุช โซ "..lock_wp.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูููุงูุน" then if DevAek:get(AEK..'Aek:Lock:Location'..msg.chat_id_) then lock_location = 'ูููููู' else lock_location = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูููุงูุน โซ "..lock_location.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุนุฑุจูู" then if DevAek:get(AEK..'Aek:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ูููููู' else lock_arabic = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุนุฑุจูู โซ "..lock_arabic.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุงููููุฒูู" then if DevAek:get(AEK..'Aek:Lock:English'..msg.chat_id_) then lock_english = 'ูููููู' else lock_english = 'ููุชูุญู' end local AEKTEAM = "\n" .."ใโ ุงูุงููููุฒูู โซ "..lock_english.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูููุฑ" then if DevAek:get(AEK..'Aek:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end local AEKTEAM = "\n" .."ใโ ุงูููุฑ โซ "..lock_kaf.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงููุดุงุฑ" then if DevAek:get(AEK..'Aek:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end local AEKTEAM = "\n" .."ใโ ุงููุดุงุฑ โซ "..lock_fshar.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
if text == "ุงูุทุงุฆููู" then if DevAek:get(AEK..'Aek:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end local AEKTEAM = "\n" .."ใโ ุงูุทุงุฆููู โซ "..lock_taf.."\n" Dev_Aek(msg.chat_id_, msg.id_, 1, AEKTEAM, 1, 'md') end
end
--     Source AEK     --
if text == 'ุชูุนูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ูุดู ุงูุงุนุฏุงุฏุงุช'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:LockSettings'..msg.chat_id_,true)  
end
if text == 'ุชุนุทูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ูุดู ุงูุงุนุฏุงุฏุงุช'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:LockSettings'..msg.chat_id_) 
end
--     Source AEK     --
if text == 'ุชูุนูู ุงูุงูุฑ ุงูุชุญุดูุด' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงูุฑ ุงูุชุญุดูุด'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:Stupid'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุงูุงูุฑ ุงูุชุญุดูุด' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงูุฑ ุงูุชุญุดูุด'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:Stupid'..msg.chat_id_,true)
end
--     Source AEK     --
if text and (text == 'ุชุนุทูู ุงูุชุญูู' or text == 'ููู ุงูุชุญูู' or text == 'ุชุนุทูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุชุญูู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'ุชูุนูู ุงูุชุญูู' or text == 'ูุชุญ ุงูุชุญูู' or text == 'ุชูุนูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุชุญูู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:Robot'..msg.chat_id_,true)
end
--     Source AEK     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:GpRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:GpRed'..msg.chat_id_,true)
end
--     Source AEK     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุฑุฏูุฏ ุงููุทูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:AllRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุฑุฏูุฏ ุงููุทูุฑ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:AllRed'..msg.chat_id_,true)
end
--     Source AEK     --
if SecondSudo(msg) then
if text == 'ุชูุนูู ุงููุบุงุฏุฑู' or text == 'โซ ุชูุนูู ุงููุบุงุฏุฑู ใ' then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงููุบุงุฏุฑู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK.."Aek:Left:Bot"..AEK)
end
if text == 'ุชุนุทูู ุงููุบุงุฏุฑู' or text == 'โซ ุชุนุทูู ุงููุบุงุฏุฑู ใ' then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงููุบุงุฏุฑู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK.."Aek:Left:Bot"..AEK,true) 
end 
if text == 'ุชูุนูู ุงูุงุฐุงุนู' or text == 'โซ ุชูุนูู ุงูุงุฐุงุนู ใ' then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงุฐุงุนู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK.."Aek:Send:Bot"..AEK)
end
if text == 'ุชุนุทูู ุงูุงุฐุงุนู' or text == 'โซ ุชุนุทูู ุงูุงุฐุงุนู ใ' then 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงุฐุงุนู ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK.."Aek:Send:Bot"..AEK,true) 
end
end
--     Source AEK     --
if text and text:match("^ุถุน ุงุณู (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ุถุน ุงุณู) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"ใโ ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุบูุฑ ุงุณู ุงููุฌููุนู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source AEK     --
if msg.content_.photo_ then
if DevAek:get(AEK..'Aek:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"ใโ ุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู ูุงููุญุงููู ูุงุญูุง") 
DevAek:del(AEK..'Aek:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช") 
DevAek:del(AEK..'Aek:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุบูุฑ ุตูุฑุฉ ุงููุฌููุนู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevAek:del(AEK..'Aek:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ุถุน ุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุถุน ุตูุฑู$") and ChCheck(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, 'ใโ ุงุฑุณู ุตูุฑุฉ ุงููุฌููุนู ุงูุงู', 1, 'md')
DevAek:set(AEK..'Aek:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source AEK     --
if text and text:match("^ุญุฐู ุงูุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุตูุฑู$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุตูุฑุฉ ุงููุฌููุนู")  
return false  
end
--     Source AEK     --
if Manager(msg) then
if text and text:match("^ุงูุบุงุก ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงูุบุงุก ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevAek:sismember(AEK.."Aek:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, "ใโ ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAek:del(AEK..'Aek:PinnedMsg'..msg.chat_id_)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุงูุบุงุก ุชุซุจูุช ุงูุฑุณุงูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"ใโ ุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     Source AEK     --
if text and text:match("^ุงูุบุงุก ุชุซุจูุช ุงููู$") then  
if DevAek:sismember(AEK.."Aek:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, "ใโ ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุงูุบุงุก ุชุซุจูุช ุงููู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAek:del(AEK.."Aek:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"ใโ ุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"ใโ ููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     Source AEK     --
if text and text:match("^ุงุนุงุฏู ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏู ุงูุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏุฉ ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevAek:sismember(AEK.."Aek:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Aek(msg.chat_id_,msg.id_, 1, "ใโ ุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
local pin_id = DevAek:get(AEK..'Aek:PinnedMsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุงุนุงุฏุฉ ุชุซุจูุช ุงูุฑุณุงูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source AEK     --
if text == 'ุทุฑุฏ ุงููุญุฐูููู' or text == 'ูุณุญ ุงููุญุฐูููู' or text == 'ุทุฑุฏ ุงูุญุณุงุจุงุช ุงููุญุฐููู' or text == 'ุญุฐู ุงููุญุฐูููู' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุทุฑุฏ ุงููุญุฐูููู")  
end,nil)
end
--     Source AEK     --
if text and text:match("^ูุณุญ ุงููุญุธูุฑูู$") or text and text:match("^ุญุฐู ุงููุญุธูุฑูู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงููุทุฑูุฏูู$") or text and text:match("^ุญุฐู ุงููุทุฑูุฏูู$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Aek(msg.chat_id_, msg.id_, 0,'ใโ *ูุง ููุฌุฏ ูุญุธูุฑูู*', 1, 'md')
DevAek:del(AEK..'Aek:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevAek:del(AEK..'Aek:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุงููุญุธูุฑูู")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source AEK     --
if text and text:match("^ูุนูููุงุช ุงููุฌููุนู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุนุถุงุก$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุฑูุจ$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุฏูููู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุญุธูุฑูู$") and ChCheck(msg) then
local Muted = DevAek:scard(AEK.."Aek:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู โซ โจ '..dp.title_..' โฉ\nใโ ุงูุงูุฏู โซ โจ '..msg.chat_id_..' โฉ\nใโ ุนุฏุฏ ุงูุงุนุถุงุก โซ โจ *'..data.member_count_..'* โฉ\nใโ ุนุฏุฏ ุงูุงุฏูููู โซ โจ *'..data.administrator_count_..'* โฉ\nใโ ุนุฏุฏ ุงููุทุฑูุฏูู โซ โจ *'..data.kicked_count_..'* โฉ\nใโ ุนุฏุฏ ุงูููุชูููู โซ โจ *'..Muted..'* โฉ\nใโ ุนุฏุฏ ุฑุณุงุฆู ุงููุฌููุนู โซ โจ *'..(msg.id_/2097152/0.5)..'* โฉ\nโโโโโโปใโปโโโโโ\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source AEK     --
if text and text:match('^ูุดู (-%d+)') then
local ChatId = text:match('ูุดู (-%d+)') 
if not SudoBot(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑูู ููุท', 1, 'md')
else
local ConstructorList = DevAek:scard(AEK.."Aek:Constructor:"..ChatId) or 0
local BanedList = DevAek:scard(AEK.."Aek:Ban:"..ChatId) or 0
local ManagerList = DevAek:scard(AEK.."Aek:Managers:"..ChatId) or 0
local MutedList = DevAek:scard(AEK.."Aek:Muted:"..ChatId) or 0
local TkeedList = DevAek:scard(AEK.."Aek:Aek:Tkeed:"..ChatId) or 0
local AdminsList = DevAek:scard(AEK.."Aek:Admins:"..ChatId) or 0
local VipList = DevAek:scard(AEK.."Aek:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/SoalfLove' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Aek) 
if Aek.first_name_ ~= false then
ConstructorAek = "["..Aek.first_name_.."](T.me/"..(Aek.username_ or "SoalfLove")..")"
else 
ConstructorAek = "ุญุณุงุจ ูุญุฐูู"
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงููุฌููุนู โซ ["..dp.title_.."]("..LinkGroup..")\nใโ ุงูุงูุฏู โซ ( `"..ChatId.."` )\nใโ ุงูููุดุฆ โซ "..ConstructorAek.."\nใโ ุนุฏุฏ ุงููุฏุฑุงุก โซ ( *"..ManagerList.."* )\nใโ ุนุฏุฏ ุงูููุดุฆูู โซ ( *"..ConstructorList.."* )\nใโ ุนุฏุฏ ุงูุงุฏูููู โซ ( *"..AdminsList.."* )\nใโ ุนุฏุฏ ุงููููุฒูู โซ ( *"..VipList.."* )\nใโ ุนุฏุฏ ุงููุญุธูุฑูู โซ ( *"..BanedList.."* )\nใโ ุนุฏุฏ ุงููููุฏูู โซ ( *"..TkeedList.."* )\nใโ ุนุฏุฏ ุงูููุชูููู โซ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุดููุง", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source AEK     --
if text and text:match("^ุบุงุฏุฑ (-%d+)$")  then
local Text = { string.match(text, "^(ุบุงุฏุฑ) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงููุฌููุนู โซ ["..dp.title_.."]\nใโ ุชูุช ุงููุบุงุฏุฑู ูููุง ุจูุฌุงุญ", 1, "md")
Dev_Aek(Text[2], 0, 1, "ใโ ุจุงูุฑ ุงููุทูุฑ ุชู ูุบุงุฏุฑุฉ ูุฐู ุงููุฌููุนู ", 1, "md")  
ChatLeave(dp.id_, AEK)
DevAek:srem(AEK.."Aek:Groups", dp.id_)
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุบุงุฏุฑุชูุง", 1, "md")
end 
end,nil)
end 
end
--     Source AEK     --
if text and text:match("^ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) or text and text:match("^ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) then
local Num = text:match("ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$")
DevAek:set(AEK..'Aek:Num:Add:Bot',Num) 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ูุถุน ุนุฏุฏ ุงูุงุนุถุงุก โซ *'..Num..'* ุนุถู', 1, 'md')
end
--     Source AEK     --
if text == 'ุชูุนูู ุงูุจูุช ุงูุฎุฏูู' then 
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุจูุช ุงูุฎุฏูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:FreeBot'..AEK) 
end 
end
if text == 'ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู' then 
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท', 1, 'md')
else 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:FreeBot'..AEK,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'ุชูุนูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชูุนูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then   
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุงูุงูุนุงุจ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK..'Aek:Lock:Games'..msg.chat_id_) 
end
if text == 'ุชุนุทูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชุนุทูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then  
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุงูุงูุนุงุจ ุจูุฌุงุญ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK..'Aek:Lock:Games'..msg.chat_id_,true)  
end
if text == "ุชูุนูู ุงูุฑุงุจุท" or text == "ุชูุนูู ุฌูุจ ุงูุฑุงุจุท" then 
if Admin(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชูุนูู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:del(AEK.."Aek:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "ุชุนุทูู ุงูุฑุงุจุท" or text == "ุชุนุทูู ุฌูุจ ุงูุฑุงุจุท" then 
if Admin(msg) then
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุชุนุทูู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
DevAek:set(AEK.."Aek:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source AEK     --
if text and text:match('^ุชูุนูู$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAek:get(AEK..'Aek:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู โซ *'..(DevAek:get(AEK..'Aek:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
DevAek:del(AEK..'Aek:AekConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Aekan) 
local admins = Aekan.members_
for i=0 , #admins do
if Aekan.members_[i].bot_info_ == false and Aekan.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAek:srem(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAek:sadd(AEK..'Aek:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if Aekan.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAek:sadd(AEK.."Aek:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAek:sadd(AEK.."Aek:AekConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAek:srem(AEK.."Aek:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAek:srem(AEK.."Aek:AekConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAek:sismember(AEK..'Aek:Groups',msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","ใโ ุชู ุชูุนูู ุงููุฌููุนู "..dp.title_)  
DevAek:sadd(AEK.."Aek:Groups",msg.chat_id_)
if not DevAek:get(AEK..'Aek:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAek:incrby(AEK..'Aek:Sudos'..msg.sender_user_id_,1)
DevAek:set(AEK..'Aek:SudosGp'..msg.sender_user_id_..msg.chat_id_,"Aek")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAek:set(AEK.."Aek:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"ใโ ุชู ุชูุนูู ูุฌููุนู ุฌุฏูุฏู โซ โค \nโโโโโโปใโปโโโโโ\nใโ ุจูุงุณุทุฉ โซ "..Name.."\nใโ ุงุณู ุงููุฌููุนู โซ ["..NameChat.."]\nใโ ุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู โซ โจ *"..NumMem.."* โฉ\nใโ ุงูุฏู ุงููุฌููุนู โซ โค \nโจ `"..msg.chat_id_.."` โฉ\nใโ ุฑุงุจุท ุงููุฌููุนู โซ โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโปใโปโโโโโ\nใโ ุงูููุช โซ "..os.date("%I:%M%p").."\nใโ ุงูุชุงุฑูุฎ โซ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'ุชุนุทูู' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAek:sismember(AEK..'Aek:Groups',msg.chat_id_) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงููุฌููุนู ุจุงูุชุงููุฏ ูุนุทูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","ใโ ุชู ุชุนุทูู ุงููุฌููุนู "..dp.title_)  
DevAek:srem(AEK.."Aek:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevAek:set(AEK.."Aek:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"ใโ ุชู ุชุนุทูู ูุฌููุนู ุฌุฏูุฏู โซ โค \nโโโโโโปใโปโโโโโ\nใโ ุจูุงุณุทุฉ โซ "..Name.."\nใโ ุงุณู ุงููุฌููุนู โซ ["..NameChat.."]\nใโ ุงูุฏู ุงููุฌููุนู โซ โค \nโจ `"..msg.chat_id_.."` โฉ\nใโ ุฑุงุจุท ุงููุฌููุนู โซ โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโปใโปโโโโโ\nใโ ุงูููุช โซ "..os.date("%I:%M%p").."\nใโ ุงูุชุงุฑูุฎ โซ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source AEK     --
if text and text:match("^ุงููุทูุฑ$") and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
if not Sudo(msg) then
SendText(DevId,"ใโ ููุงู ูู ุจุญุงุฌู ุงูู ูุณุงุนุฏู โซ โค \nโโโโโโปใโปโโโโโ\nใโ ุงูุดุฎุต โซ "..Name.."\nใโ ุงุณู ุงููุฌููุนู โซ ["..NameChat.."]\nใโ ุงูุฏู ุงููุฌููุนู โซ โค \nโจ `"..msg.chat_id_.."` โฉ\nใโ ุฑุงุจุท ุงููุฌููุนู โซ โค\nโจ ["..LinkGroup.."] โฉ\nโโโโโโปใโปโโโโโ\nใโ ุงูููุช โซ "..os.date("%I:%M%p").."\nใโ ุงูุชุงุฑูุฎ โซ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source AEK     --
if text == 'ุฌูุจ ูุณุฎู ุงูุณูุฑุณ' then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './AEK.lua', dl_cb, nil)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนุฒูุฒู ุงููุทูุฑ ุชู ุงุฑุณุงู ูุณุฎุฉ ููู ุงูุณูุฑุณ ุงูู ุงูุฎุงุต', 1, 'md')
end end
--     Source AEK     --
if text == 'ุฑูุงุจุท ุงููุฑูุจุงุช' or text == 'ุฑูุงุจุท ุงููุฌููุนุงุช' then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
local List = DevAek:smembers(AEK.."Aek:Groups")
if #List == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุง ููุฌุฏ ูุฌููุนุงุช ููุนูู', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฌุงุฑู ุงุฑุณุงู ูุณุฎู ุชุญุชูู ุนูู '..#List..' ูุฌููุนู', 1, 'md')
local text = "ใโ Source AEK\nใโ File Bot Groups\nโโโโโโปใโปโโโโโ\n"
for k,v in pairs(List) do
local GroupsManagers = DevAek:scard(AEK.."Aek:Managers:"..v) or 0
local GroupsAdmins = DevAek:scard(AEK.."Aek:Admins:"..v) or 0
local Groupslink = DevAek:get(AEK.."Aek:Groups:Links" ..v)
text = text..k.." โฌ โค \nใโ Group ID โฌ "..v.."\nใโ Group Link โฌ "..(Groupslink or "Not Found").."\nใโ Group Managers โฌ "..GroupsManagers.."\nใโ Group Admins โฌ "..GroupsAdmins.."\nโโโโโโปใโปโโโโโ\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(text)
File:close()
local Aekan = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Aekan .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(curl)
end
end
end
--     Source AEK     --
if text == "ุงุฐุงุนู ุจุงูุฎุงุต" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "โซ ุงุฐุงุนู ุฎุงุต ใ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAek:setex(AEK.."Aek:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุงุฑุณู ูู ุณูุงุก โซ โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก ) \n โ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAek:get(AEK.."Aek:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
List = DevAek:smembers(AEK..'Aek:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AekText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AekText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AekText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AekText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AekText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AekText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AekText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AekText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุฐุงุนุฉ "..AekText.." ุจูุฌุงุญ \nใโ โุงูู โซ โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AEK     --
if text == "ุงุฐุงุนู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "โซ ุงุฐุงุนู ุนุงู ใ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAek:setex(AEK.."Aek:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุงุฑุณู ูู ุณูุงุก โซ โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก ) \n โ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAek:get(AEK.."Aek:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
List = DevAek:smembers(AEK..'Aek:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AekText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AekText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AekText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AekText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AekText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AekText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AekText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AekText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุฐุงุนุฉ "..AekText.." ุจูุฌุงุญ \nใโ โูู โซ โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AEK     --
if text == "ุงุฐุงุนู ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "โซ ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู ใ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAek:setex(AEK.."Aek:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก ) \n โ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAek:get(AEK.."Aek:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAek:del(AEK.."Aek:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAek:smembers(AEK..'Aek:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nใโ โูู โซ โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAek:del(AEK.."Aek:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AEK     --
if text == "ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "โซ ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู ใ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAek:setex(AEK.."Aek:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก ) \n โ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAek:get(AEK.."Aek:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAek:del(AEK.."Aek:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAek:smembers(AEK..'Aek:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nใโ โุงูู โซ โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevAek:del(AEK.."Aek:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AEK     --
if text == "ุงุฐุงุนู ุจุงูุชุซุจูุช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "โซ ุงุฐุงุนู ุจุงูุชุซุจูุช ใ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAek:get(AEK.."Aek:Send:Bot"..AEK) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"ใโ ุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevAek:setex(AEK.."Aek:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุงุฑุณู ูู ุณูุงุก โซ โค \nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก ) \n โ'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAek:get(AEK.."Aek:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "ุงูุบุงุก" then   
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุจูุฌุงุญ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local List = DevAek:smembers(AEK.."Aek:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AekText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AekText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAek:set(AEK..'Aek:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AekText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AekText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AekText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AekText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AekText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AekText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAek:set(AEK..'Aek:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุฐุงุนุฉ "..AekText.." ุจุงูุชุซุจูุช \nใโ โูู โซ โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevAek:del(AEK.."Aek:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--     Source AEK     --
if text == 'ุญุฐู ุฑุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏ' and  Manager(msg) and ChCheck(msg) then
DevAek:set(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'DelGpRed')
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ' and Manager(msg) and ChCheck(msg) then
DevAek:set(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'SetGpRed')
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAek:get(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SetGpRed == 'SetGpRed' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โซ โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nใโ ููููู ุงุถุงูุฉ ุงูู ุงููุต โซ โค\nโโโโโโปใโปโโโโโ\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\nโโโโโโปใโปโโโโโ\nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก )\n โ" ,  1, "md")
DevAek:set(AEK..'Aek:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'','SaveGpRed')
DevAek:set(AEK..'Aek:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'',text)
DevAek:sadd(AEK..'Aek:Manager:GpRed'..msg.chat_id_..'',text)
DevAek:set(AEK..'DelManagerRep'..msg.chat_id_..'',text)
return false
end
end
--     Source AEK     --
if text == 'ุญุฐู ุฑุฏ ุนุงู' and SecondSudo(msg) or text == 'โซ ุญุฐู ุฑุฏ ุนุงู ใ' and SecondSudo(msg) or text == 'ูุณุญ ุฑุฏ ุนุงู' and SecondSudo(msg) then
DevAek:set(AEK.."Aek:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ ุนุงู' and SecondSudo(msg) or text == 'โซ ุงุถู ุฑุฏ ุนุงู ใ' and SecondSudo(msg) then
DevAek:set(AEK.."Aek:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAek:get(AEK.."Aek:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โซ โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nใโ ููููู ุงุถุงูุฉ ุงูู ุงููุต โซ โค\nโโโโโโปใโปโโโโโ\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\nโโโโโโปใโปโโโโโ\nใโ ููุฎุฑูุฌ ุงุฑุณู โซ ( ุงูุบุงุก )\n โ" ,  1, "md")
DevAek:set(AEK.."Aek:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAek:set(AEK.."Aek:Add:AllText"..msg.sender_user_id_, text)
DevAek:sadd(AEK.."Aek:Sudo:AllRed",text)
DevAek:set(AEK.."DelSudoRep",text)
return false 
end end
--     Source AEK     --
if text == 'ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then
local redod = DevAek:smembers(AEK..'Aek:Manager:GpRed'..msg.chat_id_..'')
MsgRep = 'ใโ ุฑุฏูุฏ ุงููุฏูุฑ โซ โค \nโโโโโโปใโปโโโโโ\n'
for k,v in pairs(redod) do
if DevAek:get(AEK.."Aek:Gif:GpRed"..v..msg.chat_id_) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevAek:get(AEK.."Aek:Voice:GpRed"..v..msg.chat_id_) then
dp = 'ุจุตูู ๐'
elseif DevAek:get(AEK.."Aek:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ููุตู ๐'
elseif DevAek:get(AEK.."Aek:Text:GpRed"..v..msg.chat_id_) then
dp = 'ุฑุณุงูู โ'
elseif DevAek:get(AEK.."Aek:Photo:GpRed"..v..msg.chat_id_) then
dp = 'ุตูุฑู ๐'
elseif DevAek:get(AEK.."Aek:Video:GpRed"..v..msg.chat_id_) then
dp = 'ููุฏูู ๐ฝ'
elseif DevAek:get(AEK.."Aek:File:GpRed"..v..msg.chat_id_) then
dp = 'ููู ๐'
elseif DevAek:get(AEK.."Aek:Audio:GpRed"..v..msg.chat_id_) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) โซ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = 'ใโ ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source AEK     --
if text == 'ุญุฐู ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) or text == 'ูุณุญ ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then
local redod = DevAek:smembers(AEK..'Aek:Manager:GpRed'..msg.chat_id_..'')
if #redod == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevAek:del(AEK..'Aek:Gif:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Voice:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Audio:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Photo:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Stecker:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Video:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:File:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Text:GpRed'..v..msg.chat_id_)
DevAek:del(AEK..'Aek:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ")  
return false
end
end
--     Source AEK     --
if  text == "ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) or text == "ุงูุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "ุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "โซ ุงูุฑุฏูุฏ ุงูุนุงู ใ" and SecondSudo(msg) then
local redod = DevAek:smembers(AEK.."Aek:Sudo:AllRed")
MsgRep = 'ใโ ุฑุฏูุฏ ุงููุทูุฑ โซ โค \nโโโโโโปใโปโโโโโ\n'
for k,v in pairs(redod) do
if DevAek:get(AEK.."Aek:Gif:AllRed"..v) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevAek:get(AEK.."Aek:Voice:AllRed"..v) then
dp = 'ุจุตูู ๐'
elseif DevAek:get(AEK.."Aek:Stecker:AllRed"..v) then
dp = 'ููุตู ๐'
elseif DevAek:get(AEK.."Aek:Text:AllRed"..v) then
dp = 'ุฑุณุงูู โ'
elseif DevAek:get(AEK.."Aek:Photo:AllRed"..v) then
dp = 'ุตูุฑู ๐'
elseif DevAek:get(AEK.."Aek:Video:AllRed"..v) then
dp = 'ููุฏูู ๐ฝ'
elseif DevAek:get(AEK.."Aek:File:AllRed"..v) then
dp = 'ููู ๐'
elseif DevAek:get(AEK.."Aek:Audio:AllRed"..v) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) โซ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = 'ใโ ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source AEK     --
if text == "ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) or text == "ุญุฐู ุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "ูุณุญ ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) then
local redod = DevAek:smembers(AEK.."Aek:Sudo:AllRed")
if #redod == 0 then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevAek:del(AEK.."Aek:Add:AllRed"..v)
DevAek:del(AEK.."Aek:Gif:AllRed"..v)
DevAek:del(AEK.."Aek:Voice:AllRed"..v)
DevAek:del(AEK.."Aek:Audio:AllRed"..v)
DevAek:del(AEK.."Aek:Photo:AllRed"..v)
DevAek:del(AEK.."Aek:Stecker:AllRed"..v)
DevAek:del(AEK.."Aek:Video:AllRed"..v)
DevAek:del(AEK.."Aek:File:AllRed"..v)
DevAek:del(AEK.."Aek:Text:AllRed"..v)
DevAek:del(AEK.."Aek:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","ใโ ุชู ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ")  
return false
end
end 
--     Source AEK     --
if text and text == "ุชุบููุฑ ุงุณู ุงูุจูุช" or text and text == "ูุถุน ุงุณู ุงูุจูุช" or text and text == "ุชุบูุฑ ุงุณู ุงูุจูุช" then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูู ุงุณู ุงูุจูุช ุงูุงู" ,  1, "md") 
DevAek:set(AEK..'Aek:NameBot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'ุญุฐู ุงุณู ุงูุจูุช' or text == 'ูุณุญ ุงุณู ุงูุจูุช' then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAek:del(AEK..'Aek:NameBot')
local AEKTEAM = 'ใโ ุงููุง ุนุฒูุฒู โซ '..AekRank(msg)..' \nใโ ุชู ุญุฐู ุงุณู ุงูุจูุช'
Aekmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, AEKTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source AEK     --
if text and text:match("^ุงุณุชุนุงุฏู ุงูุงูุงูุฑ$") and SecondSudo(msg) or text and text:match("^ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ$") and SecondSudo(msg) then
HelpList ={'Aek:Help','Aek:Help1','Aek:Help2','Aek:Help3','Aek:Help4','Aek:Help5','Aek:Help6'}
for i,Help in pairs(HelpList) do
DevAek:del(AEK..Help) 
end
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงุณุชุนุงุฏุฉ ุงูููุงูุด ุงูุงุตููู" ,  1, "md") 
end
if text == "ุชุนููู ุงูุงูุงูุฑ" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ุงูุงูุงูุฑ" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ุงูุงูุงูุฑ) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help0'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
DevAek:del(AEK..'Aek:Help0'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ุงูุงูุงูุฑ" or text == "ุงูุงูุฑ" or text == "ูุณุงุนุฏู" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nใโ ุงุฑุณู โซ (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help')
local text =  [[
ใโ ุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุงูุฑ โซ โค 
โโโโโโปใโปโโโโโ
ใโ ู1 โซ ุงูุงูุฑ ุงูุญูุงูู
ใโ ู2 โซ ุงูุงูุฑ ุงูุงุฏูููู
ใโ ู3 โซ ุงูุงูุฑ ุงููุฏุฑุงุก
ใโ ู4 โซ ุงูุงูุฑ ุงูููุดุฆูู
ใโ ู5 โซ ุงูุงูุฑ ุงููุทูุฑูู
ใโ ู6 โซ ุงูุงูุฑ ุงูุงุนุถุงุก
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]] 
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
end
if text == "ุชุนููู ุงูุฑ ู1" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููก" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู1) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help01'..msg.sender_user_id_)
if AEKTEAM == 'msg' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
DevAek:del(AEK..'Aek:Help01'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help1', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ู1" or text == "ููก" or text == "ุงูุงูุฑ1" or text == "ุงูุงูุฑูก" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nใโ ุงุฑุณู โซ (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help1')
local text =  [[
ใโ ุงูุงูุฑ ุญูุงูุฉ ุงููุฌููุนู โซ โค
โโโโโโปใโปโโโโโ
ใโ ููู โข ูุชุญ โซ ุงูุฑูุงุจุท
ใโ ููู โข ูุชุญ โซ ุงููุนุฑูุงุช
ใโ ููู โข ูุชุญ โซ ุงูุจูุชุงุช
ใโ ููู โข ูุชุญ โซ ุงููุชุญุฑูู
ใโ ููู โข ูุชุญ โซ ุงูููุตูุงุช
ใโ ููู โข ูุชุญ โซ ุงููููุงุช
ใโ ููู โข ูุชุญ โซ ุงูุตูุฑ
ใโ ููู โข ูุชุญ โซ ุงูููุฏูู
ใโ ููู โข ูุชุญ โซ ุงูุงูููุงูู
ใโ ููู โข ูุชุญ โซ ุงูุฏุฑุฏุดู
ใโ ููู โข ูุชุญ โซ ุงูุชูุฌูู
ใโ ููู โข ูุชุญ โซ ุงูุงุบุงูู
ใโ ููู โข ูุชุญ โซ ุงูุตูุช
ใโ ููู โข ูุชุญ โซ ุงูุฌูุงุช
ใโ ููู โข ูุชุญ โซ ุงููุงุฑูุฏุงูู
ใโ ููู โข ูุชุญ โซ ุงูุชูุฑุงุฑ
ใโ ููู โข ูุชุญ โซ ุงููุงุดุชุงู
ใโ ููู โข ูุชุญ โซ ุงูุชุนุฏูู
ใโ ููู โข ูุชุญ โซ ุงูุชุซุจูุช
ใโ ููู โข ูุชุญ โซ ุงูุงุดุนุงุฑุงุช
ใโ ููู โข ูุชุญ โซ ุงูููุงูุด
ใโ ููู โข ูุชุญ โซ ุงูุฏุฎูู
ใโ ููู โข ูุชุญ โซ ุงูุดุจูุงุช
ใโ ููู โข ูุชุญ โซ ุงูููุงูุน
ใโ ููู โข ูุชุญ โซ ุงููุดุงุฑ
ใโ ููู โข ูุชุญ โซ ุงูููุฑ
ใโ ููู โข ูุชุญ โซ ุงูุทุงุฆููู
ใโ ููู โข ูุชุญ โซ ุงููู
ใโ ููู โข ูุชุญ โซ ุงูุนุฑุจูู
ใโ ููู โข ูุชุญ โซ ุงูุงููููุฒูู
ใโ ููู โข ูุชุญ โซ ุงููุงุฑุณูู
ใโ ููู โข ูุชุญ โซ ุงูุชูููุด
โโโโโโปใโปโโโโโ
ใโ ุงูุงูุฑ ุญูุงูู ุงุฎุฑู โซ โค
โโโโโโปใโปโโโโโ
ใโ ููู โข ูุชุญ + ุงูุงูุฑ โซ โค
ใโ ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ
ใโ ุงูุชูุฑุงุฑ ุจุงููุชู
ใโ ุงูุชูุฑุงุฑ ุจุงูุชููุฏ
ใโ ุงููุงุฑุณูู ุจุงูุชุญุฐูุฑ
ใโ ุงููุงุฑุณูู ุจุงูุทุฑุฏ
ใโ ุงูุจูุชุงุช ุจุงูุทุฑุฏ
ใโ ุงูุจูุชุงุช ุจุงูุชููุฏ
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู2" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููข" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู2) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help21'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
DevAek:del(AEK..'Aek:Help21'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help2', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ู2" or text == "ููข" or text == "ุงูุงูุฑ2" or text == "ุงูุงูุฑูข" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nใโ ุงุฑุณู โซ (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help2')
local text =  [[
ใโ ุงูุงูุฑ ุงูุงุฏูููู โซ โค
โโโโโโปใโปโโโโโ
ใโ ุงูุงุนุฏุงุฏุช
ใโ ุชุงู ูููู 
ใโ ุงูุดุงุก ุฑุงุจุท
ใโ ุถุน ูุตู
ใโ ุถุน ุฑุงุจุท
ใโ ุถุน ุตูุฑู
ใโ ุญุฐู ุงูุฑุงุจุท
ใโ ุญุฐู ุงููุทุงูู
ใโ ูุดู ุงูุจูุชุงุช
ใโ ุทุฑุฏ ุงูุจูุชุงุช
ใโ ุชูุธูู + ุงูุนุฏุฏ
ใโ ุชูุธูู ุงูุชุนุฏูู
ใโ ููููู + ุงููููู
ใโ ุงุณู ุงูุจูุช + ุงูุงูุฑ
ใโ ุถุน โข ุญุฐู โซ ุชุฑุญูุจ
ใโ ุถุน โข ุญุฐู โซ ููุงููู
ใโ ุงุถู โข ุญุฐู โซ ุตูุงุญูู
ใโ ุงูุตูุงุญูุงุช โข ุญุฐู ุงูุตูุงุญูุงุช
โโโโโโปใโปโโโโโ
ใโ ุถุน ุณุจุงู + ุงูุนุฏุฏ
ใโ ุถุน ุชูุฑุงุฑ + ุงูุนุฏุฏ
โโโโโโปใโปโโโโโ
ใโ ุฑูุน ูููุฒ โข ุชูุฒูู ูููุฒ
ใโ ุงููููุฒูู โข ุญุฐู ุงููููุฒูู
ใโ ูุดู ุงููููุฏ โข ุฑูุน ุงููููุฏ
โโโโโโปใโปโโโโโ
ใโ ุญุฐู โข ูุณุญ + ุจุงูุฑุฏ
ใโ ููุน โข ุงูุบุงุก ููุน
ใโ ูุงุฆูู ุงูููุน
ใโ ุญุฐู ูุงุฆูู ุงูููุน
โโโโโโปใโปโโโโโ
ใโ ุชูุนูู โข ุชุนุทูู โซ ุงูุฑุงุจุท
ใโ ุชูุนูู โข ุชุนุทูู โซ ุงูุงูุนุงุจ
ใโ ุชูุนูู โข ุชุนุทูู โซ ุงูุชุฑุญูุจ
ใโ ุชูุนูู โข ุชุนุทูู โซ ูุดู ุงูุงุนุฏุงุฏุงุช
โโโโโโปใโปโโโโโ
ใโ ุทุฑุฏ ุงููุญุฐูููู
ใโ ุทุฑุฏ โซ ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
ใโ ูุชู โข ุงูุบุงุก ูุชู
ใโ ุชููุฏ โข ุงูุบุงุก ุชููุฏ
ใโ ุญุธุฑ โข ุงูุบุงุก ุญุธุฑ
ใโ ุงูููุชูููู โข ุญุฐู ุงูููุชูููู
ใโ ุงููููุฏูู โข ุญุฐู ุงููููุฏูู
ใโ ุงููุญุธูุฑูู โข ุญุฐู ุงููุญุธูุฑูู
โโโโโโปใโปโโโโโ
ใโ ุชูููุฏ ุฏูููู + ุนุฏุฏ ุงูุฏูุงุฆู
ใโ ุชูููุฏ ุณุงุนู + ุนุฏุฏ ุงูุณุงุนุงุช
ใโ ุชูููุฏ ููู + ุนุฏุฏ ุงูุงูุงู
ใโ ุงูุบุงุก ุชูููุฏ โซ ูุงูุบุงุก ุงูุชูููุฏ ุจุงูููุช
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู3" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฃ" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู3) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help31'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
DevAek:del(AEK..'Aek:Help31'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help3', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ู3" or text == "ููฃ" or text == "ุงูุงูุฑ3" or text == "ุงูุงูุฑูฃ" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nใโ ุงุฑุณู โซ (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help3')
local text =  [[
ใโ ุงูุงูุฑ ุงููุฏุฑุงุก โซ โค
โโโโโโปใโปโโโโโ
ใโ ูุญุต ุงูุจูุช
ใโ ุถุน ุงุณู + ุงูุงุณู
ใโ ูุถุน ุชูุญูุฏ + ุฑูุฒ ุงูุชูุญูุฏ
ใโ ุชุนูู ุนุฏุฏ ุงููุชู + ุงูุนุฏุฏ
ใโ ุงูุบุงุก โข ูุชู ุงุณู + ุงูุงุณู
ใโ ุงุถู โข ุญุฐู โซ ุฑุฏ
ใโ ุฑุฏูุฏ ุงููุฏูุฑ
ใโ ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ
ใโ ุญุฐู ููุงุฆู ุงูููุน
ใโ ููุน โซ ุจุงูุฑุฏ ุนูู ( ููุตู โข ุตูุฑู โข ูุชุญุฑูู )
ใโ ุญุฐู ูุงุฆูู ููุน + โซ โค
( ุงูุตูุฑ โข ุงููุชุญุฑูุงุช โข ุงูููุตูุงุช )
โโโโโโปใโปโโโโโ
ใโ ุชูุฒูู ุงููู
ใโ ุฑูุน ุงุฏูู โข ุชูุฒูู ุงุฏูู
ใโ ุงูุงุฏูููู โข ุญุฐู ุงูุงุฏูููู
โโโโโโปใโปโโโโโ
ใโ ุชุซุจูุช
ใโ ุงูุบุงุก ุงูุชุซุจูุช
ใโ ุงุนุงุฏู ุงูุชุซุจูุช
ใโ ุงูุบุงุก ุชุซุจูุช ุงููู
โโโโโโปใโปโโโโโ
ใโ ุชุบูุฑ ุฑุฏ + ุงุณู ุงูุฑุชุจู + ุงููุต โซ โค
ใโ ุงููุทูุฑ โข ููุดุฆ ุงูุงุณุงุณู
ใโ ุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู
ใโ ุงููููุฒ โข ุงูุนุถู
ใโ ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ
โโโโโโปใโปโโโโโ
ใโ ุชุบููุฑ ุงูุงูุฏู โซ ูุชุบููุฑ ุงููููุดู
ใโ ุชุนููู ุงูุงูุฏู โซ ูุชุนููู ุงููููุดู
ใโ ุญุฐู ุงูุงูุฏู โซ ูุญุฐู ุงููููุดู
โโโโโโปใโปโโโโโ
ใโ ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โซ โค
ใโ ุงุทุฑุฏูู โข ุงูุงูุฏู ุจุงูุตูุฑู โข ุงูุงุจุฑุงุฌ
ใโ ูุนุงูู ุงูุงุณูุงุก โข ุงูุงูุฑ ุงููุณุจ โข ุงูุชูุญูุฏ
ใโ ุงูุงูุฏู โข ุชุญููู ุงูุตูุบ โข ุงูุงูุฑ ุงูุชุญุดูุด
ใโ ุฑุฏูุฏ ุงููุฏูุฑ โข ุฑุฏูุฏ ุงููุทูุฑ โข ุงูุชุญูู
ใโ ุถุงููู โข ุญุณุงุจ ุงูุนูุฑ โข ุงูุฒุฎุฑูู
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู4" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููค" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู4) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help41'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
DevAek:del(AEK..'Aek:Help41'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help4', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ููค" or text == "ู4" or text == "ุงูุงูุฑ4" or text == "ุงูุงูุฑูค" then
if not Admin(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nใโ ุงุฑุณู โซ (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help4')
local text =  [[
ใโ ุงูุงูุฑ ุงูููุดุฆูู โซ โค
โโโโโโปใโปโโโโโ
ใโ ุชูุฒูู ุงููู
ใโ ุงุถู โข ุญุฐู โซ ุงูุฑ
ใโ ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู
ใโ ุงูุงูุงูุฑ ุงููุถุงูู
ใโ ุงุถู ููุงุท โซ ุจุงูุฑุฏ โข ุจุงูุงูุฏู
ใโ ุงุถู ุฑุณุงุฆู โซ ุจุงูุฑุฏ โข ุจุงูุงูุฏู
ใโ ุฑูุน ูุฏูุฑ โข ุชูุฒูู ูุฏูุฑ
ใโ ุงููุฏุฑุงุก โข ุญุฐู ุงููุฏุฑุงุก
ใโ ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โซ โค
ใโ ูุฒููู
ใโ ุงูุญุธุฑ โข ุงููุชู
ใโ ูุชู ุงูุงุณู
โโโโโโปใโปโโโโโ
ใโ ุงูุงูุฑ ุงูููุดุฆูู ุงูุงุณุงุณููู โซ โค
โโโโโโปใโปโโโโโ
ใโ ูุถุน ููุจ + ุงูููุจ
ใโ ุชูุนูู โข ุชุนุทูู โซ ุงูุฑูุน
ใโ ุฑูุน ููุดุฆ โข ุชูุฒูู ููุดุฆ
ใโ ุงูููุดุฆูู โข ุญุฐู ุงูููุดุฆูู
ใโ ุฑูุน โข ุชูุฒูู โซ ูุดุฑู
ใโ ุฑูุน ุจูู ุงูุตูุงุญูุงุช
ใโ ุญุฐู ุงูููุงุฆู
โโโโโโปใโปโโโโโ
ใโ ุงูุงูุฑ ููุดุฆ ุงููุฌููุนู โซ โค
โโโโโโปใโปโโโโโ
ใโ ุฑูุน โข ุชูุฒูู โซ ููุดุฆ ุงุณุงุณู
ใโ ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู 
ใโ ุงูููุดุฆูู ุงูุงุณุงุณููู 
ใโ ุญุฐู โข ูุณุญ โซ ุงูุงุณูุงุก ุงูููุชููู
ใโ ุญุฐู ุฌููุน ุงูุฑุชุจ
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู5" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฅ" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู5) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help51'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
DevAek:del(AEK..'Aek:Help51'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help5', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ููฅ" or text == "ู5" or text == "ุงูุงูุฑ5" or text == "ุงูุงูุฑูฅ" then
if not SudoBot(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูุฐุง ุงูุงูุฑ ูููุทูุฑูู ููุท', 1, 'md')
else
local Help = DevAek:get(AEK..'Aek:Help5')
local text =  [[
ใโ ุงูุงูุฑ ุงููุทูุฑูู โซ โค
โโโโโโปใโปโโโโโ
ใโ ุงููุฑูุจุงุช
ใโ ุงููุทูุฑูู
ใโ ุงููุดุชุฑููู
ใโ ุงูุงุญุตุงุฆูุงุช
ใโ ุงููุฌููุนุงุช
ใโ ุงุณู ุงูุจูุช + ุบุงุฏุฑ
ใโ ุงุณู ุงูุจูุช + ุชุนุทูู
ใโ ูุดู + -ุงูุฏู ุงููุฌููุนู
โโโโโโปใโปโโโโโ
ใโ ุฑูุน โข ุชูุฒูู โซ ูุฏูุฑ ุนุงู
ใโ ุญุฐู โข ุงููุฏุฑุงุก ุงูุนุงููู 
ใโ ุฑูุน โข ุชูุฒูู โซ ุงุฏูู ุนุงู
ใโ ุญุฐู โข ุงูุงุฏูููู ุงูุนุงููู 
ใโ ุฑูุน โข ุชูุฒูู โซ ูููุฒ ุนุงู
ใโ ุญุฐู โข ุงููููุฒูู ุนุงู 
โโโโโโปใโปโโโโโ
ใโ ุงูุงูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โซ โค
โโโโโโปใโปโโโโโ
ใโ ุชุญุฏูุซ
ใโ ุงููููุงุช
ใโ ุงููุชุฌุฑ
ใโ ุงูุณูุฑูุฑ
ใโ ุฑูุงุจุท ุงููุฑูุจุงุช
ใโ ุชุญุฏูุซ ุงูุณูุฑุณ
ใโ ุชูุธูู ุงููุฑูุจุงุช
ใโ ุชูุธูู ุงููุดุชุฑููู
ใโ ุญุฐู ุฌููุน ุงููููุงุช
ใโ ุชุนููู ุงูุงูุฏู ุงูุนุงู
ใโ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู
ใโ ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ
ใโ ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ
ใโ ุบุงุฏุฑ + -ุงูุฏู ุงููุฌููุนู
ใโ ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก + ุงูุนุฏุฏ
ใโ ุญุธุฑ ุนุงู โข ุงูุบุงุก ุงูุนุงู
ใโ ูุชู ุนุงู โข ุงูุบุงุก ุงูุนุงู
ใโ ูุงุฆูู ุงูุนุงู โข ุญุฐู ูุงุฆูู ุงูุนุงู
ใโ ูุถุน โข ุญุฐู โซ ุงุณู ุงูุจูุช
ใโ ุงุถู โข ุญุฐู โซ ุฑุฏ ุนุงู
ใโ ุฑุฏูุฏ ุงููุทูุฑ โข ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ
ใโ ุชุนููู โข ุญุฐู โข ุฌูุจ โซ ุฑุฏ ุงูุฎุงุต
ใโ ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช
ใโ ุฑูุน ุงููุณุฎู + ุจุงูุฑุฏ ุนูู ุงูููู
ใโ ุชุนููู โข ุญุฐู โซ ููุงุฉ ุงูุงุดุชุฑุงู
ใโ ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู
ใโ ุชุบููุฑ โข ุญุฐู โซ ูููุดู ุงูุงุดุชุฑุงู
ใโ ุฑูุน โข ุชูุฒูู โซ ูุทูุฑ
ใโ ุงููุทูุฑูู โข ุญุฐู ุงููุทูุฑูู
ใโ ุฑูุน โข ุชูุฒูู โซ ูุทูุฑ ุซุงููู
ใโ ุงูุซุงููููู โข ุญุฐู ุงูุซุงููููู
ใโ ุชุนููู โข ุญุฐู โซ ูููุดุฉ ุงูุงูุฏู
ใโ ุงุฐุงุนู ูููู ุจุงูุชูุฌูู โซ ุจุงูุฑุฏ
โโโโโโปใโปโโโโโ
ใโ ุชูุนูู ููู + ุงุณู ุงูููู
ใโ ุชุนุทูู ููู + ุงุณู ุงูููู
ใโ ุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โซ โค
ใโ ุงูุงุฐุงุนู โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู
ใโ ุชุฑุญูุจ ุงูุจูุช โข ุงููุบุงุฏุฑู
ใโ ุงูุจูุช ุงูุฎุฏูู โข ุงูุชูุงุตู
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู6" and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููฆ" and SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ (ู6) ุงูุงู " ,  1, "md")
DevAek:set(AEK..'Aek:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local AEKTEAM =  DevAek:get(AEK..'Aek:Help61'..msg.sender_user_id_)
if AEKTEAM == 'msg' then
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
DevAek:del(AEK..'Aek:Help61'..msg.sender_user_id_)
DevAek:set(AEK..'Aek:Help6', text)
Dev_Aek(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "ููฆ" or text == "ู6" or text == "ุงูุงูุฑ6" or text == "ุงูุงูุฑูฆ" then
local Help = DevAek:get(AEK..'Aek:Help6')
local text =  [[
ใโ ุงูุงูุฑ ุงูุงุนุถุงุก โซ โค
โโโโโโปใโปโโโโโ
ใโ ุงูุณูุฑุณ โข ูููุนู โข ุฑุชุจุชู โข ูุนูููุงุชู
ใโ ุฑุณุงุฆูู โข ุญุฐู ุฑุณุงุฆูู โข ุงุณูู โข ูุนุฑูู 
ใโ ุงูุฏู โขุงูุฏูู โข ุฌูุงุชู โข ุบูููู โข ุงูุงูุนุงุจ 
ใโ ููุงุทู โข ุจูุน ููุงุทู โข ุงูููุงููู โข ุฒุฎุฑูู 
ใโ ุฑุงุจุท ุงูุญุฐู โข ูุฒููู โข ุงุทุฑุฏูู โข ุงููุทูุฑ 
ใโ ููู ุถุงููู โข ูุดุงูุฏุงุช ุงูููุดูุฑ โข ุงูุฑุงุจุท 
ใโ ุฑููู โข ุงูุฏู ุงููุฌููุนู โข ูุนูููุงุช ุงููุฌููุนู 
ใโ ูุณุจู ุงูุญุจ โข ูุณุจู ุงููุฑู โข ูุณุจู ุงูุบุจุงุก 
ใโ ูุณุจู ุงูุฑุฌููู โข ูุณุจู ุงูุงููุซู โข ุงูุชูุงุนู
โโโโโโปใโปโโโโโ
ใโ ุตูุงุญูุงุชู
ใโ ููู + ุงููููู
ใโ ุฒุฎุฑูู + ุงุณูู
ใโ ุจุฑุฌ + ููุน ุงูุจุฑุฌ
ใโ ูุนูู ุงุณู + ุงูุงุณู
ใโ ุงุญุณุจ + ุชุงุฑูุฎ ูููุงุฏู
ใโ ุงูุญุณุงุจ + ุงูุฏู ุงูุญุณุงุจ
ใโ ุจูุณู โข ุจูุณูุง โซ ุจุงูุฑุฏ
ใโ ุฑูุน ูุทู โข ุชูุฒูู ูุทู โขุงููุทุงูู
ใโ ูููู โข ููููุง โซ ุจุงูุฑุฏ โข ุจุงููุนุฑู
ใโ ุตูุญู โข ุตูุญูุง โซ ุจุงูุฑุฏ โข ุจุงููุนุฑู
ใโ ุตูุงุญูุงุชู โซ ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
ใโ ุงูุฏู โข ูุดู  โซ ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
ใโ ุชุญููู + ุจุงูุฑุฏ โซ ุตูุฑู โข ููุตู โข ุตูุช โข ุจุตูู
โโโโโโปใโปโโโโโ
ใ [๐ผ๐๐๐ ๐๐๐](t.me/SoalfLove)โค
]]
Dev_Aek(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
--     Source AEK     --
if SecondSudo(msg) then
if text == "ุชุญุฏูุซ ุงูุณูุฑุณ" or text == "ุชุญุฏูุซ ุณูุฑุณ" then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุฌุงุฑู ุชุญุฏูุซ ุณูุฑุณ ุงููุงู', 1, 'md') 
os.execute('rm -rf AEK.lua') 
os.execute('wget https://raw.githubusercontent.com/AEKOVIP/AEK/master/AEK.lua') 
dofile('AEK.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( ุชู ุชุญุฏูุซ ุงูุณูุฑุณ )          \n\27[0;34;49m\n") 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุงูุชุญุฏูุซ ุงูู ุงูุงุตุฏุงุฑ ุงูุฌุฏูุฏ', 1, 'md') 
end
if text == 'ุชุญุฏูุซ' or text == 'ุชุญุฏูุซ ุงูุจูุช' or text == 'โซ ุชุญุฏูุซ ใ' then  
dofile('AEK.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช )        \n\27[0;34;49m\n") 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช", 1, "md")
end
if msg and not DevAek:get(AEK..'Aek:Update') then
DevAek:set(AEK..'Aek:Update',true)
os.execute('unlink JSON.lua && unlink dkjson.lua')
os.execute('git clone https://github.com/AEKOVIP/libs') 
dofile('AEK.lua') 
end
--     Source AEK     --
if text == 'ุงููููุงุช' then
Files = '\nใโ ุงููููุงุช ุงูููุนูู ูู ุงูุจูุช โซ โค \nโโโโโโปใโปโโโโโ\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = 'ใโ ูุง ุชูุฌุฏ ูููุงุช ูู ุงูุจูุช'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "ูุชุฌุฑ ุงููููุงุช" or text == 'ุงููุชุฌุฑ' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/AEKOVIP/AEKFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\nใโ ูุงุฆูุฉ ูููุงุช ูุชุฌุฑ ุณูุฑุณ ุงููุงู\nใโ ุงููููุงุช ุงููุชููุฑู ุญุงููุง โซ โค\nโโโโโโปใโปโโโโโ\n"
local TextE = "โโโโโโปใโปโโโโโ\nใโ ุนูุงูุฉ โซ (โ) ุชุนูู ุงูููู ููุนู\nใโ ุนูุงูุฉ โซ (โ๏ธ) ุชุนูู ุงูููู ูุนุทู\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(โ)"
else
CheckFile = "(โ๏ธ)"
end
NumFile = NumFile + 1
TextS = TextS.."ใโ "..Info..' โซ โค\n'..NumFile.."~ : `"..name..'` โฌ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"ใโ ูุง ููุฌุฏ ุงุชุตุงู ูู ุงููapi") 
end
end
if text == "ูุณุญ ุฌููุน ุงููููุงุช" or text == "ุญุฐู ุฌููุน ุงููููุงุช" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"ใโ ุชู ุญุฐู ุฌููุน ุงููููุงุช ุงูููุนูู")
end
if text and text:match("^(ุชุนุทูู ููู) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(ุชุนุทูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/AEKOVIP/AEKFiles/master/AEKFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\nใโ ุงูููู โซ *"..FileName.."*\nใโ ุชู ุชุนุทููู ูุญุฐูู ูู ุงูุจูุช ุจูุฌุงุญ") 
dofile('AEK.lua')  
else
send(msg.chat_id_, msg.id_,"ใโ ูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
end
if text and text:match("^(ุชูุนูู ููู) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(ุชูุนูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/AEKOVIP/AEKFiles/master/AEKFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\nใโ ุงูููู โซ *"..FileName.."*\nใโ ุชู ุชูุนููู ูู ุงูุจูุช ุจูุฌุงุญ") 
dofile('AEK.lua')  
else
send(msg.chat_id_, msg.id_,"ใโ ูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
return false
end
end 
--     Source AEK     --
if text and (text == 'ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ูุณุญ ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ', 1, 'md')   
DevAek:del(AEK..'Aek:Text:BotWelcome')
DevAek:del(AEK..'Aek:Photo:BotWelcome')
return false
end 
if text and (text == 'ุชูุนูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชูุนูู ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชูุนูู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevAek:del(AEK..'Aek:Lock:BotWelcome')
return false
end 
if text and (text == 'ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชุนุทูู ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) then    
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชุนุทูู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevAek:set(AEK..'Aek:Lock:BotWelcome',true)
return false
end 
if text and (text == 'ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ุชุบููุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'โซ ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ ใ') and SecondSudo(msg) then    
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุงุฑุณู ูู ูุต ุงูุชุฑุญูุจ', 1, 'md') 
DevAek:del(AEK..'Aek:Text:BotWelcome')
DevAek:del(AEK..'Aek:Photo:BotWelcome')
DevAek:set(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAek:get(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevAek:del(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููุต ุงุฑุณู ูู ุตูุฑุฉ ุงูุชุฑุญูุจ\nใโ ุงุฑุณู โซ ุงูุบุงุก ูุญูุธ ุงููุต ููุท", 1, 'md')   
DevAek:set(AEK.."Aek:Text:BotWelcome",text) 
DevAek:set(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAek:get(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููุต ูุงูุบุงุก ุญูุธ ุตูุฑุฉ ุงูุชุฑุญูุจ", 1, "md") 
DevAek:del(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAek:set(AEK.."Aek:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญูุธ ุงููุต ูุตูุฑุฉ ุงูุชุฑุญูุจ", 1, 'md')   
DevAek:del(AEK.."Aek:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source AEK     --
if text and text:match("^ุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ูุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ุชุบููุฑ ูููุดู ุงููุทูุฑ$") then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุงุฑุณู ูููุดุฉ ุงููุทูุฑ ุงูุงู ", 1, "md")
DevAek:setex(AEK.."Aek:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^ูุณุญ ูููุดู ุงููุทูุฑ$") or text and text:match("^ุญุฐู ูููุดู ุงููุทูุฑ$") then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุญุฐู ูููุดุฉ ุงููุทูุฑ", 1, "md")
DevAek:del(AEK.."DevText")
end end
--     Source AEK     --
if DevAek:get(AEK.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "ใโ ุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevAek:del(AEK.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAek:del(AEK.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAek:set(AEK..'Aek:textch:user',texxt)
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุชู ุชุบููุฑ ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู', 1, 'md')
end
if text and text:match("^ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู$") and SecondSudo(msg) or text and text:match("^ุชุบููุฑ ูููุดู ุงูุงุดุชุฑุงู$") and SecondSudo(msg) then  
DevAek:setex(AEK.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
local text = 'ใโ ุญุณูุง ุงุฑุณู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุฌุฏูุฏู'  
Dev_Aek(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "ุญุฐู ูููุดู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "ุญุฐู ูููุดู ุงูุงุดุชุฑุงู" then  
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
DevAek:del(AEK..'Aek:textch:user')
textt = "ใโ ุชู ุญุฐู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู"
Dev_Aek(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'ูููุดู ุงูุงุดุชุฑุงู' or text == 'ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู' then
if not SecondSudo(msg) then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุทูุฑ ุงูุงุณุงุณู ููุท ', 1, 'md')
else
local chtext = DevAek:get(AEK.."Aek:textch:user")
if chtext then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูููุดุฉ ุงูุงุดุชุฑุงู โซ โค \nโโโโโโปใโปโโโโโ\n['..chtext..']', 1, 'md')
else
local DevAek6 = DevAek:get(AEK.."DevAek3")
if DevAek6 then
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ุนููู ุงูุงุดุชุฑุงู ูู ููุงุฉ ุงูุจูุช \nใโ ููุงุฉ ุงูุจูุช โซ '..DevAek6, 1, "html")
else
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ ูู ูุชู ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nใโ ุงุฑุณู โซ ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ููุชุนููู ', 1, 'md')
end end end end
--     Source AEK     --
if text == 'ุงูููุงุฉ' or text == 'ููุงุฉ ุงูุณูุฑุณ' or text == 'ููุงู ุงูุณูุฑุณ' or text == 'ููุงุช ุงูุณูุฑุณ' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, 'ใโ Channel โฌ @SoalfLove', 1, 'html')    
end 
--     Source AEK     --
if Sudo(msg) then 
if text == 'ูุนูููุงุช ุงูุณูุฑูุฑ' or text == 'ุงูุณูุฑูุฑ' then 
Dev_Aek(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo 'ใโ ูุธุงู ุงูุชุดุบูู โซ โค\n`'"$LinuxVersion"'`' 
echo 'โโโโโโปใโปโโโโโ\nใโ ุงูุฐุงูุฑู ุงูุนุดูุงุฆูู โซ โค\n`'"$MemoryUsage"'`'
echo 'โโโโโโปใโปโโโโโ\nใโ ูุญุฏุฉ ุงูุชุฎุฒูู โซ โค\n`'"$HardDisk"'`'
echo 'โโโโโโปใโปโโโโโ\nใโ ุงููุนุงูุฌ โซ โค\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo 'โโโโโโปใโปโโโโโ\nใโ ุงูุฏุฎูู โซ โค\n`'`whoami`'`'
echo 'โโโโโโปใโปโโโโโ\nใโ ูุฏุฉ ุชุดุบูู ุงูุณูุฑูุฑ โซ โค\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source AEK     --
AEKFiles(msg)
--     Source AEK     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAek:incr(AEK..'Aek:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'ุงูููุฏูุง'
if result.content_.ID == "MessagePhoto" then Media = 'ุงูุตูุฑู'
elseif result.content_.ID == "MessageSticker" then Media = 'ุงูููุตู'
elseif result.content_.ID == "MessageVoice" then Media = 'ุงูุจุตูู'
elseif result.content_.ID == "MessageAudio" then Media = 'ุงูุตูุช'
elseif result.content_.ID == "MessageVideo" then Media = 'ุงูููุฏูู'
elseif result.content_.ID == "MessageAnimation" then Media = 'ุงููุชุญุฑูู'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local Aekname = 'ใโ ุงูุนุถู โซ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local Aekid = 'ใโ ุงูุฏูู โซ `'..dp.id_..'`'
local Aektext = 'ใโ ูุงู ุจุงูุชุนุฏูู ุนูู '..Media
local Aektxt = 'โโโโโโปใโปโโโโโ\nใโ ุชุนุงูู ูุงูุดุฑููู ุงูู ูุฎุฑุจ'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Aekan) 
local admins = Aekan.members_  
text = '\nโโโโโโปใโปโโโโโ\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, Aekname..'\n'..Aekid..'\n'..Aektext..text..Aektxt,0,'md') 
end
end,nil)
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAek:get(AEK..'Aek:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source AEK     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAek:get(AEK..'Aek:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAek:del(AEK..'Aek:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAek:del(AEK..'Aek:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAek:del(AEK..'Aek:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAek:del(AEK..'Aek:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source AEK     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mุฌุงุฑู ุชูุธูู ุงููุฌููุนุงุช ุงูููููู ูุฑุฌู ุงูุงูุชุธุงุฑ\n\27[1;37m')
local PvList = DevAek:smembers(AEK..'Aek:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAek:smembers(AEK..'Aek:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=AEK,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAek:srem(AEK..'Aek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAek:srem(AEK..'Aek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAek:srem(AEK..'Aek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAek:srem(AEK..'Aek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAek:sadd(AEK..'Aek:Groups',v)  
end end,nil) end
end
--     Source AEK     --
end 
------------------------------------------------
-- This Source Was Developed By (AEKAN) @A3KON.--
--   This Is The ๐๐๐ ๐๐ฉ๐ข๐ฏ๐ฏ๐ฆ๐ญ @SoalfLove .   --
--                - AEK -                 --
--        -- https://t.me/SoalfLove --         --
------------------------------------------------ 
