package onlineExamination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Question {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter exam ID: ");
        int examId = sc.nextInt();
        sc.nextLine();

        System.out.print("Enter question: ");
        String questionText = sc.nextLine();

        System.out.print("Enter option A: ");
        String optionA = sc.nextLine();

        System.out.print("Enter option B: ");
        String optionB = sc.nextLine();

        System.out.print("Enter option C: ");
        String optionC = sc.nextLine();

        System.out.print("Enter option D: ");
        String optionD = sc.nextLine();

        System.out.print("Enter correct answer (A/B/C/D): ");
        String correctAnswer = sc.nextLine();

        String sql = "INSERT INTO questions " +
                "(exam_id, question_text, option_a, option_b, option_c, option_d, correct_answer) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, examId);
            ps.setString(2, questionText);
            ps.setString(3, optionA);
            ps.setString(4, optionB);
            ps.setString(5, optionC);
            ps.setString(6, optionD);
            ps.setString(7, correctAnswer);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("Question added successfully!");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        sc.close();
    }
}