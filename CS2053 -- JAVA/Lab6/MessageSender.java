package javalab;
class message
{
	void sendMessage(String msg)
	{
		for(int i=0;i<(msg.length());i++)
		{
			System.out.print(msg.charAt(i));
			try
			{
				Thread.sleep(1000);
			}catch(InterruptedException e)
			{
				System.out.println("Interrupted");
			}
		}
	}
}

class send implements Runnable
{
	message msg;
	String m;
	Thread sm;
	
	public send(message msg1,String m1)
	{
		msg=msg1;
		m=m1;
		sm=new Thread(this);
		sm.start();
	}
	
	public void run()
	{
		synchronized(msg) {
		msg.sendMessage(m);
	}
	}
}
public class MessageSender 
{
	public static void main(String [] args)
	{
		message msg=new message();
		send t1=new send(msg,"happy");
		send t2=new send(msg,"birthday");
		
		try
		{
			t1.sm.join();
			t2.sm.join();
			
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
	}
}

