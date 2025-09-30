package javalab;
class bank
{
	void withdraw(int Amount,int number)
	{
		int a=1000;
		int balance=a-Amount;
		System.out.println("Account Balance : "+balance);
		
		
	}
}

class thread implements Runnable
{
	Thread b;
	bank n;
	int a;
	int num;
	
	public thread(bank n1,int a1,int num1)
	{
		n=n1;
		a=a1;
		num=num1;
		b=new Thread(this);
		b.start();
	}
	
	public void run()
	{
		synchronized(n)  
		{
			n.withdraw(a, num);
		}
	}
}

public class BankAccount {
	public static void main(String [] args)
	{
		bank yes=new bank();
		thread ob1=new thread(yes,500,1);
		thread ob2=new thread(yes,400,2);
		
		try
		{
			ob1.b.join();
			ob2.b.join();
			
		}catch(InterruptedException e)
		{
			System.out.println("Interrupted");
		}
		

	}
}
