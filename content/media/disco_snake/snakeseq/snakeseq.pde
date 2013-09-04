/* @pjs preload="discosnakelogo.gif"; */
// Stubs for running inside processing IDE.
/*
void playSample(String sample, int volume)
{
}

void setSequence(String seq)
{
  println(seq);
}

String sequence = "011223344";
*/

int pixelWidth = 320;
int pixelHeight = 320;
int gridWidth = 16;
int gridHeight = 16;
int squareWidth = 20;
int squareHeight = 20;

Food food = null;
Sequence seq = null;
Snake snake = null;

void setup()
{
  size(pixelWidth, pixelHeight);
  background(0);
  frameRate(2);
  strokeWeight(2);
  String[] layers = split(sequence, '-');
  seq = new Sequence(layers, layers.length - 1);
}

void mousePressed()
{
  if(snake == null)
  {
    food = new Food();
    snake = new Snake();
	loop();
  }  
  if(mouseY > mouseX) 
		{
	if(mouseY > (pixelHeight - mouseX)) {
      snake.down();
    }
    else {
        snake.left();
      }
    }
    else {
      if(mouseY > (pixelHeight - mouseX)) {
        snake.right();
      }
      else {
        snake.up();
      }
    }
  }

void draw() 
{
  if(snake == null)
  {
    if(sequence.length() == 0)
    {
      PImage b;
      b = loadImage("discosnakelogo.gif");
      image(b, 0, 0);
      noLoop();
      return;
    }
  }
  else
  {
    snake.update();
  }
  
  seq.update();
  background(0);
  seq.draw();
  
  if(snake != null)
  {
    food.draw();
    snake.draw();
  }
}

void keyPressed() 
{
  if(snake == null)
  {
    food = new Food();
    snake = new Snake();
	loop();
  }
  if(key == CODED)
  {
    switch(keyCode)
    {
      case 38:
        snake.up();
        break;
      case 39:
        snake.right();
        break;
      case 40:
        snake.down();
        break;
      case 37:
        snake.left();
        break;
    }
  }
}

class GridLocation
{
  int x, y;

  GridLocation(int xin, int yin)
  {
    x = xin;
    y = yin;
  }
  
  boolean equals(GridLocation rhs)
  {
    return (x == rhs.x) && (y == rhs.y);
  }
  
  void square()
  {
    rect(x * squareWidth, y * squareHeight, squareWidth, squareHeight);
  }
}

class Food
{
  int food_count = 8;
  GridLocation[] positions = new GridLocation[food_count];
  
  Food()
  {
    // Randomly sprinkle some food around.
    for(int i = 0; i < food_count; ++i)
    {
      positions[i] = new GridLocation(round(random(gridWidth)), round(random(gridHeight)));
    }
  }
  
  boolean isFood(GridLocation loc)
  {
    for(int i = 0; i < food_count; ++i)
    {
      if(positions[i].equals(loc))
      {
        return true;
      }
    }
    return false;
  }
  
  void draw()
  {
    int green = 255;
    for(int i = 0; i < food_count; ++i)
    {
      fill(0, green, 0);
      positions[i].square();
      green -= 20;
    }
  }
}

class Sequence
{
  int layer = 0;
  int step = 0;
  int length = 0;
  int bar_length = 8;
  int max_length = 8;
  int blue = 80;
  GridLocation[] sequence = new GridLocation[max_length];
  Sequence lastSeq = null;
    
  Sequence(String[] data, int index)
  {
    lastSeq = null;
    if(index != 0)
    {
      lastSeq = new Sequence(data, index - 1);
      layer = lastSeq.layer + 1;
      blue = lastSeq.blue * 2;
    }
    fromString(data[index]);
  }
  
  Sequence(Sequence last)
  {
    lastSeq = last;
    if(null != lastSeq)
    {
      layer = lastSeq.layer + 1;
      blue = lastSeq.blue * 2;
    }
    
  }
  
  void update()
  {
    ++step;
    step %= max_length;
    if(null != lastSeq)
    {
      lastSeq.update();
    }
  }
  
