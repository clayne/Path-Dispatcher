package Path::Dispatcher::Rule::Empty;
# ABSTRACT: matches only the empty path

our $VERSION = '1.09';

use Moo;
extends 'Path::Dispatcher::Rule';

sub _match {
    my $self = shift;
    my $path = shift;
    return if length $path->path;
    return { leftover => $path->path };
}

__PACKAGE__->meta->make_immutable;
no Moo;

1;

__END__

=pod

=head1 DESCRIPTION

Rules of this class match only the empty path.

=cut

