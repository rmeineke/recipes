#!/usr/bin/perl -w
use strict;
use File::Copy;

my ($arg_count, $input, $output, @directories, $dir, $count, $response, $line);
my ($title);

$arg_count = @ARGV;
#test arg count, should be one and only one
if ($arg_count != 1) {
    print "$0: one file name must be provided\n";
    exit(1);
}

$input = $ARGV[0];
#make sure the file provided exists
if (! -e $input) {
    print "$0: $input not found: $!";
    exit(1);
}


##############################
# backup and strip
my $backup;
#cobble the backup name together
$backup = 'BAK.' . $input;

print " -- $input -- $backup --\n";

#make a backup
move($input, $backup) or die "$0: move $input failed: $!\n";

#from the backup, strip the carriage returns and send the 
#resulting line back out to the original file name
open(IN, "$backup") or die "$0: open $backup failed: $!\n";
open(OUT, "> $input") or die "$0: open $input failed: $\n!";
while (<IN>) {
    s/\r//g;
    print OUT;
}
close(IN);
close(OUT);

##############################


#grab title, we'll use it as the filename
open(IN, $input) or die "$0: unable to open $input: $!\n";
chomp($line = <IN>);
$title = $line;
close(IN);
print "\n\n===---< $line >---===\n\n";


####
#Choose directory here
####
print "Choose a directory:\n";
@directories = grep -d, glob '/home/robertm/Recipes/*';
$count = 0;
foreach $dir (@directories) {
    printf "\t%02d -- $dir\n", $count;
    $count++;
} 
print "Directory >> ";
chomp($response = <STDIN>);
$dir = $directories[$response];

my $dir_name;
#print "Trying to open <<$dir/index.htm>>\n";
open(IN, "$dir/index.htm") or die "$0: unable to open $dir index file: $!\n";
while (<IN>) {
    chomp;
    if ( $_ =~ m!^<title>(.*)<\/title>$!i ) {
        $dir_name = $1;
        last;
    }
}
close(IN);
#print "Using <<$dir_name>>\n";


#lowercase the title
# -- Chicken Cordon Bleu becomes chicken cordon bleu
$line = lc($line);

#translate spaces to underscores
# -- chicken cordon bleu becomes chicken_cordon_bleu
$line =~ s/ /_/g;

#set output file and don't clobber
$count = 1;
$output = $dir . '/' . $line . ".html";
while (-e $output) {
    $output = $dir . '/' . $line . $count . ".html";
    $count++;
}

######
######
#print "Are all the slashes in the right places?\n";
#print "---->$output<----\n";
#exit(0);
######
######

 
open(IN, $input) or die "$0: unable to open $input: $!\n";
open(OUT, "> $output") or die "$0: unable to open output: $!\n";

print OUT "<html>\n<head>\n";
$line = <IN>;#get past the first line, again

print OUT "<title>$title</title>\n</head>\n<body>\n";
print OUT "<h1>$title</h1>\n";

######################
print OUT "<h3>Ingredients:</h3>\n";
print OUT "<ul>\n";
while (<IN>) {
    chomp;
    #empty line
    if (m/^$/) {
        last;
    }
    print OUT "<li> &nbsp; ____ &nbsp; $_</li>\n";
}
print OUT "</ul>\n";

###################
print OUT "<h3>Directions:</h3>\n";
print OUT "<p>\n";
while (<IN>) {
    chomp;
    if (m/^$/) {
        print OUT "</p>\n<p>";
    }
    print OUT "$_\n";
}
print OUT "</p>\n";
print OUT "<hr />\n";
print OUT "<p>\n";
print OUT "Back to <a href=\"./index.htm\">$dir_name</a><br />\n";
print OUT "Back to <a href=\"../recipe.htm\">Main Index</a>\n";
print OUT "</p>\n";

print OUT "</body>\n</html>\n";

close(IN);
close(OUT);

__END__
Back to <A HREF="./index.htm">Main Dishes R->Z</A><BR>
Back to <A HREF="../recipe.htm">Main Index</A><BR>



#!/usr/bin/perl
use warnings;
use strict;
use File::Copy;

my ($input, $backup);

my $arg_count = @ARGV;
#test arg count, should be one and only one
if ($arg_count != 1) {
    print "$0: one, and only one, file name must be provided\n";
    exit(1);
}

$input = $ARGV[0];
#make sure the file provided exists
if (! -e $input) {
    print "$0: $input not found: $!";
    exit(1);
}

#cobble the backup name together
$backup = 'BAK.' . $input;

print " -- $input -- $backup --\n";

#make a backup
move($input, $backup) or die "$0: move $input failed: $!\n";

#from the backup, strip the carriage returns and send the 
#resulting line back out to the original file name
open(IN, "$backup") or die "$0: open $backup failed: $!\n";
open(OUT, "> $input") or die "$0: open $input failed: $\n!";
while (<IN>) {
    s/\r//g;
    print OUT;
}
close(IN);
close(OUT);