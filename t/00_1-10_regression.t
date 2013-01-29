#########################

use Test::More tests => 59;

#########################

# use
# exports explode and notify (and nothing else) by default
{
    package t::Carp::Notify::a;

    ::use_ok( 'Carp::Notify' );

    my %symtable = %t::Carp::Notify::a::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::a::explode,
            notify => *t::Carp::Notify::a::notify,
        },
        '...::a symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::a::explode,
        '==',
        \&Carp::Notify::explode,
        '...::a explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::a::notify,
        '==',
        \&Carp::Notify::notify,
        '...::a notify came from where we expect',
    );
}

# exports even if passed nothing, e.g. qw()
# this contrary to normal conventions, but is the original module behaviour
# consider making these tests pass on TODO as a step towards correcting the bad behavior
{
    package t::Carp::Notify::b;

    ::use_ok( 'Carp::Notify', qw() );

    my %symtable = %t::Carp::Notify::b::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::b::explode,
            notify => *t::Carp::Notify::b::notify,
        },
        '...::b symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::b::explode,
        '==',
        \&Carp::Notify::explode,
        '...::b explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::b::notify,
        '==',
        \&Carp::Notify::notify,
        '...::b notify came from where we expect',
    );
}

# exports croak, carp, make_storable, and make_unstorable when asked
# make the explode and notify tests pass on TODOs
{
    package t::Carp::Notify::c;

    ::use_ok( 'Carp::Notify', qw(croak) );

    my %symtable = %t::Carp::Notify::c::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::c::explode,
            notify => *t::Carp::Notify::c::notify,
            'croak' => *t::Carp::Notify::c::croak,
        },
        '...::c symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::c::explode,
        '==',
        \&Carp::Notify::explode,
        '...::c explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::c::notify,
        '==',
        \&Carp::Notify::notify,
        '...::c notify came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::c::croak,
        '==',
        \&Carp::Notify::explode,
        '...::c croak came from where we expect',
    );
}
{
    package t::Carp::Notify::d;

    ::use_ok( 'Carp::Notify', qw(carp) );

    my %symtable = %t::Carp::Notify::d::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::d::explode,
            notify => *t::Carp::Notify::d::notify,
            'carp' => *t::Carp::Notify::d::carp,
        },
        '...::d symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::d::explode,
        '==',
        \&Carp::Notify::explode,
        '...::d explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::d::notify,
        '==',
        \&Carp::Notify::notify,
        '...::d notify came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::d::carp,
        '==',
        \&Carp::Notify::notify,
        '...::d carp came from where we expect',
    );
}
{
    package t::Carp::Notify::e;

    ::use_ok( 'Carp::Notify', qw(make_storable) );

    my %symtable = %t::Carp::Notify::e::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::e::explode,
            notify => *t::Carp::Notify::e::notify,
            make_storable => *t::Carp::Notify::e::make_storable,
        },
        '...::e symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::e::explode,
        '==',
        \&Carp::Notify::explode,
        '...::e explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::e::notify,
        '==',
        \&Carp::Notify::notify,
        '...::e notify came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::e::make_storable,
        '==',
        \&Carp::Notify::make_storable,
        '...::e make_storable came from where we expect',
    );
}
{
    package t::Carp::Notify::f;

    ::use_ok( 'Carp::Notify', qw(make_unstorable) );

    my %symtable = %t::Carp::Notify::f::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::f::explode,
            notify => *t::Carp::Notify::f::notify,
            make_unstorable => *t::Carp::Notify::f::make_unstorable,
        },
        '...::f symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::f::explode,
        '==',
        \&Carp::Notify::explode,
        '...::f explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::f::notify,
        '==',
        \&Carp::Notify::notify,
        '...::f notify came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::f::make_unstorable,
        '==',
        \&Carp::Notify::make_unstorable,
        '...::f make_unstorable came from where we expect',
    );
}
{
    package t::Carp::Notify::g;

    ::use_ok( 'Carp::Notify', qw(croak carp make_storable make_unstorable) );

    my %symtable = %t::Carp::Notify::g::;
    delete $symtable{BEGIN};
    delete $symtable{TODO};

    ::is_deeply(
        \%symtable,
        {
            explode => *t::Carp::Notify::g::explode,
            notify => *t::Carp::Notify::g::notify,
            'croak' => *t::Carp::Notify::g::croak,
            'carp' => *t::Carp::Notify::g::carp,
            make_storable => *t::Carp::Notify::g::make_storable,
            make_unstorable => *t::Carp::Notify::g::make_unstorable,
        },
        '...::g symbol table',
    );

    ::cmp_ok(
        \&t::Carp::Notify::g::explode,
        '==',
        \&Carp::Notify::explode,
        '...::g explode came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::g::notify,
        '==',
        \&Carp::Notify::notify,
        '...::g notify came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::g::croak,
        '==',
        \&Carp::Notify::explode,
        '...::g croak came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::g::carp,
        '==',
        \&Carp::Notify::notify,
        '...::g carp came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::g::make_storable,
        '==',
        \&Carp::Notify::make_storable,
        '...::g make_storable came from where we expect',
    );
    ::cmp_ok(
        \&t::Carp::Notify::g::make_unstorable,
        '==',
        \&Carp::Notify::make_unstorable,
        '...::g make_unstorable came from where we expect',
    );
}

