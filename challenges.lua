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
    ['1P'] = {'7s','7c','Jh','8s','4d'},
    ['HC'] = {'Kd','Th','9s','8c','4c'}
}

challenges = function(poker_hands, jokers)
    for h, j in pairs(jokers) do
        for i = 1, #j do
            j[i] = {id = 'j_'.. mod_prefix ..'_'.. j[i]}
        end
    end

    local standard_deck = {}
    for _, suit in ipairs({'S','H','D','C'}) do
        for _, rank in ipairs({'A','K','Q','J','T','9','8','7','6','5','4','3','2'}) do
            table.insert(standard_deck, {s = suit, r = rank})
        end
    end

    for index = #poker_hands, 1, -1 do
        local consumables = {}
        local hand = poker_hands[index]
        local cards = {}
        
        for _, card in ipairs(standard_deck) do
            local flag = true
            for _, joker in ipairs(jokers[hand]) do
                local suit = joker.id:sub(-1,-1)
                local rank = joker.id:sub(-2,-2)
                if suit:upper() == card.s and rank == card.r then
                    flag = false
                    break
                end
            end
            if flag then
                table.insert(cards, card)
            end
        end

        if hand == 'HC' then
            consumables = {{id = 'c_pluto'}}
        elseif hand == '1P' then
            consumables = {{id = 'c_mercury'}}
        elseif hand == '2P' then
            consumables = {{id = 'c_uranus'}}
        elseif hand == '3K' then
            consumables = {{id = 'c_venus'}}
        elseif hand == 'ST' then
            consumables = {{id = 'c_saturn'}}
        elseif hand == 'FL' then
            consumables = {{id = 'c_jupiter'}}
        elseif hand == 'FH' then
            consumables = {{id = 'c_earth'}}
        elseif hand == '4K' then
            consumables = {{id = 'c_mars'}}
        elseif hand == 'SF' then
            consumables = {{id = 'c_neptune'}}
        elseif hand == 'RF' then
            consumables = {{id = 'c_fool'},{id = 'c_neptune'}}
        end

        local challenge_jokers = jokers[hand] or {'j_joker'}
        SMODS.Challenge{
            key = hand,
            unlocked = function()
                for _, joker in ipairs(challenge_jokers) do
                    local center = G.P_CENTERS[joker.id]
                    if not center or not center.discovered then
                        return false
                    end
                end
                return true
            end,
            deck = {
                type = 'Challenge Deck',
                cards = cards
            },
            rules = {
                custom = {{id = 'no_shop_jokers'}},
                modifiers = {{id = 'joker_slots', value = 0}}
            },
            jokers = jokers[hand],
            consumeables = consumables,
            vouchers = {},
            restrictions = {
                banned_cards = {
                    {id = 'c_judgement'},
                    {id = 'c_wraith'},
                    {id = 'c_soul'},
                    {id = 'v_antimatter'},
                    {id = 'p_buffoon_normal_2', ids = {
                        'p_buffoon_normal_1','p_buffoon_normal_2', 'p_buffoon_jumbo_1','p_buffoon_mega_1'
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
                banned_other = {}
            }
        }
    end
end
challenges(poker_hands, jokers)