package app;

import java.sql.*;
import java.util.Scanner;

public class Main {

    public static Connection con = null;
    public static PreparedStatement ps = null;
    public static ResultSet rs = null;

    public static void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://10.10.13.97:3306/te31414_db", "te31414", "te31414");

            if (!con.isClosed()) {
                System.out.println("Database Connection Established !!");
            }
        } catch (Exception e) {
            System.out.println("Error while Establishing DB Connection");
            e.printStackTrace();
        }
    }

    public static void disconnect() {
        try {
            if (!(rs == null) && !rs.isClosed()) {
                rs.close();
            }
            if (!(ps == null) && !ps.isClosed()) {
                ps.close();
            }
            if (!(con == null) && !con.isClosed()) {
                con.close();
            }
            System.out.println("Successfully Closed the Connection !!");
        } catch (Exception e) {
            System.out.println("Error while Closing DB Connection");
            e.printStackTrace();
        }
    }

    public static void getAllEntries() {
        try {
            ps = con.prepareStatement("select * from entries");
            rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getString(1) + " => " + rs.getString(2));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateEntry(String key, String value) {
        try {
            ps = con.prepareStatement("select * from entries where `key` = ?");
            ps.setString(1, key);
            rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("No entry with given key found !!" + "\nkey : " + key);
                return;
            }

            ps = con.prepareStatement("update entries set value = ? where `key` = ?");
            ps.setString(1, value);
            ps.setString(2, key);

            int i = ps.executeUpdate();

            if (i == 1)
                System.out.println("Record Updated Successfully");
            else
                System.out.println("Error while updating the record !!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteEntry(String key) {
        try {
            ps = con.prepareStatement("select * from entries where `key` = ?");
            ps.setString(1, key);
            rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("No entry with given key found !!" + "\nkey : " + key);
                return;
            }

            ps = con.prepareStatement("delete from entries where `key` = ?");
            ps.setString(1, key);

            int i = ps.executeUpdate();

            if (i == 1)
                System.out.println("Record Deleted Successfully");
            else
                System.out.println("Error while deleting the record !!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addEntry(String key, String value) {
        try {
            ps = con.prepareStatement("insert into entries(`key`, value) values(?, ?)");
            ps.setString(1, key);
            ps.setString(2, value);

            int i = ps.executeUpdate();

            if (i == 1)
                System.out.println("Record Inserted Successfully");
            else
                System.out.println("Error while inserting the record !!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;
        connect();

        do {
            System.out.println("\n*** MENU ***");
            System.out.println("1. Add Entry");
            System.out.println("2. Update Entry");
            System.out.println("3. Delete Entry");
            System.out.println("4. Get All Entries");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();
            sc.nextLine();  // Consume newline

            switch (choice) {
                case 1:
                    System.out.print("Enter key: ");
                    String addKey = sc.nextLine();
                    System.out.print("Enter value: ");
                    String addValue = sc.nextLine();
                    addEntry(addKey, addValue);
                    break;

                case 2:
                    System.out.print("Enter key to update: ");
                    String updateKey = sc.nextLine();
                    System.out.print("Enter new value: ");
                    String updateValue = sc.nextLine();
                    updateEntry(updateKey, updateValue);
                    break;

                case 3:
                    System.out.print("Enter key to delete: ");
                    String deleteKey = sc.nextLine();
                    deleteEntry(deleteKey);
                    break;

                case 4:
                    getAllEntries();
                    break;

                case 5:
                    disconnect();
                    System.out.println("Exiting...");
                    break;

                default:
                    System.out.println("Invalid choice! Please try again.");
                    break;
            }
        } while (choice != 5);

        sc.close();
    }
}