# adds variables to the storable list on import
# store_vars
# make_storable
# make_unstorable
#
# in v1.10 make_storable and make_unstorable operate on a differnt data
# storage variable than store_vars (and the add via import mechanism) use
#
# retrieving $, @, %, and & variables from multiple packages
{
    package t::Carp::Notify::h;

    use vars qw(
        $var_1
        @var_1
        %var_1
        $var_2
        @var_2
        %var_2
    );

    $var_1 = 'contents of $var_1';
    @var_1 = qw(contents of @var_1);
    %var_1 = ( contents => 'of', '%var_1' => 'value' );
    $var_2 = 'contents of $var_2';
    @var_2 = qw(contents of @var_2);
    %var_2 = ( contents => 'of', '%var_2' => 'value' );

    sub func_1 {
        return 'func_1 return value';
    }

    sub func_2 {
        return 'func_2 return value';
    }

    sub get_store_vars {
        # work around the caller(1)[0] in store_vars to find the package
        return Carp::Notify::store_vars();
    }

    ::use_ok('Carp::Notify', qw($var_1 @var_1 %var_1 &func_1));

    my $store_return = get_store_vars();

    ::ok( $store_return, 'store_vars returned a value' );

    ::like(
        $store_return,
        qr/\$t::Carp::Notify::h::var_1 : contents of \$var_1/,
        'store_vars returns $var_1 contents'
    );
    ::like(
        $store_return,
        qr/\@t::Carp::Notify::h::var_1 : \(contents of \@var_1\)/,
        'store_vars returns @var_1 contents'
    );
    ::like(
        $store_return,
        qr/\%t::Carp::Notify::h::var_1 :\s+contents => of\s+\%var_1 => value/s,
        'store_vars returns %var_1 contents'
    );
    ::like(
        $store_return,
        qr/\&t::Carp::Notify::h::func_1 : func_1 return value/,
        'store_vars returns &func_1 return value'
    );

    # store_vars modifies the list of "stored" variables to make them
    # unsuitable for repeated calls to store_vars
    $store_return = get_store_vars();

    ::is( $store_return, '' );
}
{
    package t::Carp::Notify::i;

    use vars qw(
        $var_1
        @var_1
        %var_1
        $var_2
        @var_2
        %var_2
    );

    $var_1 = 'contents of $var_1';
    @var_1 = qw(contents of @var_1);
    %var_1 = ( contents => 'of', '%var_1' => 'value' );
    $var_2 = 'contents of $var_2';
    @var_2 = qw(contents of @var_2);
    %var_2 = ( contents => 'of', '%var_2' => 'value' );

    sub func_1 {
        return 'func_1 return value';
    }

    sub func_2 {
        return 'func_2 return value';
    }

    sub get_store_vars {
        # work around the caller(1)[0] in store_vars to find the package
        return Carp::Notify::store_vars();
    }

    ::use_ok('Carp::Notify', qw($var_1 @var_1 %var_1 &func_1));

    ::ok(
        Carp::Notify::make_storable(
            qw(
                $t::Carp::Notify::h::var_2
                @t::Carp::Notify::h::var_2
                %t::Carp::Notify::h::var_2
                &t::Carp::Notify::h::func_2
            ),
        ),
        'make_storable returns true'
    );

    ::ok(
        Carp::Notify::make_unstorable(
            qw(
                $t::Carp::Notify::h::var_1
                @t::Carp::Notify::h::var_1
                %t::Carp::Notify::h::var_1
                &t::Carp::Notify::h::func_1
            ),
        ),
        'make_unstorable returns true'
    );

    $store_return = get_store_vars();

    ::ok( $store_return, 'store_vars returned a value' );

    ::like(
        $store_return,
        qr/\$t::Carp::Notify::i::var_1 : contents of \$var_1/,
        'store_vars STILL returns $var_1 contents'
    );
    ::like(
        $store_return,
        qr/\@t::Carp::Notify::i::var_1 : \(contents of \@var_1\)/,
        'store_vars STILL returns @var_1 contents'
    );
    ::like(
        $store_return,
        qr/\%t::Carp::Notify::i::var_1 :\s+contents => of\s+\%var_1 => value/s,
        'store_vars STILL returns %var_1 contents'
    );
    ::like(
        $store_return,
        qr/\&t::Carp::Notify::i::func_1 : func_1 return value/,
        'store_vars STILL returns &func_1 return value'
    );
}

