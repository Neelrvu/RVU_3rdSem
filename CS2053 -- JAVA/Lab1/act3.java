import java.util.Scanner;
public class revnum
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
        System.out.println("The reversed number is "+rev);
    }
}
