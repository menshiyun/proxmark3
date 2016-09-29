#!/usr/bin/perl
# Output a version.c file that includes information about the current build
# Normally a couple of lines of bash would be enough (see openpcd project, original firmware by Harald Welte and Milosch Meriac)
# but this will, at least in theory, also work on Windows with our current compile environment.
# -- Henryk Plötz <henryk@ploetzli.ch> 2009-09-28
# Modified april 2014 because of the move to github. 
# --- Martin Holst Swende <martin@swende.se>


# Clear environment locale so that git will not use localized strings
$ENV{'LC_ALL'} = "C";
$ENV{'LANG'} = "C";

my $gitversion = `git describe --dirty`;
my $gitbranch = `git rev-parse --abbrev-ref HEAD`;
my $gitcommitid = `git rev-parse --short HEAD`;
my $clean = 2;
my @compiletime = localtime();

my $fullgitinfo = 'menshiyun';

$fullgitinfo = $fullgitinfo . '/' . $gitbranch . '-' . $gitcommitid;

$fullgitinfo =~ s/(\s)//g;

# Crop so it fits within 50 characters
$fullgitinfo =~ s/.{50}\K.*//s;

use POSIX;
my $tz = strftime("%z", @compiletime);
$tz =~ s/(\d{2})(\d{2})/$1:$2/;
my $ctime =  strftime("%Y-%m-%dT%H:%M:%S", @compiletime) . $tz;


print <<EOF
#include "proxmark3.h"
/* Generated file, do not edit */
const struct version_information __attribute__((section(".version_information"))) version_information = {
	VERSION_INFORMATION_MAGIC,
	1,
	1,
	$clean,
	"$fullgitinfo",
	"$ctime",
};
EOF
