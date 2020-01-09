// Arrays in Java - Putting Values in an Array
// https://interactivepython.org/runestone/static/JavaReview/ArrayBasics/abasics.html#putting-values-in-an-array

public class Test1A
{
   public static void main(String[] args)
   {
     // declare arrays
     int[ ] highScores = null;
     String[ ] names = null;

     // create the arrays
     highScores = new int[5];
     names = new String[5];

     // print the initial values at index 0
     System.out.println(highScores[0]);
     System.out.println(names[0]);

     // set the values in the highScores array
     highScores[0] =  99;
     highScores[1] =  98;
     highScores[2] =  98;
     highScores[3] =  88;
     highScores[4] =  68;
     System.out.println(highScores[0]);

     // set the values in the names array
     names[0] = "Jamal";
     names[1] = "Emily";
     names[2] = "Destiny";
     names[3] = "Mateo";
     names[4] = "Sofia";
     System.out.println(names[0]);
   }
}

