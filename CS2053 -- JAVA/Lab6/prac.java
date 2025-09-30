package javalab;
class nums
{
	void printnums()
	{
		for(int i=1;i<=5;i++)
		{
			System.out.println(i);
		}
		try
		{
			Thread.sleep(1000);
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
	}
}

class tt implements Runnable
{
	Thread t;
	nums data;
	
	
	public tt(nums d)
	{
		data=d;
		t=new Thread(this);
		t.start();
		
	}
	
	public void run()
	{
		synchronized(data) {
		data.printnums();
		}
	}
}
public class prac {
	public static void main(String [] args)
	{
		
	nums pp=new nums();
	tt ob1=new tt(pp);
	tt ob2=new tt(pp);
	try
	{
		ob1.t.join();
		ob2.t.join();
		
	}catch(InterruptedException e)
	{
		System.out.println("Interrupted");
	}
	}
}
