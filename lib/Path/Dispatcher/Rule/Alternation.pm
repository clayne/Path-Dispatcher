package Path::Dispatcher::Rule::Alternation;
# ABSTRACT: any rule must match

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
        return {} if $rule->match($path);
    }

    return;
}

sub complete {
    my $self = shift;

    return map { $_->complete(@_) } $self->rules;
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

