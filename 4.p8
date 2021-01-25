pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include main.lua
#include gamestate.lua
#include input.lua
#include object.lua
#include objects.lua
#include player.lua
#include px9_decomp.lua

standalone = true
level_index = 4

__gfx__
00000000626666660011110001111110011111000011110000000000000000000000000000000000000000006666666600000000422222220000000000000000
00000000626666660111111011144411111111100111111000000000000000000000000000000000000000000311113000000000422222220800000000000080
00700700626666661114441111474471144441101174471100000000000000000000000000000000000000000031130000000000422222220080000000000800
0007700022222222114744710144444017447410714444170000000000000000000000000000000000000077000bb00000000000422222220008000000008000
00077000666662660144444000aaaa000444441007aaaa700eeeeeeeeee00000000000000000000000000777000bb00066666666200000000000808008080000
007007006666626600aaaa000022220000aaaa7000222200e111ee11e111000000770000000000000007777700b11b0000033000400000000000088008800000
000000006666626600222200070000700022220000222200e1ccee7ce7cc00000777770000000000007777770b1111b0000bb000400000000000888008880000
000000002222222200700700000000000000700007700770e1cceeccee77c0007777777000000000777777776666666666666666400000000000000000000000
57777777777777777777777599999999000600000b300b00e1cceeeceeccc0000000000000000000000000000000000000000000000000000000000000022000
77777777777777777777777791111119006660000033b000eeeeeeeeeeee22220000000000000000000000000000000000000000000000000000000000022000
77777777777777777777777791411419000500000288882088888888888897970000000000000000000000000000000000000000000000000000000000024000
77777771177777711777777791441119000500000898888088888888888897970000000000000000000000000000000000000000000000000000000000044000
777777122177771221777777911441190044400008888980eeeeeeeeeeee11110000000000000000077000000000000000000000000000000000000000044000
71777122221111222217771791414419009990000888888020002220002222220000000000000000777700000000000000000000000000000000000000044000
72111222222222222221112791111119004440000289882001610201615551000000000000000000777777000000000000000000000000000000000000044000
72222222222222222222222799999999009990000028820001110001110111000000000000000000777777700000000000000000000000000000000000042000
72222222222222222222222757777775000000000000066622222222222222225555555555555555555555555777777777777777777777750008800056666650
77222222222222222222227777777777000000000007777722222221122222225555555555555550055555557771111177711111777111170081180066666661
77222222222222222222227777777777000000000000066622222211112222225555555555555500005555557777111117771111177711170811118066666661
77722222222222222222277777177177007000700000000022222111111222225555555555555000000555557117711111177111111771178117711866666661
777222222222222222222777772112770070007000000666222211111111222255555555555500000000555571ddd7ddddddd7ddddddd7178117711856666651
772222222222222222222277772222770676067600077777222111111111122255555555555000000000055571dddddddddddddddddddd170811118055555551
77222222222222222222227777722777067606760000066622111111111111225555555555000000000000557111111111111111111111170081180015555551
72222222222222222222222757777775067606760000000021111111111111125555555550000000000000055777777777777777777777750008800001111110
722222222222222222222227577777777777777777777775211111111111111211111111500000000000000557777775777ddd17777ddd170077770056666650
7222222222222222222222277777777777777777777777772211111111111122111111115500000000000055777711177777dd177777dd170777677066666661
72222722222222222222222777777777777777777777777722211111111112221111111155500000000005557117711771177d1771177d177777777766666661
722222222222222222222227777777711777777117777777222211111111222211111111555500000000555571111717711dd717711dd7177777767766666661
7722222222222222222722777777771221777712217777772222211111122222111111115555500000055555711ddd17711ddd17711ddd177767777756666651
7772222222777722222227777177712222111122221777172222221111222222111111115555550000555555711ddd17711ddd17711ddd177777777755555551
7777722227777772222777777211122222222222222111272222222112222222111111115555555005555555711ddd17711ddd17711111170777677015555551
5777777777777777777777755777777777777777777777752222222222222222111111115555555555555555711ddd17711ddd17577777750077770001111110
00000000047744444944977706660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777794999944997775550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000077777774991194491777ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000777779949911199991774755000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000
000077799949911222222227294900000000000000000000000000000000000000000000000000000000000000000000000a0a00000000000000000000000000
00079999949912222222222722149000000000000000000000000000000000000000000000000000000000000000000000a000a0000000000000000000000000
0079799949912227777222272221990000000000000000000000000000000000000000000000000000000000000000000a000009000000000000000000000000
099979949912227777777222222211900000000000000000000000000000000000000000000000000000000000000000a0000009000000000000000000000000
99999944111111117111111111111119000000000000000000000000000000000000000000000000000000000000000900000009000a00000000000000000000
0441294912222222222222222222221400000000000000000000000000000000000000000000000000000000000000a00000000090a0a0000000000000000000
094119491111111111111111111111140000000000000000000000000000000000000000000000000000000000000900000000000a000a000000000000000000
09412949122222222222222222222294000000000000000000000000000000000000000000000000000000000000090000000000000000000000000000000000
0941294912222222222222222222229400000000000000000000000000000000000000000eeeee00eeeeee00ee009000eeeeee000eeeee00eeeeee00eeeeee00
094129491224444222222222244442940000000000000000000000000000000000000000eeeeeee0eeeeeee0ee090000eeeeeee0eeeeeee0eeeeeee0eeeeeee0
094129491291411222222222914112940000000000000000000000000000000000000000ee000ee0ee000000ee000000ee000000ee00000000ee0000ee000000
09412949129141122444422291411294000000000000000000000000000000000000000022000000222200002200000022220000222222200022000022220000
09412949129141122111142291411294000000000000000000000000000000000000000022000220220000002200002022000000000000200022000022000000
09412949129141122122242291411294000000000000000000000000000000000000000022222220222222002222222022222200222222200022000022222200
09412949129141122122292291411294000000000000000000000000000000000000000002222200222222202222222022222220022222000022000022222220
09412949129141122122242291411294000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09412949129444422122242294444294000000000000000000000000000000000000000000000000000009000000000000000000000000000000900000000000
09412949121111122122242211111294000000000000000000000000000000000000000000000000000090000000000000666660000000000000090000000000
09412949122277772122242222222294000000000000000000000000000000000000000000000000009900000000000006666666000000000000009000000000
09412949122777777772242227772294000000000000000000000000000000000000000000000000090000000000000000000066000000000000009000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000dd00006666000dd00000000009000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000dd000dddd0000dd00000000009009000000
0000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000000000dd00000000000000000002020900000
0000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000ddddddd000000000000000200090000
0000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000ddddddd000000000000000000020000
00000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000002000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000020
__gff__
0003000000000101010101000000000083838300000001010101010000000001838383830800838381818107070700038383838383838383818181070707000001010101000000000000000000000000010101010000000000000000000000000101010100000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
383837213c2121213638383838383c2136383838383821213c2138383838383821212121212121213131313131313c2121313131313131313d3131313131313c3c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c
383821213c2131313131313131313c2121213638383721213c2136383838383821213131313131322839000000003d313228290000000000000000001328283c3c28282900000000000000000000000000002a28282829000000000000000000000000000000003c00000000000000102c2c2c2d000000002b2c2c2c2d292a28
383821213c3200000028282828003c2121313131313131213c2121212136383821222828282828282828390000002a28282900000000000024000000132a283c3c2800000000000000000000000000000000002a282800000000000000000010120000000000003d00000000000000202c2d00000000000000002a2828393a28
383721213c2800000028282828003d2122000000002828203c313131312121382122282800000028282828282800002a28000d00000000003b000000003a283c3c29000000000000000000080d00003b3b1a000a101200000000000000000a30320000000000000000000000000000302d00000000000000000000002a282828
212131313d282800002828282800002022000000002828303d00000028202121212228290000002a28282828283b2b2c2c2c2c2d000000003c0000003a2828103c0000000000002e0000002b2c2d003c3c10111121221a080000000000002b2c3c3e000d00000000000000000000003c2d0000000000000000000a1a00282828
2122282828282800002a282828390030320000003a282900000000282830313131320000000000000000002a283c21213c2c2c2d000000003c000000282828203c000000000000000000002b2c2d003c3c303131312b2c2d000000000000002b3c2c2c2c2d000000000000000024003c2d39000000000000001011123a282828
3132282828282800000028282828002828000000282800000000002828282828290000000000000000000025103c21213c282828000000003c003a28282829203c00000000000000000000002b2d003c3c2828282800000000000000000000233c0000242424242424242424243b003c11122839000000000a20212111111111
0000002a2828290000002a282828282828003a28280000000000002a28282828000000000000000000000025203d21213c282829000000003c282829000000203c00000000000000000000000000003c3c2828282900000000000000000000233c00002b2c2c2c2c2c2c2c2c2c3c003c31322828283900101121212121212121
00000000000000000000002a2828282828282828290000000000000028282900000000000000000000000025202126383c28390000003a283c290000001500203c002e0000000000000000000000003c3c28280000000000000000000000003b3c1a0000000000003c000000003c003c2d0000002a2828202121383827263838
0002000000000000000000002a2828282828282800000000000000002a28003a283900000000000000000025203638383c2828390b3a28283c000000000000303c00000000000000000000000000003c3c29000000002400000000002424243c2c2c2d00000000003c000000003d003c2d00000000002a303121363838383838
1111120000243e24002839000010111111113b122424000000000000000a1a28282800000b00000000000025202121363c282828232828293d00000000003a3b3c00000000000000002e00000000003c3c00000000003b24242424242b2c2c3c12000000000000003d0000000000003c2d1a0000000000000020212121212121
2121222424101112002a10111121212121213c21113b24242424242410111111123b11113500000000000025203b21213c28282823290000000000000000283c3c00000000000000000000000000003c3c00000000003c2c2c2c2c2c2c2c2c3c32000000000000000000000000000a3c2c2d0000000000000030313131313131
2121211111212122242420212121212121213c21213c11111111111121212121213c21220000000000000025303c21213c2a282823000000240000000000283c3c00000000000000000000000000153c3c00000000003c3c000000000000003c3b0000000000000000000000002b2c3c2c2c2c2d00000000002b2c2c2c2c2c2c
3b21212121212121111121212121212121213c21213c21212121212121212121213c21220000000000000000003c21213c000000000000003b00000000002a3c3c00000000000000000000000000003c3c00000000003d3d000000000000003c3c00000000000000000000000000003c2c2c2c2c2c2d1a00000000000000003c
3c21212121212121212121212121212121213c21213c21363838383838383838213c21220000000000000000003c21213c242424242424243c2424242424243c3c24242424242424242424242424243c3c1a0d000b00000a1a0000003e080a3c3c00242424242424242424242424243c2c2c2c2c2c2c2d1a000808000000003c
3c21212121212121212121212121212121213c21213c21213638383721212137213c21220000000000000000003c31313c2c2c2c2c2c2c2c3c2c2c2c2c2c2c3c3c2c2c2c2c2c2c2c2c2c2c2c2c2c2c3c3c2c2c2c2c2c2c2c2d000010111111113c002b2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d00003c
3c31313131313131313131313131313131313d31313c31313131313131313121213c21220000000000000000003c00013c3c3c3c3c3c3c3c3d3d3d3d3d3c3c3c3c3c3d3c3d3c3c3c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d000020212121263c002b2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d00003c
2c2d28292a282828282839000000000000000028283d000000002a282828283b213c21220000000000000000003c15013c3c3c3c3c3d3d3d28000000283d3d3c3c3c003d283c3c3d002800000028000000003c3c24242b2c2d000020262738383c003b00002800000000000000253c3c2c2c2c2c2c2d0000000000000000003c
2c2d28393a28282828282839000d00080a1a3a2828290015000000282828283c213c21220000000000000000003d00013c3c3d3d3d280000280000002800003c3c3d0000283c3c00002800000028000000003c3d0000000000000020363838383c003c00002800000000000000253c3c3c0000003c2500000000000000000a3c
2c2d28282828002a282828282b2c2c2c2c2c2d282800000000000000002a283c213c21220000000000000000000000013c3d000000280000280000002800003c3c000000283d3c00002800002e28003b3b003c000000000000000a20263838383c003c000028000000002e0000253d3c3c0000003c250000000000002b2c2c2c
3c00002a28290000002828283c010101012b2c2c2c2c2c2c2d0000000000283c213c21220000000000000000000000013c00000000280000290000002800003c3c00000028003c00002800000028003c3c003d00000000000a2b2c2c2c2c2c2c3c003c00002a0000000000000000003d3d0000003c25000000002e000000253c
3c3e000028000000002828283c01010101013c01013c28282900000000002a3c213c212200000000000000000000003b3c00000000280000000000002800003c3c00000028003c00002a00000028003c3c1a0000000000002b2c2c2c2c2c2c2c3c003c0000000000000000000000000800000d003c250000000000000000253c
2c2d003a280000003a2828283c01010101013c01013c2829000000000000003d313d313200000000000000000000003c3c00000000280000000000002a00003c3c00000028003c00000000000028003c3c2c2c2c2c2d0000003c28282828283c3c003c24240000000000000000002b2c2c2c2d003c250000002e00000000253c
2c2d3a282839003a282828283c01010101013c01013c2800000000000000000000000000000000000000000000000a3c3c00000000280000000000000000003c3c0000002a003c00000000000028003c3c2d000000000000003d28282828283c3c003c2c2d252e00000000000000003c3c0000003c250000000000000000253c
2c2d2828282828292a28282b2c2c2c2c2c2c2c2d013c290000000000000d000800000000000039000000000000002b2d3c00000000280000000000000000003d3d00000000003c00002e00000029003c3c0000000a2b2c2d0000002a2828283c3c003c2424000000000000000000003c3c0000003c25000000002e000000253c
2c2d2828282828393a28282900003d2828283c01013c00000000003334343411113b000000002800000000003900253c3c00000000280000000000000000000000000d0000003c00000000000000003c3c00002b2c2d000000000000002a283c3c003c0000000000000000000000003c3c0000003c250000000000000000253c
3c002a2828282823282829000000232a28283c01013c00000000000000240b20213c3a0000002800000000002839253c3c000000002a0000000000002b2c2c2c2c2c2d0000003d00000000000000003c3c000000000000000000000000002a3c3c003c0000000000000000000024243c3c0000003d250000002e00000000253c
3c0b00002a2828232829000000002300002a3c01013c00000000000000101121213c2800003a2800000000002828253c3c000000000000002e000000002b2c2c2c2d000000000000000000000000003c3c00000000000000000000000000003c3c003c00000000000000002e252b2c2c3c00000000000000000000000000253c
2c2d0000003334352900000000003b0000003c01013c00000013130000202121213c2800002828003b3b00002828003c3c000000000000000000000000002a3c3c00000000000000000000002b2c2c2c3c00000000000000002e00000015003c3c003c0000000000000000000024243c3c0000000000000000002e000000253c
2c2d2424242424000000001500003c0000003c01013c00000000000000202121213c28390028280a3c3c3b3a2828003d3d00000000000000000000000000003c3c0000000000002e000000000000003c3c1a0d0000000000000000000000003c3c003d0000000000000000000000003c3c00000000000000000000000000253c
3c111111111112242424242424243c2424243c01013c24242424242424202121213c28282828283b3c3c3c282828000000000d0000000000000000000000003c3c00000000000000000000000000003c2c2c2c2d000000000000000000003a3c3c1a0a1a0d080000000000000000003c3c00000000000000000000000000253c
3c212121212121111111111111113c1111113c11113c11111111111111212121213c3b3b3b3b3b3c3c3c3c3b3b3b3b3b3b3b3b3b00000000000000000000003c3c00000000000000000000000000003c3c2900000000000000000000003a283c3c2c2c2c2c2d0000000000000000003c3c00000000000000000000000000253c
__sfx__
01030306245342452024510245102451024510245002450030500305002b5002b5002950029500245002450030500305002b5002b5002950029500245002450030500305002b5002b50029500295002450024500
0104020317770187711877018770154001540015400164001740018400194001a4001b4001d4001e4001f4001f4001f4001c40018400164000000000000000000000000000000000000000000000000000000000
010b05080017000160001500014000132001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010605081817300154001400013000122001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010300002f6702f6302f6202f6202f6102f6102f6102f6102f6152f61500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400021837020370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01040002183701f370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200000c6400c070110611305130634306250c06000051244502b4513a4503a4502b0241f021320213202329040290502a0612a0602c0612c0600c65400000186631e0601f0511f0501e0411d0311c02100000
010700000c05318653246440061200612000000000000000301532b1402e13035130241342b1242e1143511500673186230c621006150065324620186212461524340246433233131321303112b3110000000000
010b000030830308252b8202b8152982029815248202481530820308152b8202b8152982029815248202481530820308152b8102b8152981029815248102481530820308152b8102b81529810298152481024815
010b0000080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025
010b00000c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f025
010b00000a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f025
010b0000060400602513045130251a0451a0251f0451f025060400602513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025
01040000306532405330653306103061018615376003760000654000003065424800248002480000000000003c6240c6412466113075260741a0610e0510206425041190310d04424031180210c024180110c011
010b0000247402473500000000002b7402b73500000000002b7402b73500000000002b7402b73500000240002b9402b7302b7222b7122c740007002e7402e7302e7202e71530750000002e7402e7352c7402c735
010b00002b9402b7302b7302b7222b7122b7122c7402b740297402973029730297202971029712297120000027740277302773027720277122771229740277402674026730267202671226712267120000000000
010c000013033006001f033210313c02100654070140c0213e0143d0213c0213a0213b0213a0213901138011370113601135011340113301132011300111f02100614006110c62118631246310c6210061100615
010b0000247402473024722247152b7402b73500000000002b7402b73500000000002b7402b73500000000002b7402b7302b7222b7152c740000002e9402e7302e7422e73530740307352e7402e7352c7402c735
010b0000090400902513040130251a0401a0251f0401f0250804008025120401202519040190251e0401e0250704007025110401102518040180251d0401d0250604006025140401402518040180251d0401d025
010b00002b9402b7302b7302b7222b7122b7122c7402b7302974029730297302972229712297122b7402973027740277302772027722277122771229740277302674026730267302672226712267122671026710
010b000014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2016a5016a20
010600002463424160188352b1501f825301402481524140188252b1301f815301202481524130188152b1201f815301102481524120188151f8101f81524810248150000018c0018c0000000000000000000000
010b000018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a201aa5018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2018a5016a20
010b000012b5012a2012a2012a5012a2012a2012a5012a2012b5012a2012a2012a5012a2012a201ea501ea2007b50000000000000000000000000007b50000000000000000000000000018c4018c1024a3018a21
010b000014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2016a5016a20
010b000018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a201ac3018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2018a5016a20
010b00000000030810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b815298102981524810
010b000022130221202211222112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1302b12529135001002b125001002b1302c1302c1202c1122b1302b12529135001002712500000
010b0000050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025
010b000011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011b501da2011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011a5013a20
010b000026130261202611226112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1102b11529100001002b1102b1152b1002c1002b1102b1152b1002b1002b1102c1112e7212f731
010b00000b0400b02513045130251a0451a0251f0451f0250b0400b02513045130251a0451a0251f0451f0252b0242b01500000000002b0242b01500000000002b0342b02500000000002b0442b0352b00000000
010b000017b5017a2017a2017a5017a2017a2017a5017a2017c4017c1017a2017a5017a2017a2017b5023a2013b5013a4013a4213a3207a2107a1207a1207a120000000000000000000018b5018a4016b5016a40
010b0000307503074500000000003075030745000000000030750307450000000000307503074030732307253275032740327323272533755000003295032740327323272530750000002e7502e7453074500000
010b00003275032745000000000032740327350000000000327403273032722327153375033745357303572533950337403373033722337123371532950327303273232742337503274030750307403073230725
010b00002c7502c7402c7322c7322c7222c7222e7502e7402e7322e7222e7122e715307503074030732307422f7502f7402f7322f7322f7222f72230750307403073230722307123071532750327403273232725
010b00002a7502b7412b7402b7302b7322b7222b7222b7122b7122b7122b7122b715297402b7302c7302b7502b7402b7402b7322b7222b7122b7122b7150000000000000000000000000297002b7002c7002b700
010b00002f7502f7402f7402f7322f7322f7423075030740307403073230732307423275032740327323273533750337403373033722337123371235750337403275032740327303272232722327123271232715
010b0000083550000013d200000013d1000000083550000013d200000013d1000000083550000013d20000000a3550000013e200000013e10000000a3550000013e200000013e10000000a3550000013e2000000
010b00000b3550000013e200000013e10000000b3550000013e200000013e10000000b3550000013e20000000c340133251b3150c340133251b3150a340133251b3150a340133251b3150a340133201b3121b315
010b0000083550000013d200000013d1000000083550000013d200000013d1000000083550000013d2000000073550000013e2000e0013e1000000073550000013e200000013e1000000073550000013e2000000
010b0000063550000013e200000013e1000000063550000013e200000013e1000000063550000013e2000000073550000013e2000e0013e1000000073550000013e200000013e1000000073550000013e2000000
010b000014b5014a4014a3014a5014c4014a4014b4014a3014b5014a5014a4014a3014c4014a3020a350000016b5016a500000016b5016c400000016b5016a4016a3016a2216a2216a1216c4016a5016b5022a40
010b000017b5017a4017a3017a5017c4017a4017b4017a3017b5017a5017a4017a3013c4013a301fa350000018b5018a500000018b5018c400000016b5016a4016a3016a2216a2216a1216c4016a5018b5022a40
010b000014b5014a4014a3014a5014c4014a4014b4014a3014b5014a5014a4014a3014c4014a3020a350000013b5013a500000013b5013c400000013b5013a4013a3013a2213a2213a1213c4013a5013b501fa40
010b000012b501ea4012a3012a5012c4012a4012b4012a3012b5012a501ea4012a3012c4012a3012a350000013b501fa50000001fb5013c400000013b501fa401fa301fa221fa221fa1213c401fa5013b502ba40
018200200c60018600186140c6110c6150000000000000000c6140c61500000000000000000000246140c6110c615000000000000000000001861400611006150000000000000000c6140c615000000000000000
01820000000000ca740ca700ca700ca75000000000000000000000ca740ca700ca700ca750000000000000000000000a7400a7000a7000a750000000000000000000000000000000ca740ca7100a7100a7500000
0182002004614006111d611026111061109611056120461200611116110261110611096110561204612006111d611026112861109611056120461200611116110261110611096110561204612006120561202615
010b0000188401f850248601f850248602687024840268502886226870288502b8603087130872248002680030820268002880030810308003080030814000003080000000000000000000000000000000000000
010700000c00018600246000060000600246002b8003780037800378003780037800000000000000000000000c0001860024600006000c05318653246440061200612246532b8743787137862378523784237824
010e000018a1418a1018a2018a3018a4018a5018a6018a7018a6218a5218a4218a3218a2218a1218a1218a1518a5018a4018a3018a3518a2418a4018a3018a3518a5018a4018a3018a3518a2418a4018a3018a35
010e00000c0431a8001c80018800000001f8000c0330c0230c033268002480026800288002680028800298000c7500c74513750137451a7501a74518750187451f7501f745247402473526740267352474024735
011000002b7402b73530740307353274032730327203271032710327103271032715000000000000000000001f8502b8522b8422b835000000000000000000000000000000000000000000000000000000000000
010e00000cc400cc45130001a000130001a0000cc450cc450cc430cc4500000000000cc400cc4500000000000cc400cc45000000000000000000000000000000130161a026130361a046130361a026130161a016
01100000130161a026180361f046130461a036180261f016130161a016180161f015130001a000130001a00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000018a1418a1018a2018a3018a4018a5018a6018a7018a6218a5218a4218a3218a2218a1218a1218a1500000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000180161f026180361f046180361f026180161f016180161f016180161f0150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00000000000000000000000000000000000000000000006140c6110c611186111861124611246113062130621246112461118611186110c61100611006150000000000000000000000000000000000000000
__music__
00 091d4344
00 091d5656
01 090a1555
00 090b1757
00 090c1858
00 090d194e
00 1a0a0f51
00 1b0b1057
00 1c0c1258
00 56131444
00 21201e44
00 1b0b1f44
00 1c0c2244
00 25242344
00 2f2b2644
00 302c2744
00 312d2844
00 322e2944
00 2f2b2644
00 302c2744
00 312d2844
02 322e2a44
00 091d4344
00 091d4344
01 090a4344
00 090b4344
00 090c4344
00 090d4e44
00 090a4f44
00 090b5044
00 090c5244
00 09135444
00 09201d44
00 090b1d44
00 090c1d44
02 090d1d44
03 33347544
03 73343544
03 41423544
00 36374344
00 38393b3f
04 3d3a3c3e

