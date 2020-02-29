package Path::Dispatcher::Rule::Always;
# ABSTRACT: always matches

use Moo;
extends 'Path::Dispatcher::Rule';

sub _match {
    my $self = shift;
    my $path = shift;

    return {
        leftover => $path->path,
    };
}

__PACKAGE__->meta->make_immutable;
no Moo;

1;

__END__

=pod

=head1 DESCRIPTION

Rules of this class always match. If a prefix match is requested, the full path
is returned as leftover.

=cut

