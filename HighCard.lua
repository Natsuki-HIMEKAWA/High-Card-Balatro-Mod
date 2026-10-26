mod_prefix = SMODS.current_mod.prefix

--Stone Viewer: Reveal the hidden base of Stone Cards--
SMODS.Enhancement:take_ownership('stone', {
    loc_vars = function(self, info_queue, card)
        if card and card.base
            and card.base.value
            and card.base.suit then

            info_queue[#info_queue + 1] = {
                key = 'hidden_base',
                set = 'Other',
                vars = {
                    localize(card.base.value,'ranks'),
                    localize(card.base.suit,'suits_plural'),
                    colours = {G.C.SUITS[card.base.suit]}
                }
            }
        end

        return {vars = {self.config.bonus or 50}}
    end
}, true)
---
SMODS.Atlas({
    key = 'XPCB',
    path = 'XPC_Back.png',
    px = 71, py=95
})

SMODS.Atlas {
    key = 'XPC_undiscovered',
    path = 'undiscovered.png',
    px = 71, py = 95
}

SMODS.Atlas({
    key = 'XPC',
    path = 'X-Playing_Cards.png',
    px = 71, py = 95
})

SMODS.Atlas({
    key = 'clone',
    path = 'st_clone.png',
    px = 71, py=95
})

local rank_to_string = function(rank)
    if rank <= 10 then return tostring(rank)
    elseif rank == 11 then return 'Jack'
    elseif rank == 12 then return 'Queen'
    elseif rank == 13 then return 'King'
    elseif rank == 14 then return 'Ace'
    end
end

local contains = function(element, list)
    for _, e in ipairs(list) do
        if e == element then
            return true
        end
    end
    return false
end

local function has_dynamic_kinesis() -- Defined for Ad Dynamic Kinesis
    if not (G.jokers and G.jokers.cards) then
        return false
    end

    for _, joker in ipairs(G.jokers.cards) do
        local center = joker.config and joker.config.center
        local key = center and center.key

        if not joker.debuff and key == 'j_'.. mod_prefix ..'_Ad'
        then return true
        end
    end

    return false
end

local adding_self = function(joker)
    G.E_MANAGER:add_event(Event({
        func = function()
            card_eval_status_text(
                joker, 'extra', nil, nil, nil, 
                {
                    message = localize('k_deactivated'),
                    colour = G.C.GREEN
                }
            )

            local area = G.deck
            if has_dynamic_kinesis() and G.GAME.facing_blind then
                area = G.hand
            end
            
            local center = joker.config and joker.config.center
            local key = center and (center.original_key or center.key)

            if type(key) ~= 'string' then
                return true
            end

            local rank = key:sub(-2,-2)
            local suit = key:sub(-1,-1):upper()

            local card = create_playing_card({
                front = G.P_CARDS[suit .. '_' .. rank],
                center = G.P_CENTERS.c_base
            }, area, nil, nil, {G.C.SECONDARY_SET.Enhanced})

            local original = joker.ability.original or {}
            local enhancement = original.enhancement
            local seal = original.seal

            if enhancement and G.P_CENTERS[enhancement] then
                card:set_ability(
                    G.P_CENTERS[enhancement],
                    nil, true
                )
            end

            if seal then card:set_seal(seal) end

            local edition = joker.edition
            if type(edition) == 'table' then
                card:set_edition(copy_table(edition), true)
            elseif type(edition) == 'string' then
                card:set_edition({[edition:sub(3)] = true}, true)
            end
            
            card:juice_up()
            return true
        end
    }))
    return
end

SMODS.Sticker { -- Defined for 4h Agent S
    key = 'agent_s',
    atlas = 'clone',

    badge_colour = HEX('D70C18'),

    default_compat = false,
    rate = 0
}


