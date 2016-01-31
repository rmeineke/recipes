#!/usr/bin/perl
use strict;
use warnings;

my $filename = 'index.htm';

open my $FH, q{<}, $filename or die "$0: Unable to open $filename: $!\n";

print "<ul>\n";
while (<$FH>) {
    if ($_ =~ m/^<a href=(.*)<br.*/) {
        print "<li><a href=", $1, "</li>", "\n";
    }
}
print "</ul>\n";

close $FH;