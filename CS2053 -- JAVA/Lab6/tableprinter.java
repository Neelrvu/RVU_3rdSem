package javalab;

class table
{
	void printer(int num)
	{
		for(int i=1;i<=10;i++)
		{
			System.out.println(num+"x"+i+"="+(num*i));
		}
	
	}
}

class tp implements Runnable
{
	table t;
	Thread tab;
	int number;
	
	public tp(table tp1,int n)
	{
		tab=new Thread(this);
		t=tp1;
		number=n;
		
		tab.start();
	}
	
	public void run()
	{
		synchronized(t) {
		t.printer(number);
	}}
}

public class tableprinter 
{
	public static void main(String [] args)
	{
		table t1=new table();
		tp ob1=new tp(t1,5);
		tp ob2=new tp(t1,10);
		
		try
		{
			ob1.tab.join();
			ob2.tab.join();
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
	}

}
