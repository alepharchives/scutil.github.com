
-module(cards).

-author("John Haugeland - stonecypher@gmail.com").
-webpage("http://scutil.com/").
-license( {mit_license, "http://scutil.com/license.html"} ).

-publicsvn("svn://crunchyd.com/scutil/").
-bugtracker(none).
-publicforum(none).

-svn_id("$Id$").
-svn_head("$HeadURL$").
-svn_revision("$Revision$").

-description("Deck management for card games.").

-testerl_export( { [], cards_testsuite } ).





-export( [

    mameluke_deck/0,
    french_deck/0,
    american_deck/0,
    german_deck/0,
    domino_deck/0,
    chinese_money_deck/0,
    piquet_deck/0,
    pinochle_deck/0,
    tarot_deck/0,
    doppelkopf_deck/0, doppelkopf_deck/1,
    euchre_deck/0,
    hungarian_deck/0,
    austrian_deck/0,
    mille_bornes_deck/0,
    swiss_deck/0,
    italian_deck/0,
    uno_deck/0

] ).





%% @spec mameluke_deck() -> list()

%% @doc One of the oldest decks of cards known, originating from Egypt; probably the point between Chinese Money Cards and the early European decks.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:mameluke_deck()).
%%    {1,polo_stick}         {1,coin}         {1,sword}         {1,cup}
%%    {2,polo_stick}         {2,coin}         {2,sword}         {2,cup}
%%    {3,polo_stick}         {3,coin}         {3,sword}         {3,cup}
%%    {4,polo_stick}         {4,coin}         {4,sword}         {4,cup}
%%    {5,polo_stick}         {5,coin}         {5,sword}         {5,cup}
%%    {6,polo_stick}         {6,coin}         {6,sword}         {6,cup}
%%    {7,polo_stick}         {7,coin}         {7,sword}         {7,cup}
%%    {8,polo_stick}         {8,coin}         {8,sword}         {8,cup}
%%    {9,polo_stick}         {9,coin}         {9,sword}         {9,cup}
%%   {10,polo_stick}        {10,coin}        {10,sword}        {10,cup}
%%  {duke,polo_stick}      {duke,coin}      {duke,sword}      {duke,cup}
%% {viceroy,polo_stick}   {viceroy,coin}   {viceroy,sword}   {viceroy,cup}
%%  {king,polo_stick}      {king,coin}      {king,sword}      {king,cup}
%% ok
%%
%% 3> length(cards:mameluke_deck()).
%% 52'''

%% @since Version 200

mameluke_deck() ->

   [ {Face,Suit} ||

       Face <- [1,2,3,4,5,6,7,8,9,10,duke,viceroy,king],
       Suit <- [polo_stick,coin,sword,cup]

   ].





%% @spec french_deck() -> list()

%% @doc The first standardized European card deck, also known as the Rouennais deck; does not feature jokers, and uses `knave' where many expect `jack'.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:french_deck()).
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {2,hearts}       {2,spades}       {2,diamonds}       {2,clubs}
%%   {3,hearts}       {3,spades}       {3,diamonds}       {3,clubs}
%%   {4,hearts}       {4,spades}       {4,diamonds}       {4,clubs}
%%   {5,hearts}       {5,spades}       {5,diamonds}       {5,clubs}
%%   {6,hearts}       {6,spades}       {6,diamonds}       {6,clubs}
%%   {7,hearts}       {7,spades}       {7,diamonds}       {7,clubs}
%%   {8,hearts}       {8,spades}       {8,diamonds}       {8,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {knave,hearts}   {knave,spades}   {knave,diamonds}   {knave,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%% ok
%%
%% 3> length(cards:french_deck()).
%% 52'''

%% @since Version 200

french_deck() ->

    [ {Face,Suit} ||

        Face <- [ace,2,3,4,5,6,7,8,9,10,knave,queen,king],
        Suit <- [hearts,spades,diamonds,clubs]

    ].





%% @spec american_deck() -> list()

