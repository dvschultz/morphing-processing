float u,v,w = 0;
float x,y,z = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 120;
float scalar = 75;
void setup() {
  size(600,600,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
}

void draw() {
	u = 0;
	v = 0;
	uMin = 0; //try -4*PI
	vMin = 0;
	uMax = 2*PI; //try 4*PI
	vMax = PI;

	background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	rotateX(frameCount*PI/300);
	rotateY(frameCount*PI/200);
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);
	
	v = 0;
	for(u = uMin; u <= uMax; u+=((uMax-uMin)/iter))  {
	    for(v = vMin; v <= vMax; v+=((vMax-vMin)/iter)) {
	    	x = sin(v)*cos(u)*scalar;
	    	y = sin(v)*sin(2*u)*scalar;
	    	z = cos(v)*scalar;
	    	point(x,y,z);
	    }
	}
	popMatrix();
}