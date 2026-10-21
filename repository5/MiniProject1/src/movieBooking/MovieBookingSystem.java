package movieBooking;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Scanner;

public class MovieBookingSystem {

    static Scanner sc = new Scanner(System.in);

    /*
     * 4D ARRAY
     *
     * [3][4][5][5]
     *
     * 3 = Movies
     * 4 = Timings
     * 5 = Rows
     * 5 = Seats
     */
    static boolean[][][][] seats = new boolean[3][4][5][5];

    // File to store bookings
    static File bookingFile = new File("movie_bookings.txt");

    // Movies
    static String[] movieNames = {
            "Avengers",
            "Pushpa 2",
            "Kalki 2898 AD"
    };

    // Ratings
    static double[] movieRatings = {
            4.5,
            4.3,
            4.6
    };

    // Timings
    static String[] timings = {
            "10:00 AM",
            "1:30 PM",
            "5:00 PM",
            "8:30 PM"
    };

    // Prices
    static double lowerBalconyPrice = 200;
    static double upperBalconyPrice = 300;

    // Selected movie
    static int selectedMovie = -1;

    // Selected timing
    static int selectedTiming = -1;


    // ==================================================
    // MAIN
    // ==================================================

    public static void main(String[] args) {

        loadBookings();

        while (true) {

            System.out.println("\n==========================================");
            System.out.println("        MOVIE TICKET BOOKING SYSTEM");
            System.out.println("==========================================");

            if (selectedMovie == -1) {

                System.out.println("Movie  : Not Selected");

            } else {

                System.out.println(
                        "Movie  : "
                        + movieNames[selectedMovie]);

                System.out.println(
                        "Rating : "
                        + movieRatings[selectedMovie]
                        + "/5");
            }

            if (selectedTiming == -1) {

                System.out.println(
                        "Timing : Not Selected");

            } else {

                System.out.println(
                        "Timing : "
                        + timings[selectedTiming]);
            }

            System.out.println("\n1. Choose Movie");
            System.out.println("2. Choose Timing");
            System.out.println("3. Show Seats");
            System.out.println("4. Book Ticket");
            System.out.println("5. Cancel Ticket");
            System.out.println("6. View Ticket Prices");
            System.out.println("7. Exit");

            System.out.print("\nEnter your choice: ");

            int choice = sc.nextInt();

            switch (choice) {

                case 1:
                    chooseMovie();
                    break;

                case 2:
                    chooseTiming();
                    break;

                case 3:
                    showSelectedSeats();
                    break;

                case 4:
                    bookTicket();
                    break;

                case 5:
                    cancelTicket();
                    break;

                case 6:
                    showPrices();
                    break;

                case 7:

                    System.out.println(
                            "\nThank you for using "
                            + "Movie Ticket Booking System!");

                    return;

                default:

                    System.out.println(
                            "\nInvalid choice!");
            }
        }
    }


    // ==================================================
    // OPTION 1 - CHOOSE MOVIE
    // ==================================================

    static void chooseMovie() {

        System.out.println(
                "\n------------- CHOOSE MOVIE -------------");

        for (int i = 0; i < movieNames.length; i++) {

            System.out.println(
                    (i + 1)
                    + ". "
                    + movieNames[i]
                    + " - Rating: "
                    + movieRatings[i]
                    + "/5");
        }

        System.out.print(
                "\nSelect movie (1-3): ");

        int choice = sc.nextInt();

        if (choice < 1 || choice > 3) {

            System.out.println(
                    "Invalid movie selection!");

            return;
        }

        selectedMovie = choice - 1;

        // Reset timing when movie changes
        selectedTiming = -1;

        System.out.println(
                "\nMovie selected successfully!");

        System.out.println(
                "Movie  : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Rating : "
                + movieRatings[selectedMovie]
                + "/5");
    }


    // ==================================================
    // OPTION 2 - CHOOSE TIMING
    // ==================================================

    static void chooseTiming() {

        if (selectedMovie == -1) {

            System.out.println(
                    "\nPlease choose a movie first!");

            return;
        }

        System.out.println(
                "\n==========================================");

        System.out.println(
                "Movie  : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Rating : "
                + movieRatings[selectedMovie]
                + "/5");

        System.out.println(
                "==========================================");


        System.out.println(
                "\n------------- MOVIE TIMINGS -------------");

        for (int i = 0; i < timings.length; i++) {

            System.out.println(
                    (i + 1)
                    + ". "
                    + timings[i]);
        }

        System.out.print(
                "\nSelect timing (1-4): ");

        int choice = sc.nextInt();

        if (choice < 1 || choice > 4) {

            System.out.println(
                    "Invalid timing!");

            return;
        }

        selectedTiming = choice - 1;

        System.out.println(
                "\nTiming selected successfully!");

        System.out.println(
                "Selected Timing : "
                + timings[selectedTiming]);
    }

 
    // ==================================================
    // OPTION 3 - SHOW SEATS
    // ==================================================

