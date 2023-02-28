using System;
using System.Collections;
namespace StackDemo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //--Stack Demonstration
            Stack st = new Stack();
            //push adds an element to the stack at the front that is top
            st.Push("Pune");
            st.Push("Mumbai");
            st.Push("Chennai");
            st.Push("Bangalore");
            st.Push("Hydrabad");
            Console.WriteLine("The Stack Elements : \n");
            foreach (string tmp in st)
                Console.WriteLine(tmp.ToString());
            Console.WriteLine();

            //Pop()
            Console.WriteLine(" ------ Element popped from top of the stack ------\n ");
            Console.WriteLine("Popping an Item: " + st.Pop());
            Console.WriteLine("\nThe Stack Elements : \n");
            foreach (string tmp in st)
                Console.WriteLine(tmp.ToString());

            //Peek()
            Console.WriteLine();
            Console.WriteLine(" ------- Element now at the Top -------\n");
            Console.WriteLine("The top element of Stack: " + st.Peek());
            Console.WriteLine("\nThe Stack Elements : \n");
            foreach (string tmp in st)
                Console.WriteLine(tmp.ToString());

            //clear()
            Console.WriteLine(" -----  Clear the Stack ----");
            st.Clear();

            // count
            Console.WriteLine(" \n After clear the stack -----\n");
            Console.WriteLine(" Count :" + st.Count);

            Console.ReadKey();
        }
    }
}
