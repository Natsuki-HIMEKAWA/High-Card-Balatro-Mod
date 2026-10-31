local descriptions = {
    Other = {
        hidden_base = {
            name = 'Hidden Base',
            text = {
                '{C:attention}#1#{} of {V:1}#2#{}'
            }
        },

        
        [mod_prefix ..'_agent_s'] = {
            name = 'Clone',
            text = {
                '{C:red}Self-destructs{} at',
                'the end of round'
            },
        }
    },

    Back = {
        ['b_'.. mod_prefix ..'_'.. XPC_deck_key] = {
            name = 'X-Playing Deck',
            text = {
                'Defeat any {C:attention}Blind{} by',
                'a {C:attention}single{} card to',
                "activate that card's",
                'unique ability!'
            }
        }
    },

    Joker = {
        ['j_'.. mod_prefix ..'_2s'] = {
            name = 'Neo New Nambu',
            text = {
                '{C:attention}Always{} sets Hands to {C:blue}#1#{}',
                'when {C:legendary}Neo New Nambu{}',
                'enters Joker slot or the',
                '{C:attention}first hand{} is drawn, and',
                'gives {C:white,X:mult}X#2#{} Mult for each',
                'card remaining in {C:attention}deck{}',
                '{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_3s'] = {
            name = 'Infinite Nunchaku',
            text = {
                'Each played {C:attention}#1#{} gives',
                '{C:white,X:mult}X#2#{} Mult when scored'
            }
        },
        ['j_'.. mod_prefix ..'_4s'] = {
            name = 'Clear Lance',
            text = {
                'The {C:legendary}Clear Lance{} gains {C:white,X:mult}X#1#{}',
                'Mult when a played hand',
                'contains {C:attention}#2#{}',
                '{C:inactive}(Currently {C:white,X:mult}X#3#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_5s'] = {
            name = 'Brain Buster',
            text = {
                'Destroy all played {C:attention}#1#s{}',
                'after scoring, and {C:legendary}Brain{}',
                '{C:legendary}Buster{} gains {X:mult,C:white}X#2#{} Mult',
                'for each of them',
                '{C:inactive}(Currently {C:white,X:mult}X#3#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_6s'] = {
            name = 'Juggling Gun',
            text = {
                'The {C:legendary}Juggling Gun{}',
                'gains {C:white,X:mult}X#1#{} Mult when',
                'a {C:attention}#2#{} is destroyed',
                '{C:inactive}(Currently{} {C:white,X:mult}X#3#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_7s'] = {
            name = 'Interceptor',
            text = {
                'Upgrade the {C:attention}first{}',
                '{C:attention}poker hand{} played each',
                'round by {C:attention}#1#{} level; with',
                'a {C:green}#2# in #3#{} chance to',
                'upgrade it by {C:attention}#4#{} levels'
            }
        },
        ['j_'.. mod_prefix ..'_8s'] = {
            name = 'All Kaboom',
            text = {
                'All played {C:attention}#1#s{} give',
                '{C:white,X:mult}X#2#{} Mult when scored, ',
                'then destroy them'
            }
        },
        ['j_'.. mod_prefix ..'_9s'] = {
            name = 'Mohism',
            text = {
                'Prevent {C:red}Death{} if scored',
                '{C:chips}Chips{} are at least {C:attention}#1#%{} of',
                'the required amount, and',
                'disable the effects of',
                '{C:attention}Boss Blinds{} at {C:attention}odd{} antes'
            }
        },
        ['j_'.. mod_prefix ..'_Ts'] = {
            name = 'Honest Straight',
            text = {
                'The {C:legendary}Honest Straight{} gains',
                '{C:white,X:mult}X#1#{} Mult when a played',
                'hand contains {C:attention}#2#{}',
                '{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Js'] = {
            name = 'Noah Metal',
            text = {
                'Every played {C:attention}#1#{}',
                'or {C:attention}#2#{} gives',
                '{C:white,X:mult}X#3#{} Mult when scored'
            }
        },
        ['j_'.. mod_prefix ..'_Qs'] = {
            name = 'Gorgon Whip',
            text = {
                'Retrigger each scored',
                'card in the {C:attention}first{} played',
                'hand {C:attention}#1#{} additional times,',
                'then enhance them to',
                '{C:attention}#2#s{} after scoring'
            }
        },
        ['j_'.. mod_prefix ..'_Ks'] = {
            name = 'San Galgano',
            text = {
                'All played {C:attention}#1#s{} become',
                '{C:attention}#2#s{} when scored'
            }
        },
        ['j_'.. mod_prefix ..'_As'] = {
            name = 'Love and Peace',
            text = {
                'Each {C:attention}#1#{} in your {C:attention}full deck{}',
                'gives {C:white,X:mult}X#2#{} Mult; always',
                'forces {C:attention}1{} card in hand to be',
                'selected if {C:attention}no hands{} have',
                'been {C:attention}played{} yet this round,',
                'and destroys the {C:attention}selected{}',
                'card if it has been scored',
                '{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_2h'] = {
            name = 'Jelly Crawler',
            text = {
                '{C:attention}+1{} hand size for every',
                '{C:money}$#1#{} you have, up to {C:attention}+#2#{}',
                '{C:inactive}(Currently {C:attention}+#3#{}{C:inactive} hand size){}'
            }
        },
        ['j_'.. mod_prefix ..'_3h'] = {
            name = "Rockin' Rock",
            text = {
                'The {C:attention}first{} played card in',
                'scoring becomes {C:attention}#1#{};',
                'played {C:attention}#1#s{} each',
                'gives {C:white,X:mult}X#2#{} Mult when scored'
            }
        },
        ['j_'.. mod_prefix ..'_4h'] = {
            name = 'Agent S',
            text = {
                'If the {C:attention}first hand{} of',
                'round has only {C:attention}1{} card,',
                'create {C:attention}#1#{} {C:attention}clones{} to hand'
            }
        },
        ['j_'.. mod_prefix ..'_5h'] = {
            name = "Calorie's High",
            text = {
                'Gives {C:white,X:mult}X#1#{} Mult for each',
                'remaining {C:blue}Hand{} and {C:red}Discard{}',
                '{C:inactive}(Gives {C:white,X:mult}X#2#{}{C:inactive} Mult when{}',
                '{C:inactive}playing the next hand){}'
            }
        },
        ['j_'.. mod_prefix ..'_6h'] = {
            name = 'The Zoo',
            text = {
                'Each played {C:attention}#1#{} gives {C:white,X:mult}X#2#{}',
                'Mult when scored, and',
                'converts all scored cards',
                'into {C:attention}#1#s{} after scoring'
            }
        },
        ['j_'.. mod_prefix ..'_7h'] = {
            name = 'Chameleon',
            text = {
                'All cards played in the',
                '{C:attention}first hand{} become {C:attention}#1#s{}',
                'when scored, and {C:legendary}Chameleon{}',
                'gives {C:white,X:mult}X#2#{} Mult for each',
                '{C:attention}#1#{} in your {C:attention}full deck{}',
                '{C:inactive}(Currently {C:white,X:mult}X#3#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_8h'] = {
            name = 'Mun Pheromone Mun',
            text = {
                'Converts all scored cards',
                'into the same suit as',
                'the {C:attention}first card scored{}'
            }
        },
        ['j_'.. mod_prefix ..'_9h'] = {
            name = 'Marvelous Genius',
            text = {
                'The {C:legendary}Marvelous Genius{}',
                'gains {C:white,X:mult}X#1#{} Mult for each',
                'remaining card in {C:attention}deck{}',
                'at the end of round',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Th'] = {
            name = 'Sensitive Sense',
            text = {
                'The {C:legendary}Sensitive Sense{} gains',
                '{C:white,X:mult}X#1#{} Mult when a played',
                'hand contains {C:attention}#2#{}',
                '{C:inactive}(Currently {C:white,X:mult}X#3#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Jh'] = {
            name = 'Sky Dancer',
            text = {
                'Upgrade a poker hand {C:attention}#1#{}',
                'additional level after',
                'using the corresponding',
                '{C:planet}Planet{} Card'
            }
        },
        ['j_'.. mod_prefix ..'_Qh'] = {
            name = 'Sonic Move',
            text = {
                'The {C:legendary}Sonic Move{} gains {C:white,X:mult}X#1#{}',
                'Mult if {C:attention}Blind{} is defeated',
                'in a {C:attention}single{} hand',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Kh'] = {
            name = 'Masculine Parfait',
            text = {
                'Add a {C:attention}#1#{} to',
                'all played {C:attention}#2#{}',
                'when scored'
            }
        },
        ['j_'.. mod_prefix ..'_Ah'] = {
            name = 'Faceless',
            text = {
                'All played cards',
                'become {C:attention}#1#{} of',
                '{V:1}#2#{} after scored',
                '{s:0.8}Card changes every round{}'
            }
        },
        ['j_'.. mod_prefix ..'_2d'] = {
            name = 'Love Connection',
            text = {
                'The {C:legendary}Love Connection{}',
                'gains {C:white,X:mult}X0.5{} Mult for',
                'each different {C:attention}Seal{}',
                'in a scoring hand',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{}{C:inactive} Mult){}'

            }
        },
        ['j_'.. mod_prefix ..'_3d'] = {
            name = 'Marble Rumble',
            text = {
                'All played cards in',
                'the {C:attention}first hand{} become',
                '{C:attention}#1#{} when scored'
            }
        },
        ['j_'.. mod_prefix ..'_4d'] = {
            name = 'Time Mime',
            text = {
                'Retrigger all played cards',
                'in the {C:attention}first hand{} scored',
                '{C:attention}#1#{} additional times,',
                'then destroy them'
            }
        },
        ['j_'.. mod_prefix ..'_5d'] = {
            name = 'Greatest Man',
            text = {
                'All played {C:attention}#1#{} and',
                '{C:attention}#2#{} increase ',
                'ranks by {C:attention}#3#{} after scored'
            }
        },
        ['j_'.. mod_prefix ..'_6d'] = {
            name = '13 Stairs',
            text = {
                'The {C:legendary}13 Stairs{} gains {C:white,X:mult}X#1#{}',
                'Mult for every {C:attention}13{} {C:inactive}(#2#){}',
                'cards played, and destroys',
                'every {C:attention}13th{} card played',
                '{C:inactive}(Currently{} {C:white,X:mult}X#3#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_7d'] = {
            name = 'Never No Dollars',
            text = {
                'The {C:legendary}Never No Dollars{} gains',
                '{C:white,X:mult}X#1#{} Mult for each {C:money}$1{}',
                'you have spent or lost',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_8d'] = {
            name = "Red Labyrinth",
            text = {
                'Swap {C:blue}Chips{} and {C:mult}Mult{} before',
                'scoring the played hand'
            }
        },
        ['j_'.. mod_prefix ..'_9d'] = {
            name = 'No Mercy',
            text = {
                'The {C:legendary}No Mercy{} gains {C:white,X:mult}XMult{}',
                'equal to {C:attention}quarter{} of the',
                '{C:attention}rank{} of the {C:attention}first scored{}',
                '{C:attention}card{} of each round,',
                'then destroys it, resets',
                'at the end of round',
                '{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Td'] = {
            name = 'Unlucky Poky',
            text = {
                '{C:attention}#1#s{} always trigger',
                'their effects when scored'
            }
        },
        ['j_'.. mod_prefix ..'_Jd'] = {
            name = 'Out of 5',
            text = {
                'All played {C:attention}#1#{}',
                'with exactly {C:attention}5{} cards are',
                'treated as {C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Qd'] = {
                name = 'Balor',
                text = {
                    '{C:dark_edition}Foresee{} the order',
                    'in which the deck',
                    'will be drawn'
                }
        },
        ['j_'.. mod_prefix ..'_Kd'] = {
            name = 'Round and Round',
            text = {
                'Balance {C:chips}Chips{} and {C:mult}Mult{}',
                'for every {C:attention}hand{} played'
            }
        },
        ['j_'.. mod_prefix ..'_Ad'] = {
            name = 'Dynamic Kinesis',
            text = {
                'Selling {C:B4883C}X-Playing Cards{} in',
                'round will add it to hand,',
                'instead of the deck'
            }
        },
        ['j_'.. mod_prefix ..'_2c'] = {
            name = 'Metallical Parade',
            text = {
                'All {C:attention}#1#s{} and',
                '{C:attention}#2#s{} gain the',
                'effects of both',
                '{C:enhanced}Enhancements{}'
            }
        },
        ['j_'.. mod_prefix ..'_3c'] = {
            name = 'Green Green',
            text = {
                'Every played card',
                'permanently gains',
                '{C:white,X:red}X#1#{} Mult when scored'
            }
        },
        ['j_'.. mod_prefix ..'_4c'] = {
            name = 'Wing Wind',
            text = {
                'After each hand is',
                'scored, {C:attention}shuffle{} all',
                'remaining cards in',
                'hand into your deck'
            }
        },
        ['j_'.. mod_prefix ..'_5c'] = {
            name = 'G Round',
            text = {
                'All played {C:attention}#1#s{}',
                'give {C:white,X:mult}X#2#{} Mult when scored,',
                'then destroy them'
            }
        },
        ['j_'.. mod_prefix ..'_6c'] = {
            name = 'Shallow Blue',
            text = {
                '{C:green}#1# in #2#{} chance to',
                'add {C:dark_edition}Foil{} to every',
                'scored card during',
                'the {C:attention}first{} hand if',
                'it has no edition'
            }
        },
        ['j_'.. mod_prefix ..'_7c'] = {
            name = 'Lethal Scoville',
            text = {
                'Each played {C:attention}#1#{} gives',
                '{C:white,X:mult}X#2#{} Mult when scored,',
                'then destroy them'
            }
        },
        ['j_'.. mod_prefix ..'_8c'] = {
            name = 'Sinking Shadow',
            text = {
                '{C:green}#1# in #2#{} chance to add',
                '{C:dark_edition}Negative{} to every',
                'scored card during',
                'the {C:attention}first{} hand if',
                'it has no edition'
            }
        },
        ['j_'.. mod_prefix ..'_9c'] = {
            name = 'Rising Light',
            text = {
                '{C:green}#1# in #2#{} chance to add',
                '{C:dark_edition}Polychrome{} to every',
                'scored card during',
                'the {C:attention}first{} hand if',
                'it has no edition'
            }
        },
        ['j_'.. mod_prefix ..'_Tc'] = {
            name = 'Million Volt',
            text = {
                '{C:green}#1# in #2#{} chance to add',
                '{C:dark_edition}Holographic{} to every ',
                'scored card during',
                'the {C:attention}first{} hand if',
                'it has no edition'
            }
        },
        ['j_'.. mod_prefix ..'_Jc'] = {
            name = 'Coming Home',
            text = {
                'Return the {C:attention}first{}',
                '{C:attention}played card{} scored',
                'to hand after scoring'
            }
        },
        ['j_'.. mod_prefix ..'_Qc'] = {
            name = 'Gladiator',
            text = {
                'Each played {C:attention}#1#{}',
                'gives {C:white,X:mult}X#2#{} Mult when scored,',
                'then destroy them'
            }
        },
        ['j_'.. mod_prefix ..'_Kc'] = {
            name = "Reaper's Hand",
            text = {
                'Destroy all scored cards in the',
                "{C:attention}first hand{}, and {C:legendary}Reaper's Hand{} gains",
                'corresponding {C:chips}Chips{}, {C:mult}Mult{}, {C:white,X:mult}XMult{},',
                'or returns {C:money}money{} from their',
                '{C:enhanced}Enhancements{} or {C:dark_edition}Editions{} after scoring',
                'Resets when {C:attention}Boss Blind{} is defeated',
                '{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips, {C:mult}+#2#{} {C:inactive}Mult,{} {X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        ['j_'.. mod_prefix ..'_Ac'] = {
            name = 'Another Lives',
            text = {
                'Create a {C:spectral}Spectral{} Card',
                'when {C:attention}Blind{} is selected',
                '{C:inactive}(Must have room){}'
            }
        },
        ['j_'.. mod_prefix ..'_0x'] = {
            name = 'Red Joker',
            text = {},
            unlock = {'Stay tuned!'}
        },
        ['j_'.. mod_prefix ..'_1x'] = {
            name = 'Black Joker',
            text = {},
            unlock = {'Stay tuned!'}
        }
    }
}

for key, Joker in pairs(descriptions.Joker) do
    if key:sub(-1,-1) ~= 'x' then
        local add = {
            '{C:legendary,s:0.8}Sell to deactivate this card{}',
            '{C:legendary,s:0.8}and add it to deck with its{}',
            '{C:legendary,s:0.8}original enhancement and seal{}'
        }
        for _, string in ipairs(add) do
            Joker.text[#Joker.text + 1] = string
        end
    end
end

local misc = {
    labels = {
        HIGH_CARD_agent_s = 'Clone',
    },
    dictionary = {
        k_loaded = 'Loaded!',
        k_smashed = 'Smashed!',
        k_exploded = 'Exploded!',
        k_mohism_saved = 'Universal Love, Non-aggression',
        k_petrified = 'Petrified!',
        k_armed = 'Armed!',
        k_slained = 'Slained!',
        k_merged = 'Merged!',
        k_burnt = 'Burnt!',
        k_transform = 'Transform!',
        k_chameleon = 'Chameleon!',
        k_induce = 'Induce!',
        k_brilliant = 'Brilliant!',
        k_dance = 'Dance!',
        k_sonic_boom = 'Sonic Boom!',
        k_fortified = 'Fortified!',
        k_faceless = 'Faceless!',
        k_vitrified = 'Vitrified!',
        k_withered = 'Withered!',
        k_evolved = 'Evolved!',
        k_swapped = 'Swapped!',
        k_sacrificed = 'Sacrificed!',
        k_balor = 'Balor',
        k_not_ready = 'The deck is not ready yet!',
        k_ready = 'Cards will be drawn from left to right!',
        k_drawn = 'All cards have been drawn.',
        k_blown = 'Blown!',
        k_crumbled = 'Crumbled!',
        k_submerged = 'Submerged!',
        k_ignited = 'Ignited!',
        k_sunk = 'Sunk!',
        k_shone = 'Shone!',
        k_charged = 'Charged!',
        k_coming_home = 'Coming Home!',
        k_defeated = 'Defeated!',
        k_reaped = 'Reaped!',
        k_summoned = 'Summoned!',
        k_activated = 'Activated!',
        k_deactivated = 'Deactivated!'
    },
    challenge_names = {
        ['c_'.. mod_prefix ..'_RF'] = 'Royal Flush',
        ['c_'.. mod_prefix ..'_SF'] = 'Straight Flush',
        ['c_'.. mod_prefix ..'_4K'] = 'Four of a Kind',
        ['c_'.. mod_prefix ..'_FH'] = 'Full House',
        ['c_'.. mod_prefix ..'_FL'] = 'Flush',
        ['c_'.. mod_prefix ..'_ST'] = 'Straight',
        ['c_'.. mod_prefix ..'_3K'] = 'Three of a Kind',
        ['c_'.. mod_prefix ..'_2P'] = 'Two Pair',
        ['c_'.. mod_prefix ..'_1P'] = 'One Pair',
        ['c_'.. mod_prefix ..'_HC'] = 'High Card',
    }
}

return {
    descriptions = descriptions,
    misc = misc
}
