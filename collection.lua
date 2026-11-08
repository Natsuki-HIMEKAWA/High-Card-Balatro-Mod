local collection = function(XPC, keys, mod_prefix)

    function create_UIBox_collection(args)
        local rows = {5, 4, 4}
        local page_size = 13
        local page = 1
        local pages = 4

        if args and args.cycle_config then
            page = args.cycle_config.current_option or 1
        end

        page = math.max(1, math.min(pages, page))

        G.XPC_collection = {}

        local page_nodes = {}
        local card_index = (page - 1) * page_size + 1

        for row, row_size in ipairs(rows) do
            local area = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
                G.ROOM.T.h,
                row_size * G.CARD_W,
                0.90 * G.CARD_H,
                {
                    card_limit = row_size,
                    type = 'title',
                    highlight_limit = 0,
                    collection = true
                }
            )

            G.XPC_collection[row] = area

            for col = 1, row_size do
                local joker_data = XPC[keys[card_index]]
                card_index = card_index + 1

                local center = G.P_CENTERS['j_'.. mod_prefix ..'_'.. joker_data.key]

                if center then
                    local card = Card(
                        area.T.x + area.T.w / 2,
                        area.T.y,
                        G.CARD_W,
                        G.CARD_H,
                        G.P_CARDS.empty,
                        center
                    )

                    card.sticker = get_joker_win_sticker(center)
                    area:emplace(card)
                end
            end

            page_nodes[#page_nodes + 1] = {
                n = G.UIT.R,
                config = {
                    align = 'cm',
                    padding = 0,
                    no_fill = true
                },
                nodes = {{n = G.UIT.O, config = {object = area}}}
            }
        end

        INIT_COLLECTION_CARD_ALERTS()

        local page_options = {}
        for i = 1, pages do
            page_options[i] = localize('k_page') ..' '.. tostring(i) ..'/'.. pages
        end

        page_nodes[#page_nodes + 1] = {
            n = G.UIT.R,
            config = {
                align = 'cm',
                padding = 0.05
            },
            nodes = {
                create_option_cycle({
                    options = page_options,
                    w = 4.5,
                    cycle_shoulders = true,
                    opt_callback = 'XPC_collection_page',
                    current_option = page,
                    colour = G.C.RED,
                    no_pips = true,
                    focus_args = {
                        snap_to = true,
                        nav = 'wide'
                    }
                })
            }
        }

        local contents = {
            {
                n = G.UIT.R,
                config = {align = 'cm', padding = 0},
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = 'cm',
                            colour = G.C.BLACK,
                            r = 0.1,
                            padding = 0.1,
                            emboss = 0.05
                        },
                        nodes = page_nodes
                    }
                }
            }
        }

        return create_UIBox_generic_options({
            back_func = 'XPC_collection',
            contents = contents
        })
    end

    G.FUNCS.XPC_collection = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu({definition = create_UIBox_collection()})
    end

    G.FUNCS.XPC_collection_page = function(args)
        if not args or not args.cycle_config
        then return end

        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu({definition = create_UIBox_collection(args)})
    end
end

return collection