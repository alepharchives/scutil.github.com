
%% @author John Haugeland <stonecypher@gmail.com>
%% @copyright 2007 - current John Haugeland, All Rights Reserved
%% @version $Revision$
%% @since Version 8

%% @doc <!-- google analytics --><script type="text/javascript">var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script><script type="text/javascript">var pageTracker = _gat._getTracker("UA-4903191-10");pageTracker._trackPageview();</script>
%% <p></p>



%% @reference <span style="padding:0.1em 0.4em;background-color:#eef;display:inline-block;width:47em"><span style="display:inline-block;width:18em">Website is</span><a href="http://scutil.com/">http://scutil.com/</a></span>
%% @reference <span style="padding:0.1em 0.4em;background-color:#efe;display:inline-block;width:47em"><span style="display:inline-block;width:18em">Author's Website</span><a href="http://fullof.bs">Full of BS</a></span>
%% @reference <span style="padding:0.1em 0.4em;background-color:#eef;display:inline-block;width:47em"><span style="display:inline-block;width:18em">This library is released under the</span><a href="http://scutil.com/license.html">MIT License</a></span>
%% @reference <span style="padding:0.1em 0.4em;background-color:#efe;display:inline-block;width:47em"><span style="display:inline-block;width:18em">This build was released</span><tt style="text-decoration:underline;background-color:#eee">$Date: 2009-04-05 16:16:32 -0600 (Sun, 05 Apr 2009) $</tt></span>

%% @todo add @see cross-references between related functions
%% @todo add thanks tables and cross-references
%% @todo add dependant libraries table
%% @todo add untested warnings to beginnings of @doc tags
%% @todo add defective warnings to beginnings of @doc tags
%% @todo add links to test data
%% @todo add sections to examples: descriptive text, code example, what's it for, related, thanks





-module(sc_correlate).

-author("John Haugeland <stonecypher@gmail.com>").
-webpage("http://scutil.com/").
-license( {mit_license, "http://scutil.com/license.html"} ).

-publicsvn("svn://crunchyd.com/scutil/").
-currentsource("http://crunchyd.com/release/scutil.zip").

-svn_id("$Id$").
-svn_head("$HeadURL$").
-svn_revision("$Revision$").

-description("The correlations section of the statistics package").

-testerl_export( { [], sc_stats_testsuite } ).  % todo needs test suite

-library_requirements([
]).





-export( [

  pearson/1,
    pearson/2,

  spearman/1,
    spearman/2,

  kendall/1,
    kendall/2

] ).





%% @todo use test data at http://changingminds.org/explanations/research/analysis/pearson.htm

%% @spec pearson(TupleList::coordlist()) -> { r, Correlation::number() }

