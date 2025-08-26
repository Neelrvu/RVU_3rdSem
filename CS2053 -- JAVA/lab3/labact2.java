package fjfj;

class shape
{
	double length;
	double breadth;
	
	shape(double l,double b)
	{
		length=l;
		breadth=b;
	}
	shape()
	{
		length=0;
		breadth=0;
	}
	shape(double l)
	{
		length=breadth=l;
	}
	double area()
	{
		return length*breadth;
	}
	
}
public class labact2
{
	public static void main(String [] args)
	{
		shape mys1=new shape();
		shape mys2=new shape(15,17);
		shape mys3=new shape(30);
		double area;
		area=mys1.area();
        System.out.println("The area of first shape is "+area);
        area=mys2.area();
        System.out.println("The area of second shape is "+area);
        area=mys3.area();
        System.out.println("The area of third shape is "+area);
	}
}
