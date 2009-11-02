package Album::Role::Resource; {

	use Moose::Role;
	use MooseX::Types::IO qw(IO);
	use Perl6::Junction qw(any);	

	requires 'supported_mime_types';

	has source_fh => (
		is => 'ro',
		isa => IO,
		required => 1,
		coerce => 1,
	);

	has title => (
		is => 'ro', 
		isa => 'Str', 
		required => 1,
	);

	has mime_type => (
		is => 'ro',
		isa => 'Object',
		required => 1,
	);

	sub process {
		my ($class, $asset) = @_;
		my $mime_type = $asset->{mime_type}->type;
		if(any($class->supported_mime_types) eq $mime_type) {
			return $class->new($asset);
		} else {
			return;
		}
	}
}

1;
