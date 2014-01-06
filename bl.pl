#!/usr/bin/perl

# ============================================================================
# bl.pl is a Perl script that renames a file to it's bit literate file name.
# Usage: [file] [user intitials] [file topic]
# Copyright (c) 2014 Yashwant Chauhan. All rights reserved.
# ============================================================================

use strict;
use warnings; no warnings ('uninitialized', 'substr');
use diagnostics;
use autodie;
use File::stat;
use Time::Piece;

my $oldfile = $ARGV[0]; 
my $user = $ARGV[1]; 
my $tp = $ARGV[2];

open(my $fh, "<$oldfile");

if ($fh) {
	my $tm = localtime(stat($fh)->mtime)->dmy;
	
	my $filename = "$user-$tm-$tp"; 
	print "$oldfile will be renamed to $filename\n";
	
	rename($oldfile, $filename);
	
} elsif (!$user && !$tp && !$oldfile) {
	print "Usage: bl.pl [file] [user] [topic]\n"
}

close;