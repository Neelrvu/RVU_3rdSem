package javalab;

import java.util.Scanner;

class InvalidMarksException extends Exception
{
	public InvalidMarksException(String Message)
	{
		super(Message);
	}
}

public class CustomExceptionExample {
	public static void main(String [] args)
	{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("Enter marks 0-100 ");
		int marks=sc.nextInt();
		
		try
		{
			if(marks>100 || marks<0)
			{
				throw new InvalidMarksException("Marks should be between 0 and 100 ");
			}
			else
			{
				System.out.println("Marks Entered : "+marks);
			}
		}catch(InvalidMarksException e)
		{
			System.out.println("Error: "+e.getMessage());
		}
		
		System.out.println("Program continues...");
		sc.close();
	}

}
