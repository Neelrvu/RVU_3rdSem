import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Scanner;

public class FindIPAddress {
	public static void main(String[] args) {
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            System.out.println("Your Computer Name: " + localHost.getHostName());
            System.out.println("Your IP Address: " + localHost.getHostAddress());
            
            Scanner input = new Scanner(System.in);
            System.out.print("\nEnter a domain name : ");
            String domain = input.nextLine();
            
            InetAddress[] addresses = InetAddress.getAllByName(domain);
            System.out.println("\nIP addresses for domain: " + domain);
            for (InetAddress addr : addresses) {
                System.out.println(addr.getHostAddress());
            }

            input.close();
        } catch (UnknownHostException e) {
            System.out.println("Could not resolve host. Please check the domain name.");
        }
    }
}
