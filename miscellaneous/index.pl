#!/usr/bin/perl -w

###################################################################
#index.pl
#
#creates an html index of all the html files in the directory
#
#reviewed/updated 2002.01.28
#2005.02.24
###################################################################

my $line;
my $title;
my $file_name;
my @file_list;
my $name;

#backup the index file
system ('cp index.htm index.old');

#get the name of the category
open (IN, "index.old");
while ( <IN> ) {
   $line = $_;
   if ( $line =~ m!^<title>(.*)</title>$!i ) {
      $title = $1;
      last;
   }
}
close (IN);

#start the new index file here
open (OUT, ">index.htm");
#write headers
print OUT "<html>\n";
print OUT "<head>\n";
print OUT "<title>$title</title>\n";
print OUT "</head>\n";
print OUT "<body>\n\n";
print OUT "<h3>$title</h3>\n\n";

@file_list = glob("*");

my @html_files;
foreach $file_name (@file_list) {
    if ($file_name =~ m/.*htm$/ or $file_name =~ m/.*html$/) {
        push(@html_files, $file_name);
    }
}


foreach $file_name (@html_files) {
   #globbed on *.htm, so skip the index.htm file
   if ( $file_name =~ m/^index.htm$/ ) {
      next;
   }

   #rip through each recipe file and get the titles
   open(HTMFILE, "$file_name");
   while ( <HTMFILE> ) {
      $line = $_;

      if ( $line =~ m!<title>(.*)<\/title>!i ) {
         $name = $1;
         last;
      }
   }
   close(HTMFILE);
   print OUT "<a href=\"\./$file_name\">$name</a><br />\n";
}

#write trailers for the index file
print OUT "\n";
print OUT "<hr>\n";
print OUT "\n";
print OUT "Back to <a href=\"\.\./recipe\.htm\">Main Index</a>\n\n";
print OUT "</body>\n";
print OUT "</html>\n";

close (OUT);