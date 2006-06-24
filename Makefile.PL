use 5.008003;
use ExtUtils::MakeMaker;

#$LastChangedDate: 2006-02-20 14:04:22 -0600 (Mon, 20 Feb 2006) $
#$LastChangedRevision: 34 $

#$Id: Makefile.PL 34 2006-02-20 20:04:22Z linmar $
$VERSION = "".sprintf("%0.3f",0+((qw$LastChangedRevision: 34 $)[-1])/1000);

WriteMakefile(
    NAME              => 'Murex',
    VERSION_FROM      => 'lib/Murex.pm', # finds $VERSION
    PREREQ_PM         => {
                            'Data::Dumper::Simple' => 0.01,
                            'Log::Dispatch' => 0.01,
                            'Log::Dispatch::FileRotate' => 0.01,
                            'Log::Log4perl' => 0.01,
                            'Mail::Sendmail' => 0.01,
                            'Log::Dispatch::Email' => 0.01,
                            'XML::Simple' => 0.01,
                            'Crypt::RC6' => 0.01,
                            'Hash::Merge' => 0.01,
                            'Digest::MD5' => 0.01,
                            'English' => 0.01,
                            'Template' => 0.01,	  
                          },
			  
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Murex.pm', 
       AUTHOR         => 'Markus Linke <markus.linke@linke.de>') : ()),
           dist => {
	PREOP => 'svn log lib/Murex.pm > Changes;pod2text lib/Murex.pm > README;pod2html lib/Murex.pm > README.html',
    },

);

