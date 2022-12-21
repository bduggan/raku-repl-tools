#!/usr/bin/env raku

sub w is hidden-from-backtrace is export {
  put "\n--- current stack --- ";
  my $b = Backtrace.new;
  my $first = True;
  put $b.concise;
  my $f = $b.first(:k, {!.is-setting && !.is-hidden && .is-routine});
  my $file = $f.file;
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
