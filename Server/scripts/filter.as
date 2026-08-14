#include "scripts/include/uerm.as"

void OnInitialize()
{
    RegisterCallback(PlayerChat_c, OnChat);
    RegisterCallback(PlayerConnect_c, OnConnect);
    Filter::Register();

    print(" ");
    print("-------------------------------------------------------------");
    print("[SERVER] UERM Filter has been loaded successfully");
    print("[SERVER] By BelaRain");
    print("[SERVER] Repository - https://github.com/belarain/Filter-UERM");
    print("-------------------------------------------------------------");
    print(" ");

}

bool OnChat(Player player, string message)
{
    if (Filter::Contains(message)) { chat.SendPlayer(player, "[SERVER] No swear!"); return false; }
    return true;
}

void OnConnect(Player player)
{
    if (Filter::Contains(player.GetName()))
        player.Kick(12, "Your nickname contains offensive words! Change your nickname.");
}

namespace Filter
{
    string[] Words;

    void Register()
    {

        // English
        Add({"nigga", "n1gga", "negga", "nigge", "n1gge", "chink"});
        Add({"asshole", "assh0le"});
        Add({"motherfuck", "m0therfuck"});
        Add("faggot");
        Add("retard");
        Add("bastard");
        Add("moron"); // wattasigma
        Add({"nazi", "hitler", "gitler", "reich"});
        Add({"idiot", "1d1ot", "1diot", "id1ot"});
        Add({"bitch", "b1tch", "b1t4", "bit4"});

        // Russian
        Add({"долбоеб", "далбаеб", "долбаеб", "dolboeb", "dolbaeb", "dalbaeb"});
        Add("конч");
        Add({"даун", "daun"});
        Add({"педик", "педофил", "педек"});
        Add({"гомо", "гомик"});
        Add({"мудак", "мудила", "мудень", "мудачье", "mudak", "mudila"});
        Add({"пидор", "pidor"});
        Add({"ебанат", "еблан"});
        Add({"нига", "нигга", "чёрномазы", "чёрножоп"});
        Add({"хуепутало", "хуепл"});
        Add({"жид", "хохл", "хохол", "hohol", "hohl", "jid", "чинк", "узкоглаз", "русня", "rusnia", "чурк", "нерусь", "пендос", "пиндос", "москаль"}); // Political words.
        Add("мраз");
        Add("пиздабол");
    }

    void Add(string[] word)
    {
        for(int i = 0; i < word.size(); i++) Words.push_back(word[i].lower());
    }

    void Add(string word)
    {
        Words.push_back(word.lower());
    }

    bool Contains(string msg) 
    {
        for(int i = 0; i < Words.size(); i++) {
            if(msg.lower().findFirst(Words[i]) >= 0) return true;
        }

        return false;
    }
}