local XPC = {
    S2 = {
        key = '2s',
        pos = {x=0,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '2s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '2s'
        }),
        config = {extra = { hands = 5, x_mult_add = 0.1 }},

        loc_vars = function(self, info_queue, card)
            local remaining = G.deck and G.deck.cards and #G.deck.cards or 0
            local x_mult = 1 + remaining * card.ability.extra.x_mult_add
            return {vars = {
                    card.ability.extra.hands,
                    card.ability.extra.x_mult_add,
                    x_mult
                }}
        end,

        add_to_deck = function(self, card, from_debuff)
            return end,

        calculate = function(self,card,context)
            local function reset()
                if not G.GAME or not G.GAME.current_round then
                    return
                end

                local target = card.ability.extra.hands
                local current = G.GAME.current_round.hands_left

                if current == nil then return end

                local diff = target - current

                if diff ~= 0 then
                    ease_hands_played(diff)
                    card_eval_status_text(card, 'extra', nil, nil, nil, 
                        {message = localize('k_loaded')}
                    )
                end
            end
            
            if not context.blueprint then
                if context.card_added and context.card == card then
                    if G.GAME and G.GAME.current_round
                    and G.GAME.current_round.hands_left then
                        reset()
                    end
                end

                if context.first_hand_drawn then
                    reset()
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
            
            if context.joker_main then
                local remaining = G.deck and G.deck.cards and #G.deck.cards or 0
                local x_mult = 1 + remaining * card.ability.extra.x_mult_add

                if x_mult > 1 then
                    return{
                        x_mult = x_mult,
                        colour = G.C.MULT
                    }
                end
            end
        end
    },

    S3 = {
        key = '3s',
        pos = {x=1,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '3s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '3s'
        }),
        config = { extra = { rank = 3, x_mult = 1.5 } },

        loc_vars = function(self, info_queue, card)
            return {vars = {
            localize(rank_to_string(card.ability.extra.rank),'ranks'),
            card.ability.extra.x_mult
        }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == card.ability.extra.rank then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card
                        }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    S4 = {
        key = '4s',
        pos = {x=2,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '4s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '4s'
        }),
        config = {
            extra = {
                x_mult = 1.0,                
                x_mult_add = 0.2,
                poker_hand = 'Four of a Kind'
            }
        },

        loc_vars = function(self, info_queue, card)
            return {vars = {
                    card.ability.extra.x_mult_add,
                    localize(card.ability.extra.poker_hand, 'poker_hands'),
                    card.ability.extra.x_mult,
                }}
        end,

        calculate = function(self, card, context)
            if not context.blueprint and context.cardarea == G.jokers
            and context.before then
                if next(context.poker_hands[card.ability.extra.poker_hand]) then
                    card.ability.extra.x_mult =
                    card.ability.extra.x_mult + card.ability.extra.x_mult_add
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.ORANGE
                    }
                end
            end

            if context.cardarea == G.jokers and context.joker_main then
                if card.ability.extra.x_mult > 1 then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    S5 = {
        key = '5s',
        pos = {x=3,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '5s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '5s'
        }),
        config = {extra = {
            rank = 5,
            x_mult_add = 0.5,
            x_mult = 1,
            message = false
        }},

        loc_vars = function(self, info_queue, card)
            return {vars = {
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                card.ability.extra.x_mult_add,
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {x_mult = card.ability.extra.x_mult}
            end

            if not context.blueprint then
                if context.destroying_card and context.cardarea == G.play
                and context.destroy_card
                and context.destroy_card:get_id() == card.ability.extra.rank
                then
                    card.ability.extra.x_mult =
                    card.ability.extra.x_mult + card.ability.extra.x_mult_add

                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        return {
                            remove = true,
                            message = localize('k_smashed'),
                            colour = G.C.RED
                        }
                    else
                        return { remove = true }
                    end
                end

                if context.before then
                    card.ability.extra.message = true
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    S6 = {
        key = '6s',
        pos = {x=4,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '6s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '6s'
        }),
        config = {extra = {x_mult_add = 1, rank = 6, x_mult = 1}},

        loc_vars = function(self,info_queue,card)
            return {vars = 
            {
                card.ability.extra.x_mult_add,
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self,card,context)
            local extra = card.ability.extra
            if not context.blueprint and context.remove_playing_cards then
                local count = 0
                for _, removed_card in ipairs(context.removed or {}) do
                    if removed_card:get_id() == extra.rank then
                        count = count + 1
                    end
                end
                
                if count > 0 then
                    extra.x_mult = extra.x_mult + extra.x_mult_add * count
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        func = function()
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = localize('k_upgrade_ex'),
                                colour = G.C.MULT
                            })

                            return true
                        end
                    }))
                end
            end

            if context.joker_main then
                return {x_mult = extra.x_mult}
            end
            
            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    S7 = {
        key = '7s',
        pos = {x=5,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '7s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '7s'
        }),
        config = {extra = {level = 2}},

        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.level}}
        end,

        calculate = function(self, card, context)
            if context.cardarea == G.jokers
            and context.before
            and context.scoring_name 
            and G.GAME.current_round.hands_played == 0 then
                return {
                    card = card,
                    level_up = card.ability.extra.level,
                    message = localize('k_level_up_ex')
                }
            end
            
            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    S8 = {
        key = '8s',
        pos = {x=6,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '8s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '8s'
        }),
        config = {extra = {enhancement = 'm_mult', x_mult = 3, message = false}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {
                vars = {
                localize({
                    type = 'name_text',
                    set = 'Enhanced',
                    key = card.ability.extra.enhancement
                }),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self,card,context)
            if context.individual and context.cardarea == G.play then
                if context.other_card.config.center.key == 
                card.ability.extra.enhancement then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card
                        }
                end
            end

            if not context.blueprint then
                if context.destroy_card and context.cardarea == G.play
                and context.destroy_card.config.center.key 
                == card.ability.extra.enhancement then
                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = localize('k_exploded'),
                            colour = G.C.RED
                        })
                    end

                    return {remove = true}
                end

                if context.setting_blind then
                    card.ability.extra.message = true
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    S9 = {
        blueprint_compat = false,

        key = '9s',
        pos = {x=7,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '9s'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '9s'
        }),
        config = {extra = {ratio = 0.50}},
        loc_vars = function(self, info_queue, card)
            local ratio = card.ability.extra.ratio
            return {vars = {
                string.format('%.2f',100 * card.ability.extra.ratio
                ):gsub('0+$', ''):gsub('%.$', '')
            }}
        end,

        calculate = function(self, card, context)
            if context.selling_self then
                adding_self(card)
            end

            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled
            and G.GAME.round_resets.ante % 2 == 1 and context.setting_blind then
                G.GAME.blind:disable()

                return {
                    message = localize('ph_boss_disabled'),
                    colour = G.C.RED
                }
            end

            if not context.game_over then
                return
            end

            local blind = G.GAME and G.GAME.blind
            if not blind or not blind.chips or blind.chips <= 0 then
                return
            end

            local ratio = card.ability.extra.ratio

            if G.GAME.chips / blind.chips < ratio then
                return
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.hand_text_area
                        and G.hand_text_area.blind_chips then
                        G.hand_text_area.blind_chips:juice_up()
                    end

                    if G.hand_text_area
                        and G.hand_text_area.game_chips then
                        G.hand_text_area.game_chips:juice_up()
                    end

                    play_sound('tarot1')

                    return true
                end
            }))

            return {
                saved = localize('k_mohism_saved'),
                message = localize('k_saved_ex'),
                colour = G.C.RED
            }
        end
    },

    ST = {
        key = 'Ts',
        pos = {x=8,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Ts'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Ts'
        }),
        config = {
            extra = {x_mult = 1.0, x_mult_add = 0.3, poker_hand = 'Straight'}
        },

        loc_vars = function(self, info_queue, card)
            return {vars = {
                    card.ability.extra.x_mult_add,
                    localize(card.ability.extra.poker_hand, 'poker_hands'),
                    card.ability.extra.x_mult,
                }}
        end,

        calculate = function(self, card, context)
            if context.cardarea == G.jokers 
            and context.before and not context.blueprint then
                if next(context.poker_hands[card.ability.extra.poker_hand]) then
                    card.ability.extra.x_mult = 
                    card.ability.extra.x_mult + card.ability.extra.x_mult_add
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.ORANGE
                    }
                end
            end

            if context.cardarea == G.jokers and context.joker_main then
                if card.ability.extra.x_mult > 1 then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    SJ = {
        key = 'Js',
        pos = {x=9,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Js'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Js'
        }),
        config = {extra = {enhancements = {'m_steel','m_gold'}, x_mult = 1.5}},

        loc_vars = function(self, info_queue, card)
            for i = 1, #card.ability.extra.enhancements do
                info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancements[i]]
            end
            return {vars = {
                localize({
                    type = 'name_text', set = 'Enhanced',
                    key = card.ability.extra.enhancements[1]
                }),
                localize({
                    type = 'name_text', set = 'Enhanced',
                    key = card.ability.extra.enhancements[2]
                }),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                if contains(context.other_card.config.center.key,
                            card.ability.extra.enhancements) then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card
                        }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    SQ = {
        key = 'Qs',
        pos = {x=10,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Qs'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Qs'
        }),
        config = {extra = {retrigger = 3, enhancement = 'm_stone'}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {vars = {
                card.ability.extra.retrigger,
                localize({
                    type = 'name_text',set = 'Enhanced',
                    key = card.ability.extra.enhancement
                })
            }}
        end,

        calculate = function(self,card,context)
            if context.repetition and context.cardarea == G.play
            and context.scoring_hand
            and G.GAME.current_round.hands_played == 0
            then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retrigger,
                    card = card
                }
            end

            if not context.blueprint then
                if context.after and G.GAME.current_round.hands_played == 0 then
                    local changed_cards = {}

                    for _, scored_card in ipairs(context.scoring_hand) do
                        table.insert(changed_cards, scored_card)
                    end

                    if next(changed_cards) then
                        return {
                            message = localize('k_petrified'),
                            colour = G.C.GREY,

                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'immediate',
                                    func = function()
                                        for _, scored_card in ipairs(changed_cards) do
                                            local petrify = scored_card:set_ability(
                                                G.P_CENTERS[card.ability.extra.enhancement],
                                                nil, true)

                                            if petrify then
                                                scored_card:set_sprites(nil,
                                                    scored_card.config.card)
                                                scored_card:juice_up()
                                            end
                                        end
                                        return true
                                    end
                                }))
                            end
                        }
                    end
                end
            
                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    SK = {
        blueprint_compat = false,

        key = 'Ks',
        pos  = {x=11,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Ks'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Ks'
        }),
        config = {extra = {rank = 11, enhancement = 'm_steel'}},

        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement] 
            return {vars = {
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                localize({
                        type = 'name_text',
                        set = 'Enhanced',
                        key = card.ability.extra.enhancement
                    })
            }}
        end,

        calculate = function(self, card, context)
            if context.before then
                local enhancing_cards = {}

                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card:get_id() == card.ability.extra.rank then
                        scored_card:set_ability(
                            G.P_CENTERS[card.ability.extra.enhancement],
                            nil, true
                        )
                        table.insert(enhancing_cards, scored_card)

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    end
                end

                if enhancing_cards and next(enhancing_cards) then
                    return {message = localize('k_armed'), colour = G.C.EXTRA}
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    SA = {
        key = 'As',
        pos = {x=12,y=3},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'As'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'As'
        }),
        config = {extra = {rank = 14, x_mult_add = 1.1}},

        loc_vars = function(self,info_queue,card)
            local ace = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card:get_id() == 14 then
                    ace = ace + 1
                end
            end
            local x_mult = 1 + ace * card.ability.extra.x_mult_add
            return {vars = {
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                card.ability.extra.x_mult_add,
                x_mult
            }}
        end,

        calculate = function(self,card,context)
            if context.joker_main then
                local ace = 0
                for _, playing_card in ipairs(G.playing_cards or {}) do
                    if playing_card:get_id() == 14 then
                        ace = ace + 1
                    end
                end
                x_mult = 1 + ace * card.ability.extra.x_mult_add
                return {x_mult = x_mult}
            end

            if not context.blueprint then
                if context.hand_drawn then
                    for _, playing_card in ipairs(G.playing_cards or {}) do
                        playing_card.ability.slain = nil
                    end

                    if G.GAME.current_round.hands_played == 0 then
                        if G.GAME.blind.config.blind.key == 'bl_cerulean_bell' then
                            for _, playing_card in ipairs(G.hand.cards) do
                                if playing_card.ability.forced_selection then
                                    playing_card.ability.slain = true
                                    break
                                end
                            end
                        else
                            G.hand:unhighlight_all()

                            local forced_card = pseudorandom_element(
                                G.hand.cards, pseudoseed('Love and Peace')
                            )

                            for _, playing_card in ipairs(G.hand.cards) do
                                if playing_card.ability.forced_selection then
                                    forced_card = playing_card
                                    break
                                end
                            end

                            forced_card.ability.forced_selection = true
                            forced_card.ability.slain = true

                            if not forced_card.highlighted then
                                G.hand:add_to_highlighted(forced_card)
                            end
                        end
                    end
                end

                if context.cardarea == G.play and context.destroy_card
                and context.destroying_card
                and context.destroying_card == context.destroy_card
                and context.destroy_card.ability.slain then
                    return {
                        remove = true,
                        message = localize('k_slained'),
                        colour = G.C.RED
                    }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    H2 = {
        blueprint_compat = false,

        key = '2h',
        pos = {x=0,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '2h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '2h'
        }),

        config = { extra = {
            money_per_size = 20,
            max_bonus = 5,
            applied = 0} },

        loc_vars = function(self, info_queue, card)
            local extra = card.ability.extra
            local money = (G.GAME and G.GAME.dollars) or 0

            local target = math.min(
                math.max(0, math.floor(money / extra.money_per_size)),
                extra.max_bonus
            )

            if card.debuff then target = 0
            end

            return {
                vars = {
                    extra.money_per_size,
                    extra.max_bonus,
                    target
                }
            }
        end,
        
        add_to_deck = function(self, card, from_debuff)
            card.ability.extra.applied = 0
        end,

        remove_from_deck = function(self, card, from_debuff)
            local extra = card.ability.extra
            local applied = extra.applied or 0

            if G.hand and applied ~= 0 then
                G.hand:change_size(-applied)
            end

            extra.applied = 0
        end,

        update = function(self, card, dt)
            if not G.hand or not G.GAME or not G.jokers
            or card.area ~= G.jokers then
                return
            end

            local extra = card.ability.extra
            local money = G.GAME.dollars or 0
            local money_per_size = extra.money_per_size
            local max_bonus = extra.max_bonus

            local target = math.min(
                math.max(0, math.floor(money / money_per_size)),
                max_bonus
            )

            if card.debuff then
                target = 0
            end

            local applied = extra.applied or 0
            local diff = target - applied

            if diff ~= 0 then
                G.hand:change_size(diff)
                extra.applied = target
            end
        end,

        calculate = function(self,card,context)
            if context.selling_self then
                adding_self(card)
            end
        end
    },

    H3 = {
        key = '3h',
        pos = {x=1,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '3h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '3h'
        }),
        config = {extra = {enhancement = 'm_stone', x_mult_add = 1.5}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {vars = {
                    localize({type = 'name_text', set = 'Enhanced',
                        key = card.ability.extra.enhancement}),
                    card.ability.extra.x_mult_add
                }}
        end,

        calculate = function(self,card,context)
            
            if context.individual and context.cardarea == G.play then
                if context.other_card.config.center.key
                == card.ability.extra.enhancement then
                    return {
                        x_mult = card.ability.extra.x_mult_add,
                        colour = G.C.RED,
                        card = card
                        }
                end
            end
            
            if not context.blueprint then
                if context.initial_scoring_step then
                    context.scoring_hand[1]:set_ability(
                    G.P_CENTERS[card.ability.extra.enhancement],
                    nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[1]:juice_up()
                            return true
                        end}))

                    return {
                        message = localize('k_petrified'),
                        colour = G.C.RARITY[4],
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                func = function()
                                    context.scoring_hand[1]:set_sprites(
                                    nil,
                                    context.scoring_hand[1].config.card
                                    )
                                    return true
                                end}))
                        end
                    }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    H4 = {
        key = '4h',
        pos = {x=2,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '4h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '4h'
        }),
        config = {extra = {duplicates = 4}},
        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = {
                key = mod_prefix ..'_agent_s',
                set = 'Other',
            }
            return {vars = {card.ability.extra.duplicates}}
        end,

        calculate = function(self,card,context)
            if context.before and G.GAME.current_round.hands_played == 0
            and #context.full_hand == 1 then
                for count = 1, card.ability.extra.duplicates do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    
                    local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                    _card.ability.AgentS = true

                    _card:add_sticker(mod_prefix ..'_agent_s', true)
                    _card:add_to_deck()

                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card.states.visible = nil

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            _card:start_materialize()
                            return true
                        end
                    }))
                end
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    card = card,
                    playing_cards_created = {true}
                }
            end

            if not context.blueprint then
                if context.end_of_round and context.main_eval then
                    local destroy = {}

                    for _, playing_card in ipairs(G.playing_cards) do
                        if playing_card.ability.AgentS then
                            table.insert(destroy, playing_card)
                        end
                    end

                    if next(destroy) then
                        SMODS.destroy_cards(destroy)
                        return {
                            message = localize('k_merged'),
                            colour = G.C.RARITY[4],
                            card = card
                        }
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    H5 = { 
        key = '5h',
        pos = {x=3,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '5h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '5h'
        }),
        config = {extra = {x_mult_add = 1, x_mult = 1}},

        loc_vars = function(self, info_queue, card)
            local remaining = G.GAME.current_round.hands_left or 0
            + G.GAME.current_round.discards_left or 0
            card.ability.extra.x_mult = 1 + remaining * card.ability.extra.x_mult_add
            return { vars = {
                    card.ability.extra.x_mult_add,
                    card.ability.extra.x_mult
                }}
        end,

        calculate = function(self,card,context)
            if context.joker_main then
                local remaining = G.GAME.current_round.hands_left or 0
                + G.GAME.current_round.discards_left or 0
                card.ability.extra.x_mult = 1 + remaining * card.ability.extra.x_mult_add

                if card.ability.extra.x_mult > 1 then
                    return{
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.MULT
                    }
                end
            end

            if not context.blueprint then
                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    H6 = {
        key = '6h',
        pos = {x=4,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '6h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '6h'
        }),
        config = {extra = {rank = 6, x_mult = 1.2}},

        loc_vars = function(self,info_queue,card)
            return {vars = {
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == card.ability.extra.rank then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card
                        }
                    end
            end

            if not context.blueprint then
                if context.after then
                    local changed_cards = {}

                    for _, scored_card in ipairs(context.scoring_hand) do
                        if not SMODS.has_enhancement(scored_card, 'm_stone') then
                            table.insert(changed_cards, scored_card)
                        end
                    end

                    if next(changed_cards) then

                        return {
                            message = localize('k_transform'),
                            colour = G.C.RARITY[4],

                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'immediate',

                                    func = function()
                                        for _, scored_card in ipairs(changed_cards) do
                                            local diff =
                                                card.ability.extra.rank
                                                - scored_card:get_id()

                                            if diff ~= 0 then
                                                local increase =
                                                    SMODS.modify_rank(scored_card,
                                                        diff,true)

                                                if increase then
                                                    scored_card:set_sprites(nil,
                                                        scored_card.config.card)
                                                        scored_card:juice_up()
                                                end
                                            end
                                        end

                                        return true
                                    end
                                }))
                            end
                        }
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    H7 = {
        key = '7h',
        pos = {x=5,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '7h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '7h'
        }),
        config = { extra = {enhancement = 'm_wild', x_mult_add = 0.2} },

        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.config.center.key
                    == card.ability.extra.enhancement then
                    count = count + 1
                end
            end
            local x_mult = 1 + count * card.ability.extra.x_mult_add
            return { vars = {
                    localize({
                        type = 'name_text',set = 'Enhanced',
                        key = card.ability.extra.enhancement
                    }),
                    card.ability.extra.x_mult_add,
                    x_mult
            }}
        end,


        calculate = function(self, card, context)
            if not context.blueprint then
                if context.before and G.GAME.current_round.hands_played == 0 then
                    for _, scored_card in ipairs(context.scoring_hand) do
                        scored_card:set_ability(
                            G.P_CENTERS[card.ability.extra.enhancement],
                            nil, true
                        )

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    end

                    return {message = localize('k_chameleon'), colour = G.C.EXTRA}
                end

                if context.selling_self then
                    adding_self(card)
                end
            end

            if context.joker_main then
                local count = 0

                for _, playing_card in ipairs(G.playing_cards or {}) do
                    if playing_card.config.center.key
                        == card.ability.extra.enhancement then
                        count = count + 1
                    end
                end

                if count > 0 then
                    return {x_mult = 1 + count * card.ability.extra.x_mult_add}
                end
            end
        end
    },

    H8 = {
        blueprint_compat = false,

        key = '8h',
        pos = {x=6,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '8h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '8h'
        }),
        config = {},

        calculate = function(self, card, context)
            if context.initial_scoring_step then
                if context.scoring_hand[1].config.center.key == 'm_stone' then
                    return end

                local changed_cards = {}
                local suit = context.scoring_hand[1].base.suit

                if not suit then return end

                for index = 2, #context.scoring_hand do
                    local scored_card = context.scoring_hand[index]
                    local converts = SMODS.change_base(
                        scored_card, suit, nil, true)
                    if converts then
                        table.insert(changed_cards, scored_card)
                    end
                end

                if changed_cards and next(changed_cards) then
                    return {
                        message = localize('k_induce'),
                        colour = G.C.RARITY[4],
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                func = function()
                                    for _, scored_card in ipairs(changed_cards) do
                                        scored_card:set_sprites(
                                            nil,
                                            scored_card.config.card
                                        )
                                        scored_card:juice_up()
                                    end
                                    return true
                                end}))
                        end
                    }
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    H9 = {
        key = '9h',
        pos = {x=7,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '9h'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '9h'
        }),
        config = {extra = {x_mult_add = 0.02, x_mult = 1}},
        loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.x_mult_add,
                card.ability.extra.x_mult
            }}
        end,

        calculate =  function(self, card, context)
            if context.joker_main then
                return {x_mult = card.ability.extra.x_mult}
            end

            if not context.blueprint then
                if context.end_of_round  and context.cardarea == G.jokers then
                    card.ability.extra.x_mult =
                    card.ability.extra.x_mult + card.ability.extra.x_mult_add * #G.deck.cards
                    return {
                        message = localize('k_brilliant'),
                        colour = G.C.RARITY[4]
                    }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    HT = {
        key = 'Th',
        pos = {x=8,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Th'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Th'
        }),
        config = {
            extra = {
                x_mult = 1.0,                
                x_mult_add = 0.1,
                poker_hand = 'Flush'
            }
        },

        loc_vars = function(self, info_queue, card)
            return {vars = {
                    card.ability.extra.x_mult_add,
                    localize(card.ability.extra.poker_hand, 'poker_hands'),
                    card.ability.extra.x_mult,
                }}
        end,

        calculate = function(self, card, context)
            if not context.blueprint then
                if context.cardarea == G.jokers and context.before then
                    if next(context.poker_hands[card.ability.extra.poker_hand]) then
                        card.ability.extra.x_mult =
                        card.ability.extra.x_mult + card.ability.extra.x_mult_add
                        return {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.ORANGE
                        }
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end

            if context.cardarea == G.jokers and context.joker_main then
                if card.ability.extra.x_mult > 1 then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = card
                    }
                end
            end
        end
    },

    HJ = {
        key = 'Jh',
        pos = {x=9,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Jh'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Jh'
        }),
        config = {extra = {level = 1}},

        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.level} }
        end,

        calculate = function(self, card, context)
            local blueprint_or_self = context.blueprint_card or card
            
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                local hand_type = context.consumeable.ability.hand_type
                if hand_type then
                    card_eval_status_text(blueprint_or_self,
                            'extra', nil, nil, nil, 
                            {message = localize('k_dance'),
                            colour = G.C.SECONDARY_SET.Planet})
                    update_hand_text(
                        {
                            sound = 'button', volume = 0.7,
                            pitch = 0.8, delay = 0
                    },

                        {
                            handname = localize(hand_type, 'poker_hands'),
                            chips = G.GAME.hands[hand_type].chips,
                            mult = G.GAME.hands[hand_type].mult,
                            level = G.GAME.hands[hand_type].level
                    })

                    level_up_hand(blueprint_or_self, hand_type, 
                                nil, card.ability.extra.level)
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    HQ = {
        key = 'Qh',
        pos = {x=10,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Qh'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Qh'
        }),
        config = {extra = {x_mult_add = 1, x_mult = 1}},

        loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.x_mult_add,
                card.ability.extra.x_mult
            }}
        end,
        
        calculate = function(self, card, context)

            if context.joker_main then
                return { x_mult = card.ability.extra.x_mult }
            end

            if not context.blueprint then
                if context.end_of_round and not G.GAME_OVER
                and context.cardarea == G.jokers
                and G.GAME.current_round.hands_played == 1 then

                    card.ability.extra.x_mult = 
                    card.ability.extra.x_mult + card.ability.extra.x_mult_add

                    return {
                        message = localize('k_sonic_boom'),
                        colour = G.C.RARITY[4],
                        card = card
                    }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    HK = {
        blueprint_compat = false,

        key = 'Kh',
        pos = {x=11,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Kh'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Kh'
        }),
        config = {extra = {seal = 'red_seal', cards = 'k_face_cards', message = false}},

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = {
                key = card.ability.extra.seal, set = 'Other'
            }
            return {vars = {
                localize{
                    type = 'name_text',
                    set = 'Other',
                    key = card.ability.extra.seal
                },
                localize(card.ability.extra.cards)
            }}
        end,

        calculate = function(self,card,context)
            if context.initial_scoring_step and context.cardarea == G.jokers then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card:is_face() then
                        scored_card:set_seal('Red', true, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end}))
                        card.ability.extra.message = true
                    end
                end
                if card.ability.extra.message then
                    card.ability.extra.message = false
                    return {message = localize('k_fortified'), colour = G.C.RED}
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    HA = {
        blueprint_compat = false,

        key = 'Ah',
        pos = {x=12,y=0},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Ah'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Ah'
        }),
        config = {extra = {rank = 'Ace', suit = 'Hearts'}},

        loc_vars = function(self, info_queue, card)
            return { vars = { 
                localize(card.ability.extra.rank,'ranks'),
                localize(card.ability.extra.suit,'suits_plural'),
                colours = {G.C.SUITS[card.ability.extra.suit]}
            }}
        end,

        add_to_deck = function(self, card, from_debuff)
            if from_debuff then return end

            local all_stone = true

            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.config.center.key ~= 'm_stone' then
                    all_stone = false
                    break
                end
            end

            if not all_stone then
                local playing_card
                repeat
                    playing_card = pseudorandom_element(
                        G.playing_cards, pseudoseed('Faceless')
                    )
                until playing_card.config.center.key ~= 'm_stone'
                card.ability.extra.rank = playing_card.base.value
                card.ability.extra.suit = playing_card.base.suit
            end
        end,

        calculate = function(self, card, context)
            if context.end_of_round and context.cardarea == G.jokers then
                local full_deck = {}

                for _, playing_card in ipairs(G.playing_cards or {}) do
                    if not SMODS.has_enhancement(playing_card, 'm_stone') then
                        full_deck[#full_deck + 1] = playing_card
                    end
                end

                if #full_deck > 0 then
                    local playing_card = pseudorandom_element(
                        full_deck,
                        pseudoseed('Faceless')
                    )

                    card.ability.extra.rank = playing_card.base.value
                    card.ability.extra.suit = playing_card.base.suit
                end
            end

            if context.after then
                local changed_cards = {}
                for _, scored_card in pairs(context.scoring_hand) do
                    if not SMODS.has_enhancement(scored_card, 'm_stone') then
                        local change = 
                            SMODS.change_base(
                                scored_card,
                                card.ability.extra.suit,
                                card.ability.extra.rank,
                                true
                            )
                        if change then
                            table.insert(changed_cards, scored_card)
                        end
                    end
                end

                if #changed_cards > 0 then
                    return {
                        message = localize('k_faceless'),
                        colour = G.C.RARITY[4],
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                func = function()
                                    for _, scored_card in ipairs(changed_cards) do
                                        scored_card:set_sprites(
                                            nil, scored_card.config.card
                                        )
                                        scored_card:juice_up()
                                    end
                                    return true
                                end
                            }))
                        end
                    }
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    D2 = {
        key = '2d',
        pos = {x=0,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '2d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '2d'
        }),
        config = {extra = {x_mult_add = 0.5, x_mult = 1}},

        loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.x_mult_add,
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {x_mult = card.ability.extra.x_mult}
            end

            if not context.blueprint then
                if context.before then
                    local seals = {}

                    for _, playing_card in ipairs(context.scoring_hand or {}) do
                        local seal = playing_card.seal

                        if seal ~= nil and not contains(seal,seals) then
                            table.insert(seals,seal)
                        end
                    end

                    if #seals > 0 then
                        card.ability.extra.x_mult =
                        card.ability.extra.x_mult + card.ability.extra.x_mult_add * #seals

                        return {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.MULT,
                            card = card
                        }
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },
    
    D3 = {
        blueprint_compat = false,

        key = '3d',
        pos = {x=1,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '3d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '3d'
        }),
        config = {extra = {enhancement = 'm_glass'}},

        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return { vars = { localize({
                type = 'name_text', set = 'Enhanced',
                key = card.ability.extra.enhancement
                })
            }}
        end,


        calculate = function(self, card, context)
            if context.before and G.GAME.current_round.hands_played == 0 then

                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card:set_ability(
                        G.P_CENTERS[card.ability.extra.enhancement],
                        nil, true
                    )

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end

                return {
                    message = localize('k_marbles'),
                    colour = G.C.EXTRA
                }
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    D4 = {
        key = '4d',
        pos = {x=2,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '4d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '4d'
        }),
        config = { extra = {retrigger = 4, message = false} },
        
        loc_vars = function(self,info_queue,card)
            return {vars = {card.ability.extra.retrigger}}
        end,

        calculate = function(self,card,context)
            if context.repetition and context.cardarea == G.play
            and context.scoring_hand and G.GAME.current_round.hands_played == 0 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retrigger,
                    card = card
                }
            end

            if not context.blueprint then
                if context.setting_blind then
                    card.ability.extra.message = true
                end

                if context.cardarea == G.play and context.destroy_card
                and G.GAME.current_round.hands_played == 0 then                
                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        return {
                            remove = true,
                            message = localize('k_withered'),
                            colour = G.C.GREY
                        }
                    else return {remove = true}
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    D5 = {
        blueprint_compat = false,

        key = '5d',
        pos = {x=3,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '5d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '5d'
        }),
        config = {extra = {rank = 1}},

        loc_vars = function(self,info_queue,card)
            return {vars = {
                localize('k_face_cards'),
                localize('k_numbered_cards'),
                card.ability.extra.rank}
            }
        end,

        calculate = function(self, card, context)
            if context.initial_scoring_step then
                local changed_cards = {}

                for _, scored_card in ipairs(context.scoring_hand) do
                    if not SMODS.has_enhancement(scored_card, 'm_stone') 
                    and scored_card:get_id() < 14 then
                        local increase = SMODS.modify_rank(
                            scored_card, 
                            card.ability.extra.rank,
                            true)
                        if increase then
                            table.insert(changed_cards, scored_card)
                        end
                    end
                end

                if changed_cards and next(changed_cards) then
                    return {
                        message = localize('k_evolved'),
                        colour = G.C.RARITY[4],
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                func = function()
                                    for _, scored_card in ipairs(changed_cards) do
                                        scored_card:set_sprites(
                                            nil,
                                            scored_card.config.card
                                        )
                                        scored_card:juice_up()
                                    end
                                    return true
                                end
                            }))
                        end
                    }
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    D6 = {
        key = '6d',
        pos = {x=4,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '6d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '6d'
        }),
        config = {extra = {
            x_mult_add = 1,
            count = 0,
            x_mult = 1,
            destroy_card = nil
        }},

        loc_vars = function(self, info_queue, card)
            local extra = card.ability.extra
            return {
                vars = {
                    extra.x_mult_add,
                    13 - extra.count % 13,
                    extra.x_mult
                }
            }
        end,

        calculate = function(self, card, context)
            local extra = card.ability.extra
            if context.joker_main then
                return {
                    x_mult = extra.x_mult
                }
            end
            
            if not context.blueprint then
                if context.before and context.full_hand then
                    extra.destroy_card = nil

                    for _, playing_card in ipairs(context.full_hand) do
                        extra.count = extra.count + 1

                        if extra.count % 13 == 0 then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = localize('k_upgrade_ex')
                            })

                            extra.x_mult = extra.x_mult + extra.x_mult_add
                            extra.destroy_card = playing_card
                        end
                    end
                end

                if context.destroy_card and context.cardarea == G.play
                    and  context.destroy_card == extra.destroy_card then

                    card_eval_status_text(card, 'extra', 
                    nil, nil, nil, {message = localize('k_slained')})

                    extra.destroy_card = nil
                    return { remove = true }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    D7 = {
        key = '7d',
        pos = {x=5,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '7d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '7d'
        }),
        config = {extra = {x_mult_add = 0.02, x_mult = 1}},

        loc_vars = function(self,info_queue,card)
            return {vars = {
                    card.ability.extra.x_mult_add,
                    card.ability.extra.x_mult
                }}
        end,

        calculate = function(self, card, context)
            local extra = card.ability.extra

            if context.joker_main then
                return { x_mult = extra.x_mult }
            end

            if not context.blueprint then
                if context.money_altered and context.amount < 0 then
                    extra.x_mult = extra.x_mult
                        + (-context.amount) * extra.x_mult_add

                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.RED,
                        card = card
                    }
                end


                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    D8 = {
        blueprint_compat = false,

        key = '8d',
        pos = {x=6,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '8d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '8d'
        }),
        config = {},

        calculate = function(self, card, context)
            if context.initial_scoring_step then
                return{
                    swap = true,
                    message = localize('k_swapped'),
                    colour = G.C.RARITY[4]
                }
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    D9 = {
        key = '9d',
        pos = {x=7,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '9d'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '9d'
        }),
        config = { extra = { x_mult = 1 } },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.x_mult}}
        end,

        calculate = function(self, card, context)

            if context.joker_main then
                return {x_mult = card.ability.extra.x_mult}
            end
            
            if not context.blueprint then
                if context.initial_scoring_step
                and G.GAME.current_round.hands_played == 0 then
                    local rank = context.scoring_hand[1]:get_id()
                    local point = 1
                    if rank >= 2 and rank <= 10 then
                        point = rank
                    elseif rank >= 11 and rank <= 13 then
                        point = 10
                    elseif rank == 14 then
                        point = 11
                    end
                    
                    card.ability.extra.x_mult = point
                end

                if context.destroy_card and context.cardarea == G.play
                and G.GAME.current_round.hands_played == 0
                and context.destroy_card == context.scoring_hand[1] then
                    return {remove = true, message = localize('k_sacrificed')}
                end

                if context.end_of_round and context.main_eval then

                    card.ability.extra.x_mult = 1
                    return {message = localize('k_reset')}
                end


                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    DT = {
        blueprint_compat = false,

        key = 'Td',
        pos = {x=8,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Td'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Td'
        }),
        config = {extra = {enhancement = 'm_lucky'}},

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {vars = {
                localize({
                    type = 'name_text', set = 'Enhanced',
                    key = card.ability.extra.enhancement
                })
            }}
        end,

        calculate = function(self, card, context)
            if context.fix_probability
            and context.trigger_obj
            and context.trigger_obj.config
            and context.trigger_obj.config.center
            and context.trigger_obj.config.center.key == 'm_lucky'
            then
                return {numerator = 1, denominator = 1}
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    DJ = {
        blueprint_compat = false,

        key = 'Jd',
        pos = {x=9,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Jd'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Jd'
        }),
        config = {},

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    localize('Four of a Kind', 'poker_hands'),
                    localize('Five of a Kind', 'poker_hands')
                }
            }
        end,

        calculate = function(self, card, context)
            if context.selling_self then
                adding_self(card)
            end

            if not context.evaluate_poker_hand then
                return
            end

            if context.scoring_name ~= 'Four of a Kind'
                or not context.full_hand
                or #context.full_hand ~= 5 then
                return 
            end

            local poker_hands = context.poker_hands or {}

            if poker_hands['Flush'] and next(poker_hands['Flush']) then
                return { replace_scoring_name = 'Flush Five' }
            else 
                return {replace_scoring_name = 'Five of a Kind' }
            end
        end,
    },

    DQ = (function()
        local Balor = function()
            G.VIEWING_DECK = true
            local drawpile = {}

            if G.deck and G.deck.cards then
                for _, card in ipairs(G.deck.cards) do
                    table.insert(drawpile, card)
                end
            end

            local view_deck = CardArea(
                G.ROOM.T.x + 0.05 * G.ROOM.T.w,
                G.ROOM.T.h,
                8 * G.CARD_W,
                0.5 * G.CARD_H,
                {
                    card_limit = math.max(#drawpile, 1),
                    type = 'title',
                    view_deck = true,
                    highlight_limit = 0,
                    card_w = G.CARD_W * 0.5,
                    draw_layers = {'card'}
                }
            )

            for index = #drawpile, 1, -1 do
                local card = drawpile[index]

                if card ~= nil then
                    local copy = copy_card(card, nil ,0.8)
                        copy.T.x = view_deck.T.x + view_deck.T.w / 2
                        copy.T.y = view_deck.T.y
                        copy:hard_set_T()
                        view_deck:emplace(copy)
                end
            end

            local tips = nil
            if not G.GAME.blind or not G.GAME.blind.in_blind then
                tips = localize('k_not_ready')
            elseif #drawpile > 0 then
                tips = localize('k_ready')
            else tips = localize('k_drawn')
            end
            
            return {
                n = G.UIT.ROOT,
                config = { align = "cm", colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            align = 'cm',
                            padding = 0.1,
                            r = 0.1,
                            colour = G.C.BLACK,
                            emboss = 0.05
                        },
                        nodes = { {n = G.UIT.O, config = {object = view_deck}} }
                    },
                    {
                        n = G.UIT.R,
                        config = { align = 'cm', minh = 0.8, padding = 0.05 },
                        nodes = {{
                                n = G.UIT.T,
                                config = {
                                    text = tips,
                                    colour = G.C.WHITE,
                                    scale = 0.6
                                }
                            }}
                    }
                }
            }
        end

        local backup_create_tabs = create_tabs

        local function has_balor()
            if not (G and G.jokers and G.jokers.cards) then
                return false
            end

            for _, joker in ipairs(G.jokers.cards) do
                if joker
                    and joker.config
                    and joker.config.center
                    and joker.config.center.key == 'j_' .. mod_prefix .. '_Qd'
                    and not joker.debuff
                then
                    return true
                end
            end

            return false
        end

        if type(backup_create_tabs) == 'function' then
            create_tabs = function(args)
                local UIDEF = G and G.UIDEF

                if UIDEF then
                    if type(UIDEF.Balor) ~= 'function' then
                        UIDEF.Balor = function()
                            return Balor()
                        end
                    end

                    if has_balor() and args
                        and type(args.tabs) == 'table'
                        and type(UIDEF.view_deck) == 'function'
                    then
                        local is_view_deck = false
                        local has_balor_tab = false

                        for _, tab in ipairs(args.tabs) do
                            if type(tab) == 'table' then
                                if tab.tab_definition_function == UIDEF.view_deck then
                                    is_view_deck = true
                                end

                                if tab.tab_definition_function == UIDEF.Balor then
                                    has_balor_tab = true
                                end
                            end
                        end

                        if is_view_deck and not has_balor_tab then
                            table.insert(args.tabs, {
                                label = localize('k_balor'),
                                tab_definition_function = UIDEF.Balor
                            })
                        end
                    end
                end

                return backup_create_tabs(args)
            end
        end

        return {
            blueprint_compat = false,

            key = 'Qd',
            pos = {x=10,y=2},
            name = localize({
                type = 'name_text',
                set = 'Joker',
                key = 'Qd'
            }),
            text = localize({
                type = 'raw_descriptions',
                set = 'Joker',
                key = 'Qd'
            }),
            config = {},
            calculate = function(self, card, context)
                if context.selling_self then
                    adding_self(card)
                end
            end
        }
    end
    )(),

    DK = {
        blueprint_compat = false,
        
        key = 'Kd',
        pos = {x=11,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Kd'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Kd'
        }),
        config = {},

        calculate = function(self, card, context)
            if context.final_scoring_step then
                return{balance = true, colour = G.C.PURPLE}
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    DA = {
        blueprint_compat = false,

        key = 'Ad',
        pos = {x=12,y=2},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Ad'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Ad'
        }),
        config = {},
        calculate = function(self,card,context)
            if context.selling_self then
                adding_self(card)
            end
        end
    },

    C2 = {
        blueprint_compat = false,

        key = '2c',
        pos = {x=0,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '2c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '2c'
        }),
        config = {extra = {enhancements = {'m_steel','m_gold'}}},

        loc_vars = function(self, info_queue, card)
            for i = 1, #card.ability.extra.enhancements do
                info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancements[i]]
            end
            return {vars = {
                localize({
                    type = 'name_text', set = 'Enhanced',
                    key = card.ability.extra.enhancements[1]
                }),
                localize({
                    type = 'name_text', set = 'Enhanced',
                    key = card.ability.extra.enhancements[2]
                }),
            }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand then
                local other_card = context.other_card
                if context.end_of_round then
                    if SMODS.has_enhancement(other_card, 'm_steel') then
                        return {
                            dollars = G.P_CENTERS.m_gold.config.h_dollars,
                            card = card
                        }
                    end
                else
                    if SMODS.has_enhancement(other_card, 'm_gold') then
                        return {
                            x_mult = G.P_CENTERS.m_steel.config.h_x_mult,
                            card = card
                        }
                    end
                end
            end

            if context.selling_self then
                adding_self(card)
            end
        end
    },

    C3 = {
        key = '3c',
        pos = {x=1,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '3c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '3c'
        }),
        config = {extra = {x_mult_add = 0.1}},

        loc_vars = function(self,info_queue,card)
            return {vars = {card.ability.extra.x_mult_add}}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_x_mult =
                (context.other_card.ability.perma_x_mult or 0)
                + card.ability.extra.x_mult_add
                return {
                    extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
                    colour = G.C.MULT,
                    card = card
                }
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    C4 = {
        blueprint_compat = false,

        key = '4c',
        pos = {x=2,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '4c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '4c'
        }),
        config = {extra = {enhancement = 'm_lucky', x_mult = 3, message = false}},

        loc_vars = function(self, info_queue, card)
            return {vars = {
                localize({
                    type = 'name_text',
                    set = 'Enhanced',
                    key = card.ability.extra.enhancement
                }),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self,card,context)
            if context.after and context.cardarea == G.jokers
            and context.main_eval and G.deck
            and G.hand and #G.hand.cards > 0
            then
                card_eval_status_text(
                    card, 'extra', nil, nil, nil,
                    {
                        message = localize('k_blown'),
                        colour = G.C.GREEN
                })

                for i = 1, #G.hand.cards do
                    draw_card(G.hand,  G.deck, 50, 'up')
                end

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        if G.deck and #G.deck.cards > 1 then
                            G.deck:shuffle()
                        end
                        return true
                    end
                }))
            end
        end
    },

    C5 = {
        key = '5c',
        pos = {x=3,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '5c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '5c'
        }),
        config = {extra = {enhancement = 'm_stone', x_mult = 3, message = false}},

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {vars = {
                localize({
                    type = 'name_text',
                    set = 'Enhanced',
                    key = card.ability.extra.enhancement
                }),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self,card,context)
            if context.individual and context.cardarea == G.play then
                if context.other_card.config.center.key == 
                card.ability.extra.enhancement then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card
                        }
                end
            end


            if not context.blueprint then
                if context.setting_blind then
                    card.ability.extra.message = true
                end

                if context.cardarea == G.play and context.destroy_card and
                context.destroy_card.config.center.key == card.ability.extra.enhancement
                then                
                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        return {
                            remove = true,
                            message = localize('k_crumbled'),
                            colour = G.C.RED
                        }
                    else return {remove = true}
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end

        end
    },

    C6 = {
        key = '6c',
        pos = {x=4,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '6c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '6c'
        }),
        config = {extra = {numerator = 1, denominator = 2}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = {
                key = 'e_foil',
                set = 'Edition',
                config = {extra = 50}
            }

            local numerator, denominator = SMODS.get_probability_vars(
                card, card.ability.extra.numerator,
                card.ability.extra.denominator, 'Shallow Blue'
            )

            return {vars = { numerator, denominator }}
        end,

        calculate = function(self, card, context)
            if context.before and context.scoring_hand
                and #context.scoring_hand > 0
                and G.GAME.current_round.hands_played == 0 then

                local message = false
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.edition == nil then
                        if SMODS.pseudorandom_probability(
                            card, 'Shallow Blue',
                            card.ability.extra.numerator,
                            card.ability.extra.denominator
                        ) then
                            scored_card:set_edition(
                                {negative = true},
                                true, false, true
                            )
                            message = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
                end
                if message then
                    message = false
                    return{
                        message = localize('k_submerged'),
                        colour = G.C.RARITY[4],
                        card = scored_card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    C7 = {
        key = '7c',
        pos = {x=5,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '7c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '7c'
        }),
        config = { extra = {rank = 7, x_mult = 3, message = false}},

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                localize(rank_to_string(card.ability.extra.rank),'ranks'),
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == card.ability.extra.rank then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        colour = G.C.RED,
                        card = card,
                        }
                end
            end

            if not context.blueprint then
                if context.setting_blind then
                    card.ability.extra.message = true
                end

                if context.cardarea == G.play and context.destroy_card
                and context.destroy_card:get_id() == card.ability.extra.rank then                
                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        return {
                            remove = true,
                            message = localize('k_ignited'),
                            colour = G.C.RED
                        }
                    else return {remove = true}
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    C8 = {
        key = '8c',
        pos = {x=6,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '8c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '8c'
        }),
        config = {extra = {numerator = 1, denominator = 24}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = {
                key = 'e_negative_playing_card',
                set = 'Edition',
                config = {extra = 1}
            }
            
            local numerator, denominator = SMODS.get_probability_vars(
                card, card.ability.extra.numerator,
                card.ability.extra.denominator, 'Sinking Shadow'
            )

            return {vars = { numerator, denominator }}
        end,

        calculate = function(self, card, context)
            if context.before and context.scoring_hand
                and #context.scoring_hand > 0
                and G.GAME.current_round.hands_played == 0 then

                local message = false
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.edition == nil then
                        if SMODS.pseudorandom_probability(
                            card, 'Sinking Shadow',
                            card.ability.extra.numerator,
                            card.ability.extra.denominator
                        ) then
                            scored_card:set_edition(
                                {negative = true},
                                true, false, true
                            )
                            message = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
                end
                if message then
                    message = false
                    return{
                        message = localize('k_sunk'),
                        colour = G.C.RARITY[4],
                        card = scored_card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    C9 = {
        key = '9c',
        pos ={x=7,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = '9c'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = '9c'
        }),
        config = {extra = {numerator = 1, denominator = 8}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = {
                key = 'e_polychrome',
                set = 'Edition',
                config = {extra = 1.5}
            }

            local numerator, denominator = SMODS.get_probability_vars(
                card, card.ability.extra.numerator,
                card.ability.extra.denominator, 'Rising Light'
            )

            return {vars = { numerator, denominator }}
        end,

        calculate = function(self, card, context)
            if context.before and context.scoring_hand
                and #context.scoring_hand > 0
                and G.GAME.current_round.hands_played == 0 then

                local message = false
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.edition == nil then
                        if SMODS.pseudorandom_probability(
                            card, 'Rising Light',
                            card.ability.extra.numerator,
                            card.ability.extra.denominator
                        ) then
                            scored_card:set_edition(
                                {polychrome = true},
                                true, false, true
                            )
                            message = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
                end
                if message then
                    message = false
                    return{
                        message = localize('k_shone'),
                        colour = G.C.RARITY[4],
                        card = scored_card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    CT = {
        key = 'Tc',
        pos = {x=8,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Tc'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Tc'
        }),
        config = {extra = {numerator = 1, denominator = 3}},

        loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = {
                key = 'e_holo',
                set = 'Edition',
                config = {extra = 10}
            }

            local numerator, denominator = SMODS.get_probability_vars(
                card, card.ability.extra.numerator,
                card.ability.extra.denominator, 'Million Volt'
            )

            return {vars = { numerator, denominator }}
        end,

        calculate = function(self, card, context)
            if context.before and context.scoring_hand
                and #context.scoring_hand > 0
                and G.GAME.current_round.hands_played == 0 then

                local message = false
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.edition == nil then
                        if SMODS.pseudorandom_probability(
                            card, 'Million Volt',
                            card.ability.extra.numerator,
                            card.ability.extra.denominator
                        ) then
                            scored_card:set_edition(
                                {holo = true},
                                true, false, true
                            )
                            message = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
                end
                if message then
                    message = false
                    return{
                        message = localize('k_charged'),
                        colour = G.C.RARITY[4],
                        card = scored_card
                    }
                end
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    CJ = (function()
        local backup_draw_from_play_to_discard =
            G.FUNCS.draw_from_play_to_discard

        local card_target = nil
        local show_massage = false

        G.FUNCS.draw_from_play_to_discard = function(e)
            local target = card_target
            card_target = nil

            if not (
                target and G.play and G.hand
                and target.area == G.play
                and not target.shattered
                and not target.destroyed
            ) then
                return backup_draw_from_play_to_discard(e)
            end

            local play_count = #G.play.cards
            local it = 1

            for _, scored_card in ipairs(G.play.cards) do
                if scored_card ~= target
                    and not scored_card.shattered
                    and not scored_card.destroyed then

                    draw_card(
                        G.play, G.discard, it * 100 / play_count,
                        'down', false, scored_card
                    )

                    it = it + 1
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                func = function()
                    if target and G.play and G.hand  and target.area == G.play
                        and not target.shattered and not target.destroyed then

                        draw_card(G.play, G.hand, nil, 'up', true, target)

                        show_massage = true
                    end

                    return true
                end
            }))
        end

        return {
            blueprint_compat = false,

            key = 'Jc',
            pos = {x=9, y=1},
            name = localize({
                type = 'name_text',
                set = 'Joker',
                key = 'Jc'
            }),
            text = localize({
                type = 'raw_descriptions',
                set = 'Joker',
                key = 'Jc'
            }),
            config = {extra = {}},

            calculate = function(self, card, context)
                if not context.blueprint and context.selling_self then
                    adding_self(card)
                end

                if context.after and context.cardarea == G.jokers then
                    card_target =
                        context.scoring_hand
                        and context.scoring_hand[1]
                        or nil
                end

                if show_massage then
                    show_massage = false

                    return {
                        message = localize('k_coming_home'),
                        colour = G.C.RARITY[4]
                    }
                end
            end
        }
    end)(),

    CQ = {
        key = 'Qc',
        pos = {x=10,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Qc'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Qc'
        }),
        config = { extra = {enhancement = 'm_bonus', x_mult_add = 3, message = false} },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
            return {vars = {
                    localize({
                        type = 'name_text',
                        set = 'Enhanced',
                        key = card.ability.extra.enhancement
                    }),
                    card.ability.extra.x_mult_add
                }}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play
                and context.other_card
                and context.other_card.config.center == G.P_CENTERS.m_bonus
            then
                return {
                    x_mult = card.ability.extra.x_mult_add,
                    card = card
                }
            end

            if not context.blueprint then
                if context.setting_blind then
                    card.ability.extra.message = true
                end

                if context.cardarea == G.play and context.destroy_card and
                context.destroy_card.config.center.key == card.ability.extra.enhancement
                then                
                    if card.ability.extra.message then
                        card.ability.extra.message = false
                        return {
                            remove = true,
                            message = localize('k_defeated'),
                            colour = G.C.RED
                        }
                    else return {remove = true}
                    end
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    CK = {
        key = 'Kc',
        pos = {x=11,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Kc'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Kc'
        }),
        config = {extra = {chips = 0, mult = 0, x_mult = 1, message = false}},

        loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.x_mult
            }}
        end,

        calculate = function(self,card,context)
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                    x_mult = card.ability.extra.x_mult,
                }
            end

            if context.remove_playing_cards and context.cardarea == G.jokers then
                if card.ability.extra.message then
                    card.ability.extra.message = false
                    return {
                        message = localize('k_reaped'),
                        colour = G.C.RED
                    }
                end     
            end

            if not context.blueprint then
                if context.cardarea == G.play and
                context.destroy_card and G.GAME.current_round.hands_played == 0
                then
                    card.ability.extra.message = true

                    local chips = 0
                    local mult = 0
                    local x_mult = 0
                    local money = 0

                    local scored_card = context.destroy_card
                    local enhancement = scored_card.config.center.key
                    local edition = scored_card.edition or {}

                    if enhancement then
                        if enhancement == 'm_bonus' then
                            chips = chips + G.P_CENTERS.m_bonus.config.bonus
                        elseif enhancement == 'm_stone' then
                            chips = chips + G.P_CENTERS.m_stone.config.bonus
                        elseif enhancement == 'm_mult' then
                            mult = mult + G.P_CENTERS.m_mult.config.mult
                        elseif enhancement == 'm_steel' then
                            x_mult = x_mult + G.P_CENTERS.m_steel.config.h_x_mult
                        elseif enhancement == 'm_glass' then 
                            x_mult = x_mult + G.P_CENTERS.m_glass.config.Xmult
                        elseif enhancement == 'm_gold' then
                            money = money + G.P_CENTERS.m_gold.config.h_dollars
                        elseif enhancement == 'm_lucky' then

                            if SMODS.pseudorandom_probability(
                                card, "Reaper's Hand", 1, 5
                            ) then 
                                mult = mult + G.P_CENTERS.m_lucky.config.mult
                            end

                            if SMODS.pseudorandom_probability(
                                card, "King of Clubs", 1, 15
                            ) then
                                money = money + G.P_CENTERS.m_lucky.config.p_dollars
                            end
                        else
                            local config = G.P_CENTERS[enhancement].config
                            chips = chips + config.bonus
                            mult = mult + config.mult
                            x_mult = x_mult + config.h_x_mult or config.Xmult
                            money = money + config.h_dollars
                        end
                    end

                    local edition = scored_card.edition or {}

                    chips = chips + (edition.chips or 0)
                    mult = mult + (edition.mult or 0)
                    x_mult = x_mult + (edition.x_mult or 0)

                    card.ability.extra.chips =
                    card.ability.extra.chips + chips
                    card.ability.extra.mult =
                    card.ability.extra.mult + mult
                    card.ability.extra.x_mult =
                    card.ability.extra.x_mult + x_mult

                    return {
                        remove = true,
                        dollars = money > 0 and money or nil,
                    }
                end

                if context.selling_self then
                    adding_self(card)
                end
            end
        end
    },

    CA = {
        key = 'Ac',
        pos = {x=12,y=1},
        name = localize({
            type = 'name_text',
            set = 'Joker',
            key = 'Ac'
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'Ac'
        }),
        config = {},

        calculate = function(self, card, context)
            if context.setting_blind
            and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
            then
                local blueprint_or_self = context.blueprint_card or card

                G.GAME.consumeable_buffer =
                    (G.GAME.consumeable_buffer or 0) + 1

                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local spectral = create_card(
                                    'Spectral',
                                    G.consumeables,
                                    nil, nil, nil, nil, nil,
                                    'Another Lives'
                                ) 
                                -- _type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append
                                spectral:add_to_deck()
                                G.consumeables:emplace(spectral)

                                G.GAME.consumeable_buffer = math.max(0,
                                    G.GAME.consumeable_buffer - 1)

                                return true
                            end}))
            
                        card_eval_status_text(blueprint_or_self,
                            'extra', nil, nil, nil, 
                            {message = localize('k_summoned'),
                            colour = G.C.SECONDARY_SET.Spectral})

                        return true
                    end
                    )
                }))
            end

            if not context.blueprint and context.selling_self then
                adding_self(card)
            end
        end
    },

    JR = {key = '0x',name = 'Red Joker',unlocked = false},
    JB = {key = '1x',name = 'Black Joker',unlocked = false}
}

