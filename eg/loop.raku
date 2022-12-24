#!/usr/bin/env raku

use Repl::Tools;

my $i = 1;
loop {
  say "iteration: " ~ $i++;
  repl;
}

