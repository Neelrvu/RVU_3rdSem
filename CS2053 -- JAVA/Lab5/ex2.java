package javalab;

import java.util.Scanner;
class WeakPasswordException extends Exception
{
	public WeakPasswordException(String message)
	{
		super(message);
	}
}

public class ex2 
{
	public static void main(String [] args)
	{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("Enter Password : ");
		String pass=sc.next();
		
		int len=pass.length();
		
		try
		{
			if(len<6)
			{
				throw new WeakPasswordException("Password too short! Must be at least 6 characters.");
			}
			else
			{
				System.out.println("Password Accepted");
			}
		}catch(WeakPasswordException e)
		{
			System.out.println("Error: "+e.getMessage());
		}
		
		sc.close();

	}
}
