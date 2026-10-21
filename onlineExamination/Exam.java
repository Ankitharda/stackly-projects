package onlineExamination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Exam {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter exam name: ");
        String examName = sc.nextLine();

        System.out.print("Enter exam duration in minutes: ");
        int duration = sc.nextInt();

        String sql = "INSERT INTO exams (exam_name, duration) VALUES (?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, examName);
            ps.setInt(2, duration);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("Exam created successfully!");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        sc.close();
    }
}