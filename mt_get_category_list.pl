#!/usr/bin/perl

use strict;
use warnings;
use XMLRPC::Lite;
use Encode;

# 下記のパラメータはあなたがお使いのMovableTypeの設定に応じて
# 変更してください。

# mt-xmlrpc.cgiのURL

my $cgi_url = 'http://example.com/mt/mt-xmlrpc.cgi';

# ブログID

my $blog_id = 5;

# MT管理画面にログインするときのアカウント
my $username = 'hoge';  # MTのログインユーザ名
my $password  = 'fuga';  # MTのログインパスワード

# XML-RPCを実行

my $categories = XMLRPC::Lite
    ->proxy($cgi_url)
    ->call('mt.getCategoryList', $blog_id, $username, $password)
    ->result;

for my $category (@$categories) {
    print encode('utf8', "$category->{categoryId}: $category->{categoryName}\n");
}
