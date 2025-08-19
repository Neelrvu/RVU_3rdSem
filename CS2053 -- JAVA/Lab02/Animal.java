public class Animal {
	void sound() {
		System.out.println("Animal makes a sound");
		
	}
}

class dog extends Animal
{
	void sound()
	{
		System.out.println("Dog barks");
	}
	
	public static void main(String [] args)
	{
		dog d=new dog();
		d.sound();
	}
}
