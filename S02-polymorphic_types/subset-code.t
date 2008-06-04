use v6;
use Test;
plan 4;

=begin description

Test for 'subset' with a closure

=end description

# L<S02/Polymorphic types/"Fancier type constraints may be expressed through a subtype">

subset Even of Int where { $_ % 2 == 0 };

{
    my Even $x = 2;
    is $x, 2, 'Can assign value to a type variable with subset';
};

eval_dies_ok  'my Even $x = 3',
              "Can't assing value that violates type constraint via subst";

{
    ok 2 ~~ Even,  'Can smartmatch against subsets 1';
    ok 3 !~~ Even, 'Can smartmatch against subsets 2';
}


# vim: ft=perl6