%% @doc {@section Statistics} Compute the Pearson Correlation Coefficient of a list of coordinate tuples. ```1> sc_correlate:pearson([ {1,1}, {2,2}, {3,3}, {4,4}, {5,5} ]).
%% {r,1.0}
%%
%% 2> sc_correlate:pearson([ {1,5}, {2,4}, {3,3}, {4,2}, {5,1} ]).
%% {r,-1.0}
%%
%% 3> sc_correlate:pearson([ {1,3}, {2,3}, {3,3}, {4,3}, {5,3} ]).
%% {r,0.0}
%%
%% 4> sc_correlate:pearson([ {1,2}, {2,2.5}, {3,3}, {4,3.5}, {5,4} ]).
%% {r,1.0}
%%
%% 5> sc_correlate:pearson([ {1,2}, {2,2.4}, {3,3}, {4,3.6}, {5,4} ]).
%% {r,0.9970544855015818}'''
%%
%% @since Version 49

pearson(TupleList) when is_list(TupleList) ->

    {A,B} = lists:unzip(TupleList),
    pearson(A,B).



%% @equiv pearson(lists:zip(List1, List2))

pearson(List1, _) when length(List1) < 2 ->

    {r, 0.0};



pearson(List1, List2) when length(List1) /= length(List2) ->

    {error, lists_must_be_same_length};



pearson(List1, List2) when is_list(List1), is_list(List2) ->

    SumXY = lists:sum([A*B || {A,B} <- lists:zip(List1,List2) ]),   % the sum of the products of each matched pair

    SumX  = lists:sum(List1),
    SumY  = lists:sum(List2),

    SumXX = lists:sum([L*L || L<-List1]),                            % the sums of the squared items
    SumYY = lists:sum([L*L || L<-List2]),

    N     = length(List1),

    case math:sqrt(   ( (N*SumXX)-(SumX*SumX) )   *   ( (N*SumYY)-(SumY*SumY) )   ) of

        0 ->
            {r, 0.0};  % some nasty value sets otherwise cause divide by zero


        0.0 ->
            {r, 0.0};  % eg [ [1,1,1,1,1], [1,1,2,1,2] ]

        Denom ->
          Numer = (N*SumXY) - (SumX * SumY),
          {r, (Numer/Denom)}

    end.





%% @todo use test data at http://geographyfieldwork.com/SpearmansRank.htm

%% @spec spearman(TupleList::coordlist()) -> { rsquared, Correlation::number() }

%% @doc {@section Statistics} Compute the Spearman's Rank Correlation Coefficient of a list of coordinate tuples. ```1> scutil:spearman([ {1,1}, {2,2}, {3,3}, {4,4}, {5,5} ]).
%% {rsquared,1.0}
%%
%% 2> scutil:spearman([ {1,5}, {2,4}, {3,3}, {4,2}, {5,1} ]).
%% {rsquared,-1.0}
%%
%% 3> scutil:spearman([ {1,3}, {2,3}, {3,3}, {4,3}, {5,3} ]).
%% {rsquared,0.5}
%%
%% 4> scutil:spearman([ {1,2}, {2,2.5}, {3,3}, {4,3.5}, {5,4} ]).
%% {rsquared,1.0}
%%
%% 5> scutil:spearman([ {1,2}, {2,2.4}, {3,3}, {4,3.6}, {5,4} ]).
%% {rsquared,1.0}'''

%% @since Version 50

spearman(TupleList) when is_list(TupleList) ->

    {A,B} = lists:unzip(TupleList),
    spearman(A,B).




%% @equiv spearman(lists:zip(List1, List2))

spearman(List1, _) when length(List1) < 2 ->

    {rsquared, 0.0};



spearman(List1, List2) when length(List1) /= length(List2) ->

    {error, lists_must_be_same_length};



spearman(List1, List2) when is_list(List1), is_list(List2) ->

    {TR1,_} = lists:unzip(sc_rank:simple(List1)),
    {TR2,_} = lists:unzip(sc_rank:simple(List2)),

    Numerator   = 6 * lists:sum([ (D1-D2)*(D1-D2) || {D1,D2} <- lists:zip(TR1,TR2) ]),
    Denominator = math:pow(length(List1),3)-length(List1),

    {rsquared, 1-(Numerator/Denominator) }.





%% @todo use test data at http://changingminds.org/explanations/research/analysis/kendall.htm

%% @spec kendall(TupleList::coordlist()) -> { tau, Correlation::number() }

%% @doc {@section Statistics} Compute the Kendall Tau Rank Correlation Coefficient of a list of coordinate tuples. ```1> scutil:kendall([ {1,1}, {2,2}, {3,3}, {4,4}, {5,5} ]).
%% {tau,1.0}
%%
%% 2> scutil:kendall([ {1,5}, {2,4}, {3,3}, {4,2}, {5,1} ]).
%% {tau,-1.0}
%%
%% 3> scutil:kendall([ {1,3}, {2,3}, {3,3}, {4,3}, {5,3} ]).
%% {tau,1.0}
%%
%% 4> scutil:kendall([ {1,2}, {2,2.5}, {3,3}, {4,3.5}, {5,4} ]).
%% {tau,1.0}
%%
%% 5> scutil:kendall([ {1,2}, {2,2.4}, {3,3}, {4,3.6}, {5,4} ]).
%% {tau,1.0}'''

%% @since Version 51

kendall(TupleList) when is_list(TupleList) ->

    {A,B} = lists:unzip(TupleList),
    kendall(A,B).



%% @equiv kendall(lists:zip(List1, List2))

kendall(List1, _) when length(List1) < 2 ->

    {tau, 0.0};



kendall(List1, List2) when length(List1) /= length(List2) ->

    {error, lists_must_be_same_length};



kendall(List1, List2) when is_list(List1), is_list(List2) ->

    {RA,_} = lists:unzip(.sc.stats.ranks:ordered_ranks_of(List1)),
    {RB,_} = lists:unzip(.sc.stats.ranks:ordered_ranks_of(List2)),

    Ordering = lists:keysort(1, lists:zip(RA,RB)),
    {_,OrdB} = lists:unzip(Ordering),

    N = length(List1),
    P = lists:sum(kendall_right_of(OrdB, [])),

    {tau, -(( (4*P) / (N * (N - 1))) - 1) }.





%% @private

kendall_right_of([], Work) ->

    lists:reverse(Work);



kendall_right_of([F|R], Work) ->

    kendall_right_of(R, [kendall_right_of_item(F,R)]++Work).



kendall_right_of_item(B, Rem) ->

    length([R || R <- Rem, R < B]).