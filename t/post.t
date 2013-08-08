use warnings;
use strict;
use Test::More;
use Test::Mojo;

plan skip_all => 't/cgi-bin/postman' unless -x 't/cgi-bin/postman';

{
  use Mojolicious::Lite;
  plugin CGI => [ '/postman' => 't/cgi-bin/postman' ];
}

my $t = Test::Mojo->new;

$t->post_ok('/postman', {}, "some\ndata\n")
  ->status_is(200)
  ->content_is("--- some\n--- data\n");

done_testing;
