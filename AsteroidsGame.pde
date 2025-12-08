boolean shoot = false;
Spaceship sig;
Star[]stars;
int score=0;
int health = 3;
ArrayList <asteroid> ast = new ArrayList <asteroid> ();
ArrayList <Bullet> bam = new ArrayList <Bullet> ();
public void setup() 
{
  //your code here
  background(0);
  size(800, 800);
  stars = new Star[500];
  sig= new Spaceship();
  for (int  i =0; i<stars.length; i++) {
    stars[i]= new Star();
  }
  for (int  i =0; i < 30; i++) {
    ast.add(i, new asteroid());
  }
  for (int  i =0; i < 100; i++) {
    bam.add(i, new Bullet());
  }
  keyPressed();
}
public void draw() 
{
  background(0);
  sig.show();
  sig.move();
  for (int  i =0; i<stars.length; i++) {
    stars[i].show();
  }
 for (int n = bam.size()-1; n>0; n--) {
  for (int  i = ast.size()-1; i>0; i--) {
      asteroid a = ast.get(i);
      if (dist((float)(sig.myCenterX), (float)(sig.myCenterY), (float)(a.myCenterX), (float)(a.myCenterY))<20) {
        ast.remove(i);
        health--;
      }
      if (dist((float)(bam.get(n).myCenterX), (float)(bam.get(n).myCenterY), (float)(a.myCenterX), (float)(a.myCenterY))<20) {
        a.myCenterX= (int)((Math.random()*2)*900)-50;
        a.myCenterY= (int)((Math.random()*2)*900)-50; 
        score++;
      }
    }
  }
    for (int  i = ast.size()-1; i>0; i--) {
      asteroid a = ast.get(i);
      a.show();
      a.move();
    }
  for (int i = 0; i<bam.size(); i++) {
    Bullet b = bam.get(i);
    bam.get(i).show();
    bam.get(i).move();
    if (b.getterX() >width)
    {
    } else if (b.getterX()<0)
    {     
      bam.remove(i);
    }    
    if (b.getterY() >height)
    {    
      bam.remove(i);
    } else if (b.getterY() < 0)
    {     
      bam.remove(i);
    }
  }
  if (shoot == true) {
    Bullet b = new Bullet();
    bam.add(b);
  }
  shoot = false;
   text("score ="+ score,10,10);
  text("health ="+ health,740,10);
if(score==100){
  noLoop();
  textSize(50);
  fill(0,255,0);
  text("You Win", width-500, height-500);
  }
  if(health==0){
  noLoop();
  fill(255,0,0);
  textSize(50);
  text("You Lose", width-500, height-500);
  }
}
public void keyPressed() {
  if (key=='w') {
    sig.accelerate(.4);
  }
  if (key=='a') {
    sig.myPointDirection-=10;
  }
  if (key=='s') {
    sig.accelerate(-.4);
  }
  if (key=='d') {
    sig.myPointDirection+=10;
  }
  if (key=='x') {
    sig.myXspeed =0;
    sig.myYspeed =0;
    sig.myCenterX =Math.random()*801;
    sig.myCenterY=Math.random()*801;
    sig.myPointDirection=Math.random()*360;
  }
  if (key== ' ') {
    shoot = true;
  }
}