for key, card in pairs(XPC) do
    card.rarity = 4
    card.cost = 1
    card.enhancment = nil
    card.seal = nil
    if key:sub(1,1) ~= 'J' then
        local suffix = localize({
            type = 'raw_descriptions',
            set = 'Joker',
            key = 'add'
        })
    end
    card.undiscovered = {
        atlas = mod_prefix .. '_XPC_undiscovered',
        pos = card.pos
    }
end

local XPCO = {
    'S2','S3','S4','S5','S6','S7','S8','S9','ST','SJ','SQ','SK','SA',
    'H2','H3','H4','H5','H6','H7','H8','H9','HT','HJ','HQ','HK','HA',
    'D2','D3','D4','D5','D6','D7','D8','D9','DT','DJ','DQ','DK','DA',
    'C2','C3','C4','C5','C6','C7','C8','C9','CT','CJ','CQ','CK','CA',
    --'JR','JB'
}

local XPCJ = {}

for _, k in ipairs(XPCO) do
    local joker = XPC[k]
    XPCJ[#XPCJ + 1] = SMODS.Joker({
        key = joker.key,
        atlas = 'XPC',
        pos = joker.pos,
        rarity = joker.rarity,
        cost = joker.cost,
        unlocked = joker.unlocked ~= false,
        discovered = false,
        blueprint_compat = joker.blueprint_compat ~= false,
        undiscovered = joker.undiscovered,

        in_pool = function() return false end,

        config = joker.config,
        loc_txt = {
            name = joker.name,
            text = joker.text
        },
        loc_vars = joker.loc_vars,
        calculate = joker.calculate,
        add_to_deck = joker.add_to_deck,
        remove_from_deck = joker.remove_from_deck,
        update = joker.update
    })
