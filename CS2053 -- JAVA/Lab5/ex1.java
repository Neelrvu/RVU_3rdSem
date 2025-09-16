package javalab;

import java.util.Scanner;

class UnderAgeException extends Exception
{
	public UnderAgeException(String message)
	{
		super(message);
	}
}

public class ex1 
{
	public static void main(String [] args)
	{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("Enter Age");
		int age=sc.nextInt();
		
		try
		{
			if(age<18)
			{
				throw new UnderAgeException("You must be at least 18 years old!");
			}
			else
			{
				System.out.println("Valid Age : "+age);
			}
		}catch(UnderAgeException e)
		{
			System.out.println("Error: "+e.getMessage());
		}
		
		
		sc.close();
	}
	

}