%% @doc The world's most common deck, in use in most casinos, in North/South America, Australia, the UK and in parts of Japan and Hong Kong; features jokers.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:american_deck()).
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {2,hearts}       {2,spades}       {2,diamonds}       {2,clubs}
%%   {3,hearts}       {3,spades}       {3,diamonds}       {3,clubs}
%%   {4,hearts}       {4,spades}       {4,diamonds}       {4,clubs}
%%   {5,hearts}       {5,spades}       {5,diamonds}       {5,clubs}
%%   {6,hearts}       {6,spades}       {6,diamonds}       {6,clubs}
%%   {7,hearts}       {7,spades}       {7,diamonds}       {7,clubs}
%%   {8,hearts}       {8,spades}       {8,diamonds}       {8,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {jack,hearts}    {jack,spades}    {jack,diamonds}    {jack,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%%  {joker,big}     {joker,little}
%% ok
%%
%% 3> length(cards:american_deck()).
%% 54'''

%% @since Version 200

american_deck() ->

    [ {Face,Suit} ||

        Face <- [ace,2,3,4,5,6,7,8,9,10,jack,queen,king],
        Suit <- [hearts,spades,diamonds,clubs]

    ] ++ [ {joker,big}, {joker,little} ].





%% @spec german_deck() -> list()

%% @doc The deck used in most of Germany; uses different suits than American decks, and has jokers.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:german_deck()).
%%  {ace,hearts}     {ace,bells}      {ace,leaves}     {ace,acorns}
%%   {2,hearts}       {2,bells}        {2,leaves}       {2,acorns}
%%   {3,hearts}       {3,bells}        {3,leaves}       {3,acorns}
%%   {4,hearts}       {4,bells}        {4,leaves}       {4,acorns}
%%   {5,hearts}       {5,bells}        {5,leaves}       {5,acorns}
%%   {6,hearts}       {6,bells}        {6,leaves}       {6,acorns}
%%   {7,hearts}       {7,bells}        {7,leaves}       {7,acorns}
%%   {8,hearts}       {8,bells}        {8,leaves}       {8,acorns}
%%   {9,hearts}       {9,bells}        {9,leaves}       {9,acorns}
%%  {10,hearts}       {10,bells}      {10,leaves}      {10,acorns}
%% {jack,hearts}     {jack,bells}    {jack,leaves}    {jack,acorns}
%% {queen,hearts}   {queen,bells}    {queen,leaves}   {queen,acorns}
%% {king,hearts}     {king,bells}    {king,leaves}    {king,acorns}
%%  {joker,big}     {joker,little}
%% ok
%%
%% 3> length(cards:german_deck()).
%% 54'''

%% @since Version 200

german_deck() ->

    [ {Face,Suit} ||

        Face <- [ace,2,3,4,5,6,7,8,9,10,jack,queen,king],
        Suit <- [hearts,bells,leaves,acorns]

    ] ++ [ {joker,big}, {joker,little} ].





%% @spec domino_deck() -> list()

%% @doc The domino deck, or 1-6 pair deck has been used by many cultures but is first found in Chinese culture.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:domino_deck()).
%% {1,1}   {1,2}   {1,3}   {1,4}
%% {1,5}   {1,6}   {2,2}   {2,3}
%% {2,4}   {2,5}   {2,6}   {3,3}
%% {3,4}   {3,5}   {3,6}   {4,4}
%% {4,5}   {4,6}   {5,5}   {5,6}
%% {6,6}
%% ok
%%
%% 3> length(cards:domino_deck()).
%% 21'''

%% @since Version 200

domino_deck() ->

    [ {A,B} ||

        A <- [1,2,3,4,5,6],
        B <- [1,2,3,4,5,6],

        A =< B

    ].





%% @spec chinese_money_deck() -> list()

%% @doc One of the oldest decks of cards known, originating from China; predates all other known decks except domino decks.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:chinese_money_deck()).
%%      {2,coins}        {2,strings}   {2,myriads}   {2,tens_of_myriads}
%%      {3,coins}        {3,strings}   {3,myriads}   {3,tens_of_myriads}
%%      {4,coins}        {4,strings}   {4,myriads}   {4,tens_of_myriads}
%%      {5,coins}        {5,strings}   {5,myriads}   {5,tens_of_myriads}
%%      {6,coins}        {6,strings}   {6,myriads}   {6,tens_of_myriads}
%%      {7,coins}        {7,strings}   {7,myriads}   {7,tens_of_myriads}
%%      {8,coins}        {8,strings}   {8,myriads}   {8,tens_of_myriads}
%%      {9,coins}        {9,strings}   {9,myriads}   {9,tens_of_myriads}
%% {1,tens_of_myriads}
%% ok
%%
%% 3> length(cards:chinese_money_deck()).
%% 33'''

%% @since Version 200

chinese_money_deck() ->

    [ {Value,Suit} ||

        Value <- [2,3,4,5,6,7,8,9],
        Suit  <- [coins,strings,myriads,tens_of_myriads]

    ] ++ [{1,tens_of_myriads}].   % that's right, 2-9 in each suit except tens, which is 1-9.





%% @spec piquet_deck() -> list()

%% @doc A modern French specialty game deck (a subset of the normal deck).  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:piquet_deck()).
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {7,hearts}       {7,spades}       {7,diamonds}       {7,clubs}
%%   {8,hearts}       {8,spades}       {8,diamonds}       {8,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {knave,hearts}   {knave,spades}   {knave,diamonds}   {knave,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%% ok
%%
%% 3> length(cards:piquet_deck()).
%% 32'''

%% @since Version 200

piquet_deck() ->

    [ {Face,Suit} ||

        Face <- [ace,7,8,9,10,knave,queen,king],
        Suit <- [hearts,spades,diamonds,clubs]

    ].





%% @spec pinochle_deck() -> list()

%% @doc A specialty American deck featuring two copies each of the cards ace and nine through king inclusive from the American standard deck.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:pinochle_deck()).
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {jack,hearts}    {jack,spades}    {jack,diamonds}    {jack,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {jack,hearts}    {jack,spades}    {jack,diamonds}    {jack,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%% ok
%%
%% 3> length(cards:pinochle_deck()).
%% 48'''

%% @since Version 200

pinochle_deck() ->

    lists:flatten(
        lists:duplicate(2,

            [ {Face,Suit} ||

                Face <- [ace,9,10,jack,queen,king],
                Suit <- [hearts,spades,diamonds,clubs]

            ]

        )
    ).





%% @spec tarot_deck() -> list()

%% @doc The standard (tarot de Marseilles) tarot divination deck, with 78 cards between minor arcana, major arcana and the fool.  ```1> Show = fun(Cards) -> io:format("~s~n",[scutil:columnated_text(Cards, [{columns,4}])]) end.
%% #Fun<erl_eval.6.13229925>
%%
%% 2> Show(cards:pinochle_deck()).
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {jack,hearts}    {jack,spades}    {jack,diamonds}    {jack,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%%  {ace,hearts}     {ace,spades}     {ace,diamonds}     {ace,clubs}
%%   {9,hearts}       {9,spades}       {9,diamonds}       {9,clubs}
%%  {10,hearts}      {10,spades}      {10,diamonds}      {10,clubs}
%% {jack,hearts}    {jack,spades}    {jack,diamonds}    {jack,clubs}
%% {queen,hearts}   {queen,spades}   {queen,diamonds}   {queen,clubs}
%% {king,hearts}    {king,spades}    {king,diamonds}    {king,clubs}
%% ok
%%
%% 3> length(cards:pinochle_deck()).
%% 48'''

%% @since Version 200

tarot_deck() ->

    [ {Face,Suit} ||
        Face <- [ace,2,3,4,5,6,7,8,9,10,jack,knight,queen,king],
        Suit <- [hearts,spades,diamonds,clubs]
    ] ++

    [ {major,X} ||
        X <- lists:seq(1,21)
    ] ++

    [{the_fool,0}].





%% @equiv doppelkopf_deck(nines)
%% @since Version 200
doppelkopf_deck() ->

    doppelkopf_deck(nines).


%% @since Version 200
doppelkopf_deck(nines) ->

    [ {Face,Suit} ||

        Face <- [ace,9,10,jack,queen,king],
        Suit <- [hearts,bells,leaves,acorns]

    ];


doppelkopf_deck(no_nines) ->

    [ {Face,Suit} ||

        Face <- [ace,10,jack,queen,king],
        Suit <- [hearts,bells,leaves,acorns]

    ].





%% @since Version 200
hungarian_deck() -> 

    [ {Face,Suit} || 
    
        Face <- [vii,viii,ix,x,under,over,king,ace], 
        Suit <- [hearts,bells,leaves,acorns] 
        
    ].





%% @since Version 200
austrian_deck() -> 

    [ {Face,Suit} || 
    
        Face <- [vi,vii,viii,ix,x,under,over,king,ace], 
        Suit <- [hearts,bells,leaves,acorns] 
        
    ].





%% @since Version 200
swiss_deck() -> 

    [ {Face,Suit} || 
    
         Face <- [6,7,8,9,banner,under,over,king,ace], 
         Suit <- [roses,bells,acorns,shields] 
         
    ].





%% @since Version 200
italian_deck() -> 

    [ {Face,Suit} || 
    
        Face <- [ace,2,3,4,5,6,7,infantry,cavalry,king], 
        Suit <- [coins,swords,cups,clubs] 
        
    ].





%% @since Version 200
euchre_deck() -> 

    [ {Face,Suit} || 
    
        Face <- [9,10,jack,queen,king,ace], 
        Suit <- [hearts,spades,diamonds,clubs]

    ].





%% @since Version 200
mille_bornes_deck() -> 

    scutil:key_duplicate( [

        {3,  {hazard,accident}    },
        {3,  {hazard,out_of_gas}  },
        {3,  {hazard,flat_tire}   },
        {4,  {hazard,speed_limit} },
        {5,  {hazard,stop}        },

        {6,  {remedy,repair}             },
        {6,  {remedy,gasoline}           },
        {6,  {remedy,spare_tire}         },
        {6,  {remedy,end_of_speed_limit} },
        {14, {remedy,go}                 },

        {1,  {safety,driving_ace}    },
        {1,  {safety,extra_tank}     },
        {1,  {safety,puncture_proof} },
        {1,  {safety,right_of_way}   },

        {10, {distance,25}  },
        {10, {distance,50}  },
        {10, {distance,75}  },
        {12, {distance,100} },
        {4,  {distance,200} }

    ] ).





%% @since Version 200
uno_deck() -> 

    [ {Face,Color} || 
    
        Face <- lists:seq(0,9) 
             ++ lists:seq(1,9) 
             ++ [reverse,reverse,skip,skip,draw_two,draw_two], 
             
        Color <- [red,yellow,green,blue] 
    
    ] ++ 
    
    lists:flatten(
        lists:duplicate(4, 
            [{draw_four,wild},{wild,wild}]
        )
    ).
