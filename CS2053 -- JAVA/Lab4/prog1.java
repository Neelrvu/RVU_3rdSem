package javalab;
class A
{
	A()
	{
		System.out.println("Hello I am class A");
	}
	
}
class B extends A
{
	B()
	{
		System.out.println("Hello I am class B");
	}
}
class C extends B
{
	C()
	{
		System.out.println("Hello I am class C");
	}
}
public class test1 {
      public static void main(String [] args)
      {
    	  C ob=new C();

      }
}
