descriptions = {
    Other = {
        hidden_base = {
            name = '隱匿牌面',
            text = {
                '{V:1}#2#{} {C:attention}#1#{}'
            }
        },

        [mod_prefix ..'_agent_s'] = {
            name = '克隆',
            text = {'本回合結束時{C:red}自毀{}'}
        }
    },

    Back = {
        ['b_'.. mod_prefix ..'_'.. XPC_deck_key] = {
            name = 'X-撲克牌組',
            text = {
                '使用{C:attention}單張牌{}打敗任一',
                '{C:attention}盲注{}以激發該牌的潛能'
            }
        }
    },

    Joker = {
        ['j_'.. mod_prefix ..'_2s'] = {
            name = '新·新南部',
            text = {
                '當{C:legendary}新·新南部{}被獲得',
                '或抽完{C:attention}第一手牌{}時，',
                '將出牌次數設為{C:blue}5{}；',
                '每張{C:attention}牌堆{}內剩餘',
                '的牌給予{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3s'] = {
            name = '無限棒',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '計分時給予{C:white,X:mult}X#2#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4s'] = {
            name = '清冷長槍',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，則{C:legendary}清冷長槍{}',
                '獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_5s'] = {
            name = '緻密重錘',
            text = {
                '計分後摧毀所有被',
                '計分的{C:attention}#1#{}，每張給予',
                '{C:legendary}緻密重錘{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6s'] = {
            name = '雜耍火銃',
            text = {
                '每摧毀一張{C:attention}#2#{}，',
                '{C:legendary}雜耍火銃{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7s'] = {
            name = '阻擊者',
            text = {
                '將每回合{C:attention}第一手{}打出',
                '的{C:attention}牌型{}等級提升{C:attention}#1#{}級，',
                '且有{C:green}#2#/#3#{}概率將其改為',
                '提升{C:attention}#4#{}級'
            }
        },
        ['j_'.. mod_prefix ..'_8s'] = {
            name = '爆轟',
            text = {
                '每張打出的{C:attention}#1#{}',
                '給予{C:white,X:mult}X#2#{}倍數，且於',
                '計分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_9s'] = {
            name = '墨家',
            text = {
                '出牌次數耗盡時，',
                '若{C:blue}籌碼{}分數达到所需',
                '的{C:attention}#1#%{}，則免于{C:red}失敗{}；',
                '所有{C:attention}奇數底注{}下的',
                '{C:attention}Boss盲注{}限制條件消失'
            }
        },
        ['j_'.. mod_prefix ..'_Ts'] = {
            name = '誠意之弓',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，則{C:legendary}誠意之弓{}',
                '獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Js'] = {
            name = '方舟之械',
            text = {
                '所有打出的{C:attention}#1#{}',
                '和{C:attention}#2#{}在計分時',
                '給予{C:white,X:mult}X#3#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_Qs'] = {
            name = '梅杜莎之鞭',
            text = {
                '打出的{C:attention}第一手牌{}中，',
                '所有計分牌額外觸發',
                '{C:attention}#1#{}次，且於計分後將',
                '其轉化為{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ks'] = {
            name = '石中劍騎士',
            text = {
                '所有打出的{C:attention}#1#{}在',
                '計分時轉化為{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_As'] = {
            name = '愛與和平',
            text = {
                '計分時{C:attention}牌堆{}中的每張{C:attention}#1#{}',
                '提供{C:white,X:mult}X#2#{}倍數；本回合',
                '打出{C:attention}第一手牌{}前，總是',
                '迫使{C:attention}1{}張牌被選中，',
                '若該牌被用於計分，',
                '則計分後將其摧毀',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_2h'] = {
            name = '果凍觸手',
            text = {
                '每持有{C:money}$#1#{}，手牌上限',
                '{C:attention}+1{}，至多{C:attention}+#2#{}',
                '{C:inactive}（當前為{C:attention}+#3#{C:inactive}手牌上限）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3h'] = {
            name = '堅如磐石',
            text = {
                '打出的牌中，第一張',
                '計分牌變為{C:attention}#1#{}；',
                '計分時每張{C:attention}#1#{}',
                '給予{C:white,X:mult}X#2#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4h'] = {
            name = 'S探員',
            text = {
                '若本回合打出的{C:attention}第一手牌{}',
                '只有一張牌，則往手牌中',
                '添加其的{C:attention}4{}個{C:attention}克隆{}'
            }
        },
        ['j_'.. mod_prefix ..'_5h'] = {
            name = '高熱量',
            text = {
                '剩餘的每次{C:blue}出牌{}',
                '和{C:red}棄牌{}提供{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（打出下一手牌',
                '{C:inactive}時為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6h'] = {
            name = '動物園',
            text = {
                '每張打出的{C:attention}#1#{}在計分時',
                '給予{C:white,X:mult}X#2#{}倍數；',
                '計分後將其轉變為{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_7h'] = {
            name = '變色龍',
            text = {
                '本回合{C:attention}第一次{}出牌中',
                '的所有計分牌轉化為',
                '{C:attention}#1#{}；{C:attention}完整牌組{}',
                '中的每張{C:attention}#1#{}為',
                '{C:legendary}變色龍{}提供{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8h'] = {
            name = '信息素',
            text = {
                '將所有計分牌的花色',
                '轉變為本次出牌中',
                '{C:attention}第一張{}計分牌的花色'
            }
        },
        ['j_'.. mod_prefix ..'_9h'] = {
            name = '卓越天才',
            text = {
                '回合結束時',
                '牌堆中的每張牌',
                '給予{C:legendary}卓越天才{}',
                '{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Th'] = {
            name = '敏銳五感',
            text = {
                '若打出的牌包含',
                '{C:attention}#2#{}，則{C:legendary}敏銳五感{}',
                '獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jh'] = {
            name = '蒼穹舞者',
            text = {
                '每使用一張{C:planet}行星牌{}',
                '額外提升{C:attention}#1#{}級',
                '相應牌型的等級'
            }
        },
        ['j_'.. mod_prefix ..'_Qh'] = {
            name = '音速行者',
            text = {
                '若只出{C:attention}1{}手牌即擊敗',
                '{C:attention}盲注{}，則{C:legendary}音速移動{}',
                '獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Kh'] = {
            name = '剛健體魄',
            text = {
                '所有打出的{C:attention}#2#{}在',
                '計分時獲得{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ah'] = {
            name = '千人千面',
            text = {
                '所有打出的牌在',
                '計分後變為{V:1}#2#{}{C:attention}#1#{}',
                '{s:0.8}每個回合牌都會變'
            }
        },
        ['j_'.. mod_prefix ..'_2d'] = {
            name = '心有靈犀',
            text = {
                '每手計分牌中每種',
                '不同的封蠟章給予',
                '{C:legendary}心有靈犀{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3d'] = {
            name = '彈如雨下',
            text = {
                '本回合{C:attention}第一次{}出牌',
                '中的所有計分牌',
                '轉化為{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_4d'] = {
            name = '時間啞劇',
            text = {
                '打出的{C:attention}第一手牌{}中',
                '所有計分牌額外',
                '觸發{C:attention}#1#{}次，且於',
                '計分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_5d'] = {
            name = '最強人類',
            text = {
                '打出的所有{C:attention}#1#{}',
                '和{C:attention}#2#{}在計分後',
                '增加{C:attention}1{}級點數'
            }
        },
        ['j_'.. mod_prefix ..'_6d'] = {
            name = '13級階梯',
            text = {
                '每打出{C:attention}13{}{C:inactive}(#2#){}張牌，',
                '{C:legendary}13級階梯{}獲得{C:white,X:mult}X#1#{}倍數，',
                '且摧毀每第{C:attention}13{}張打出的牌',
                '{C:inactive}（當前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7d'] = {
            name = '等價交換',
            text = {
                '每花費或失去',
                '{C:money}$1{}，{C:legendary}等價交換{}',
                '獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（當前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8d'] = {
            name = '紅色迷宮',
            text = {
                '在打出的牌計分前',
                '互換{C:blue}籌碼{}和{C:mult}倍數{}'
            }
        },
        ['j_'.. mod_prefix ..'_9d'] = {
            name = '無慈悲',
            text = {
                '將每回合{C:attention}第一張{}計分牌',
                '點數的{C:atteention}四分之一{}賦予',
                '{C:legendary}無慈悲{}的{C:white,X:mult}X倍數{}，',
                '且於計分後將其摧毀',
                '回合結束後重置',
                '{C:inactive}（當前為{C:white,X:mult}X#1#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Td'] = {
            name = '倒楣鬼',
            text = {
                '所有計分的{C:attention}#1#{}',
                '其兩種效果必然觸發'
            }
        },
        ['j_'.. mod_prefix ..'_Jd'] = {
            name = '五感之外',
            text = {
                '所有打出{C:attention}5{}張牌的',
                '{C:attention}#1#{}牌型均視為{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Qd'] = {
            name = '邪眼魔王',
            text = {'{C:dark_edition}預見{}牌堆的抽牌順序'}
        },
        ['j_'.. mod_prefix ..'_Kd'] = {
            name = '周而復始',
            text = {
                '每手牌計分後',
                '平衡{C:blue}籌碼{}和{C:mult}倍數{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ad'] = {
            name = '動態念力',
            text = {
                '回合內出售{C:B4883C}X-撲克牌{}',
                '會將其抽入手牌中'
            }
        },
        ['j_'.. mod_prefix ..'_2c'] = {
            name = '剛韌金屬',
            text = {
                '所有{C:attention}#1#{}和{C:attention}#2#{}',
                '在手中同時具有',
                '這两種增強的效果'
            }
        },
        ['j_'.. mod_prefix ..'_3c'] = {
            name = '青翠藤蔓',
            text = {
                '打出的每張計分牌',
                '永久獲得{C:white,X:mult}X#1#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4c'] = {
            name = '振翼疾風',
            text = {
                '每手牌記分後，',
                '將手中剩餘的牌',
                '全部{C:attention}洗入{}牌堆'
            }
        },
        ['j_'.. mod_prefix ..'_5c'] = {
            name = '飛揚塵土',
            text = {
                '每張打出的{C:attention}#1#{}',
                '在計分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於計分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_6c'] = {
            name = '淡藍波濤',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每張沒有版本的{C:attention}計分牌{}',
                '都有{C:green}#1#/#2#{}概率獲得{C:dark_edition}銀箔{}'
            }
        },
        ['j_'.. mod_prefix ..'_7c'] = {
            name = '致命辣度',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '計分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於計分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_8c'] = {
            name = '沈沒暗影',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每張沒有版本的{C:attention}計分牌{}',
                '都有{C:green}#1#/#2#{}概率獲得{C:dark_edition}負片{}'
            }
        },
        ['j_'.. mod_prefix ..'_9c'] = {
            name = '初升光明',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每張沒有版本的{C:attention}計分牌{}',
                '都有{C:green}#1#/#2#{}概率獲得{C:dark_edition}多彩{}'
            }
        },
        ['j_'.. mod_prefix ..'_Tc'] = {
            name = '百萬伏特',
            text = {
                '每回合的{C:attention}第一手牌{}中，',
                '每張沒有版本的{C:attention}計分牌{}',
                '都有{C:green}#1#/#2#{}概率獲得{C:dark_edition}全像{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jc'] = {
            name = '歸來',
            text = {
                '計分結束後，將{C:attention}第一張{}',
                '計分牌抽回手牌中'
            }
        },
        ['j_'.. mod_prefix ..'_Qc'] = {
            name = '角鬥士',
            text = {
                '每張打出的{C:attention}#1#{}',
                '在計分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於計分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_Kc'] = {
            name = '死神之手',
            text = {
                '每回合{C:attention}第一次{}出牌中的',
                '所有計分牌將在計分後',
                '被摧毀，同時{C:legendary}死神之手{}',
                '獲得這些牌相應增強與',
                '版本提供的{C:chips}籌碼{}，{C:mult}倍數{}，',
                '{C:white,X:mult}X倍數{}，或返還相應{C:money}金錢{}',
                '{C:inactive}（當前為{C:chips}+#1#{}{C:inactive}籌碼，{}',
                '{C:mult}+#2#{}{C:inactive}倍數{}，{X:mult,C:white}X#3#{}{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ac'] = {
            name = '行屍走肉',
            text = {
                '選擇{C:attention}盲注{}後，',
                '生成一張{C:spectral}幻靈牌{}',
                '{C:inactive}（必須有空位）{}'
            }
        },
        ['j_'.. mod_prefix ..'_0x'] = {
            name = '',
            text = {},
            unlock = {'敬請期待！'}
        },
        ['j_'.. mod_prefix ..'_1x'] = {
            name = '',
            text = {},
            unlock = {'敬請期待！'}
        }
    }
}

for key, Joker in pairs(descriptions.Joker) do
    if key:sub(-1,-1) ~= 'x' then
        local add = {
            '{C:legendary,s:0.8}出售此牌以向牌組中加入{}',
            '{C:legendary,s:0.8}一張同版本、帶有原有{}',
            '{C:legendary,s:0.8}增強及封蠟章的相應撲克牌{}'
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
        k_loaded = '裝彈！',
        k_smashed = '砸碎！',
        k_exploded = '爆炸！',
        k_mohism_saved = '兼愛，非攻',
        k_petrified = '石化！',
        k_armed = '着甲！',
        k_slained = '斬殺！',
        k_merged = '合體！',
        k_transform = '變形！',
        k_chameleon = '變色！',
        k_induce = '誘導！',
        k_brilliant = '聰慧！',
        k_dance = '起舞！',
        k_sonic_boom = '音爆！',
        k_fortified = '健壯！',
        k_faceless = '變臉！',
        k_marbles = '彈珠！',
        k_withered = '凋謝！',
        k_evolved = '進化！',
        k_swapped = '互換！',
        k_sacrificed = '獻祭！',
        k_balor = '邪眼魔王',
        k_not_ready = '牌堆尚未就緒',
        k_ready = '由左至右抽牌',
        k_drawn = '牌已抽完',
        k_blown = '吹散！',
        k_crumbled = '粉碎！',
        k_submerged = '淹沒！',
        k_ignited = '焚毀！',
        k_sunk = '沈沒！',
        k_shone = '閃耀！',
        k_charged = '充能！',
        k_coming_home = '歸來！',
        k_defeated = '擊敗！',
        k_reaped = '收割！',
        k_summoned = '召喚！',
        k_activated = '激活！',
        k_deactivated = '失活！'
    },
    challenge_names = {
        ['c_'.. mod_prefix ..'_RF'] = '同花大順',
        ['c_'.. mod_prefix ..'_SF'] = '同花順',
        ['c_'.. mod_prefix ..'_4K'] = '金剛',
        ['c_'.. mod_prefix ..'_FH'] = '滿堂紅',
        ['c_'.. mod_prefix ..'_FL'] = '同花',
        ['c_'.. mod_prefix ..'_ST'] = '順子',
        ['c_'.. mod_prefix ..'_3K'] = '三條',
        ['c_'.. mod_prefix ..'_2P'] = '兩對',
        ['c_'.. mod_prefix ..'_1P'] = '一對',
        ['c_'.. mod_prefix ..'_HC'] = '高牌',
    }
}

return {
    descriptions = descriptions,
    misc = misc
}
