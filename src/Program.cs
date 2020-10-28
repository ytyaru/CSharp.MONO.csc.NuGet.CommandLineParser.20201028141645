using System;
using CommandLine;
using CommandLine.Text;
using System.Collections;
using System.Collections.Generic;

namespace MONO.csc.NuGet.CommandLineParser
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Parser.Default.ParseArguments<Options>(args)
                .WithParsed(opt => {/*パースに成功した場合*/ Run(opt); })
                .WithNotParsed(er => {/*パースに失敗した場合*/ Error(er); });
        }
        private static void Run(Options opt)
        {
            Console.WriteLine("CommandLine parse success !!");
            Console.WriteLine($"A: {opt.A}");
            Console.WriteLine($"B: {opt.B}");
            Console.WriteLine($"C: {string.Join(", ", opt.C)}");
            Console.WriteLine($"D: {opt.D}");
            Console.WriteLine($"1: {string.Join(", ", opt.Remaining)}");

        }
        private static void Error(IEnumerable<Error> er)
        {
            Console.WriteLine("CommandLine parse failed...");
            foreach (Error e in er)
            {
                Console.WriteLine(e);
            }
        }
    }
}
