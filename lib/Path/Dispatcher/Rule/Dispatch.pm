package Path::Dispatcher::Rule::Dispatch;
# ABSTRACT: redispatch

our $VERSION = '1.08';

use Moo;
use MooX::TypeTiny;
use Type::Utils qw(class_type);

extends 'Path::Dispatcher::Rule';

has dispatcher => (
    is       => 'ro',
    isa      => class_type("Path::Dispatcher"),
    required => 1,
    handles  => ['rules', 'complete'],
);

sub match {
    my $self = shift;
    my $path = shift;

    my $dispatch = $self->dispatcher->dispatch($path);
    return $dispatch->matches;
}

__PACKAGE__->meta->make_immutable;
no Moo;

1;

__END__

=pod

=head1 SYNOPSIS

    my $dispatcher = Path::Dispatcher->new(
        rules => [
            Path::Dispatcher::Rule::Tokens->new(
                tokens => [ 'help' ],
                block  => sub { show_help },
            ),
            Path::Dispatcher::Rule::Tokens->new(
                tokens => [ 'quit' ],
                block  => sub { exit },
            ),
        ],
    );

    my $rule = Path::Dispatcher::Rule::Dispatch->new(
        dispatcher => $dispatcher,
    );

    $rule->run("help");

=head1 DESCRIPTION

Rules of this class use another dispatcher to match the path.

=head1 ATTRIBUTES

=head2 dispatcher

A L<Path::Dispatcher> object. Its matches will be returned by matching this
rule.

=cut