end

---

local last_triggered_game = nil
local last_triggered_hand = nil

local atlas_1 = SMODS.Atlas({
    key = "XPdeck_1",
    path = 'face_Caro_LC.png',
    px = 71,
    py = 95,
})

local atlas_2 = SMODS.Atlas({
    key = "XPdeck_2",
    path = 'face_Caro_HC.png',
    px = 71,
    py = 95,
})

XPC_deck_key = 'X-Playing_Deck'

local function deck_matched(center)
    prefix_key = 'b_' .. mod_prefix .. '_' .. XPC_deck_key
    return center and (
        center.key == prefix_key
        or center.original_key == XPC_deck_key
    )
end
  
local backup_get_front_spriteinfo = get_front_spriteinfo

function get_front_spriteinfo(_front)
    local atlas, pos, sprite_args =
        backup_get_front_spriteinfo(_front)

    local selected_back =
        G.GAME and G.GAME.selected_back

    local center =
        selected_back
        and selected_back.effect
        and selected_back.effect.center

    if deck_matched(center)
        and _front
        and _front.pos
    then
        local atlas_key =
            (G.SETTINGS and G.SETTINGS.colourblind_option)
            and atlas_2.key
            or atlas_1.key

        local HCatlas = SMODS.get_atlas(atlas_key)

        if HCatlas then
            return HCatlas, _front.pos, sprite_args
        end
    end

    return atlas, pos, sprite_args
