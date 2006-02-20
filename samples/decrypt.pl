#!/usr/bin/perl

use strict;
#use warnings;

my $passwd=$ARGV[0];
print "Decrypt \"$passwd\"=\"".___decrypt_murex_password($passwd)."\"\n";


sub ___decrypt_murex_password {
    my $pw = $_[0];
    my $nochars = length($pw)/4;
    my @hexbits;
    for (my $n=0; $n<$nochars; $n++) {
        push(@hexbits, hex(substr($pw,4*$n, 4)));
    }
    my @decimalbits;
    for my $n (@hexbits) {
        $n -= 256 if $n >= 128;
        push(@decimalbits, $n);
    }
    my @decrypted;
    my @work = (57,57,57,49,70,87,76);
    my @key = map { chr } reverse(@work);
    my $n=0;
    foreach my $b (@decimalbits) {
        my $b1 = ($b & 0xf) << 4;
        my $b2 = ($b & 0xf0) >> 4;
        my $b3 = ($b1 | $b2);
        my $key = $key[$n++ % scalar(@key)];
        my $k = ord($key);
        my $char = $b3 ^ $k;
        my $char2 = chr($char);
        push(@decrypted, $char2);
    }
    my $dp = join("", @decrypted);
    return $dp;
}

