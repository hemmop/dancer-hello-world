use strict;
use warnings;

use Test::More;
use Plack::Test;
use HTTP::Request::Common;

use default;

my $app = default->to_app;
is ref $app, 'CODE', 'Got app';

my $test = Plack::Test->create($app);
my $res  = $test->request(GET '/');

ok $res->is_success, '[GET /] successful';
is $res->content, 'Hello World!', 'Got right content';

done_testing;
