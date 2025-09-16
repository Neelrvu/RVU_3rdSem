public class labact 
	{
		public static void main(String [] args)
		
		{
			if(args.length < 2)
			{
				System.out.println("Enter two numbers as command line arguments");
				return;
				
			}
			int a=Integer.parseInt(args[0]);
			int b=Integer.parseInt(args[1]);
			System.out.println("Sum of "+a+" and "+b+" is "+(a+b));
		    
	}
	
}
