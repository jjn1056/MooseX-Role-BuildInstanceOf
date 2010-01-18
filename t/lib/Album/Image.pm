package Album::Image; {

	use Moose;
	use MIME::Types;

	our $mime_types = MIME::Types->new();
	our @supported_mime_types_list = map { 
		$mime_types->mimeTypeOf($_)
	} qw(gif jpg png);

	sub supported_mime_types {
		@supported_mime_types_list;
	}

	has height => (
		is => 'ro',
		isa => 'Int',
		required => 1,
        default => 42,
	);

	has width => (
		is => 'ro',
		isa => 'Int',
		required => 1,
        default => 23,
	);

	with "Album::Role::Resource";
}

1;
