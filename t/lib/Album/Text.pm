package Album::Text; {

	use Moose;
	use MIME::Types;

	our $mime_types = MIME::Types->new();
	our @supported_mime_types_list = map { 
		$mime_types->mimeTypeOf($_)
	} qw(txt);

	sub supported_mime_types {
		@supported_mime_types_list;
	}

	with "Album::Role::Resource";
}

1;