    static void showSelectedSeats() {

        if (!checkMovieAndTiming()) {
            return;
        }

        System.out.println(
                "\n==========================================");

        System.out.println(
                "Movie  : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Rating : "
                + movieRatings[selectedMovie]
                + "/5");

        System.out.println(
                "Timing : "
                + timings[selectedTiming]);

        System.out.println(
                "==========================================");

        showSeats(
                selectedMovie,
                selectedTiming);
    }


    // ==================================================
    // SHOW SEATS
    // ==================================================

    static void showSeats(
            int movieIndex,
            int timingIndex) {

        System.out.println(
                "\n------------- SEAT STATUS -------------");

        System.out.println("A = Available");
        System.out.println("B = Booked");

        System.out.println(
                "\n          1   2   3   4   5");

        for (int row = 0; row < 5; row++) {

            System.out.print(
                    "Row "
                    + (row + 1)
                    + "   ");

            for (int seat = 0; seat < 5; seat++) {

                if (seats[movieIndex]
                        [timingIndex]
                        [row]
                        [seat]) {

                    System.out.print("[B] ");

                } else {

                    System.out.print("[A] ");
                }
            }

            System.out.println();
        }

        System.out.println(
                "\nRows 1-3 : Lower Balcony -Rs.200");

        System.out.println(
                "Rows 4-5 : Upper Balcony -Rs.300");
    }


    // ==================================================
    // OPTION 4 - BOOK TICKET
    // ==================================================

    static void bookTicket() {

        if (!checkMovieAndTiming()) {
            return;
        }

        System.out.println(
                "\n==========================================");

        System.out.println(
                "              BOOK TICKET");

        System.out.println(
                "==========================================");

        System.out.println(
                "Movie  : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Rating : "
                + movieRatings[selectedMovie]
                + "/5");

        System.out.println(
                "Timing : "
                + timings[selectedTiming]);

        /*
         * IMPORTANT:
         *
         * We DO NOT display timings here.
         *
         * Timing was already selected
         * using Option 2.
         */

        // Show seats directly
        showSeats(
                selectedMovie,
                selectedTiming);


        // ------------------------------------------
        // SELECT ROW
        // ------------------------------------------

        System.out.print(
                "\nEnter row number (1-5): ");

        int row = sc.nextInt();


        // ------------------------------------------
        // SELECT SEAT
        // ------------------------------------------

        System.out.print(
                "Enter seat number (1-5): ");

        int seat = sc.nextInt();


        // ------------------------------------------
        // VALIDATE
        // ------------------------------------------

        if (row < 1 || row > 5
                || seat < 1 || seat > 5) {

            System.out.println(
                    "Invalid row or seat number!");

            return;
        }


        // ------------------------------------------
        // CHECK BOOKED
        // ------------------------------------------

        if (seats[selectedMovie]
                [selectedTiming]
                [row - 1]
                [seat - 1]) {

            System.out.println(
                    "\nThis seat is already booked!");

            return;
        }


        // ------------------------------------------
        // CALCULATE PRICE
        // ------------------------------------------

        double price;

        if (row <= 3) {

            System.out.println(
                    "\nSelected Balcony: Lower Balcony");

            price = lowerBalconyPrice;

        } else {

            System.out.println(
                    "\nSelected Balcony: Upper Balcony");

            price = upperBalconyPrice;
        }


        // ------------------------------------------
        // WEEKEND CHARGE
        // ------------------------------------------

        if (isWeekend()) {

            System.out.println(
                    "Weekend extra charge: ₹50");

            price = price + 50;
        }


        // ------------------------------------------
        // COUPON
        // ------------------------------------------

        System.out.print(
                "\nDo you have a discount coupon? (yes/no): ");

        String answer = sc.next();

        if (answer.equalsIgnoreCase("yes")) {

            System.out.print(
                    "Enter coupon code: ");

            String coupon = sc.next();

            if (coupon.equalsIgnoreCase("MOVIE20")) {

                double discount =
                        price * 20 / 100;

                price = price - discount;

                System.out.println(
                        "Coupon applied successfully!");

                System.out.println(
                        "Discount: 20%");

            } else {

                System.out.println(
                        "Invalid coupon!");

                System.out.println(
                        "No discount applied.");
            }
        }


        // ------------------------------------------
        // BOOK SEAT
        // ------------------------------------------

        seats[selectedMovie]
                [selectedTiming]
                [row - 1]
                [seat - 1] = true;

        saveBookings();


        // ------------------------------------------
        // DISPLAY TICKET
        // ------------------------------------------

        System.out.println(
                "\n==========================================");

        System.out.println(
                "       TICKET BOOKED SUCCESSFULLY");

        System.out.println(
                "==========================================");

        System.out.println(
                "Movie   : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Rating  : "
                + movieRatings[selectedMovie]
                + "/5");

        System.out.println(
                "Timing  : "
                + timings[selectedTiming]);

        System.out.println(
                "Row     : "
                + row);

        System.out.println(
                "Seat    : "
                + seat);

        if (row <= 3) {

            System.out.println(
                    "Balcony : Lower Balcony");

        } else {

            System.out.println(
                    "Balcony : Upper Balcony");
        }

        System.out.println(
                "Price   : ₹"
                + price);

        System.out.println(
                "==========================================");
    }


