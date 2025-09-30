package javalab;
class callme
{
	void call(String msg)
	{
		
		System.out.print("["+msg);
		try
		{
			Thread.sleep(1000);
			
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
		System.out.print("]");
	}
}

class caller implements Runnable
{
	String msg;
	callme target;
	Thread t;
	
	public caller(String s,callme targ)
	{
		msg=s;
		target=targ;
		t=new Thread(this);
		t.start();
	}
	
	public void run()
	{
		synchronized(target) {
		target.call(msg);
	}
	}
}
public class synchmulti {
	public static void main(String [] args)
	{
		callme target=new callme();
		caller ob1=new caller("hello",target);
		caller ob2=new caller("Synchronized",target);
		caller ob3=new caller("World",target);
		
		try
		{
			ob1.t.join();
			ob2.t.join();
			ob3.t.join();
			
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
		
	}

}
