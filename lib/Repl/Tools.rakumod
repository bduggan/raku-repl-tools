#!/usr/bin/env raku

sub w is hidden-from-backtrace is export {
  put "\n--- current stack --- ";
  put Backtrace.new.Str;
  my $b = Backtrace.new.list;
  my $repl-frame = $b.first(:k, {.?subname.defined && .?subname eq 'repl' && .is-setting });
  without $repl-frame {
    die "Repl::Tools::w was called without a repl";
  }
  my $f = $b[$repl-frame ^.. *].first({!.is-setting && !.is-hidden });
  return without $f;
  my $file = $f.file.subst(/ ' (' <-[)]>+ ')' $$/,'');
  my $line = $f.line;
  put "\n-- current file ($file) --";
  my $width = $line.chars + 2;
  for $file.IO.lines.kv -> $i, $l {
    next if $i < $line - 10;
    if ($i + 1 ) == $line {
      put ($i + 1).fmt("%{$width}d >") ~ " $l";
    } else {
      put ($i + 1).fmt("%{$width}d |") ~ " $l";
    }
    last if $i > $line + 10;
  }
  put "";
}

sub qq is hidden-from-backtrace is export {
  &CORE::exit()
}
