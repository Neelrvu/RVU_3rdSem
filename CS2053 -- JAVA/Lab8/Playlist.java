package program1;

import java.util.LinkedList;
import java.util.Scanner;


public class Playlist {
	public static void main(String[] args) {
        LinkedList<String> playlist = new LinkedList<>();
        Scanner input = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n===== PLAYLIST MENU =====");
            System.out.println("1. Add a song at the beginning or end");
            System.out.println("2. Remove the first or last song");
            System.out.println("3. Replace a song at a given index");
            System.out.println("4. Display the complete playlist");
            System.out.println("0. Exit");
            System.out.print("Enter your choice: ");
            choice = input.nextInt();
            input.nextLine(); // consume newline

            switch (choice) {
                case 1:
                	System.out.println("Add song at : 1. beginning  2. End");
                    int begend = input.nextInt();
                    input.nextLine();
                    if (begend==1) {
                        System.out.print("Enter song title to add at the beginning: ");
                        String firstSong = input.nextLine();
                        playlist.addFirst(firstSong);
                        System.out.println("Song added at the beginning.");
                    }
                    
                    else if (begend==2) {
                    	System.out.print("Enter song title to add at the end: ");
                        String lastSong = input.nextLine();
                        playlist.addLast(lastSong);
                        System.out.println("Song added at the end.");

                    }
                    
                    else {
                    	System.out.println("Invalid option!");

                    }
                    displayPlaylist(playlist);
                    break;
                
                case 2:
                	System.out.println("Remove : 1. first song  2. Last song");
                    int firstlast = input.nextInt();
                    input.nextLine();
                    if (firstlast==1) {
                    	if (!playlist.isEmpty()) {
                            playlist.removeFirst();
                            System.out.println("First song removed.");
                        } 
                    	else {
                            System.out.println("Playlist is empty. Nothing to remove.");
                        }
                    }
                    else if (firstlast==2) {
                    	if (!playlist.isEmpty()) {
                            playlist.removeLast();
                            System.out.println("Last song removed.");
                        } 
                    	else {
                            System.out.println("Playlist is empty. Nothing to remove.");
                        }

                    }
                    
                    else {
                    	System.out.println("Invalid option!");

                    }

                
                displayPlaylist(playlist);
                break;

                    
                case 3:
                    if (playlist.isEmpty()) {
                        System.out.println("Playlist is empty. Nothing to replace.");
                        break;
                    }
                    System.out.print("Enter index to replace (0 to " + (playlist.size() - 1) + "): ");
                    int index = input.nextInt();
                    input.nextLine(); // consume newline
                    if (index >= 0 && index < playlist.size()) {
                        System.out.print("Enter new song title: ");
                        String newSong = input.nextLine();
                        playlist.set(index, newSong);
                        System.out.println("Song replaced at index " + index + ".");
                    } else {
                        System.out.println("Invalid index.");
                    }
                    displayPlaylist(playlist);
                    break;

                case 4:
                    displayPlaylist(playlist);
                    break;

                case 0:
                    System.out.println("Exiting program. Goodbye!");
                    break;

                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 0);

        input.close();
    }

    public static void displayPlaylist(LinkedList<String> playlist) {
        System.out.println("\nCurrent Playlist:");
        if (playlist.isEmpty()) {
            System.out.println("No songs in the playlist.");
        } else {
            for (int i = 0; i < playlist.size(); i++) {
                System.out.println(i + ": " + playlist.get(i));
            }
        }
    }
}