  void draw()
  {
    for(int i = 0; i < length; ++i)
    {
      if(i == step)
      {
         fill(0,0,255);
         switch(layer % 2)
         {
           case 0:
             playSample("bass" + (15 - sequence[i].y), sequence[i].x * 5);
             break;
           case 1:
             playSample("bell" + (15 - sequence[i].y), sequence[i].x * 5);
             break;
         }
      }
      else
      {
         fill(0,0,blue);
      }
      sequence[i].square();
    }
    if(null != lastSeq)
    {
      lastSeq.draw();
    }
  }
  
  void add(GridLocation loc)
  {
    if(length < max_length)
    {
      sequence[length++] = loc;
    }
    setSequence(toString());
  }
  
  String toString()
  {
    String result = "";
    if(null != lastSeq)
    {  
      result += lastSeq.toString();
      result += "-";
    
      int offset = step - lastSeq.step;
      if(offset < 0)
      {
        offset += max_length;
      }
      result += hex(offset, 1);
    }
    else
    {
      result += hex(0, 1);
    }
    
    for(int i = 0; i < length; ++i)
    {
      result += hex(sequence[i].x, 1);
      result += hex(sequence[i].y, 1);
    }
    return result;
  }
  
  void fromString(String s)
  {
    if(s.length() == 0)
    {
      return;
    }
    
    step = unhex(s.substring(0, 1));
    for(int i = 1; i < s.length(); i += 2)
    {
      int x = unhex(s.substring(i, i + 1));
      int y = unhex(s.substring(i + 1, i + 2));
      sequence[length++] = new GridLocation(x, y);
    }
  }
}

class Snake
{
  int direction = 1;
  int head_index = 0;
  int tail_index = 0;
  int max_length = 255;
  GridLocation[] segments = new GridLocation[max_length];
  
  Snake()
  {
    segments[head_index] = new GridLocation(3,5);
    update();
    update();
    tail_index = 0;
  }
  
  void up()
  {
    direction = 0;
  }
  
  void right()
  {
    direction = 1;
  }
  
  void down()
  {
    direction = 2;
  }
  
  void left()
  {
    direction = 3;
  }
  
  boolean isSnake(GridLocation loc)
  {
    for(int i = head_index; i != tail_index; i = dec(i, max_length))
    {
      if(segments[i].equals(loc))
      {
        return true;
      }   
    }
    return false;
  }
  
  void update()
  {
    GridLocation head = segments[head_index];
    GridLocation new_head = new GridLocation(head.x, head.y);
    switch(direction)
    {
      case 0: // up
        new_head.y = dec(new_head.y, gridHeight);
        break;
      case 1: // right
        new_head.x = inc(new_head.x, gridWidth);
        break;
      case 2: // down
        new_head.y = inc(new_head.y, gridHeight);
        break;
      case 3: // left
        new_head.x = dec(new_head.x, gridWidth);
        break;
    }
    if(isSnake(new_head))
    {
      tail_index = dec(dec(head_index, max_length), max_length);
      seq = new Sequence(seq);
    } 
    head_index = inc(head_index, max_length);
    segments[head_index] = new_head;
    if(food.isFood(new_head))
    {
      seq.add(new_head);
      food = new Food(); 
    }
    else
    {
      tail_index = inc(tail_index, max_length);
    }
  }
  
  int inc(int i, int mod)
  {
    return (i + 1) % mod;
  }

  int dec(int i, int mod)
  {
    i = i - 1;
    if(i < 0)
    {
      i = (mod - 1);
    }
    return i;
  }
  
  void draw()
  {
     int colour = 255;
     for(int i = head_index; i != tail_index; i = dec(i, max_length))
     {
       switch(seq.layer % 2)
       {
         case 0:
		   fill(colour + 100, 0, 0);
		   break;
		 case 1:
           fill(colour + 100, colour + 100, colour + 100);
		   break;
	   }
       segments[i].square();
       colour /= 2;
     } 
  }
}
