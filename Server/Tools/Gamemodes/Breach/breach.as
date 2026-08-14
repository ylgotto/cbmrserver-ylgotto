#include "include/uerm.as"
#include "utils.as"
#include "spawnpoints.as"
#include "roles.as"
#include "players.as"
#include "round.as"
#include "lobby.as"
#include "bans.as"
#include "adminpanel.as"

void OnInitialize() // Initialize when script loads. Don't use WORLD functions there.
{
	RegisterAllCallbacks();

	AdminPanel::Register();
	PlayerCallbacks::Register();
	Lobby::Create();
	
	// 初始化2分钟消息插件
	TwoMinuteMessages::Initialize();

	@GlobalBans = BanList("banlist.txt");
	
	CreateTimer(Round::Update, 1000, true);
	CreateTimer(Lobby::Update, 1000, true);
	
	server.disablenpcs = true; // Forcely set disablenpcs flag
	server.gamemode = "&colr[39 235 244]测人心&colr[252 9 9]房主有神器";
	server.respawntime = 0;
	
	print("Loaded Breach gamemode with 2-minute message plugin.");
}

void OnWorldUpdate()
{
	for(int i = 0; i < connPlayers.size(); i++) {
		if(connPlayers[i].IsBot()) PlayerTimers::BotLogic(connPlayers[i]);
	}
}

void OnWorldLoaded()
{
	Lobby::Load();
}

// 每2分钟发送随机消息插件
namespace TwoMinuteMessages
{
    array<string> messages = {
        "&colr[255 255 0]服务器提醒：请遵守游戏规则，保持友好交流！",
        "&colr[0 255 255]温馨提示：遇到问题可联系管理员寻求帮助。",
        "&colr[255 0 255]公告：服务器不定期维护，也请不要关注公告信息。",
        "&colr[0 255 0]感谢您选择我们的垃圾服务器，祝游戏愉快！",
        "&colr[255 165 0]提醒：请不要使用任何作弊软件或漏洞。",
        "&colr[255 0 0]重要：尊重其他玩家，禁止恶意行为。",
        "&colr[0 0 255]通知：服务器可能不会定期重启优化。",
        "&colr[128 0 128]游戏小贴士：35家的金属板914粗加和防毒面具加工可以得到非常牛逼的面具"
    };
    
    int messageTimer = 0;
    int interval = 120000; // 2分钟（120秒 = 120000毫秒）
    
    void Initialize()
    {
        // 创建定时器，每2分钟发送消息
        if(messageTimer != 0) {
            RemoveTimer(messageTimer);
        }
        
        messageTimer = CreateTimer(SendRandomMessage, interval, true);
        print("2分钟随机消息插件已加载，间隔: " + (interval/1000) + "秒");
    }
    
    void SendRandomMessage()
    {
        if(messages.size() > 0 && connPlayers.size() > 0) {
            // 随机选择一条消息
            int index = rand(0, messages.size() - 1);
            chat.Send(messages[index]);
        }
    }
    
    // 添加新消息到列表
    void AddMessage(string message)
    {
        messages.push_back(message);
    }
    
    // 清空消息列表
    void ClearMessages()
    {
        messages.clear();
    }
    
    // 设置消息间隔（秒）
    void SetInterval(int seconds)
    {
        interval = seconds * 1000;
        Initialize(); // 重新初始化定时器
    }
    
    // 获取当前消息列表
    array<string>@ GetMessages()
    {
        return messages;
    }
}
[file content end]