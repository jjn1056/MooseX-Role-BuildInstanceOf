use inc::Module::Install;

perl_version '5.008001';
all_from 'lib/MooseX/Role/BuildInstanceOf.pm';
repository 'git://github.com/jjn1056/MooseX-Role-BuildInstanceOf.git';

requires 'Moose' => '0.92';
requires 'Class::MOP' => '0.94';
requires 'MooseX::Role::Parameterized' => '0.13';

build_requires 'Test::More' => '0.94';
build_requires 'MooseX::Types::Path::Class';
build_requires 'Perl6::Junction';
build_requires 'MooseX::Iterator';

auto_install;
test_recursive;
WriteAll;

