float x = 200;
float y = 150;

PFont f;

float x_bon = 2;
float y_bon = 2;

float playerx = 150;
float playery = 292;
float px_mod = 2;
float py_mod = 2;

float og_pym = 5;
float pym = 5;
float max_pym = pym;

float og_pxm = 5;
float pxm = 2;
float max_pxm = pxm;

float size = 20;

boolean jumping = false;
boolean left = false;
boolean right = false;
boolean was_right = false;
boolean collision_rep = false;
boolean collision_seq = false;
boolean bouncing = false;
boolean up = true; 
boolean wall_jumped = false;
boolean double_jumped = false;

int shade = 100;
int shade_mod = 5;
int skillx = -40;
int descx = -80;

boolean smash_seq = false;
boolean smashing = false;
boolean supersmash = false;
int smash_shade = 255;
int smash_mod = 10;

int collisions = 0;

float hits = 1;

float pointx = 250;
float pointy = 250;
float og_pointy = pointy;
int points = 0;
float sined = 1;
float sined_mod = .05;

int seconds = 0;
int im = 0;

boolean playing = true;
boolean has_super_smashed = false;

int screen = 0;
float menuy = 150;
float og_menuy = 150;

int ach_num = 0;
int sel_ach = 0;
float ach_x = 0;
float ach_y = 0;
int smash_point_count = 0;
float r = 0;
float g = 0;
float b = 0;
int achievement_count = 0;
int wall_jump_count = 0;
boolean has_jumped = false;
boolean has_moved = false;
boolean has_stopped_moving = false;
boolean[] achievements;
boolean[] unlocked_skills; 
boolean slowmo = false;
int sssecond = 0;

int col_switch = 0;

float col_mods = 1;

import processing.sound.*;
SoundFile file;

void setup() {

  achievements = new boolean[15];
  unlocked_skills = new boolean[2];
  for (int i=0; i < 2; i ++) {
    unlocked_skills[i] = false;  
  }
  for (int i=0; i < 15; i++) {
    achievements[i] = false;
    println(achievements[i]);
  }
  size(700,500);
  frameRate(120);
  f = createFont("Source Code Pro Black", 14);
  textFont(f);
  file = new SoundFile(this, "02 Green Hill Zone.mp3");
  file.loop();
}

boolean collision_detection(float offending_x, float offending_y, float x, float x_end, float y, float y_end) {
  if (offending_x >= x && offending_x <= x_end && offending_y >= y && offending_y <= y_end) {
    return(true);
  } else {
    return(false);
  }
}