# today
{
    my $t1 = time;
    my ($sec1, $min1, $hour1, $mday1, $mon1, $year1, $wday1, $yday1, $isdst1) = localtime();
    my $c_n_today = Carp::Notify::today();
    my ($sec2, $min2, $hour2, $mday2, $mon2, $year2, $wday2, $yday2, $isdst2) = localtime();
    my $t2 = time;

    ok(
        # note that the numbers in the returned string are validated as being
        # zero-padded by this regex, so it won't be repeated later
        $c_n_today =~ /^(\w\w\w), (\d\d) (\w\w\w) (\d\d\d\d) (\d\d):(\d\d):(\d\d) ([+-])(\d\d\d\d)$/,
        'Carp::Notify::today matches basic pattern',
    );

    my(
        $c_n_dow,
        $c_n_mday,
        $c_n_mon,
        $c_n_yr,
        $c_n_hh,
        $c_n_mm,
        $c_n_ss,
        $c_n_off_dir,
        $c_n_off_amt,
    ) = ( $1, $2, $3, $4, $5, $6, $7, $8, $9 );

    # see which localtime capture is free of boundary wraps when compared to
    # the timestamp that Carp::Notify::today used
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);
    my $time_check_skip = 0;

    if( $t1 == $t2 ) {
        # it doesn't matter which one we use since we know that my time info
        # and Carp::Notify:today's time info came for the same second, so we
        # can be sure that there aren't any messy boundary conditions to
        # worry about.
        ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
            = ($sec1, $min1, $hour1, $mday1, $mon1, $year1, $wday1, $yday1, $isdst1);
    }
    elsif( $min1 == $c_n_min ) {
        # a minute boundary wrap is necessary before any other boundaries can
        # wrap, so if the minute didn't wrap then we're good with the first
        # set of captured time information
        ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
            = ($sec1, $min1, $hour1, $mday1, $mon1, $year1, $wday1, $yday1, $isdst1);
    }
    elsif( $min2 == $c_n_min ) {
        # a minute boundary wrap is necessary before any other boundaries can
        # wrap, so if the minute didn't wrap then we're good with the second
        # set of captured time information
        ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
            = ($sec2, $min2, $hour2, $mday2, $mon2, $year2, $wday2, $yday2, $isdst2);
    }
    else {
        # this must be a REALLY slow system for BOTH of my localtime data
        # captures to be in different minutes than the time that
        # Carp::Notify::today used...
        # OR maybe there's just something odd going on with the system clock.
        $time_check_skip = 1;
    }

    SKIP: {
        ::skip 'System time moving too fast', 6 if $time_check_skip;
        # don't bother checking the seconds...
        ::cmp_ok( $min, '==', $c_n_mm, 'Carp::Notify::today, minutes match' );
        ::cmp_ok( $hour, '==', $c_n_hh, 'Carp::Notify::today, hours match' );
        ::cmp_ok( $mday, '==', $c_n_mday, 'Carp::Notify::today, mday matches' );
        ::is(
            $mon,
            {
                Jan => 0, Feb => 1, Mar => 2, Apr => 3,
                May => 4, Jun => 5, Jul => 6, Aug => 7,
                Sep => 8, Oct => 9, Nov => 10, Dec => 11,
            }->{$c_n_mon},
            'Carp::Notify::today, month matches',
        );
        ::cmp_ok(
            $year,
            '==',
            ( $c_n_yr - 1900 - 1900 ),
            'Carp::Notify::today, year matches (with 1900 extra years)',
        );
        ::is(
            $wday,
            {
                Sun => 0, Mon => 1, Tue => 2, Wed => 3,
                Thu => 4, Fri => 5, Sat => 6,
            }->{$c_n_dow},
            'Carp::Notify::today, dow matches',
        );
    }

    SKIP: {
        ::skip 'GMT offset checking not practical', 1 if 1;
    }
}

# setting defaults on use

# store_env

# stack_trace

# log_it

# simple_smtp_mailer

# error

# notify/explode
# email_it
# log_it (log_file,explode_log,notify_log)
# log_explode
# log_notify
# store_vars
# stack_trace
# store_env
# die_to_stdout
# die_to_everywhere
# die_quietly
# error_function
# death_function
# death_message

