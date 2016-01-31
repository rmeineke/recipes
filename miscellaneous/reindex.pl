#! /usr/bin/perl -w

################################################################
#reindex.pl
#
#hop into each subdirectory and runs the index.pl script
#
#reviewed/updated 2002.01.28
################################################################

$dir = '/home/robertm/Recipes/appetize';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/bread';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/dessert';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/main_a-h';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/main_i-q';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/main_r-z';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/salad';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/sauce';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/side';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);

$dir = '/home/robertm/Recipes/soup';
chdir("$dir") or die "$0: Cannot cd to $dir: $!\n";
$cwd = `pwd`;
print "$cwd";
$cmd = "/home/robertm/Recipes/index.pl";
system($cmd);
