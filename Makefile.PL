use 5.008003;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Murex',
    VERSION_FROM      => 'lib/Murex.pm', # finds $VERSION
    PREREQ_PM         => {
'Data::Dumper::Simple',
'Log::Dispatch',
'Log::Dispatch::FileRotate',
'Log::Log4perl',
'Mail::Sendmail',
'Log::Dispatch::Email',
'XML::Simple',
'Crypt::RC6',
'Hash::Merge',
'Digest::MD5',
'English',
'Template',	  
                          },
			  
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Murex.pm', 
       AUTHOR         => 'Markus Linke <markus.linke@linke.de>') : ()),
           dist => {
	PREOP => 'svn log lib/Murex.pm > Changes;pod2text lib/Murex.pm > README;pod2html lib/Murex.pm > README.html',
    },

);

