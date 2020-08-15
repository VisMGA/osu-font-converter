void mouseClicked() {
  Settings.anyActive = false;
  for(Button b : Settings.buttonTable.values()) {
    if(b.mouseOver()) {
      b.clicked();
    }
    if(b.active() && b.type().equals("char")) {
      Settings.anyActive = true;
    }
  }
}

void keyPressed() {
  if(key == CODED) {
    switch(keyCode) {
      case UP:
        upPress();
        break;
      case DOWN:
        downPress();
        break;
      case LEFT:
        leftPress();
        break;      
      case RIGHT:
        rightPress();
        break;
    }
  } else {
    switch(key) {
     case 'w':
       upPress();
       break;
     case 's':
       downPress();
       break;
     case 'a':
       leftPress();
       break;
     case 'd':
       rightPress();
       break;
    }
  }
}

void upPress() {
  for(Button b : Settings.buttonTable.values()) {
    if(b.type().equals("setting") && b.active()) {
      b.settingUp();
      println(b.text + " up");
    }
  }
}

void downPress() {
  for(Button b : Settings.buttonTable.values()) {
    if(b.type().equals("setting") && b.active()) {
      b.settingDown();
      println(b.text + " down");
    }
  }
}

void leftPress() {
  for(Button b : Settings.buttonTable.values()) {
    if(b.type().equals("setting") && b.active()) {
      b.settingLeft();
      println(b.text + " left");
    }
  }
}

void rightPress() {
  for(Button b : Settings.buttonTable.values()) {
    if(b.type().equals("setting") && b.active()) {
      b.settingRight();
      println(b.text + " right");
    }
  }
}
