package Murex;

#$LastChangedDate: 2005-02-12 10:37:06 +0000 (Sat, 12 Feb 2005) $
#$LastChangedRevision: 8 $

#$Id: Murex.pm 8 2005-02-12 10:37:06Z root $
$VERSION = "0.".sprintf("%0.5f",0+((qw$LastChangedRevision: 8 $)[-1])/100000);

use 5.008006;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Murex ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

# Preloaded methods go here.

1;
__END__
=head1 NAME

Murex

=head1 ABSTRACT

Module to automate Murex MxG2000 Environments

=head1 SYNOPSIS

use Murex

=head1 DESCRIPTION

Module to automate Murex MxG2000 Environments. The first released module
is Murex::Base, Murex.pm itself is not available yet.

=head2 EXPORT

None by default.

=head2 LOGGING

This module expects a log.conf file to exist. This file contains the Log4Perl Configuration.

=head1 SEE ALSO

   Visit the Murex User Group at http://www.linke.de/consulting/murex/usergroup
   To submit a bug send an email to murex-rt@it-projects.com
   To join the Murex Mailing List send an email to murex-l-subscribe-request@it-projects.com
   Visit the author's website at http://www.linke.de

=head1 AUTHOR

   Markus Linke, markus.linke@linke.de

=head1 COPYRIGHT AND LICENSE

   Copyright 2005 by Markus Linke. All rights reserved.
   NO commercial use without authors written permission!

=head1 AMENDMENT HISTORY

Please see Changes file.

=cut
