import java.util.Scanner;
public class pali
{
    public static void main(String [] args)
    {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter a number : ");
        int num=sc.nextInt();
        System.out.println();
        int rev=0,temp=num;
        while(temp!=0)
        {
            rev=rev*10+(temp%10);
            temp=temp/10;
        }
        if(rev==num)
        {
            System.out.println("The number "+num+" is a palindrome");
        }
        else
        {
            System.out.println("The number "+num+" is not a palindrome");
        }
        
    }
}
