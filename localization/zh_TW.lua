local descriptions = {
    Other = {
        hidden_base = {
            name = '隱匿牌面',
            text = {
                '{V:1}#2#{} #1#'
            }
        },

        [mod_prefix ..'_clone'] = {
            name = '克隆',
            text = {'回合結束時{C:red}自毀{}'}
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
                '抽取{C:attention}第一手牌{}後，將{C:attention}出牌{}',
                '設為{C:blue}#1#{}次；每張{C:attention}牌堆{}內',
                '剩餘的牌給予{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3s'] = {
            name = '無限棒',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '得分時給予{C:white,X:mult}X#2#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4s'] = {
            name = '清冷長槍',
            text = {
                '若出牌包含{C:attention}#2#{}，則',
                '{C:legendary}清冷長槍{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_5s'] = {
            name = '緻密重錘',
            text = {
                '得分後摧毀所有被',
                '得分的{C:attention}#1#{}，每張給予',
                '{C:legendary}緻密重錘{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6s'] = {
            name = '雜耍火銃',
            text = {
                '每摧毀一張{C:attention}#2#{}，',
                '{C:legendary}雜耍火銃{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7s'] = {
            name = '阻擊者',
            text = {
                '將每回合{C:attention}第一手{}打出的',
                '{C:attention}牌型{}等級提升{C:attention}#1#{}級，',
                '且有{C:green}#2#/#3#{}機率為提升{C:attention}#4#{}級'
            }
        },
        ['j_'.. mod_prefix ..'_8s'] = {
            name = '爆轟',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '得分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於得分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_9s'] = {
            name = '墨家',
            text = {
                '若最終{C:blue}籌碼{}分數達到所需',
                '的{C:attention}#1#%{}，則免於{C:red}失敗{}；',
                '面對{C:attention}Boss盲注{}時，有{C:green}#2#/#3#{}',
                '機率使其限制條件消失'
            }
        },
        ['j_'.. mod_prefix ..'_Ts'] = {
            name = '誠意之弓',
            text = {
                '若出牌包含{C:attention}#2#{}，則',
                '{C:legendary}誠意之弓{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Js'] = {
            name = '方舟之械',
            text = {
                '所有打出的{C:attention}#1#{}',
                '和{C:attention}#2#{}在得分時',
                '給予{C:white,X:mult}X#3#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_Qs'] = {
            name = '梅杜莎之鞭',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '所有得分牌額外觸發',
                '{C:attention}#1#{}次，且於得分後將',
                '其轉化為{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ks'] = {
            name = '石中劍騎士',
            text = {
                '所有打出的{C:attention}#1#{}在',
                '得分時轉化為{C:attention}#2#{}'
            }
        },
        ['j_'.. mod_prefix ..'_As'] = {
            name = '愛與和平',
            text = {
                '{C:attention}完整牌組{}中的每張{C:attention}#1#{}在',
                '得分時提供{C:white,X:mult}X#2#{}倍數；',
                '每回合{C:attention}第一次{}出牌前，',
                '強制選定{C:attention}1{}張牌，',
                '若該牌被得分，',
                '則得分後將其摧毀',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_2h'] = {
            name = '果凍爬蟲',
            text = {
                '每持有{C:money}$#1#{}，',
                '手牌數量{C:attention}+1{}，至多{C:attention}+#2#{}',
                '{C:inactive}（目前為{C:attention}+#3#{C:inactive}手牌數量）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3h'] = {
            name = '堅如磐石',
            text = {
                '每次出牌中{C:attention}第一張{}得分牌',
                '變為{C:attention}#1#{}；得分時每張',
                '{C:attention}#1#{}給予{C:white,X:mult}X#2#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4h'] = {
            name = '全能特工',
            text = {
                '若本回合的{C:attention}第一次出牌{}',
                '只有{C:attention}1{}張牌，則向手牌',
                '中加入{C:attention}#1#{}個{C:attention}克隆{}'
            }
        },
        ['j_'.. mod_prefix ..'_5h'] = {
            name = '高熱量',
            text = {
                '剩餘的每次{C:blue}出牌{}',
                '和{C:red}棄牌{}提供{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（下次出牌時{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_6h'] = {
            name = '動物園',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '每張無增強的{C:attention}得分牌{}在',
                '得分時隨機獲得一種{C:dark_edition}增強{}'
            }
        },
        ['j_'.. mod_prefix ..'_7h'] = {
            name = '變色龍',
            text = {
                '每回合{C:attention}第一次{}出牌中',
                '的所有得分牌轉化為',
                '{C:attention}#1#{}；{C:attention}完整牌組{}中的',
                '每張{C:attention}#1#{}提供{C:white,X:mult}X#2#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8h'] = {
            name = '費洛蒙',
            text = {
                '將所有得分牌的花色',
                '轉變為本次出牌中',
                '{C:attention}第一張{}得分牌的花色'
            }
        },
        ['j_'.. mod_prefix ..'_9h'] = {
            name = '超凡天才',
            text = {
                '回合結束時，{C:attention}牌堆{}',
                '中剩餘的每張牌給予',
                '{C:legendary}超凡天才{}{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Th'] = {
            name = '敏銳五感',
            text = {
                '若出牌包含{C:attention}#2#{}，則',
                '{C:legendary}敏銳五感{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jh'] = {
            name = '蒼穹舞者',
            text = {
                '每使用一張{C:planet}行星牌{}，額外',
                '提升{C:attention}#1#{}級相應牌型的等級'
            }
        },
        ['j_'.. mod_prefix ..'_Qh'] = {
            name = '音速行者',
            text = {
                '若只出{C:attention}1{}手牌即戰勝{C:attention}盲注{}，',
                '則{C:legendary}音速行者{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Kh'] = {
            name = '完美雄性',
            text = {
                '所有打出的{C:attention}#2#{}在',
                '得分時獲得{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ah'] = {
            name = '千人千面',
            text = {
                '所有打出的牌在',
                '得分後變為{V:1}#2#{}{C:attention}#1#{}',
                '{s:0.8}每個回合牌都會變'
            }
        },
        ['j_'.. mod_prefix ..'_2d'] = {
            name = '心有靈犀',
            text = {
                '每手得分牌中每種',
                '不同的封蠟章給予',
                '{C:legendary}心有靈犀{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_3d'] = {
            name = '滾滾彈珠',
            text = {
                '每回合{C:attention}第一次{}出牌中的',
                '所有得分牌轉化為{C:attention}#1#{}'
            }
        },
        ['j_'.. mod_prefix ..'_4d'] = {
            name = '時間啞劇',
            text = {
                '每回合{C:attention}第一次{}出牌中所有',
                '得分牌額外觸發{C:attention}#1#{}次，',
                '且於得分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_5d'] = {
            name = '最強人類',
            text = {
                '打出的所有{C:attention}#1#{}',
                '和{C:attention}#2#{}在得分後',
                '提高{C:attention}#3#{}級點數'
            }
        },
        ['j_'.. mod_prefix ..'_6d'] = {
            name = '13級階梯',
            text = {
                '每打出{C:attention}13{}{C:inactive}(#2#){}張牌，',
                '{C:legendary}13級階梯{}獲得{C:white,X:mult}X#1#{}倍數，',
                '且摧毀每第{C:attention}13{}張打出的牌',
                '{C:inactive}（目前為{C:white,X:mult}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_7d'] = {
            name = '等價交換',
            text = {
                '每花費或失去{C:money}$1{}，',
                '{C:legendary}等價交換{}獲得{C:white,X:mult}X#1#{}倍數',
                '{C:inactive}（目前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_8d'] = {
            name = '紅色迷宮',
            text = {
                '每手牌得分前',
                '互換{C:blue}籌碼{}和{C:mult}倍數{}'
            }
        },
        ['j_'.. mod_prefix ..'_9d'] = {
            name = '無慈悲',
            text = {
                '將每回合{C:attention}第一張{}得分牌',
                '點數的{C:attention}四分之一{}賦予',
                '{C:legendary}無慈悲{}的{C:white,X:mult}X倍數{}，',
                '且於得分後將其摧毀',
                '回合結束後重置',
                '{C:inactive}（目前為{C:white,X:mult}X#1#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Td'] = {
            name = '倒楣鬼',
            text = {
                '所有得分的{C:attention}#1#{}',
                '其兩種效果必然觸發，',
                '且於得分後將其摧毀'
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
                '每手牌得分後',
                '平衡{C:blue}籌碼{}和{C:mult}倍數{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ad'] = {
            name = '動態念力',
            text = {
                '回合內賣出的{C:B4883C}X-撲克牌{}',
                '立即進入{C:attention}手牌{}而非牌堆；',
                '每賣出一張{C:B4883C}X-撲克牌{}，',
                '{C:legendary}動態念力{}獲得{C:white,X:mult}X#1#{}倍數，',
                '戰勝{C:attention}Boss{}盲注後重置',
                '{C:inactive}（目前為{C:white,X:mult}X#2#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_2c'] = {
            name = '剛韌金屬',
            text = {
                '所有{C:attention}#1#{}和{C:attention}#2#{}',
                '在手中同時具有',
                '這兩種增強的效果'
            }
        },
        ['j_'.. mod_prefix ..'_3c'] = {
            name = '青翠藤蔓',
            text = {
                '打出的每張得分牌',
                '永久獲得{C:white,X:mult}X#1#{}倍數'
            }
        },
        ['j_'.. mod_prefix ..'_4c'] = {
            name = '振翼疾風',
            text = {
                '每手牌得分後，將剩餘',
                '除{C:attention}#1#{}和{C:attention}#2#{}之外',
                '所有手牌{C:attention}洗入{}牌堆'
            }
        },
        ['j_'.. mod_prefix ..'_5c'] = {
            name = '飛揚塵土',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '得分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於得分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_6c'] = {
            name = '淡藍波濤',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '每張{C;attention}沒有{}版本的牌得分時',
                '都有{C:green}#1#/#2#{}機率獲得{C:dark_edition}銀箔{}'
            }
        },
        ['j_'.. mod_prefix ..'_7c'] = {
            name = '致命辣度',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '得分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於得分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_8c'] = {
            name = '沈淪暗影',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '每張{C;attention}沒有{}版本的牌得分時',
                '都有{C:green}#1#/#2#{}機率獲得{C:dark_edition}負片{}'
            }
        },
        ['j_'.. mod_prefix ..'_9c'] = {
            name = '初升光明',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '每張{C;attention}沒有{}版本的牌得分時',
                '都有{C:green}#1#/#2#{}機率獲得{C:dark_edition}多彩{}'
            }
        },
        ['j_'.. mod_prefix ..'_Tc'] = {
            name = '百萬伏特',
            text = {
                '每回合{C:attention}第一次{}出牌中，',
                '每張{C;attention}沒有{}版本的牌得分時',
                '都有{C:green}#1#/#2#{}機率獲得{C:dark_edition}全像{}'
            }
        },
        ['j_'.. mod_prefix ..'_Jc'] = {
            name = '歸來',
            text = {
                '得分結束後，將{C:attention}第一張{}',
                '得分牌抽回手牌中'
            }
        },
        ['j_'.. mod_prefix ..'_Qc'] = {
            name = '角鬥士',
            text = {
                '每張打出的{C:attention}#1#{}在',
                '得分時給予{C:white,X:mult}X#2#{}倍數，',
                '且於得分後將其摧毀'
            }
        },
        ['j_'.. mod_prefix ..'_Kc'] = {
            name = '死神之手',
            text = {
                '每回合{C:attention}第一次{}出牌中的',
                '所有得分牌將在得分後',
                '被摧毀，同時{C:legendary}死神之手{}',
                '獲得這些牌相應{C:dark_edition}增強{}與',
                '{C:dark_edition}版本{}提供的{C:chips}籌碼{}，{C:mult}倍數{}，',
                '{C:white,X:mult}X倍數{}，或返還相應{C:money}金錢{}',
                '戰勝{C:attention}Boss盲注{}後重置',
                '{C:inactive}（目前為{C:chips}+#1#{C:inactive}籌碼，{}',
                '{C:mult}+#2#{C:inactive}倍數，{X:mult,C:white}X#3#{C:inactive}倍數）{}'
            }
        },
        ['j_'.. mod_prefix ..'_Ac'] = {
            name = '行屍走肉',
            text = {
                '在選擇{C:attention}盲注{}時',
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
            '{C:green,s:0.8}出售此牌以將其停用，隨後向{}',
            '{C:green,s:0.8}牌組中加入一張同版本、帶有{}',
            '{C:green,s:0.8}原增強及封蠟章的相應撲克牌{}'
        }
        for _, string in ipairs(add) do
            Joker.text[#Joker.text + 1] = string
        end
    end
end

local misc = {
    labels = {
        [mod_prefix ..'_clone'] = '克隆',
    },
    dictionary = {
        k_loaded = '裝彈！',
        k_smashed = '擊碎！',
        k_exploded = '爆炸！',
        k_mohism_saved = '兼愛，非攻',
        k_petrified = '石化！',
        k_armed = '著甲！',
        k_slain = '斬殺！',
        k_merged = '合體！',
        k_transform = '變形！',
        k_chameleon = '變色！',
        k_induce = '誘導！',
        k_dance = '起舞！',
        k_sonic_boom = '音爆！',
        k_fortified = '強化！',
        k_faceless = '變臉！',
        k_vitrified = '玻化！',
        k_withered = '凋謝！',
        k_evolved = '進化！',
        k_swapped = '互換！',
        k_sacrificed = '獻祭！',
        k_busted = '爆牌！',
        k_balor = '邪眼魔王',
        k_not_ready = '牌堆尚未就緒',
        k_ready_sl = '由左至右抽牌',
        k_ready_pl = '由左至右抽牌，先抽第一行',
        k_drawn = '牌已抽完',
        k_blown = '吹散！',
        k_crumbled = '粉碎！',
        k_submerged = '淹沒！',
        k_burnt = '燃燒！',
        k_sunk = '沈沒！',
        k_shone = '閃耀！',
        k_charged = '充能！',
        k_coming_home = '歸來！',
        k_defeated = '戰勝！',
        k_reaped = '收割！',
        k_summoned = '召喚！',
        k_activated = '啟用！',
        k_deactivated = '停用！'
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