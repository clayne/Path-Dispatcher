package Path::Dispatcher::Rule::Intersection;
# ABSTRACT: all rules must match

our $VERSION = '1.08';

use Moo;
extends 'Path::Dispatcher::Rule';

with 'Path::Dispatcher::Role::Rules';

sub _match {
    my $self = shift;
    my $path = shift;

    my @rules = $self->rules;
    return if @rules == 0;

    for my $rule (@rules) {
        return unless $rule->match($path);
    }

    return {};
}

__PACKAGE__->meta->make_immutable;
no Moo;

1;

__END__

=pod

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 rules

=cut

