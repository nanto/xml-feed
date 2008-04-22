# $Id: Content.pm 937 2004-10-04 03:38:11Z btrott $

package XML::Feed::Content;
use strict;

use base qw( Class::ErrorHandler );

sub wrap {
    my $class = shift;
    my($c) = @_;
    bless { %$c }, $class;
}

sub _var {
    my $content = shift;
    my $var = shift;
    $content->{$var} = shift if @_;
    $content->{$var};
}

sub type { shift->_var('type', @_) }
sub body { shift->_var('body', @_) }

1;
__END__

=head1 NAME

XML::Feed::Content - Wrapper for content objects

=head1 SYNOPSIS

    my $content = $entry->content;
    print $content->body;

=head1 DESCRIPTION

I<XML::Feed::Content> represents a content object in an I<XML::Feed::Entry>
entry in a syndication feed. This could be a I<E<lt>descriptionE<gt>>
element in an RSS feed, a I<E<lt>contentE<gt>> element in an Atom feed,
etc. In other words, any element where knowing both the actual data and the
B<type> of data is useful.

=head1 USAGE

=head2 $content->body

The actual data.

=head2 $content->type

The MIME type of the content in I<body>.

This is really only useful in Atom feeds, because RSS feeds do not specify
the type of content included in an entry. In RSS feeds, generally the MIME
type defaults to I<text/html>.

=head1 AUTHOR & COPYRIGHT

Please see the I<XML::Feed> manpage for author, copyright, and license
information.

=cut
