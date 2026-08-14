#include "include/uerm.as"

void OnInitialize() {
  RegisterCallback(PlayerConnect_c, OnPlayerConnect);
  print("[Report]Plugin has successfully run.");
}

void OnPlayerConnect(Player player) {
  string[] zhs = {
    "&colr[252 9 9]服务器通知 腐竹Server hoster:ylgotto \n" ,
	  "&colr[255 0 0]特别鸣谢ATC和他牛逼的朋友\n",
    "&colr[255 128 0]开这个服务器真是闲的蛋疼\n",
    "&colr[255 255 0]请输入文本\n",
    "&colr[128 255 0]No content displayed?\n&colr[0 255 0]Please switch to Chinese.\n",
    "&col[FFFF77]欢迎来到&colr[255 0 0]C&colr[255 128 0]B&colr[255 255 0]T&colr[128 255 0]V&colr[0 255 0]服&colr[0 255 128]务&colr[0 255 255]器！\n",
    "&col[FFFF77]服务器规则：\n",
    "1.禁止作弊。\n",
    "2.禁止超过2scp长时间躲地表核弹室。\n",
    "3.禁止在914长时间刷卡导致服务器我卡顿。\n",
    "4.禁止辱骂他人或不文明用语以及任何炸麦行为。\n",
    "&colr[39 235 244]QQ交流群：135483249\nDiscord服务器:&hyperlink[https://discord.gg/MzVhhbKv,1]点击这里以加入",
    "OK"
  };
  player.ShowDialog(0, 0, zhs[0], zhs[1] + zhs[2] + zhs[3] + zhs[4] + zhs[5] + zhs[6] + zhs[7] + zhs[8] + zhs[9] + zhs[10] + zhs[11], zhs[12]);
}