void draw() {

//Title screen ----------------------------------------------------------------------------------------------------------

  if (screen == 0) {

    background(204, 255, 204);
    fill(220);
    rect(width * 0.32857142857, height * .3333, width * 0.32857142857, height * .11666, height * .0233);
    rect(width * .2, height * .6, width * .585, height * .1166, height * .0233);
    playing = false;
    textAlign(CENTER);
    fill(0);
    f = createFont("Source Code Pro Black", width * .0685);
    textFont(f);
    text("G A M E   B A L L", width/2, height*.1333);
    f = createFont("Source Code Pro Black", width * .04);
    textFont(f);
    text("S T A R T", width * .4914, height * .4033);
    text("A C H I E V E M E N T S", width/2, height * .666);
    fill(254, 156, 161);
    ellipse(width * .857, menuy, height * .0666, height * .0666);
    menuy = og_menuy + sin(sined)*15;
    sined += .075;
    if (achievement_count == 5) {
      unlocked_skills[0] = true;
      f = createFont("Source Code Pro Black", 15);
      textFont(f);
      skillx += 5;
      if (skillx >= 40) {
        skillx = 40;
        descx += 5;
        if (descx >= 80) {
          descx = 80;
          fill(230);
          rect(5, 50, 160, 45);
        }
      }
      fill(254, 156, 161);
      text("New Skill Unlocked: 'Smash'", skillx, 65);
      f = createFont("Source Code Pro Black", 9);
      textFont(f);
      textAlign(CENTER);
      fill(254, 100, 111);
      text("Press 's' to rapidly", descx, 78);
      text("fall to the ground", descx, 88);
    } 
    
    if (achievement_count == 10) {
      unlocked_skills[1] = true;
      f = createFont("Source Code Pro Black", 15);
      textFont(f);
      skillx += 5;
      if (skillx >= 65) {
        skillx = 65;
        descx += 5;
        if (descx >= 100) {
          descx = 100;
          fill(230);
          rect(5, 50, 210, 45);
        }
      }
      fill(254, 156, 161);
      text("New Skill Unlocked: 'Double Jump'", skillx, 65);
      f = createFont("Source Code Pro Black", 9);
      textFont(f);
      textAlign(CENTER);
      fill(254, 100, 111);
      text("Press 'w' twice to", descx, 78);
      text("soar into the air", descx, 88);
    }
    if (mousePressed) {
      if (collision_detection(mouseX, mouseY, width * .328, height * .7666, width * .2857, height * .45)) {
        screen = 1;
        playing = true;
      } if (collision_detection(mouseX, mouseY, width * .2, height * .9166, width * .514, height * .7166)) {
        screen = 2;
      } ///if (collision_detection(mouseX, mouseY, 91.25, (91.25+168.75), 252.5, (252.5+35))==true) {
        ///screen = 3;
      ///}
    }
  }
  
//Store screen ------------------------------------------------------------------------------------------------------------

  if (screen==3) {
    background(255, 250, 205);
    
    for (int i = 25; i < (300); i += 50) {
      rect(i, 35, 40, 40);
    }
    
    rect(91.25, 252.5, 168.75, 35);
    //if (mousePressed) {
    //  if (collision_detection(mouseX, mouseY, 91.25, (91.25+168.75), 252.5, (252.5+35))==true) {
    //    screen = 0;
    //  }
    //}
  }

//Achievement screen ------------------------------------------------------------------------------------------------------  

  
  if (screen==2) {
    background(217, 229, 255);
    f = createFont("Source Code Pro Black", 20);
    textFont(f);
    textAlign(CENTER);
    fill(0);
    text("A C H I E V E M E N T S", 175, 30);
    fill(220);
    rect(91.25, 252.5, 168.75, 35, 7);
    for (float b = 55; b <= 200; b += 72.5) {
      for (float i = 25; i <= 290; i += 66.25) {
        ach_num += 1;
        if (achievements[ach_num-1] == true) {
          fill(178, 255, 178);
        } 
        if (achievement_count < 5) {
          if (ach_num >5) {
            fill(150);
          }
        } if (achievement_count < 10) {
          if (ach_num > 10) {
            fill(150);
          }
        }
        rect(i, b, 35, 35, 7);
        
        if (mousePressed) {
          if (collision_detection(mouseX, mouseY, i, i+35, b, b+35)) {
            sel_ach = ach_num;

            ach_x = i;
            ach_y = b+37;
            
            println(achievement_count + ", " + ach_num);
            if (!(achievement_count < 5 && ach_num >5)&&!(achievement_count >= 5 && achievement_count < 10 && sel_ach > 10)) {
              
              
              if (achievements[sel_ach-1] == true) {
                fill(178, 255, 178);
              } else {
                fill(255, 204, 204);
              }
              rect(i, b, 35, 35, 7);
              
              
              if (sel_ach == 4 || sel_ach == 5 || sel_ach == 9 || sel_ach == 10 || sel_ach == 14 || sel_ach == 15) {
                rect(ach_x-(160-35), ach_y, 160, 33, 7);
              } else {
                rect(ach_x, ach_y, 160, 33, 7);
              }
            
              if (sel_ach == 1) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get a score of five", ach_x+80, ach_y+15);
              } if (sel_ach == 2) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get a score of ten", ach_x+80, ach_y+15);
              } if (sel_ach == 3) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get a score of five", ach_x+80, ach_y+15);
                text("No collisions", ach_x + 80, ach_y + 25);
              } if (sel_ach == 4) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get a score of ten", ach_x-(160-35)+80, ach_y+15);
                text("No collisions", ach_x-(160-35)+80, ach_y + 25);
              }  if (sel_ach == 5) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get fifteen collisions", ach_x-(160-35)+80, ach_y+15);
                text("No points", ach_x-(160-35)+80, ach_y + 25);
              } if (sel_ach == 6) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get 5 points and", ach_x+80, ach_y+15);
                text("perform 5 wall jumps", ach_x+80, ach_y + 25);
              } if (sel_ach == 7) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get ten collisions", ach_x+80, ach_y+15);
                text("No jumping", ach_x+80, ach_y + 25);
              } if (sel_ach == 8) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Don't move", ach_x+80, ach_y+15);
                text("1 collision", ach_x+80, ach_y + 25);
              } if (sel_ach == 9) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Don't stop moving", ach_x-(160-35)+80, ach_y+15);
                text("No collisions", ach_x-(160-35)+80, ach_y + 25);
              } if (sel_ach == 10) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Smash through 5 points,", ach_x-(160-35)+80, ach_y+15);
                text("no collisions", ach_x-(160-35)+80, ach_y + 25);
              } if (sel_ach == 11) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Get 20 points.", ach_x+80, ach_y+15);
                text("You got this.", ach_x+80, ach_y + 25);
              } if (sel_ach == 12) {
                f = createFont("Source Code Pro Semibold", 12);
                textFont(f);
                textAlign(CENTER);
                fill(0);
                text("Matrix slow down", ach_x+80, ach_y+15);
                text("Appreciate the view", ach_x+80, ach_y + 25);
              }
              fill(240);
            } else {
              fill(100);
              rect(i, b, 35, 35, 7);
            }
          }
        }
        fill(220);
      }
    }
    ach_num = 0;
    if (mousePressed) {
      if (collision_detection(mouseX, mouseY, 91.25, (91.25+168.75), 252.5, (252.5+35))==true) {
        screen = 0;
      }
    }
  } 
  
