//Program to create and export numbers for osu! from a font.
//By Vis Major

import java.util.Hashtable;

void setup() {
  size(1200,400);
  surface.setResizable(true);
  //initial settings
  Settings.textW = 40;
  Settings.fontS = 70;
  Settings.fontH = 80;
  Settings.fontW = 40;
  Settings.textPosY = Settings.fontH/2.0;
  Settings.textPosX = Settings.fontW/2.0;
  
  //Populate character settings and create buttons
  int i = 0;
  for(char c : Settings.charList) {
    Settings.settingsTable.put(""+c,new CharSettings(c));
    Settings.buttonTable.put(""+c,new CharButton((int)(i*(Settings.fontW+1)),0,(int)Settings.fontW,(int)Settings.fontH,""+c));
    i++;
  }
  Settings.buttonTable.put("export",new ExportButton(width-Settings.settingsButtonW,height-Settings.settingsButtonH,Settings.settingsButtonW,Settings.settingsButtonH));
  Settings.buttonTable.put("size", new SizeButton(width-2*(Settings.settingsButtonW+1),height-Settings.settingsButtonH,Settings.settingsButtonW,Settings.settingsButtonH));
  Settings.buttonTable.put("fontSize", new FontSizeButton(width-3*(Settings.settingsButtonW+1),height-Settings.settingsButtonH,Settings.settingsButtonW,Settings.settingsButtonH));
  Settings.buttonTable.put("position", new CharPosButton(width-4*(Settings.settingsButtonW+1),height-Settings.settingsButtonH,Settings.settingsButtonW,Settings.settingsButtonH));
  Settings.buttonTable.put("default", new SetChooser(width - Settings.settingsButtonW/3, height - 2*(Settings.settingsButtonH), Settings.settingsButtonW/3,Settings.settingsButtonH,"default"));
  Settings.buttonTable.put("combo", new SetChooser(width - 2*Settings.settingsButtonW/3, height - 2*(Settings.settingsButtonH), Settings.settingsButtonW/3,Settings.settingsButtonH,"combo"));
  Settings.buttonTable.put("score", new SetChooser(width - 3*Settings.settingsButtonW/3, height - 2*(Settings.settingsButtonH), Settings.settingsButtonW/3,Settings.settingsButtonH,"score"));
  Settings.buttonTable.get("fontSize").clicked();
  
  
  Settings.f=createFont(PFont.list()[0],200);
  selectInput("Select Font:", "fileSelector");
}

void fileSelector(File selection) {
  if (selection == null) {
    println("Selection cancelled.");
    return;
  }else{
    println(selection.getAbsolutePath());
    Settings.f = createFont(selection.getAbsolutePath(),Settings.fontS);
  }
}


PGraphics makeCharImg(CharSettings c, boolean alpha) {
  PGraphics g = createGraphics((int)Settings.fontW+c.wMod,(int)Settings.fontH+c.hMod,JAVA2D);
  g.beginDraw();
  if(!alpha) g.background(50+50*(c.active?1:0));
  g.textFont(Settings.f);
  g.textAlign(CENTER,CENTER);
  g.textSize(Settings.fontS+c.sizeMod);
  g.text(c.c,Settings.textPosX+c.xMod,Settings.textPosY+c.yMod);
  g.endDraw();
  return g;
}

void draw() {
  background(0);
  textSize(15);
  textAlign(LEFT, TOP);
  text("WASD or arrow keys to adjust settings\nRed buttons are active\nClick on any number of characters to adjust only those,\n or adjust all if no characters are active",20, 160);
  int xSum = 0;
  for(Button b : Settings.buttonTable.values()) {
    b.render();
  }
  for(char c : Settings.charList) {
    CharSettings cs = Settings.settingsTable.get(""+c);
    Button b = Settings.buttonTable.get(""+c);
    image(makeCharImg(cs,true),xSum,0);
    cs.xPos = xSum;
    b.x = xSum;
    xSum += Settings.fontW+cs.wMod+1;
  }
}



void exportPNGs() {
  for(char c : Settings.charList) {
    CharSettings cs = Settings.settingsTable.get(""+c);
    PGraphics g = makeCharImg(cs,true);
    if(cs.c == 'x' && Settings.buttonTable.get("combo").active()){
      g.save("export/combo-"+cs.c+"@2x.png");
    } else if(cs.c == ','&& Settings.buttonTable.get("score").active()){
      g.save("export/score-comma@2x.png");
    } else if(cs.c == '.' && Settings.buttonTable.get("score").active()){ 
      g.save("export/score-dot@2x.png");
    } else if (cs.c == '%' && Settings.buttonTable.get("score").active()){
      g.save("export/score-percent@2x.png");
    } else if (!(cs.c == ',' || cs.c == '.' || cs.c == '%' || cs.c == 'x')) {
      if(Settings.buttonTable.get("combo").active()) g.save("export/combo-"+cs.c+"@2x.png");
      if(Settings.buttonTable.get("default").active()) g.save("export/default-"+cs.c+"@2x.png");
      if(Settings.buttonTable.get("score").active()) g.save("export/score-"+cs.c+"@2x.png");
    }
  }
}

void deactivateOthers(Button thisButton) {
  for(Button b : Settings.buttonTable.values()) {
    if(b.type() != "char" && b != thisButton && b.type() != "setChooser") {
      b.active = false;
    }
  }
}
