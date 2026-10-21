
package onlineExamination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Result {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter student ID: ");
        int studentId = sc.nextInt();

        String sql =
                "SELECT s.name, e.exam_name, r.score " +
                "FROM results r " +
                "JOIN students s ON r.student_id = s.student_id " +
                "JOIN exams e ON r.exam_id = e.exam_id " +
                "WHERE r.student_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            System.out.println();
            System.out.println("========== EXAM RESULT ==========");

            boolean found = false;

            while (rs.next()) {

                found = true;

                String name = rs.getString("name");
                String examName = rs.getString("exam_name");
                int score = rs.getInt("score");

                System.out.println("Student Name : " + name);
                System.out.println("Exam Name    : " + examName);
                System.out.println("Score        : " + score);
                System.out.println("--------------------------------");
            }

            if (!found) {
                System.out.println("No result found!");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        sc.close();
    }
}

