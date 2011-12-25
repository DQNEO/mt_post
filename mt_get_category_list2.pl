#!/usr/bin/perl

use strict;
use warnings;
use RPC::XML::Client;
use Encode;

my $cgi_url = 'http://example.com/mt/mt-xmlrpc.cgi';
my $blog_id = 5;
my $username = 'hoge';  # MTのログインユーザ名
my $password  = 'fuga';  # MTのログインパスワード

my $cli = RPC::XML::Client->new($cgi_url);
my $res = $cli->send_request('mt.getCategoryList', $blog_id, $username, $password);
my $categories = $res;

#print Dumper $res;

for my $category (@$categories) {
    print encode('utf8', $category->{categoryId}->value ." ". $category->{categoryName}->value . "\n");
}

