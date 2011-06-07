#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use POSIX;
use Date::Manip;

my ($help, $unix, $date);

# parse arguments
my $options = GetOptions (
	"help|h|?" => \$help,
	"unix|u=s" => \$unix,
	"date|d=s" => \$date
);

if ($help) {
	print "Usage: $0 [--help|-h|-?] [--unix|-u <num>]] [--date|-d <YYYY-MMM-DD HH:MM>]\n";
	print "\nWithout arguments, will print both the current unix timestamp and the current\ndate.\n";
	exit;
}

if (!$unix && !$date) {
	$unix = time;
	$date = UnixDate("epoch $unix", "%Y-%m-%d %T");
}
elsif ($unix) {
	$date = UnixDate("epoch $unix", "%Y-%m-%d %T");
}
elsif ($date) {
	$unix = UnixDate(ParseDate($date), "%s");
}

print "$unix\n";
print "$date\n";
