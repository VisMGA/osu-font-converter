static class Settings {
  static float textPosY;
  static float textPosX;
  static float textW;
  static float fontS;
  static float fontH;
  static float fontW;
  static PFont f;
  static Hashtable<String, CharSettings> settingsTable = new Hashtable<String, CharSettings>();
  static Hashtable<String, Button> buttonTable = new Hashtable<String, Button>();
  static boolean anyActive;
  static char charList[] = {'0','1','2','3','4','5','6','7','8','9','%','x',',','.'};
  static int settingsButtonH = 40;
  static int settingsButtonW = 160;
  
  static void textPosX(int adj) {
    if(Settings.anyActive) {
     for(char c : Settings.charList) {
        CharSettings cs = Settings.settingsTable.get(""+c);
        if(cs.active) {
          cs.xMod += adj;
        }
      }
    } else {
      Settings.textPosX+=adj;
    }
  }
    

  static void textPosY(int adj) {
  if(Settings.anyActive) {
     for(char c : Settings.charList) {
       CharSettings cs = Settings.settingsTable.get(""+c);
       if(cs.active) {
         cs.yMod += adj;
       }
     }
    } else {
      Settings.textPosY+=adj;
    }
  }

  static void fontH(int adj) {
    if(Settings.anyActive) {
       for(char c : Settings.charList) {
         CharSettings cs = Settings.settingsTable.get(""+c);
         if(cs.active) {
           cs.hMod += adj;
           Settings.buttonTable.get(""+c).h+=adj;
         }
       }
    } else {
      Settings.fontH+=adj;
      for(Button b : Settings.buttonTable.values()) {
        if(b.type().equals("char")) {
          b.h+=adj;
        }
      }
    }
  }

  static void fontW(int adj) {
    if(Settings.anyActive) {
       for(char c : Settings.charList) {
         CharSettings cs = Settings.settingsTable.get(""+c);
         if(cs.active) {
           cs.wMod += adj;
           Settings.buttonTable.get(""+c).w+=adj;
         }
       }
    } else {
      Settings.fontW+=adj;
      for(Button b : Settings.buttonTable.values()) {
        if(b.type().equals("char")) {
          b.w+=adj;
        }
      }
    }
  }

  static void fontS(int adj) {
    if(Settings.anyActive) {
       for(char c : Settings.charList) {
         CharSettings cs = Settings.settingsTable.get(""+c);
         if(cs.active) {
           cs.sizeMod += adj;
         }
       }
    } else {
      Settings.fontS+=adj;
    }
  }
  
}
