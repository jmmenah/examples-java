// Arrays in Java 
// Looping From Back to Front
// https://interactivepython.org/runestone/static/JavaReview/ArrayBasics/aLoopBackToFront.html

public class ArrayWorker3
{
   private int[ ] values;

   public ArrayWorker3(int[] theValues)
   {
      values = theValues;
   }

   public int getIndexLastSmaller(int target)
   {
      for (int index = values.length - 1; index >= 0; index--)
      {
         if (values[index] < target)
             return index;
      }
      return -1;
   }

   public void printValues()
   {
     for (int val : values )
     {
       System.out.print(val + ", ");
     }
     System.out.println();
   }

   public static void main (String[] args)
   {
      int[] theArray = {-30, -5, 8, 23, 46};
      ArrayWorker3 worker = new ArrayWorker3(theArray);
      System.out.println(worker.getIndexLastSmaller(50));
      System.out.println(worker.getIndexLastSmaller(30));
      System.out.println(worker.getIndexLastSmaller(10));
      System.out.println(worker.getIndexLastSmaller(0));
      System.out.println(worker.getIndexLastSmaller(-20));
      System.out.println(worker.getIndexLastSmaller(-30));
   }
}