// Game Screen ----------------------------------------------------------------------------------------------------------  
   
  if (playing && screen ==1) {
    
    println(wall_jump_count);
    
    im += 1;
    if (im == 120 && slowmo == false) {
      seconds += 1;
      im = 0;
      print(seconds);
    } if (slowmo == true) {
      if (im == 240) {
        seconds += 1;
        im = 0;
      }
    }
    
    if (collision_seq==false && slowmo == false) {
      if (achievement_count <5) {
      r = 225;
      g = 254;
      b = 254;
      } else if (achievement_count < 10) {
        r = 255;
        g = 250;
        b = 205;
      } else {
        r = 204;
        g = 204;
        b = 255;
      }
      background(r, g, b);
    } if (slowmo == true) {
      r += col_mods;
      g += col_mods;
      b += col_mods;
      if (r >= 255) {
        col_mods = 0;
      } if (r > 100 || col_switch == 1) {
        if (r <= 100) {
          col_mods *= -1;
          col_switch = 1;
        }
      }
      background(r, g, b);
    }
    
    if (seconds >= 2) {
      if (left == false && jumping == false && right == false && smashing == false) {
        has_stopped_moving = true;
      }
    }
    
    if (playerx <= x+size/2 && playerx >= x-size/2 && playery <= y+size/2 && playery >= y-size/2) {
      if (collision_rep == false) {
        collisions +=1;
        collision_seq = true;
        print("collision");
        collision_rep = true;
      }
    } else {
      collision_rep = false;
    }
    
    
    if (collision_seq) {
      background(shade);
      shade -=shade_mod;
      if (shade <=0) {
        shade = 0;
        shade_mod *= -1;
      } if (shade >=250) {
        collision_seq = false;
        shade = 100;
        shade_mod = 5;
      }
    }

    
    fill(200);
    ellipse(x, y, size, size);
    fill(254, 156, 161);
    x += x_bon;
    y += y_bon;
    
    if(x >=(width-size/2)){
      x_bon *= -1;
      x = (width-size/2)-1;
    } if (x<=size/2) {
      x_bon *= -1;
      x = size/2 + 1; 
    } if (y >=(height-size/2)) {
      y_bon *= -1;
      y = (height-size/2) -1;
    } if (y<=size/2) {
      y_bon *= -1;
      y = size/2 + 1;
    }
    
    ellipse(playerx, playery, 15, 15);
    
    fill(234,229,159);
    ellipse(pointx, pointy, 20, 20);
    pointy = og_pointy +(10*sin(sined));
    sined += sined_mod;
    
    if (playerx <= pointx+10 && playerx >= pointx-10 && playery <= pointy+10 && playery >= pointy-10) {
        points +=1;
        print("point");
        pointx = random(10, 340);
        pointy = random(30, 290);
        og_pointy = pointy;
        if (smashing == true) {
          smash_point_count += 1;    
        }
    }
    
    if (hits >= 3) {
        pym =5;
        jumping = false;
        double_jumped = false;
        og_pym = pym;
        hits = 1;
    }
      
    if (jumping == true) {
      playery -= pym;
      pym -= .1;
      if (playery >= 293){
        wall_jumped = false;
        hits += 1;
        pym = og_pym/2;
        og_pym = pym;
        playery = 292;
      }
    } 
    
    if (left == true) {
      playerx += px_mod*-1;
      if (playerx < 7) {
        if (jumping == true) {
        bouncing = true;
        } else if (jumping == false) {
          playerx = 7;
        }
      }
    }
    
    if (right == true) {
      playerx += px_mod; 
      if (playerx > 343) {
        if (jumping == true) {
          bouncing = true;
          was_right = true;
        } else if (jumping == false) {
          playerx = 343;
        }
      }
    }
    
    if (smashing == true) {
      if (playery <= 0 && supersmash == false && has_super_smashed == false) {
        supersmash = true;
        has_super_smashed = true;
      }
      if (playery < 292) {
        playery += 15;
      } else if (playery >= 292) {
        playery = 292;
        smashing = false;
        if (supersmash == true) {
          r = 0;
          g = 0;
          b = 0;
          if (x_bon >= 0) {
            x_bon = .5;
          } if (x_bon <=0) {
            x_bon = -.5;
          } if (y_bon >= 0) {
            y_bon = .5;
          } if (y_bon <= 0) {
            y_bon = -.5;
          }
          sined_mod = .025;
          sssecond = seconds;
          slowmo = true;
          supersmash = false;
        }
      }
    }
    
    if (seconds >= sssecond +5) {
      if (x_bon >= 0) {
            x_bon = 2;
          } if (x_bon <=0) {
            x_bon = -2;
          } if (y_bon >= 0) {
            y_bon = 2;
          } if (y_bon <= 0) {
            y_bon = -2;
          }
          sined_mod = .05;
          slowmo = false;
    }
    
    if (bouncing) {
      if (right) {
        px_mod *= -1;
      }
      
      left = false;
      right = false;
  
      playerx += px_mod;
      
      if (playery == 292 || wall_jumped == true) {
        if (wall_jumped == true) {
          wall_jump_count += 1;
        }
        bouncing = false;
        if (was_right) {
          px_mod *= -1;
          was_right = false;
        }
      }
    }
    
     fill(0);
     f = createFont("Source Code Pro Black", 14);
     textFont(f);
     textAlign(RIGHT);
     fill(0);
     text("Collisions: " + str(collisions), 330, 20);
     textAlign(LEFT);
     fill(0);
     text("Points: " + str(points), 20, 20);
     textAlign(CENTER);
     fill(0);
     text("Time: " + str(30- seconds), 160, 30);
     
     if (size <=125 && up == true) {
      size += .01;
     } else if (size > 125) {
       up = false;  
     } if (size >= 20 && up == false) {
       size -= .01;  
     } else if (size < 20) {
       up = true;  
     }
     if (30-seconds < 0) {
       seconds = 30;
       playing = false;
    } 
    
  } if (playing == false && screen == 1) {
      screen = 0;
      if (points >= 5) {
         if (achievements[0] == false) {
           achievement_count += 1;
           achievements[0] = true;
         }
      } if (points >=10) {
        if (achievements[1] == false) {
           achievement_count += 1;
           achievements[1] = true;
         }
      } if (points >= 5 && collisions == 0) {
        if (achievements[2] == false) {
           achievement_count += 1;
           achievements[2] = true;
         }
      } if (points >= 10 && collisions == 0) {
        if (achievements[3] == false) {
           achievement_count += 1;
           achievements[3] = true;
         }
      } if (collisions >= 15 && points == 0) {
         if (achievements[4] == false) {
           achievement_count += 1;
           achievements[4] = true;
         }
      } if (achievement_count >=5) {
        if (points >=5 && wall_jump_count >=5 && achievements[5] == false) {
          achievement_count +=1;
          achievements[5] = true;
        } if (has_jumped == false && collisions >= 10 && achievements[6] == false) {
          achievement_count += 1;
          achievements[6] = true;
        } if (has_moved == false && collisions >= 1 && achievements[7] == false) {
          achievement_count += 1;
          achievements[7] = true;
        } if (has_stopped_moving == false && collisions == 0 && achievements[8] == false) {
          achievement_count += 1;
          achievements[8] = true;
        } if (smash_point_count >= 5 && collisions ==0) {
          achievement_count += 1;
          achievements[9] = true;
        }
      } if (achievement_count >= 10) {
        if (points >=20) {
          achievement_count +=1;
          achievements[10] = true;
        } if (has_super_smashed == true) {
          achievement_count += 1;
          achievements[11] = true;
        } if (has_moved == false && collisions >= 1 && achievements[7] == false) {
          achievement_count += 1;
          achievements[7] = true;
        } if (has_stopped_moving == false && collisions == 0 && achievements[8] == false) {
          achievement_count += 1;
          achievements[8] = true;
        } if (smash_point_count >= 5 && collisions ==0) {
          achievement_count += 1;
          achievements[9] = true;
        }
      }
      points = 0;
      collisions = 0;
      seconds = 0;
      im = 0;
      size = 20;
      collisions = 0;
      points = 0;
      playerx = 150;
      playery = 293;
      x = 25;
      y = 25;
      px_mod = 2;
      pointx = random(15, 335);
      pointy = random(280, 293);
      println(pointy);
      wall_jump_count = 0;
      has_super_smashed = false;
      has_jumped = false;
      has_moved = false;
      has_stopped_moving = false;
      descx = -80;
      skillx = -40;
      col_mods = 1;
      smash_point_count = 0;
      slowmo = false;
    }
  
}

