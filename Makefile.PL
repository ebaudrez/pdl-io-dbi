use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'PDL::IO::DBI',
  AUTHOR        => 'KMX <kmx@cpan.org>',
  VERSION_FROM  => 'lib/PDL/IO/DBI.pm',
  ABSTRACT_FROM => 'lib/PDL/IO/DBI.pm',
  LICENSE       => 'perl',
  PREREQ_PM     => {
        'PDL'          => '2.014', # we need: longlong-double fix
        'DBI'          => 0,
        'Exporter'     => '5.59',  # we need: use Exporter 'import';
        'Time::Moment' => '0.12',  # we need: lenient ISO 8601 parsing
  },
  BUILD_REQUIRES => {
        'PDL'                 => '2.014',
        'DBI'                 => 0,
        'Exporter'            => '5.59',
        'Time::Moment'        => '0.12',
        'Test::More'          => '0.88',  # we need: done_testing()
        'Test::Number::Delta' => '1.06',  # versions before 1.06 have buggy relative mode
  },
  META_MERGE => {
      prereqs => {
        runtime => {
          recommends => {
            'PDL::DateTime' => 0,
          },
        },
      },
      resources    => {
        repository   => 'https://github.com/kmx/pdl-io-dbi',
      },
  },
  dist => {
      ($^O eq 'MSWin32' ? (TAR => 'ptar', TARFLAGS => '-c -C -f') : ()),
      PREOP => 'perldoc -u lib/PDL/IO/DBI.pm | pod2markdown > README.md',
  },
);
