package Album::Image; {

	use Moose;
	use MIME::Types;
	use Image::ExifTool qw(ImageInfo);

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
	);

	has width => (
		is => 'ro',
		isa => 'Int',
		required => 1,
	);

	around BUILDARGS => sub {
		my($orig, $class, @args) = @_;
		my $args = $class->$orig(@args);
		my $info = ImageInfo($args->{source_fh}, 'ImageHeight','ImageWidth');

		return {
			height => $info->{ImageHeight},
			width => $info->{ImageWidth},
			%$args,
		};
	};

	with "Album::Role::Resource";
}

1;
