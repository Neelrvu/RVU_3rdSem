import java.util.ArrayList;
import java.util.Scanner;

public class StudentList {
    public static void main(String[] args) {
        ArrayList<String> students = new ArrayList<>();
        Scanner input = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n===== STUDENT LIST MENU =====");
            System.out.println("1. Add a student");
            System.out.println("2. Insert a student at specific index");
            System.out.println("3. Update a student's name");
            System.out.println("4. Remove a student");
            System.out.println("5. Display all students");
            System.out.println("0. Exit");
            System.out.print("Enter your choice: ");
            choice = input.nextInt();
            input.nextLine();
            
            switch (choice) {
                case 1:
                    System.out.print("Enter student name to add: ");
                    String name = input.nextLine();
                    
                    students.add(name);
                    System.out.println("Student added!");
                    displayList(students);
                    break;

                case 2:
                    System.out.print("Enter index to insert at: ");
                    int index = input.nextInt();
                    input.nextLine();
                    if (index >= 0 && index <= students.size()) {
                        System.out.print("Enter student name to insert: ");
                        String newName = input.nextLine();
                        students.add(index, newName);
                        System.out.println("Student inserted!");
                    } else {
                        System.out.println("Invalid index!");
                    }
                    displayList(students);
                    break;

                case 3:
                    System.out.print("Enter index to update: ");
                    int updateIndex = input.nextInt();
                    input.nextLine();
                    if (updateIndex >= 0 && updateIndex < students.size()) {
                        System.out.print("Enter new student name: ");
                        String updatedName = input.nextLine();
                        students.set(updateIndex, updatedName);
                        System.out.println("Student updated!");
                    } else {
                        System.out.println("Invalid index!");
                    }
                    displayList(students);
                    break;

                case 4:
                    System.out.println("Remove by: 1. Name  2. Index");
                    int removeChoice = input.nextInt();
                    input.nextLine();
                    if (removeChoice == 1) {
                        System.out.print("Enter name to remove: ");
                        String removeName = input.nextLine();
                        if (students.remove(removeName)) {
                            System.out.println("Student removed!");
                        } else {
                            System.out.println("Student not found!");
                        }
                    } else if (removeChoice == 2) {
                        System.out.print("Enter index to remove: ");
                        int removeIndex = input.nextInt();
                        if (removeIndex >= 0 && removeIndex < students.size()) {
                            students.remove(removeIndex);
                            System.out.println("Student removed!");
                        } else {
                            System.out.println("Invalid index!");
                        }
                    } else {
                        System.out.println("Invalid option!");
                    }
                    displayList(students);
                    break;

                case 5:
                    displayList(students);
                    break;

                case 0:
                    System.out.println("Exiting program. Goodbye!");
                    break;

                default:
                    System.out.println("Invalid choice!");
            }

        } while (choice != 0);

        input.close();
    }

    public static void displayList(ArrayList<String> list) {
        System.out.println("\nCurrent Student List:");
        if (list.isEmpty()) {
            System.out.println("No students in the list.");
        } else {
            for (int i = 0; i < list.size(); i++) {
                System.out.println(i + ": " + list.get(i));
            }
        }
    }
}