//Key Inputs -------------------------------------------------------------------------------------------------------------

void keyPressed() {
 if (key == 'W' || key == 'w') {
   if (unlocked_skills[1] == true) {
     if (double_jumped ==false && jumping == true && bouncing == false) {
         pym = 5;
         og_pym = 5;
         double_jumped = true;
     }
   }
   jumping = true;
   has_moved = true;
   has_jumped = true;
   if (bouncing && wall_jumped == false) {
     pym = 5;
     og_pym = 5;
     wall_jumped = true;
   } 
 }
 if (key == 'A' || key == 'a') {
   has_moved = true;
   if (bouncing == false || wall_jumped == true) {
     left = true;
   }
 } 
 if (key == 'D' || key == 'd') {
   has_moved = true;
   if (bouncing == false || wall_jumped == true) {
     right = true;
   }
 }  if (key == 'S' || key == 's') {
   if (unlocked_skills[0] == true) {
     if (jumping == true) {
       smashing = true;
     } else {
       smashing = false;
     }
   }
 }

}

void keyReleased() {
  if (key == 'A' || key == 'a') {
    left = false;
  } if (key == 'D' || key == 'd') {
    right = false;
  }
  if (key == ' ') {
    if (playing ==false) {
      playing = true;
      screen = 1;
      points = 0;
      collisions = 0;
      seconds = 0;
      im = 0;
      size = 20;
      collisions = 0;
      points = 0;
      playerx = 150;
      playery = 293;
      x = 25;
      y = 25;
      px_mod = 2;
      pointx = random(15, 335);
      pointy = random(280, 293);
      wall_jump_count = 0;
      has_jumped = false;
      has_moved = false;
      slowmo = false;
      col_mods = 1;
      has_super_smashed = false;
      has_stopped_moving = false;
      smash_point_count = 0;

    } else if (playing == true) {
      playing = false;
      descx = -40;
      skillx = -80;
      screen = 0;
      points = 0;
      collisions = 0;
      col_mods = 1;
      seconds = 0;
      im = 0;
      has_super_smashed = false;
      size = 20;
      collisions = 0;
      points = 0;
      playerx = 150;
      playery = 293;
      slowmo = false;
      x = 25;
      y = 25;
      px_mod = 2;
      pointx = random(15, 335);
      pointy = random(280, 293);
      wall_jump_count = 0;
      has_jumped = false;
      has_moved = false;
      has_stopped_moving = false;
      descx = -80;
      skillx = -40;
      smash_point_count = 0;
    }

   }
}