    // ==================================================
    // OPTION 5 - CANCEL TICKET
    // ==================================================

    static void cancelTicket() {

        if (!checkMovieAndTiming()) {
            return;
        }

        System.out.println(
                "\n==========================================");

        System.out.println(
                "             CANCEL TICKET");

        System.out.println(
                "==========================================");

        System.out.println(
                "Movie  : "
                + movieNames[selectedMovie]);

        System.out.println(
                "Timing : "
                + timings[selectedTiming]);


        // Show seats directly
        showSeats(
                selectedMovie,
                selectedTiming);


        // Select row
        System.out.print(
                "\nEnter row number (1-5): ");

        int row = sc.nextInt();


        // Select seat
        System.out.print(
                "Enter seat number (1-5): ");

        int seat = sc.nextInt();


        // Validate
        if (row < 1 || row > 5
                || seat < 1 || seat > 5) {

            System.out.println(
                    "Invalid row or seat number!");

            return;
        }


        // Check booked
        if (seats[selectedMovie]
                [selectedTiming]
                [row - 1]
                [seat - 1]) {

            seats[selectedMovie]
                    [selectedTiming]
                    [row - 1]
                    [seat - 1] = false;

            saveBookings();

            System.out.println(
                    "\nTicket cancelled successfully!");

        } else {

            System.out.println(
                    "\nThis seat is not booked!");
        }
    }


    // ==================================================
    // CHECK MOVIE AND TIMING
    // ==================================================

    static boolean checkMovieAndTiming() {

        if (selectedMovie == -1) {

            System.out.println(
                    "\nPlease choose a movie first!");

            return false;
        }

        if (selectedTiming == -1) {

            System.out.println(
                    "\nPlease choose a timing first!");

            return false;
        }

        return true;
    }


    // ==================================================
    // OPTION 6 - VIEW PRICES
    // ==================================================

    static void showPrices() {

        System.out.println(
                "\n------------- TICKET PRICES -------------");

        System.out.println(
                "Lower Balcony : ₹"
                + lowerBalconyPrice);

        System.out.println(
                "Upper Balcony : ₹"
                + upperBalconyPrice);


        if (isWeekend()) {

            System.out.println(
                    "\nToday is WEEKEND.");

            System.out.println(
                    "Weekend extra charge: ₹50");

            System.out.println(
                    "Lower Balcony Weekend Price : ₹"
                    + (lowerBalconyPrice + 50));

            System.out.println(
                    "Upper Balcony Weekend Price : ₹"
                    + (upperBalconyPrice + 50));

        } else {

            System.out.println(
                    "\nToday is WEEKDAY.");
        }
    }


    // ==================================================
    // CHECK WEEKEND
    // ==================================================

    static boolean isWeekend() {

        DayOfWeek day =
                LocalDate.now().getDayOfWeek();

        return day == DayOfWeek.SATURDAY
                || day == DayOfWeek.SUNDAY;
    }


    // ==================================================
    // SAVE BOOKINGS
    // ==================================================

    static void saveBookings() {

        try {

            PrintWriter pw =
                    new PrintWriter(bookingFile);

            /*
             * 3 Movies
             * 4 Timings
             * 5 Rows
             * 5 Seats
             */

            for (int movie = 0;
                    movie < 3;
                    movie++) {

                for (int timing = 0;
                        timing < 4;
                        timing++) {

                    for (int row = 0;
                            row < 5;
                            row++) {

                        for (int seat = 0;
                                seat < 5;
                                seat++) {

                            pw.print(
                                    seats[movie]
                                    [timing]
                                    [row]
                                    [seat]
                                    + " ");
                        }

                        pw.println();
                    }

                    pw.println();
                }
            }

            pw.close();

        } catch (IOException e) {

            System.out.println(
                    "Error while saving bookings.");
        }
    }


    // ==================================================
    // LOAD BOOKINGS
    // ==================================================

    static void loadBookings() {

        if (!bookingFile.exists()) {

            return;
        }

        try {

            Scanner fileScanner =
                    new Scanner(bookingFile);

            for (int movie = 0;
                    movie < 3;
                    movie++) {

                for (int timing = 0;
                        timing < 4;
                        timing++) {

                    for (int row = 0;
                            row < 5;
                            row++) {

                        for (int seat = 0;
                                seat < 5;
                                seat++) {

                            if (fileScanner
                                    .hasNextBoolean()) {

                                seats[movie]
                                        [timing]
                                        [row]
                                        [seat]
                                        = fileScanner
                                        .nextBoolean();
                            }
                        }
                    }
                }
            }

            fileScanner.close();

        } catch (IOException e) {

            System.out.println(
                    "Error while loading bookings.");
        }
    }
}