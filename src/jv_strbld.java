//javac -d ..\exe jv_strbld.java
import java.io.FileWriter;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;

public class jv_strbld {
    public static void test(long num) {
        System.out.print("  Java");
        StringBuilder s = new StringBuilder("");
        long i = 1L;
        Instant startTime = Instant.now();

        for (i = 1L; i <= num; i++) {
            s.append(" J ").append(i);
        }

        Duration elapsedTime = Duration.between(startTime, Instant.now());
        int minutes = (int) elapsedTime.toMinutes();
        int seconds = (int) elapsedTime.getSeconds() % 60;
        int milliseconds = (int) elapsedTime.toMillis() % 1000;

        int length = s.length();
        System.out.printf("  %d:%02d:%03d Iter %d: Len %d%n", minutes, seconds, milliseconds, num, length);

        String filePath = "out/java_output.txt";

        try (FileWriter file = new FileWriter(filePath)) {
            //file.write(s.toString());
            file.append(s);
        } catch (IOException ex) {
            System.out.printf("Error saving string to file: %s%n", ex.getMessage());
        }
    }

    public static void main(String[] args) {
        if (args.length > 0) {
            try {
                long num = Long.parseLong(args[0]);
                test(num);
                //return 0;
            } catch (NumberFormatException e) {
                System.out.println("Invalid argument. Please provide a valid integer.");
                //return 1;
            }
        } else {
            System.out.println("Invalid argument. Please provide a valid integer.");
            //return 1;
        }
    }
}