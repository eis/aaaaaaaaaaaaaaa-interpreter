package net.roddy.aaaaaaaaaaaaaa;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import net.roddy.aaaaaaaaaaaaaa.antlr4.AAAAAAAAAAAAAABaseListener;
import net.roddy.aaaaaaaaaaaaaa.antlr4.AAAAAAAAAAAAAALexer;
import net.roddy.aaaaaaaaaaaaaa.antlr4.AAAAAAAAAAAAAAListener;
import net.roddy.aaaaaaaaaaaaaa.antlr4.AAAAAAAAAAAAAAParser;
import net.roddy.aaaaaaaaaaaaaa.antlr4.AAAAAAAAAAAAAAParser.ProgramContext;

public class Main {
	public static void main(String args[]) {
		String endProgram =
				"AA AAAA AA!";
		execute(endProgram);
	}
	public static void execute(String program) {
		// Get our lexer
		AAAAAAAAAAAAAALexer lexer = new AAAAAAAAAAAAAALexer(new ANTLRInputStream(program));

		// Get a list of matched tokens
		CommonTokenStream tokens = new CommonTokenStream(lexer);

		// Pass the tokens to the parser
		AAAAAAAAAAAAAAParser parser = new AAAAAAAAAAAAAAParser(tokens);

		// Specify our entry point
		ProgramContext drinkSentenceContext = parser.program();

		// Walk it and attach our listener
		ParseTreeWalker walker = new ParseTreeWalker();
		AAAAAAAAAAAAAAListener listener = new AAAAAAAAAAAAAABaseListener();
		walker.walk(listener, drinkSentenceContext);
	}
}
