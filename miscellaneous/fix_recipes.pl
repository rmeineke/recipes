#! /usr/bin/perl
use warnings;
use strict;

use Fcntl ':mode';

$|++;


use Carp;
use File::Find;

my ($name, $pass, $uid, $gid, $quota, $comment, $gcos, $dir, $shell, $expire) = getpwnam('robertm'); 
print $name, "\n";
print $uid, "\n";
print $gid, "\n";


my $look_in = '/home/robertm/Recipes';

find sub {
    my $file = $File::Find::name;
    
    #exclude directories and sockets, yeah, that would be great
    if (-d $file || -S $file) {
        return;
    }    
    
    #get current permissions
    my $current_mode = (lstat($file))[2];
    
    my $permissions = sprintf "%04o", S_IMODE($current_mode);
        if ($permissions eq '0644') {
            return;
    }    
    
    if ($file =~ m/(pdf|html|doc|odt|css)$/i) {
    
        #change ownership
        chown $uid, $gid, $file;
        
        print $file, "\n";
        
        my $mode = 0644;
        my $rc = 0;
        $rc = chmod $mode, $file;
        if ($rc != 1) {
            print "Unable to CHMOD the file: $file ($!)\n";
        } else {
            print "$rc -- $file permissions fixed\n";
        }
        
    }
    
}, $look_in;
