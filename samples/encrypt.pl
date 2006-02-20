#!/usr/bin/perl

#$LastChangedDate:2006-02-20 20:39:21 +0000 (Mon, 20 Feb 2006) $
#$LastChangedRevision:38 $

#$Id:encrypt.pl 38 2006-02-20 20:39:21 +0000 (Mon, 20 Feb 2006) linmar $
$VERSION = "".sprintf("%0.3f",0+((qw$LastChangedRevision:38 $)[-1])/1000);

use strict;
use warnings;

my $passwd=uc($ARGV[0]);
print "Encrypt \"$passwd\"=\"".___encrypt_murex_password($passwd)."\"\n";


sub ___encrypt_murex_password {
    my ($dp) = @_;
    my @decrypted = split("", $dp);
    my @decimal_bits = ();
    my @work = (57,57,57,49,70,87,76);
    my @key = map { chr } reverse(@work);
    my $n=0;
    foreach my $char2 (@decrypted) {
        my $char = ord(uc($char2));
        my $key = $key[$n++ % scalar(@key)];
        my $k = ord($key);
        my $b3 = $char ^ $k;
        my $c1 = ($b3 & 0xf) << 4;
        my $c2 = ($b3 & 0xf0) >> 4;
        push(@decimal_bits, ($c1 | $c2));
    }
    my $passwd = "";
    foreach (@decimal_bits){
        $passwd .= sprintf("%04x", $_);
    }
    return $passwd;
}
