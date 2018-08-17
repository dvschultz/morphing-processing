float u,v,w = 0;
float x,y,z,s = 0;
float uMin,uMax,vMin,vMax,wMin,wMax,uStart,vStart;
float iter = 175;
float scalar = 90;
int dotSize = 1;

String data = "../../data/";
String img = "res_F2143D6A_chem.png";
PImage colorFile;
Wave wave;

void setup() {
  size(1440,800,P3D);
  background(0);
  strokeWeight(dotSize);
  stroke(255);
  uMin = 0; //try -4*PI
	vMin = 0;
	uMax = PI; //try 4*PI
	vMax = 2*PI;
  uStart = uMin;
  vStart = vMin;

  colorFile = loadImage(data+img);
  wave = new Wave();
  createPts();
}

void draw() {
	u = 0;
	v = 0;
	s = (frameCount/1000.0) + 1;
	background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	rotateX(frameCount*PI/300);
	//rotateX(PI/2);
	rotateY(PI/2);
	//rotateY(frameCount*PI/200);
	//scale( s );
	// rotateZ(frameCount*PI/100);

	//strokeWeight(dotSize/s);
	//try rotateX(PI/2);
	wave.display();
	popMatrix();
	surfaceItems();
	// vStart+=(PI/250);
	// uStart+=(PI/250);
	// if (vStart >= vMax || vStart <= vMin) {
	// 	vStart = 0;
	// }
	// if (uStart >= uMax || uStart <= uMin) {
	// 	uStart = 0;
	// }
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}

void createPts() {
	for(u = uStart; u <= uMin+uMax; u+=((uMax-uMin)/iter))  {
	//for(u = uMin; u <= uMin+uMax; u+=((uMax-uMin)/iter))  {
	    //for(v = vMin; v <= vMin+vMax; v+=((vMax-vMin)/iter)) {
	    for(v = vStart; v <= vMin+vMax; v+=((vMax-vMin)/iter)) {
	    	x = atan( u * sin(v) * cos(4*u) ) * scalar;
	    	y = ( u * sin(v) * atan(4*u) ) * scalar;
	    	//y = sin(sin( u * atan(v) * atan(4*u) )) * scalar;
	    	// x =  ( u * sin(v) * cos(4*u) ) * scalar;
	    	// y =  ( u * sin(v) * sin(4*u) ) * scalar;
	    	//z =  u * cos(u+v) * scalar;
	    	// z =  u * cos(u) * scalar;
	    	z =  v * cos(u) * scalar;
	    	//z = u* cos(v)*scalar;
	    	wave.pts.add( new ColorPt(x,y,z, colorFile.get( (int) random(colorFile.width), (int) random(colorFile.height) )) );
	    }
	}
}

public class Wave {

	ArrayList<ColorPt> pts = new ArrayList<ColorPt>();

	public Wave () {
		
	}

	void display() {
		for(ColorPt p : pts) {
			//stroke(p.c);
			point(p.pt.x,p.pt.y,p.pt.z);
		}
	}

}

class ColorPt {
	color c;
	PVector pt;

	ColorPt(float x, float y, float z, color _c) {
		pt = new PVector(x,y,z);
		c = _c;
	}
}