end

local function clone_color_map(source)
    local result = {}

    for suit, color in pairs(source or {}) do
        result[suit] = {
            color[1],
            color[2],
            color[3],
            color[4] or 1
        }
    end

    return result
end

local backup_SO_1 = clone_color_map(G.C.SO_1)
local backup_SO_2 = clone_color_map(G.C.SO_2)

local HC_SO_1 = {
    Hearts   = HEX('AF2C32'),
    Diamonds = HEX('00528C'),
    Spades   = HEX('59099E'),
    Clubs    = HEX('19823F'),
}

local HC_SO_2 = {
    Hearts   = HEX('D70C18'),
    Diamonds = HEX('0066FF'),
    Spades   = HEX('59099E'),
    Clubs    = HEX('1D9F3A'),
}

local function overwrite_color_map(target, source)
    if not target or not source then
        return
    end

    for suit, color in pairs(source) do
        local dest = target[suit]

        if dest then
            dest[1] = color[1]
            dest[2] = color[2]
            dest[3] = color[3]
            dest[4] = color[4] or 1
        else
            target[suit] = {
                color[1],
                color[2],
                color[3],
                color[4] or 1
            }
        end
    end
end

local function apply_suit_text_colors(back)
    local center =
        back and back.effect
        and back.effect.center

    local use_custom = deck_matched(center)

    overwrite_color_map(
        G.C.SO_1,
        use_custom and HC_SO_1 or backup_SO_1
    )

    overwrite_color_map(
        G.C.SO_2,
        use_custom and HC_SO_2 or backup_SO_2
    )
