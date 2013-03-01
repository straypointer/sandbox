#!/usr/bin/perl
use strict;
use warnings;


sub search {
	# expects:
	# filespec, search string, output file
	my $source = shift;
	my $spec = shift;
	my $str = shift;
	my $output = shift;
	my $cmd;
	
	# echo statement
	$cmd = "\nTHE FOLLOWING CONTAINS A LIST OF LOGS WITH THE STRING \"$str\" - CASE SENSITIVE SEARCH\n";
	
	system("echo '$cmd'");
	
	# find statement
	$cmd = "find $source -prune -name \"$spec\" -type f -print | xargs grep $str >> $output 2>/dev/null";

	system($cmd);
}

# main program

my @txt_array = ("The status on", "is not valid", "ERROR", "Cannot open");
my @log_array = ("WARNING: UNINITIALIZED VARIABLE", "CLIENTs CHECKED. Error count = 1", "WRONG ! TRY AGAIN", "MAXIMUM NUMBER OF PAGES HAS BEEN REACHED",
				"FTPCount=", " Not owner", "spawn id exp");
my $output_file = "/udadmin/expectfiles/print_a_report.txt";
my $input_file = "/udadmin/expectlogs/*";

				
foreach (@txt_array) {
	search($input_file, "*.txt", "$_", $output_file);
}

foreach (@log_array) {
	search($input_file, "*.log", "$_", $output_file);
}