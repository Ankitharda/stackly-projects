package onlineExamination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class TakeExam {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter student ID: ");
        int studentId = sc.nextInt();

        System.out.print("Enter exam ID: ");
        int examId = sc.nextInt();

        String sql = "SELECT * FROM questions WHERE exam_id = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, examId);

            ResultSet rs = ps.executeQuery();

            int totalQuestions = 0;
            int score = 0;

            System.out.println();
            System.out.println("========== ONLINE EXAM ==========");

            while (rs.next()) {

                totalQuestions++;

                int questionNumber = totalQuestions;

                String question = rs.getString("question_text");
                String optionA = rs.getString("option_a");
                String optionB = rs.getString("option_b");
                String optionC = rs.getString("option_c");
                String optionD = rs.getString("option_d");
                String correctAnswer = rs.getString("correct_answer");

                System.out.println();
                System.out.println("Question " + questionNumber + ":");
                System.out.println(question);

                System.out.println("A. " + optionA);
                System.out.println("B. " + optionB);
                System.out.println("C. " + optionC);
                System.out.println("D. " + optionD);

                System.out.print("Enter your answer (A/B/C/D): ");
                String answer = sc.next();

                if (answer.equalsIgnoreCase(correctAnswer)) {
                    System.out.println("Correct!");
                    score++;
                } else {
                    System.out.println("Wrong!");
                }
            }

            if (totalQuestions == 0) {

                System.out.println("No questions found for this exam.");

            } else {

                System.out.println();
                System.out.println("========== EXAM COMPLETED ==========");
                System.out.println("Total Questions: " + totalQuestions);
                System.out.println("Correct Answers: " + score);
                System.out.println("Score: " + score + "/" + totalQuestions);

                // Store result
                String resultSql =
                        "INSERT INTO results (student_id, exam_id, score) VALUES (?, ?, ?)";

                PreparedStatement resultPs =
                        con.prepareStatement(resultSql);

                resultPs.setInt(1, studentId);
                resultPs.setInt(2, examId);
                resultPs.setInt(3, score);

                resultPs.executeUpdate();

                resultPs.close();

                System.out.println("Result saved successfully!");
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