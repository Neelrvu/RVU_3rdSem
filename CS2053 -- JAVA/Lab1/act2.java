import java.util.Scanner;
public class sumdig
{
    public static void main(String [] args)
    {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter a number : ");
        int num=sc.nextInt();
        System.out.println();
        int sum=0,temp=num;
        while(temp!=0)
        {
            sum=sum+(temp%10);
            temp=temp/10;
        }
        System.out.println("The sum of digits in "+num+" is "+sum);
    }
}
