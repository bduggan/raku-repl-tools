#!/usr/bin/env raku

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