end

local unpack_fn = unpack or table.unpack

local backup_apply_to_run = Back.apply_to_run

function Back:apply_to_run(...)
    local result = {backup_apply_to_run(self, ...)}

    apply_suit_text_colors(self)

    return unpack_fn(result)
end

if Game and Game.start_run then
    local backup_start_run = Game.start_run

    function Game:start_run(...)
        local result = {backup_start_run(self, ...)}

        local back =
            (G.GAME and G.GAME.selected_back)
            or (self.GAME and self.GAME.selected_back)

        apply_suit_text_colors(back)

        return unpack_fn(result)
    end
end

if Game and Game.main_menu then
    local backup_main_menu = Game.main_menu

    function Game:main_menu(...)
        apply_suit_text_colors(nil)

        return backup_main_menu(self, ...)
    end
end


SMODS.Back({
    key = XPC_deck_key,
    atlas = 'XPCB',
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = localize({
            type = 'name_text',
            set = 'Back',
            key = XPC_deck_key
        }),
        text = localize({
            type = 'raw_descriptions',
            set = 'Back',
            key = XPC_deck_key
        })
    },

    calculate = function(self, back, context)
        if context.context ~= 'final_scoring_step' then
            return
        end

        if not G.GAME or not G.GAME.blind or not G.play
            or G.GAME.last_hand_played ~= 'High Card'
            or #G.play.cards ~= 1
        then return
        end

        local hand_count = G.GAME.hands_played or 0

        if last_triggered_game == G.GAME
            and last_triggered_hand == hand_count
        then return
        end

        if not G.jokers or #G.jokers.cards >= G.jokers.config.card_limit
        then return
        end

        local chips = context.chips or 0
        local mult = context.mult or 0

        if G.GAME.chips + chips * mult < G.GAME.blind.chips then
            return
        end

        local x = G.play.cards[1]

        if not x or x.destroyed or x.shattered then
            return
        end

        local rank = x.base.value
        local suit = x.base.suit

        if rank == '10' then rank = 'T'
        else rank = string.sub(rank, 1, 1)
        end

        suit = string.lower(string.sub(suit, 1, 1))

        local key = 'j_' .. mod_prefix .. '_' .. rank .. suit

        local edition = nil

        if type(x.edition) == 'table' then
            edition = copy_table(x.edition)
        elseif x.edition == 'e_negative_playing_card' then
            edition = {negative = true}
        end

        local enhancement = nil

        if x.config and x.config.center
        and x.config.center.set == 'Enhanced' then
            enhancement = x.config.center.key
        end

        local seal = x.seal

        last_triggered_game = G.GAME
        last_triggered_hand = hand_count

        card_eval_status_text(x, 'extra', nil, nil, nil, {
            message = localize('k_activated'),
            colour = G.C.GREEN,
            card = x
        })

        SMODS.destroy_cards({x})
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                local joker = SMODS.add_card({
                    set = 'Joker',
                    area = G.jokers,
                    key = key,
                    edition = edition,
                    no_edition = true,
                    skip_materialize = true,
                    silent = true,
                    immediate = true
                })

                if joker then
                    joker.ability.original = {
                        enhancement = enhancement,
                        seal = seal
                    }
                    joker:start_materialize()
                end

                return true
            end
        }))
    end
})

