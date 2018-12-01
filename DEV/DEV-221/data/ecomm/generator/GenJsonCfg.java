import java.io.*;

public class GenJsonCfg {

    public static void main(String[] args) throws IOException {

        String templateDir = args[0];
        String dayToGenerate = args[1];

        for(int i=0; i < 24; i++) {
            String hourAsString = String.format("%02d", i);

            String outputFileName = templateDir + "tmpJson/" + dayToGenerate + "_" + hourAsString + ".json";

            BufferedReader jsonStart = new BufferedReader(new FileReader( templateDir + "purchase-start.json"));

            BufferedWriter jsonOut = new BufferedWriter(new FileWriter(outputFileName));

            String line = null;
            while( (line = jsonStart.readLine()) != null) {
                jsonOut.write(line);
                jsonOut.newLine();
            }

            jsonOut.write("\"min\": \"" + dayToGenerate + " " + hourAsString + ":00:00\",");
            jsonOut.newLine();
            jsonOut.write("\"max\": \"" + dayToGenerate + " " + hourAsString + ":59:59\"");
            jsonOut.newLine();

            BufferedReader jsonTail = new BufferedReader(new FileReader( templateDir + "purchase-tail.json"));

            while( (line = jsonTail.readLine()) != null) {
                jsonOut.write(line);
                jsonOut.newLine();
            }

            jsonStart.close();
            jsonTail.close();
            jsonOut.close();


            //now copy the file to HDFS
            //String putCommand = "hdfs dfs -put " + outputFileName + " perf/2/working/purchaseJson";
            //System.out.println("EXECUTING >> " + putCommand);
            //Process copyToHDFS = Runtime.getRuntime().exec(putCommand);

        }

    }
}
