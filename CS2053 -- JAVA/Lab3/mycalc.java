package fjfj;

public class labcalc 
{
	void func(int a,int b)
	{
		int sum=a+b;
		int diff=a-b;
		int pro=a*b;
		int quo=a/b;
		int rem=a%b;
		System.out.println("Sum = "+sum);
		System.out.println("diff = "+diff);
		System.out.println("pro = "+pro);
		System.out.println("quo = "+quo);
		System.out.println("rem = "+rem);
	}

	public static void main(String [] args)
	{
		if(args.length < 2)
		{
			System.out.println("Enter two numbers as command line arguments : ");
			return;
		}
		labcalc mycalc=new labcalc();
		
		int a=Integer.parseInt(args[0]);
		int b=Integer.parseInt(args[1]);
		
		mycalc.func(a,b);
		
	}

}
