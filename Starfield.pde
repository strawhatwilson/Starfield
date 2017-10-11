Particle[] star;
void setup()
{
	size(700,700);
	star = new Particle[400];
	for (int i =0; i < star.length; i++)
		star [i] = new NormalParticle();
	star [50] = new OddballParticle(300,300);
	star[1] = new JumboParticle();
}
void draw()
{	
	background(0);
	for (int i = 0; i < star.length; i++)
	{
		star[i].move();
		star[i].show();
	}
}
class NormalParticle implements Particle
{
	int nColor;
	double nX,nY,dTheta,dSpeed;
	NormalParticle()
	{
		nX = 350;
		nY = 350;
		nColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		dTheta = (Math.random()*2*Math.PI);
		dSpeed = Math.random() * 10;
	}
	void move()
	{
		nX = nX + (dSpeed * Math.cos(dTheta));
		nY = nY + (dSpeed * Math.sin(dTheta));
		if ((nX < 0 || nX > 700) || (nY < 0 || nY > 700))
		{
			nX=350;
			nY=350;
			dSpeed = Math.random() * 10;
		}
		if (mousePressed)
		{
			dSpeed = ((Math.random()*7)+15);
		}
		else
		{
			dSpeed = Math.random() * 10;
		}
	}
	void show()
	{
		fill(nColor);
		strokeWeight(1);
		ellipse((float)nX,(float)nY,5,5);
	}
}
 interface Particle
 {
  	public void move();
	public void show();
 } 
 class OddballParticle implements Particle
 {
 	int oddColor;
 	double oddX,oddY,oddTheta,oddSpeed;
 	OddballParticle(double x,double y)
 	{
 		oddX = x;
 		oddY = y;
 		oddColor =color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		oddTheta= (Math.random()*2*Math.PI);
 		oddSpeed= Math.random() * 8;
 	}
	public void move()
	{
		oddX = oddX + (oddSpeed * Math.cos(oddTheta));
		oddY = oddY + (oddSpeed * Math.sin(oddTheta));
		if ((oddX < 0 || oddX > 700) || (oddY < 0 || oddY > 700))
		{
			oddX=350;
			oddY=350;
			oddSpeed = ((Math.random() * 7)+3); 
			oddTheta= (Math.random()*2*Math.PI);
			oddSpeed= Math.random() * 8;
		}
		if (mousePressed)
		{
			oddSpeed = ((Math.random()*7)+18);
		}
		else
		{
			oddSpeed= Math.random() * 8;	
		}
	}
	public void show()
	{
		fill(oddColor);
		ellipse((float)oddX,(float)oddY,25,25);
	}
 }
 class JumboParticle extends NormalParticle
 {
 	void show()
 	{
 		fill(255);
 		ellipse((float)nX,(float)nY,5,5);
 	}
 }