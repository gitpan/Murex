#!/usr/bin/perl

use strict;
use warnings;
use CGI qw(:standard);;

print header;
print start_html('Murex Password Encryption'),
    h1('Murex Password Encryption'),
    start_form,
    "Please enter password for encryption? ",textfield('password'),
    submit,
    end_form,
    hr;

if (param()) {
    my $passwd=param('password');
    print "Encrypt \"$passwd\"=\"".___encrypt_murex_password($passwd)."\"\n";
}
print hr,
      "(c) <a href=\"http://www.linke.de\">Markus Linke</a> and Tony Edwardson<br>",
      "Visit the <a href=\"http://murex.it-projects.com\">Murex User Group</a><br>",
      "Decrypt <a href=\"http://linke.de/cgi-bin/murex/cgidecrypt.pl\">here</a><br>";

print end_html;

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
