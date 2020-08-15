class CharSettings {
  char c;
  int wMod;
  int hMod;
  int sizeMod;
  int xMod;
  int yMod;
  int xPos;
  int yPos;
  boolean active;
  
  CharSettings(char setChar) {
    c = setChar;
    active = false;
    wMod = 0;
    hMod = 0;
    sizeMod = 0;
    xMod = 0;
    yMod = 0;
    xPos = 0;
    yPos = 0;
  }
  
  void activate() {
    active = !active;
  }
}
