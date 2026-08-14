#include "include/uerm.as"

// Make sure to change from the default settings!
string servername = "&colr[255 0 0]C&colr[255 128 0]B&colr[255 255 0]T&colr[128 255 0]V" ;
string discord = "discord.gg/MzVhhbKv";
string patreon = "patreon.com/yourpage";

// Make sure to setup the variables above!
bool showDiscord = true;
bool showPatreon = false;

// Debug logs (goes in console)
bool debug = false;

void OnInitialize()
{
    
    RegisterCallback(PlayerConnect_c, OnPlayerConnect);
    print("VinnySystems; Dynamic welcome has been initialized! Join discord.gg/y5R2ttaYP3 if you encounter any errors!");

    if (debug)
    {
        print("VinnySystems; Greeting vars (if discord is in greeting and if patreon): " + showDiscord + " " + showPatreon);
    }

}

void OnPlayerConnect(Player player)
{
    
    string message = player.GetName() + " 欢迎来到 " + servername + ".";
    if (showDiscord)
    {
        message += " 请加入我们的DC群聊" + discord + ".";
    }

    if (showPatreon)
    {
        message += " Support us on Patreon @ " + patreon + "!";
    }

    //
    // if (showfeature)
    // {
    //  message += "something something" + variable + "!";
    // }

    chat.SendPlayer(player, "[服务器]: " + message); // <- this is sent to the player
    
    if (debug)
    {
        print("VinnySystems; Greeting example " + message);
    }
}