challenges = function(poker_hands, jokers)
    for h, j in pairs(jokers) do
        local temp = {}
        for _, key in ipairs(j) do
            temp[#temp + 1] = {
                id = 'j_'.. mod_prefix ..'_'.. key,
                eternal = true
            }
        end
        jokers[h] = temp
    end

    for i = #poker_hands, 1, -1 do
        SMODS.Challenge{
            key = poker_hands[i],
            deck = {type = 'Challenge Deck'},
            rules = {
                custom = {{id = 'no_shop_jokers'}},
                modifiers = {{id = 'joker_slots', value = 0}}
            },
            jokers = jokers[poker_hands[i]],
            consumeables = {},
            vouchers = {},
            restrictions = {
                banned_cards = {
                    {id = 'c_judgement'},
                    {id = 'c_wraith'},
                    {id = 'c_soul'},
                    {id = 'v_antimatter'},
                    {id = 'p_buffoon_normal_1', ids = {
                        'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1',
                    }}
                },
                banned_tags = {
                    {id = 'tag_rare'},
                    {id = 'tag_uncommon'},
                    {id = 'tag_holo'},
                    {id = 'tag_polychrome'},
                    {id = 'tag_negative'},
                    {id = 'tag_foil'},
                    {id = 'tag_buffoon'},
                    {id = 'tag_top_up'}
                },
                banned_other = {
                    {id = 'bl_final_heart', type = 'blind'},
                    {id = 'bl_final_leaf', type = 'blind'}
                }
            }
        }
    end
end

local poker_hands = {
    'RF','SF','4K',
    'FH','FL','ST','3K',
    '2P','1P','HC'
}
local jokers = {
    ['RF'] = {'As','Ks','Qs','Js','Ts'},
    ['SF'] = {'Jd','Td','9d','8d','7d'},
    ['4K'] = {'6s','6h','6d','6c','Jc'},
    ['FH'] = {'3s','3d','3c','Qh','Qc'},
    ['FL'] = {'Kh','8h','7h','4h','2h'},
    ['ST'] = {'5c','4s','3h','2d','Ah'},
    ['3K'] = {'5s','5h','5d','Kc','Tc'},
    ['2P'] = {'9h','9c','2s','2c','Qd'},
    ['1P'] = {'7s','7c','Jh','8c','4d'},
    ['HC'] = {'Kd','Th','9s','8s','4c'}
}

challenges(poker_hands, jokers)
