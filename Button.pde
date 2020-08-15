abstract class Button {
  boolean active;
  String text;
  int x;
  int y;
  int h;
  int w;
  
  
  Button(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    h = _h;
    w = _w;
    text = "";
    active = false;
  }
  
  abstract void settingDown();
  abstract void settingUp();
  abstract void settingLeft();
  abstract void settingRight();
  
  abstract boolean active();
  
  void render() {
    textAlign(CENTER,TOP);
    fill(active() ? color(180,0,0) : mouseOver() ? 100 : 50);
    rect(x,y,w,h);
    fill(255);
    textSize(type() == "setChooser" ?15:30); 
    if(type() != "char") text(text,x+w/2,y+2);
  }
  
  abstract void clicked();
  
  abstract String type();
  
  boolean mouseOver()
  {
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}

class CharButton extends Button {
  CharButton(int _x, int _y, int _w, int _h, String _text) {
    super(_x,_y,_w,_h);
    text = _text;
  }
  
  boolean active() {
    return Settings.settingsTable.get(text).active;
  }
  
  void clicked() {
    Settings.settingsTable.get(text).activate();
  }
  
  String type() {
    return "char";
  }
  
  void settingDown() {};
  void settingUp() {};  
  void settingLeft() {};
  void settingRight() {};
}

class ExportButton extends Button {
  ExportButton(int _x, int _y, int _w, int _h){
    super(_x,_y,_w,_h);
    text = "Export";
  }
  
  boolean active() {
    return false;
  }
  
  void clicked() {
    exportPNGs();
  }
  
  String type() {
    return "export";
  }
  
  void settingDown() {};
  void settingUp() {};  
  void settingLeft() {};
  void settingRight() {};
}

class SetChooser extends Button {
  SetChooser(int _x, int _y, int _w, int _h, String _text){
    super(_x,_y,_w,_h);
    text = _text;
    active = true;
  }
  
  boolean active() {
    return active;
  }  
  
  void clicked() {
    active = !active;
  }
  
  String type() {
    return "setChooser";
  }
  
  void settingDown() {};
  void settingUp() {};  
  void settingLeft() {};
  void settingRight() {};
}

class SizeButton extends Button {
  SizeButton(int _x, int _y, int _w, int _h){
    super(_x,_y,_w,_h);
    text = "Size";
  }
  
  boolean active() {
    return active;
  }
  
  void clicked() {
    active = !active;
    deactivateOthers(this);
  }
  
  String type() {
    return "setting";
  }
  
  void settingDown() {
    Settings.fontH(1);
  };
  void settingUp() {
    Settings.fontH(-1);
  };  
  void settingLeft() {
    Settings.fontW(-1);
  };
  void settingRight() {
    Settings.fontW(1);
  };
}

class FontSizeButton extends Button {
  FontSizeButton(int _x, int _y, int _w, int _h){
    super(_x,_y,_w,_h);
    text = "Font Size";
  }
  
  boolean active() {
    return active;
  }
  
  void clicked() {
    active = !active;
    deactivateOthers(this);
  }
  
  String type() {
    return "setting";
  }  
  void settingDown() {
    Settings.fontS(-1);
  };
  void settingUp() {
    Settings.fontS(1);
  };  
  void settingLeft() {
  };
  void settingRight() {
  };
}

class CharPosButton extends Button {
  CharPosButton(int _x, int _y, int _w, int _h){
    super(_x,_y,_w,_h);
    text = "Position";
  }
  
  boolean active() {
    return active;
  }
  
  void clicked() {
    active = !active;
    deactivateOthers(this);
  }
  
  String type() {
    return "setting";
  }
  
  void settingDown() {
    Settings.textPosY(1);
  };
  void settingUp() {
    Settings.textPosY(-1);
  };  
  void settingLeft() {
    Settings.textPosX(-1);
  };
  void settingRight() {
    Settings.textPosX(1);
  };
}
