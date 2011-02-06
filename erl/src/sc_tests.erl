
%% @author John Haugeland <stonecypher@gmail.com>
%% @copyright 2011 John Haugeland
%% @version $Revision$
%% @doc scutil test set.

-module(sc_tests).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").





extrema_test_() ->

    { "Extrema tests", [

        {"1,2,3,4",    ?_assert( {1,4}      =:= sc:extrema( [1,2,3,4]  ) ) },
        {"-1,-2,-3",   ?_assert( {-3,-1}    =:= sc:extrema( [-1,-2,-3] ) ) },
        {"-1.1,0,1.1", ?_assert( {-1.1,1.1} =:= sc:extrema( [-1.1,1.1] ) ) },
        {"a,b,c",      ?_assert( {a,c}      =:= sc:extrema( [a,b,c]    ) ) },
        {"1,a,{}",     ?_assert( {1,{}}     =:= sc:extrema( [1,a,{}]   ) ) },
        {"1",          ?_assert( {1,1}      =:= sc:extrema( [1]        ) ) },

        {"[] error badarg", ?_assertError(badarg, sc:extrema([]) ) }

    ] }.





key_duplicate_test_() ->

    { "Key duplicate tests", [

        {"[ ]",             ?_assert( []          =:= sc:key_duplicate([ ])             ) },
        {"[ {2,a} ]",       ?_assert( [a,a]       =:= sc:key_duplicate([ {2,a} ])       ) },
        {"[ {2,a},{3,b} ]", ?_assert( [a,a,b,b,b] =:= sc:key_duplicate([ {2,a},{3,b} ]) ) }

    ] }.





rotate_list_test_() ->

    { "Rotate list tests", [

        {"0,  [ ]",       ?_assert( []      =:= sc:rotate_list(0,  [ ])       ) },
        {"1,  [ ]",       ?_assert( []      =:= sc:rotate_list(1,  [ ])       ) },
        {"-1, [ ]",       ?_assert( []      =:= sc:rotate_list(-1, [ ])       ) },

        {"0,  [ a,b,c ]", ?_assert( [a,b,c] =:= sc:rotate_list(0,  [ a,b,c ]) ) },
        {"1,  [ a,b,c ]", ?_assert( [b,c,a] =:= sc:rotate_list(1,  [ a,b,c ]) ) },
        {"-1, [ a,b,c ]", ?_assert( [c,a,b] =:= sc:rotate_list(-1, [ a,b,c ]) ) },
        {"3,  [ a,b,c ]", ?_assert( [a,b,c] =:= sc:rotate_list(3,  [ a,b,c ]) ) },
        {"-3, [ a,b,c ]", ?_assert( [a,b,c] =:= sc:rotate_list(-3, [ a,b,c ]) ) },
        {"9,  [ a,b,c ]", ?_assert( [a,b,c] =:= sc:rotate_list(9,  [ a,b,c ]) ) }

    ] }.





index_of_first_test_() ->

    { "Index of first tests", [

        {"0,  [ ]",       ?_assert( undefined =:= sc:index_of_first(0, [ ])       ) },
        {"b,  [ a,b,c ]", ?_assert( 2         =:= sc:index_of_first(b, [ a,b,c ]) ) },
        {"g,  [ a,b,c ]", ?_assert( undefined =:= sc:index_of_first(g, [ a,b,c ]) ) }

    ] }.





rotate_to_first_test_() ->

    { "Rotate to first tests", [

        {"3, [1,2,3,4]", ?_assert( [3,4,1,2] =:= sc:rotate_to_first( 3, [1,2,3,4]  ) ) },
        {"4, [1,2,3,4]", ?_assert( [4,1,2,3] =:= sc:rotate_to_first( 4, [1,2,3,4]  ) ) },
        {"1, [1,2,3,4]", ?_assert( [1,2,3,4] =:= sc:rotate_to_first( 1, [1,2,3,4]  ) ) },

        {"f, [1,2,3,4]", ?_assert( no_such_element =:= sc:rotate_to_first( f, [1,2,3,4]  ) ) }

    ] }.





rotate_to_last_test_() ->

    { "Rotate to last tests", [

        {"3, [1,2,3,4]", ?_assert( [4,1,2,3] =:= sc:rotate_to_last( 3, [1,2,3,4]  ) ) },
        {"1, [1,2,3,4]", ?_assert( [2,3,4,1] =:= sc:rotate_to_last( 1, [1,2,3,4]  ) ) },
        {"4, [1,2,3,4]", ?_assert( [1,2,3,4] =:= sc:rotate_to_last( 4, [1,2,3,4]  ) ) },

        {"f, [1,2,3,4]", ?_assert( no_such_element =:= sc:rotate_to_last( f, [1,2,3,4]  ) ) }

    ] }.





flag_sets_test_() ->

    { "Flag sets tests", [

        {"[1,2,3]",  ?_assert( [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]  =:= sc:flag_sets( [1,2,3] )  ) },
        {"[1]",      ?_assert( [[],[1]]                                    =:= sc:flag_sets( [1] )      ) },
        {"[]",       ?_assert( [[]]                                        =:= sc:flag_sets( [] )       ) },
        {"[{[{}]}]", ?_assert( [[],[{[{}]}]]                               =:= sc:flag_sets( [{[{}]}] ) ) }

    ] }.





member_sets_test_() ->

    { "Member sets tests", [

        {"[]",                           ?_assert( [[]]                         =:= sc:member_sets( [] )                           ) },
        {"[ [] ]",                       ?_assert( [[]]                         =:= sc:member_sets( [ [] ] )                       ) },
        {"[ [1],[2,3] ]",                ?_assert( [[1,2],[1,3]]                =:= sc:member_sets( [ [1],[2,3] ] )                ) },
        {"[ [1],[2,3] ], no_absence",    ?_assert( [[1,2],[1,3]]                =:= sc:member_sets( [ [1],[2,3] ], no_absence )    ) },
        {"[ [1],[2,3] ], allow_absence", ?_assert( [[],[2],[3],[1],[1,2],[1,3]] =:= sc:member_sets( [ [1],[2,3] ], allow_absence ) ) }

    ] }.





