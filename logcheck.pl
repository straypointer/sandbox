#!/usr/bin/perl
use strict;
use warnings;


sub search {
	# expects:
	# filespec, search string, output file
	my $spec = shift;
	my $str = shift;
	
	print "$spec \n";
	print "$str \n";
	
}

# main program

my @txt_array = ("The status on", "is not valid", "ERROR", "Cannot open");
my @log_array = ("WARNING: UNINITIALIZED VARIABLE", "CLIENTs CHECKED. Error count = 1", "WRONG ! TRY AGAIN", "MAXIMUM NUMBER OF PAGES HAS BEEN REACHED",
				"FTPCount=", " Not owner", "spawn id exp");


search("*.log", "while executing");
# wrong directory command
search("*.txt", "The status on");

foreach (@txt_array) {
	search("*.txt", "$_");
}

foreach (@log_array) {
	search("*.log", "$_");
}