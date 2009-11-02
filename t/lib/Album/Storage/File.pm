package Album::Storage::File; {

	use Moose;
	use MooseX::Types::Path::Class qw(Dir File);
	use MIME::Types;

	extends 'Album::Storage';

	with 'MooseX::Role::BuildInstanceOf' => {
		target => 'MIME::Types', prefix => 'mime_types', 
	};

	sub items_in_source {
		my $self = shift @_;
		my $source = $self->source;
		unless(-e $source) {
			die "$source does not exist";
		}
		$source->children;
	}

	sub asset_info_from_path {
		my ($self, $path) = @_;
		unless(is_File($path)) {
			$path = to_Path($path);
		}
		unless(-e $path) {
			die "$path does not exist";
		}
		my $title = $path->basename;
		if(my $mime_type = $self->mime_types->mimeTypeOf($title)) {
			$title =~s/\..+$//;
			return {
				mime_type => $mime_type,
				source_fh => $path->openr,
				title => $title,
			};
		} else {
			return;
		}
	}

	has '+source' => (
		isa => Dir,
		coerce => 1,
	);
}

1;
