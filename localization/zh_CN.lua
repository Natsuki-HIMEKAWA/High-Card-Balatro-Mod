local descriptions = {
    Other = {
        hidden_base = {
            name = '隐藏牌面',
            text = {
                '{V:1}#2#{} {C:attention}#1#{}'
            }
        },

        [mod_prefix ..'_agent_s'] = {
            name = '克隆',
            text = {'本回合结束时{C:red}自毁{}'}
        }
    },

    Back = {
        ['b_'.. mod_prefix ..'_'.. XPC_deck_key] = {
            name = 'X-扑克牌组',
            text = {
                '使用{C:attention}单张牌{}打败任一',
                '{C:attention}盲注{}以激发该牌的潜能'
            }
        }
    },

    Joker = {
        ['j_'.. mod_prefix ..'_2s'] = {
            name = '新·新南部',
            text = {
                '当{C:legendary}新·新南部{}被获得',
                '或抽完{C:attention}第一手牌{}时，',
                '将出牌次数设为{C:blue}5{}；',
                '每张{C:attention}牌堆{}内剩余',
                '的牌给予{C:white,X:mult}X#2#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3s'] = {
            name = '无限棒',
            text = {
                '每张打出的{C:attention}#1#{}在',
                '计分时给予{C:white,X:mult}X#2#{}倍率'
            }
        },
        ['j_'.. mod_prefix ..'_4s'] = {
            name = '清冷长枪',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，则{C:legendary}清冷长枪{}',
                '获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_5s'] = {
            name = '致密重锤',
            text = {
                '计分后摧毁所有被',
                '计分的{C:attention}#1#{}，每张给予',
                '{C:legendary}致密重锤{C:white,X:mult}X#2#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6s'] = {
            name = '杂耍火铳',
            text = {
                '每摧毁一张{C:attention}#2#{}，',
                '{C:legendary}杂耍火铳{}获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7s'] = {
            name = '阻击者',
            text = {
                '将每回合{C:attention}第一手{}打出',
                '的{C:attention}牌型{}等级提升{C:attention}#1#{}级，',
                '且有{C:green}#2#/#3#{}概率将其改为',
                '提升{C:attention}#4#{}级'
            }
        },
        ['j_'.. mod_prefix ..'_8s'] = {
            name = '爆轰',
            text = {
                '每张打出的{C:attention}#1#{}',
                '给予{C:white,X:mult}X#2#{}倍率，且于',
                '计分后将其摧毁'
            }
        },
        ['j_'.. mod_prefix ..'_9s'] = {
            name = '墨家',
            text = {
                '出牌次数耗尽时，',
                '若{C:blue}筹码{}分数达到所需',
                '的{C:attention}#1#%{}，则免于{C:red}失败{}；',
                '所有{C:attention}奇数底注{}下的',
                '{C:attention}Boss盲注{}限制条件消失'
            }
        },
        ['j_'.. mod_prefix ..'_Ts'] = {
            name = '诚意之弓',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，则{C:legendary}诚意之弓{}',
                '获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Js'] = {
            name = '方舟之械',
            text = {
                '所有打出的{C:attention}#1#{}',
                '和{C:attention}#2#{}在计分时',
                '给予{C:white,X:mult}X#3#{}倍率'
            }
        },
        ['j_'.. mod_prefix ..'_Qs'] = {
            name = '美杜莎之鞭',
            text = {
                '打出的第一手牌中，',
                '所有计分牌额外触发',
                '{C:attention}#1#{}次，且于计分后将',
                '其转化为{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ks'] = {
            name = '石中剑骑士',
            text = {
                '所有打出的{C:attention}#1#{}在',
                '计分时转化为{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_As'] = {
            name = '爱与和平',
            text = {
                '计分时{C:attention}牌堆{}中的每张{C:attention}#1#{}',
                '提供{C:white,X:mult}X#2#{}倍率；本回合',
                '打出{C:attention}第一手牌{}前，总是',
                '迫使{C:attention}1{}张牌被选中，',
                '若该牌被用于计分，',
                '则计分后将其摧毁',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_2h'] = {
            name = '果冻触手',
            text = {
                '每拥有{C:money}$#1#{}，手牌',
                '上限{C:attention}+1{}，至多{C:attention}+#2#{}',
                '{C:inactive}（当前为{C:attention}+#3#{C:inactive}手牌上限）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3h'] = {
            name = '坚如磐石',
            text = {
                '打出的牌中，第一张',
                '计分牌变为{C:attention}#1#{}；',
                '计分时每张{C:attention}#1#{}',
                '给予{C:white,X:mult}X#2#{}倍率'
            }
        },
        ['j_'.. mod_prefix ..'_4h'] = {
            name = 'S探员',
            text = {
                '若本回合打出的{C:attention}第一手牌{}',
                '只有一张牌，则往手牌中',
                '添加其的{C:attention}4{}个{C:attention}克隆{}'
            }
        },
        ['j_'.. mod_prefix ..'_5h'] = {
            name = '高热量',
            text = {
                '剩余的每次{C:blue}出牌{}',
                '和{C:red}弃牌{}提供{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（打出下一手牌',
                '{C:inactive}时为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6h'] = {
            name = '动物园',
            text = {
                '每张打出的{C:attention}#1#{}在计分时',
                '给予{C:white,X:mult}X#2#{}倍率；',
                '计分后将其转变为{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_7h'] = {
            name = '变色龙',
            text = {
                '本回合{C:attention}第一次{}出牌中',
                '的所有计分牌转化为',
                '{C:attention}#1#{}；{C:attention}完整牌组{}',
                '中的每张{C:attention}#1#{}为',
                '{C:legendary}变色龙{}提供{C:white,X:mult}X#2#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8h'] = {
            name = '信息素',
            text = {
                '将所有计分牌的花色',
                '转变为本次出牌中',
                '{C:attention}第一张{}计分牌的花色'
            }
        },
        ['j_'.. mod_prefix ..'_9h'] = {
            name = '卓越天才',
            text = {
                '回合结束时',
                '牌堆中的每张牌',
                '给予{C:legendary}卓越天才{}',
                '{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Th'] = {
            name = '敏锐五感',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，则{C:legendary}敏锐感官{}',
                '获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jh'] = {
            name = '苍穹舞者',
            text = {
                '每使用一张{C:planet}星球牌{}',
                '额外提升{C:attention}#1#{}级',
                '相应牌型的等级'
            }
        },
        ['j_'.. mod_prefix ..'_Qh'] = {
            name = '音速行者',
            text = {
                '若只出{C:attention}1{}手牌即击败',
                '{C:attention}盲注{}，则{C:legendary}音速移动{}',
                '获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Kh'] = {
            name = '刚健体魄',
            text = {
                '所有打出的{C:attention}#2#{}在',
                '计分时获得{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ah'] = {
            name = '千人千面',
            text = {
                '所有打出的牌在',
                '计分后变为{V:1}#2#{}{C:attention}#1#{}',
                '{s:0.8}每回合卡牌都会变动'
            }
        },
        ['j_'.. mod_prefix ..'_2d'] = {
            name = '心有灵犀',
            text = {
                '每手计分牌中每种',
                '不同的蜡封给予',
                '{C:legendary}心有灵犀{C:white,X:mult}X#2#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3d'] = {
            name = '弹如雨下',
            text = {
                '本回合第一次出牌',
                '中的所有计分牌',
                '转化为{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_4d'] = {
            name = '时间默剧',
            text = {
                '打出的第一手牌中',
                '所有计分牌额外',
                '触发{C:attention}#1#{}次，且于',
                '计分后将其摧毁'
            }
        },
        ['j_'.. mod_prefix ..'_5d'] = {
            name = '最强人类',
            text = {
                '打出的所有{C:attention}#1#{}',
                '和{C:attention}#2#{}在计分时',
                '增加{C:attention}1{}级点数'
            }
        },
        ['j_'.. mod_prefix ..'_6d'] = {
            name = '13级阶梯',
            text = {
                '每打出{C:attention}13{}{C:inactive}(#2#){}张牌，',
                '{C:legendary}13级阶梯{}获得{C:white,X:mult}X#1#{}倍率，',
                '且摧毁每第{C:attention}13{}张打出的牌',
                '{C:inactive}（当前为{C:white,X:mult}X#3#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7d'] = {
            name = '等价交换',
            text = {
                '每花费或失去',
                '{C:money}$1{}，{C:legendary}等价交换{}',
                '获得{C:white,X:mult}X#1#{}倍率',
                '{C:inactive}（当前为{C:white,X:mult}X#2#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8d'] = {
            name = '红色迷宫',
            text = {
                '在打出的牌计分前',
                '互换{C:blue}筹码{}和{C:mult}倍率{}'
            }
        },
        ['j_'.. mod_prefix ..'_9d'] = {
            name = '无慈悲',
            text = {
                '将每回合{C:attention}第一张{}',
                '计分牌的{C:attention}点数{}赋予',
                '{C:legendary}无慈悲{}的{C:white,X:mult}X倍率{}，',
                '计分后将其摧毁',
                '回合结束后重置',
                '{C:inactive}（当前为{C:white,X:mult}X#1#{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Td'] = {
            name = '倒霉蛋',
            text = {
                '所有计分的{C:attention}#1#{}',
                '其两种效果必然触发'
            }
        },
        ['j_'.. mod_prefix ..'_Jd'] = {
            name = '五感之外',
            text = {
                '所有打出{C:attention}5{}张牌的',
                '{C:attention}#1#{}牌型均视为{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Qd'] = {
            name = '邪眼魔王',
            text = {'{C:dark_edition}预见{}牌堆的抽牌顺序'}
        },
        ['j_'.. mod_prefix ..'_Kd'] = {
            name = '周而复始',
            text = {
                '每手牌计分后',
                '平衡{C:blue}筹码{}和{C:mult}倍率{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ad'] = {
            name = '动态念力',
            text = {
                '回合内出售{C:B4883C}X-扑克牌{}',
                '会将其抽入手牌中'
            }
        },
        ['j_'.. mod_prefix ..'_2c'] = {
            name = '刚韧金属',
            text = {
                '所有{C:attention}#1#{}和{C:attention}#2#{}',
                '在手中同时具有',
                '这两种增强的效果'
            }
        },
        ['j_'.. mod_prefix ..'_3c'] = {
            name = '青翠藤蔓',
            text = {
                '打出的每张计分牌',
                '永久获得{C:white,X:mult}X#1#{}倍率'
            }
        },
        ['j_'.. mod_prefix ..'_4c'] = {
            name = '振翼疾风',
            text = {
                '每手牌计分后，',
                '将手中剩余的牌',
                '全部{C:attention}洗入{}牌堆'
            }
        },
        ['j_'.. mod_prefix ..'_5c'] = {
            name = '飞扬尘土',
            text = {
                '每张打出的{C:attention}#1#{}',
                '在计分时给予{C:white,X:mult}X#2#{}倍率，',
                '且于计分后将其摧毁'
            }
        },
        ['j_'.. mod_prefix ..'_6c'] = {
            name = '淡蓝波涛',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每张没有版本的{C:attention}计分牌{}',
                '都有{C:green}#1#/#2#{}概率获得{C:dark_edition}闪箔{}'
            }
        },
        ['j_'.. mod_prefix ..'_7c'] = {
            name = '致命辣度',
            text = {
                '每张打出的{C:attention}#1#{}在',
                '计分时给予{C:white,X:mult}X#2#{}倍率，',
                '且于计分后将其摧毁'
            }
        },
        ['j_'.. mod_prefix ..'_8c'] = {
            name = '沉没暗影',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每张没有版本的{C:attention}计分牌{}',
                '都有{C:green}#1#/#2#{}概率获得{C:dark_edition}负片{}'
            }
        },
        ['j_'.. mod_prefix ..'_9c'] = {
            name = '初升光明',
            text = {
                '每回合的{C:attention}第一手牌中{}，',
                '每张没有版本的{C:attention}计分牌{}',
                '都有{C:green}#1#/#2#{}概率获得{C:dark_edition}多彩{}'
            }
        },
        ['j_'.. mod_prefix ..'_Tc'] = {
            name = '百万伏特',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每张没有版本的{C:attention}计分牌{}',
                '都有{C:green}#1#/#2#{}概率获得{C:dark_edition}全息{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jc'] = {
            name = '归来',
            text = {
                '计分结束后，将{C:attention}第一张{}',
                '计分牌抽回手牌中'
            }
        },
        ['j_'.. mod_prefix ..'_Qc'] = {
            name = '角斗士',
            text = {
                '每张打出的{C:attention}#1#{}',
                '在计分时给予{C:white,X:mult}X#2#{}倍率，',
                '且于计分后将其摧毁'
            }
        },
        ['j_'.. mod_prefix ..'_Kc'] = {
            name = '死神之手',
            text = {
                '每回合{C:attention}第一次{}出牌中的',
                '所有计分牌将在计分后',
                '被摧毁，同时{C:legendary}死神之手{}',
                '获得这些牌相应增强与',
                '版本提供的{C:chips}筹码{}，{C:mult}倍率{}，',
                '{C:white,X:mult}X倍率{}，或返还相应{C:money}金钱{}',
                '{C:inactive}（当前为{C:chips}+#1#{}{C:inactive}筹码，{}',
                '{C:mult}+#2#{}{C:inactive}倍率{}，{X:mult,C:white}X#3#{}{C:inactive}倍率）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ac'] = {
            name = '行尸走肉',
            text = {
                '选择{C:attention}盲注后，',
                '生成一张{C:spectral}幻灵牌{}',
                '{C:inactive}（必须有空位）{}'
            }
        },
        ['j_'.. mod_prefix ..'_0x'] = {
            name = '',
            text = {},
            unlock = {'敬请期待！'}
        },
        ['j_'.. mod_prefix ..'_1x'] = {
            name = '',
            text = {},
            unlock = {'敬请期待！'}
        }
    }
}

for key, Joker in pairs(descriptions.Joker) do
    if key:sub(-1,-1) ~= 'x' then
        local add = {
            '{C:legendary,s:0.8}出售此牌以向牌组中加入{}',
            '{C:legendary,s:0.8}一张同版本、带有原有{}',
            '{C:legendary,s:0.8}增强及蜡封的相应扑克牌{}'
        }
        for _, string in ipairs(add) do
            Joker.text[#Joker.text + 1] = string
        end
    end
end

local misc = {
    labels = {
        HIGH_CARD_agent_s = '克隆',
    },
    dictionary = {
        k_loaded = '上膛！',
        k_smashed = '砸碎！',
        k_exploded = '爆炸！',
        k_mohism_saved = '兼爱，非攻',
        k_petrified = '石化！',
        k_armed = '着甲！',
        k_slained = '斩杀！',
        k_merged = '合体！',
        k_transform = '变形！',
        k_chameleon = '变色！',
        k_induce = '诱导！',
        k_brilliant = '明智！',
        k_dance = '起舞！',
        k_sonic_boom = '音爆！',
        k_fortified = '健壮！',
        k_faceless = '变脸！',
        k_marbles = '弹珠！',
        k_withered = '凋谢！',
        k_evolved = '进化！',
        k_swapped = '互换！',
        k_sacrificed = '献祭！',
        k_balor = '邪眼魔王',
        k_not_ready = '牌堆尚未就绪',
        k_ready = '由左至右抽牌',
        k_drawn = '牌已抽完',
        k_blown = '吹散！',
        k_crumbled = '粉碎！',
        k_submerged = '淹没！',
        k_ignited = '焚毁！',
        k_sunk = '沉没！',
        k_shone = '闪耀！',
        k_charged = '充能！',
        k_coming_home = '归来！',
        k_defeated = '击败！',
        k_reaped = '收割！',
        k_summoned = '召唤！',
        k_activated = '激活！',
        k_deactivated = '失活！'
    },
    challenge_names = {
        ['c_'.. mod_prefix ..'_RF'] = '皇家同花顺',
        ['c_'.. mod_prefix ..'_SF'] = '同花顺',
        ['c_'.. mod_prefix ..'_4K'] = '四条',
        ['c_'.. mod_prefix ..'_FH'] = '葫芦',
        ['c_'.. mod_prefix ..'_FL'] = '同花',
        ['c_'.. mod_prefix ..'_ST'] = '顺子',
        ['c_'.. mod_prefix ..'_3K'] = '三条',
        ['c_'.. mod_prefix ..'_2P'] = '两对',
        ['c_'.. mod_prefix ..'_1P'] = '一对',
        ['c_'.. mod_prefix ..'_HC'] = '高牌',
    }
}

return {
    descriptions = descriptions,
    misc = misc
}
