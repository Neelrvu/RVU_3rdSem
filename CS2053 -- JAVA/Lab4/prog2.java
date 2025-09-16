package javalab;
class A1
{
	void add(int a,int b)
	{
		System.out.println("a + b : "+(a+b));
	}
    void add(double a,double b)
    {
    	System.out.println("a + b : "+(a+b));
    }
}
class B1 extends A1
{
	void add(String a,String b)
	{
		System.out.println("a + b : "+(a+b));
	}
}
public class prog2 {
      public static void main(String [] args)
      {
    	  B1 obj=new B1();
    	  obj.add(1,2);// integer
    	  obj.add(12.5, 51.2);// double
    	  obj.add("happy","day");// string
      }
}
