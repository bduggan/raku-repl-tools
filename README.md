## Repl::Tools

Some simple tools to accompany the raku's repl statement.

## Description

These are some simple tools to improve the experience of using
the built-in "repl" to debug a raku program.

Currently, there is only one tool "w", which gives information
about the current stack, and program.

## Example

1. Write a program that calls `repl` at some point:

  use Repl::Tools;

  sub hello {
    world;
  }

  sub world {
    my $x = 10;
    say "x is $x";
    repl;
  }

  hello;

2. While, in the program, type `w` to see where you are.

		$ raku hello.raku
		x is 10
		Type 'exit' to leave
		> w

		--- current stack ---
			in sub world at eg/hello.raku line 12
			in sub hello at eg/hello.raku line 6


		-- current file (eg/hello.raku) --
			 3 | use Repl::Tools;
			 4 |
			 5 | sub hello {
			 6 |   world;
			 7 | }
			 8 |
			 9 | sub world {
			10 |   my $x = 10;
			11 |   say "x is $x";
			12 >   repl;
			13 | }
			14 |
			15 | hello;
			16 |

That's it!

## Author

Brian Duggan (bduggan at matatu.org)

