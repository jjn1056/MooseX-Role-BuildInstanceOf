use inc::Module::Install;

perl_version '5.008001';
all_from 'lib/MooseX/Role/BuildInstanceOf.pm';
repository 'git://github.com/jjn1056/MooseX-Role-BuildInstanceOf.git';

requires 'Moose' => '0.92';
requires 'Class::MOP' => '0.94';
requires 'MooseX::Role::Parameterized' => '0.13';

test_requires 'Test::More' => '0.94';
test_requires 'MooseX::Types::Path::Class';
test_requires 'Perl6::Junction';
test_requires 'MooseX::Iterator';

auto_install;
tests_recursive;
WriteAll;

