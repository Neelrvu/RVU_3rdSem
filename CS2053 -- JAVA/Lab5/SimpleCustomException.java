package javalab;

import java.util.Scanner;

class InvalidAgeException extends Exception
{
	public InvalidAgeException(String Message)
	{
		super(Message);
	}
}
public class SimpleCustomException 
{
	public static void main(String [] args)
	{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("Enter Student Age : ");
		int age=sc.nextInt();
		
		try
		{
			if(age>18 || age<5)
			{
				throw new InvalidAgeException("Age must be between 5 and 18 ");
			}
			else
			{
				System.out.println("Valid Age : "+age);
			}
		}catch(InvalidAgeException e)
		{
			System.out.println("Error: "+e.getMessage());
		}
		
		System.out.println("Program Continues...");
		sc.close();
	}

}
