pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--waporware modular synthesis
--digital signal processing toy

printh"-"
#include src/globals.lua
#include src/modules.lua

-->8
#include src/dev.lua
#include src/pance_helper.lua
-- #include src/pance_benchmark.lua
#include src/pance_input.lua
#include src/pance_math.lua
-- #include src/debug.lua

-->8
#include src/main.lua
-->8
#include src/util.lua
-->8
#include src/patchmode.lua
-->8
#include src/trackmode.lua
-->8
#include src/samplemode.lua
-->8
#include src/save.lua
-->8
#include src/font.lua

__gfx__
77777eee666eeeee777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee344444443444444444444444444444444444444444444444444444444444444444444444
70007eee606eeeee707eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee233333342333333433333334333333343333333433333334333333343333333433333334
7007eeee666eeeee777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee233883342336633433336334316666343363333433636334366133343663333433666634
70707eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee238888342366663431666634363333343666613433636334366661343688333433633634
77e77eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee238888342366663436336334333336343363363433636334366661343338873436636634
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee233883342336633431333334366661343333313433131334366133343333773431131134
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee233333342333333433333334333333343333333433333334333333343333333433333334
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee222222232222222322222223222222232222222322222223222222232222222322222223
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee333223323e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ee44444444444444ee44444444444444332223332e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4222223232e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4222223232e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4222223232e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4332223332e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4333223323e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e22222222222222ee22222222222222e333333333e333333eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666666666666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ee44444444444444ee444444444444446666666666666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee45555555555555555eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4ddddddd5656565ddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee45555555555555555eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee40000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee40111000000011100eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e22222222222222ee22222222222222e1bbb1000001bbb10eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeb1b1b10101b1b1b1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ee44444444444444ee44444444444444b1b1b11b11b1b1b1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4bb11b1b1b1bb11b1eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee4111b101010111b10eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee40001000000000100eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee40000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e2eeeeeeeeeeeee4e2eeeeeeeeeeeee45555555555555555eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e22222222222222ee22222222222222e5555555555555555eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeec77777777777777777777777cee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccdcccccccccccccccccdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcdddcccccccccccccccdddc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccdcccccccccccccccccdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc222222222222222222222c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc23333333332c2c2c23332c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc222222222222222222222c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc220000000000000000022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc220011100000001110022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc2201bbb1000001bbb1022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc221b1b1b10101b1b1b122c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc221b1b1b11b11b1b1b122c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc221bb11b1b1b1bb11b122c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc220111b101010111b1022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc220000100000000010022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc220000000000000000022c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc222222222222222222222c7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc22222222222222222222cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc6c6c666c666c666c666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc6c6c6c6c6c6c6c6c6c6cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc666c666c666c6c6c66ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc666c6c6c6ccc666c6c6cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc6c6c666c666c666cccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc6c6c6c6c6c6c66ccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc666c666c66cc6cccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc666c6c6c6c6c666cccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc1881cccccccddddcccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccc168861cccccdffff7ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc16f88f61cccdf8888f7cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc16888861cccdf8f88fdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc16888861cccdf88f8fdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc16f88f61cccdf8f88fdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccc166661cccccdf88fdccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc1111cccccccd88dcccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccccccccccccccc88ccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccccccccccccccc88ccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccddddcccccccf8f1cccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccddc7c7cccccc88661ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccddc117c7ccccf8fbd61cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccdd1001cdcccc88bbb61cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccdc1001cdcccf8fbbb61cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccdcc11cddccf88dbbbb1cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccdcddddcc8881666bbccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccddddcc88fcc1111cccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccccccccf8fccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccccccccf8fcccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcccc511f8fcccccddddcccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccc55588fcccccddc7c7ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc165f8f61cccddc117c7cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc16f88561cccdd1001cdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc188f5561cccdc1001cdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedccf8f55d61cccdcc11cddcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcc8866661cccccdccdddccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedcf8f1111cccccccddddcccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedc88cccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedf88cccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed88f66666666666666666ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed886666888666bbb666566cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed88666888666bbb6665556cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed8f66888666bbb66655566cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8886888666bbb666555666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8ff688666bbb6665556666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee88868666bbb66655566666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeff86666bbb666555666666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee888666bbb6665556666666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefff66bbb66655566666666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeff8ffbbb666555666666666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef888fbb6665556666666666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef88ffb6665556666dddd666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef88ff6665556666ddc7c766cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef88ff665556666ddc117c76cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee888ff655566666dd1001cd6cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef8fff555666666dc1001cd6cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef9a9f556666666dcc11cdd6cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee9a965666666666dccddd66cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaa9666666666666dddd666cc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee9a9c66666666666666666ccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee666ccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaadcccccccccccccccccdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee9a9ddcccccccccccccccdddc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaadcccccccccccccccccdcc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaaccccccccccccccccccccc7ee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaddddddddddddddddddddddcee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
__label__
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhmfffffffffffffffffffffffffffffff
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmmfmmmmmmmfmmmmmmmfmmmmmmmf
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mm88mmfmmmm1mmfm11hmmmfm11mmmmf
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m8888mfmh1111mfm1111hmfm188mmmf
ffffffffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfffffffffffffffffffffffffffffffffffhhhh5m8888mfm1mm1mmfm1111hmfmmm887mf
mmmmmmmmmmmmmmmmmfhhfffffffffffffffffffffffffffffffffffh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhh5mm88mmfmhmmmmmfm11hmmmfmmmm77mf
m000m00mm0m0mmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh5mm00mm0mm0m0mmmmmmm00mm0mmmmmmmmmmfhhhh5mmmmmmfmmmmmmmfmmmmmmmfmmmmmmmf
mm0mm000m00mmmmmmfh5mm00m000m00mmmmmmmm00mmmmmmmmmmmmmfh5mm0mm000m000mmmmmm0m0m0mmmmmmmmmmmfhhhh5555555m5555555m5555555m5555555m
mm0mm0m0m0m0mmmmmfh5mm0mmm0mm0m0mmmmmm0mm0mmmmmmmmmmmmfh5m00mm0m0m000mmmmm0mm00mmmmmmmmmmmmfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
mmmmmmmmmmmmmmmmmfh5m00mm000m0m0mmmmm0mmmm00mmmmmmmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
mmmmmmmmmmmmmmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
m111m000m00mmmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh5m777m000m00mmm0mmm111m000m0m0m000mfhhhhhhhhhhh77777hhhhhhhhhhhhhhhhhhhh
m1a1mm0mmm0mmmmmmfh5m777m000m00mmm0mmm111m000m0m0m000mfh5m787m00mm000m0m0mm1a1m0m0m0m0mm0mmfhhhhhhhhhhh70007hhhhhhhhhhhhhhhhhhhh
m1a1mm0mm000mmmmmfh5m7a7m00mm000m0m0mm1a1m0m0m0m0mm0mmfh5m877m0mmm0m0mm00mm1a1m000m000mm0mmfhhhhhhhhhhh7007hhhhhhhhhhhhhhhhhhhhh
mmmammmmmmmmmmmmmfh5m7a7m0mmm0m0mm00mm11am000m000mm0mmfh58mmmmmmmmmmmmmmmmmmammmmmmmmmmmmmmfhhhhhhhhhhh70707hhhhhhhhhhhhhhhhhhhh
mmmammmmmmmmmmmmmfh5mammmmmmmmmmmmmmmmmmammmmmmmmmmmmmfh855555555555555555555a5555555555555hhhhhhhhhhhh77h77hhhhhhhhhhhhhhhhhhhh
m11am0mmmm0mm000mfh55a5555555555555555555a555555555555h8hhhhhhhhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
m1bam0m0m000mm0mmfhhafffffffffffffffffffffafffffffffff8hhhhhhhhhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
m1b1a000m0m0mm0mmfh5ammmmmmmmmmmmmmmmmmmmmammmmmmmmmm8fffffffffffffffffffffffaffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
mmbmammmmmmmmmmmmfhamm0mm00mmm00m00mmmmmmmmammmmmmmm8m5mmmmmmmmmmmmmmmmmmmmmmammmmmmmmmmmfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
mmmbmammmmmmmmmmmfham000m0m0mm0mm000mmmmmmmmammmmmm8mm5mm0mm00mmm00m00mmmmmmmmammmmmmmmmmfhhfffffffffffffffffffffffffffffffffffh
m11bma00m00mmmmmmfa5m0m0m00mm00mm0m0mmmmmmmmammmmm8mmm5m000m0m0mm0mm000mmmmmmmammmmmmmmmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh
m18bmmammm0mmmmmmfa5mmmmmmmmmmmmmmmmmmmmmmmmmammm8mmmm5m0m0m00mm00mm0m0mmmmmmmammmmmmmmmmfh5m000m000m0m0m000m00mmmmmmmmmmmmmmmfh
m1188mammm00mmmmmah5mmmmmmmmmmmmmmmmmmmmmmmmmma88mmmmm5mmmmmmmmmmmmmmmmmmmmmmmammmmmmmmmmfh5m000mm0mmm0mm00mm000mmmmmmmmmmmmmmfh
mmmbm8mammmmmmmmmah5m777mm0mm000m0m0mm111m000m8a0m000m5mmmmmmmmmmmmmmmmmmmmmmmammmmmmmmmmfh5m0m0m000m0m0m000m0m0mmmmmmmmmmmmmmfh
mmmbmm8mammmmmmmafh5m707m000mm0mm00mmm1a1m0m080mamm0mm5m777mm0mm000m0m0mm111m00am0m0m000mfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh
m111b0m88m0mm00amfh5m777m0m0mm0mm0m0mm11am008m000am0mm5m707m000mm0mm00mmm1a1m0mam0m0mm0mmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfh
m191b0m0m8a0mmammfh5mmmmmmmmmmmmmmmmmmmmma88mmmmmmammm5m777m0m0mm0mm0m0mm1a1m00am000mm0mmfh5m777m000m00mmmmmmm111m000m0m0m000mfh
m119b000m088aa0mmfh5mmmmmmmmmmmmmmmmmmmm88mmmmmmmmmamm5mmmmmmmmmmmmmmmmmmmammmmammmmmmmmmfh5m7a7mm0mm0m0mmmmmm1a1m0m0m0m0mm0mmfh
mmm9bmmmmmmm88mmmfh5m777m00mm000m000mm88mmammmmmmmmmam5mmmmmmmmmmmmmmmmmmmmammmmammmmmmmmfh5aa77m000m0m0mmmmmm1a1m000m000mm0mmfh
mmmm9bmmmmmmmm88mfh5m707m0m0m00mm0mm88mmmmmammmmmmmmmaam777m00mm000m000mmmmammmmammmmmmmmfhammmmmmmmmmmmmmmmmmmammmmmmmmmmmmmmfh
m111m900m000mmmm88h5m777m00mm000m088mmmmmmmmammmmmmmmm5aa07m0m0m00mm0mmmmmmammmmammmmmmmmfa5mmmmmmmmmmmmmmmmmmmammmmmmmmmmmmmmfh
m191m9bmmm00mmmmmf8888mmmmmmmmmm88mmmmmmmmmmammmmmmmmm5m7aam00mm000m000mmmmammmmammmmmmmaah5m777m0m0m000m0mmmmammmmmmmmmmmmmmmfh
m191mm9mm000mmmmmfh5mm8888888888mmmmmmmmmmmmmammmmmmmm5mmmmaammmmmmmmmmmmmmmammmmammmmaamfh5m7a7m0m0m0m0m0mmmmammmmmmmmmmmmmmmfh
mm9mmmb9mmmmmmmmmfh5m777mm00m0m0mm00mmmmmmmmmmammmmmmm5mmmmmmaammmmmmmmmmmmmammmmammaammmfh5ma77mm0mm000m000mmammmmmmmmmmmmmmmfh
mm89mmm9mmmmmmmmmfh5m707mm0mm0m0mm0mmmmmmmmmmmmammmmmm5m777mm00aam0mm00mmmmmammmmaaammmmmfh5ammmmmmmmmmmmmmmmmammmmmmmmmmmmmmmfh
m119m0mb9m0mm000mfh5m777m00mm000m00mmmmmmmmmmmmmaammmm5m707mm0mm0aaaaammmmmmaaaaaaammmmmmfaammmmmmmmmmmmmmmmmmammmmmmmmmmmmmmmfh
m1b9m0mbm900mm0mmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmammm5m777m00mm000m00aaaaaaaammmmammmmmmah5m777m000m00mmmmmmmammmmmmmmmmmmmmmfh
m119m000b090mm0mmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmamm5mmmmmmmmmmmmmmmmmmmmmmammmmmammmmafh5m7a7mm0mm0m0mmmmmammmmmmmmmmmmmmmmfh
mmm9mmmmbmm9mmmmmfh5m777m00mm000m0mmmmmmmmmmmmmmmmmmam5mmmmmmmmmmmmmmmmmmmmmmmammmmmammamfh5ma77m000m0m0mmmmmammmmmmmmmmmmmmmmfh
mmm89mmmbmmm9mmmmfh5m707m000m00mm0mmmmmmmmmmmmmmmmmmmaam777m00mm000m0mmmmmmmmmammmmmaaammfh5mammmmmmmmmmmmmmmammmmmmmmmmmmmmmmfh
m1189000b0m09mmmmfh5m777m0m0m000m000mmmmmmmmmmmmmmmmmm5aa07m000m00mm0mmmmmmmmmmammmaaammmfh5ammmmmmmmmmmmmmmmammmmmmmmmmmmmmmmfh
m1019b0mmb00m9mmmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm5m7aam0m0m000m000mmmmmmmmamaammmammfham777m0m0m000m0mmmammmmmmmmmmmmmmmmfh
m1119b0mmbm0mm9mmfh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm5mmmmaammmmmmmmmmmmmmmmmmaammmmmammfa5m7a7m0m0m0m0m0mmammmmmmmmmmmmmmmmmfh
mmmm89bmmmbmmmm9mfh5m777m0mmmm0mm000mmmmmmmmmmmmmmmmmm5mmmmmmaaaammmmmmmmmmaaaamammmmmmaaah5ma77mm0mm000m000ammmmmmmmmmmmmmmmmfh
mmmm89bmmmbmmmmm99h5m7b7m0m0m000mm0mmmmmmmmmmmmmmmmmmm5m777m0mmmmaaaaaaaaaammmmmammmmmmmmfh5mammmmmmmmmmmmmmammmmmmmmmmmmmmmmmfh
m111m9mbmm0bm000mf95mb77m000m0m0mm0mmmmmmmmmmmmmmmmmmm5m797m0m0m000mm0mmmmmmmmmmmammmmmmmfh5a555555555555555a55555555555555555hh
m101m89bm00bmm0mmfh9bmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm59977m000m0m0mm0mmmmmmmmmmmammmmmmmfhhahhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhh
m111m890b0m0bm0mmfhb99555555555555555555555555555555599mmmmmmmmmmmmmmmmmmmmmmmmmmmammmmmmfhahhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhh
mmmmm89mbmmmmbmmmfbhhh9hhhhhhhhhhhhhhhhhhhhhhhhhhhh99h55555555555555555555555555555a55555hahhhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhh
mmmmmm89mbmmmmbbbbhhhhh99hhhhhhhhhhhhhhhhhhhhhhhh99hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhahhhhhahhhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhh
m111m089mmb0mmmmmfhhhffff99ffffffffffffffffffff99fffffffhffffffffffffffffffffffffffffaffaaffhhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhh
m101mm89mmbmmmmmmfhh5mmmmmm99mmmmmmmmmmmmmmmm99mmmmmmmmf5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmaammmfhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhhh
m111mm8m900bmmmmmfhh5m0mmm0009999mmmmmmm99999mmmmmmmmmmf5mm0mm00mmm00m00mmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhhh
mmmmmmm89mmmbmmmmfhh5m0mmm00mm0m09999999mm0mmmmmmmmmmmmf5m000m0m0mm0mm000mmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhhhahhhhhhhhhhhhhhhhhhhhh
mmmmmmm89mmmbmmmmfhh5m000m0mmm000mmmmm0mmmm00mmmmmmmmmmf5m0m0m00mm00mm0m0mmmmmmmmmmmmmmmmmmfhfffffffffffffafffffffffffffffffffff
m111m0m89m0mmb00mfhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmf5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmf5mmmmmmmmmmmmammmmmmmmmmmmmmmmmmmmmf
m101m0m08900mb0mmfhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmf5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmf5m000m000m0m0a000m00mmmmmmmmmmmmmmmf
m111m00089m0mmbmmfhh5m777m000m00mmm0mmm111m000m0m0m000mf5m777mm0mm000m0m0mm111m000m0m0m000mf5m000mm0mmm0ma00mm000mmmmmmmmmmmmmmf
mmmmmmmmm89mmmmbmfhh5m797m00mm000m0m0mm191m0m0m0m0mm0mmf5m707m000mm0mm00mmm181m0m0m0m0mm0mmf5m0m0m000m0mam000m0m0mmmmmmmmmmmmmmf
mmmmmmmmm8m9mmmbmfhh5m977m0mmm0m0mm00mm191m000m000mm0mmf5m777m0m0mm0mm0m0mm181m000m000mm0mmf5mmmmmmmmmmmammmmmmmmmmmmmmmmmmmmmmf
m111m000m8m9mmmmbfhh5m9mmmmmmmmmmmmmmmm9mmmmmmmmmmmmmmmf5mmmmmmmmmmmmmmmmmm8mmmmmmmmmmmmmmmf5mmmmmmmmmmmammmmmmmmmmmmmmmmmmmmmmf
m101mm0mm0809mmmmbhh59555555555555555559555555555555555h5mmmmmmmmmmmmmmmmmm8mmmmmmmmmmmmmmmf5m777m000m0ammmmmmm111m000m0m0m000mf
m111mm0mm080m99mmfb99hfffffffffffffffff9ffffffffffffffff5m777m00mm000m000m8mmmmmmmmmmmmmmmmf5m7a7mm0mm0a0mmmmmm1b1m0m0m0m0mm0mmf
mmmmmmmmmmm8mmm9999bh5mmmmmmmmmmmmmmmm9mmmmmmmmmmmmmmmmm5m707m0m0m00mm0mmm8mmmmmmmmmmmmmmmmf5m77am000mam0mmmmmm1b1m000m000mm0mmf
mmmmmmmmmmm8mmmmmfhhb5mm00mm0mm00mmmmm9mm0000mmmmmmmmmmm5m777m00mm000m0008mmmmmmmmmmmmmmmmmf5mmmammmmmammmmmmmmmbmmmmmmmmmmmmmmf
m111m0mmmm0m8000mfhhb5mm0mm0m0m000mmm9mmm0mm0mmmmmmmmmmm5mmmmmmmmmmmmmmmm8mmmmmmmmmmmmmmmmmf5mmmmammmammmmmmmmmbmmmmmmmmmmmmmmmf
m101m0m0m0008m0mmfhhhbm00mmm00m0m0mmm9m000mm00mmmmmmmmmm5mmmmmmmmmmmmmmmm8mmmmmmmmmmmmmmmmmf5m777maaam000m0mmmmbmmmmmmmmmmmmmmmf
m111m000m0m0m80mmfhhh5bmmmmmmmmmmmmmm9mmmmmmmmmmmmmmmmmm5m777mm00m0m0mm08mmmmmmmmmmmmmmmmmmf5m707m0m0m0m0m0mmmmbmmmmmmmmmmmmmmmf
mmmmmmmmmmmmm8mmmfhhh5mbmmmmmmmmmmmm9mmmmmmmmmmmmmmmmmmm5m707mm0mm0m0mm08mmmmmmmmmmmmmmmmmmf5m777mm0mm000m000mmbmmmmmmmmmmmmmmmf
mmmmmmmmmmmmmm8mmfhhh5m7b7m000m00mmm9mmm111m000m0m0m000m5m777m00mm000m08mmmmmmmmmmmmmmmmmmmf5mmmmmmmmmmmmmmmmmmbmmmmmmmmmmmmmmmf
m111m0m0mmmmmm8mmfhhh5m78bm00mm000m090mm181m0m0m0m0mm0mm5mmmmmmmmmmmmmm8mmmmmmmmmmmmmmmmmmmf5mmmmmmmmmmmmmmmmmmbmmmmmmmmmmmmmmmf
m101mm0mmmmmmmm8mfhhh58877b0mmm0m0m900mm181m000m000mm0mm5mmmmmmmmmmmmm8mmmmmmmmmmmmmmmmmmmmf5m777m000m00mmmmmmbmmmmmmmmmmmmmmmmf
m111m0m0mmmmmmm88fhh88mmmmmbmmmmmmm9mmmmm8mmmmmmmmmmmmmm5m777m00mm000m8mmmmmmmmmmmmmmmmmmmmf5m797mm0mm0m0mmmmmbmmmmmmmmmmmmmmmmf
mmmmmmmmmmmmmmmmm888h5mmmmmmbmmmmmm9mmmmm8mmmmmmmmmmmmmm5m707m000m00mm8mmmmmmmmmmmmmmmmmmmmf5m977m000m0m0mmmmmbmmmmmmmmmmmmmmmmf
mmmmmmmmmmmmmmmmmfhhh5m777m0mbm000900mmmm8mmmmmmmmmmmmmm5m777m0m0m0008000mmmmmmmmmmmmmmmmmmf5m9mmmmmmmmmmmmmmmbmmmmmmmmmmmmmmmmf
m111m00mmmmmmmmmmfhhh5m7b7m0mmb00m90m0mmm8mmmmmmmmmmmmmm5mmmmmmmmmmmm8mmmmmmmmmmmmmmmmmmmmmf59mmmmmmmmmmmmmmmmbmmmmmmmmmmmmmmmmf
m101mm0mmmmmmmmmmfhhh5m7b7m000mbb090m0mm8mmmmmmmmmmmmmmm5mmmmmmmmmmm8mmmmmmmmmmmmmmmmmmmmmmf59777m0m0m000m0mmbmmmmmmmmmmmmmmmmmf
m111mm00mmmmmmmmmfhhh5mmbmmmmmmmmbbmmmmm8mmmmmmmmmmmmmmm5m777m0mmmm08m000mmmmmmmmmmmmmmmmmmf9m707m0m0m0m0m0mmbmmmmmmmmmmmmmmmmmf
mmmmmmmmmmmmmmmmmfhhh555b5555555595bb55585555555555555555mbb7m0m0m008mm0mmmmmmmmmmmmmmmmmmmf9m777mm0mm000m000bmmmmmmmmmmmmmmmmmf
55555555555555555hhhhhhhbhhhhhhh9hhhhbbh8hhhhhhhhhhhhhbbbb777m000m080mm0mmmmmmmmmmmmmmmmmmm95mmmmmmmmmmmmmmmmbmmmmmmmmmmmmmmmmmf
hhhhhhhhhhhhhhhhhhhhhhhhbhhhhhhh9hhhhhhbbbbhhhhhbbbbbbhh5mmmmmmmmmm8mmmmmmmmmmmmmmmmmmmmmmm955555555555555555b55555555555555555h
hhhhhhhhhhffffffffffffffbffffff9ffffffff8ffbbbbbhhhhhhhh55555555558555555555555555555555559hhhhhhhhhhhhhhhhhbhhhhhhhhhhhhhhhhhhh
hhhhhhhhh5mmmmmmmmmmmmmmbmmmmmm9mmmmmmmm8mmmfhhhhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhhhhhhbhhhhhhhhhhhhhhhhhhh
hhhhhhhhh5m000m000m0m0m0b0m00m9mmmmmmmmm8mmmfhhhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhhhhhhhbhhhhhhhhhhhhhhhhhhh
hhhhhhhhh5m000mm0mmm0mm0bmm0009mmmmmmmmm8mmmfhhhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhhhhhhhhbhhhhhhhhhhhhhhhhhhh
hhhhhhhhh5m0m0m000m0m0m0b0m0m9mmmmmmmmmm8mmmfhhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhhhhhhhhbhhhhhhhhhhhhhhhhhhh
hhhhhhhhh5mmmmmmmmmmmmmmbmmm9mmmmmmmmmmm8mmmfhhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhfffffffffffbfffffffffffffffffff
hhhhhhhhh5mmmmmmmmmmmmmmmbmm9mmmmmmmmmm8mmmmfhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhh5mmmmmmmmmmbmmmmmmmmmmmmmmmmmmmm
hhhhhhhhh5m777m000m00mmmmbm9111m000m0m08000mfhhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhh5mm00m000m0b0mm0mm0m0m000m00mmmm
hhhhhhhhh5m797mm0mm0m0mmmbm91b1m0m0m0m08m0mmfhhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhh5mm0mm000m0bmm000m00mm00mm000mmm
hhhhhhhhh5m779m000m0m0mmmb9m1b1m000m0008m0mmfhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhh5m00mm0mmm0b0m0m0m0m0m000m0m0mmm
hhhhhhhhh5mmmm9mmmmmmmmmmbmmmbmmmmmmmmm8mmmmfhhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhh5mmmmmmmmmmbmmmmmmmmmmmmmmmmmmmm
hhhhhhhhh5mmmmm9mmmmmmm99bmmbmmmmmmmmmm8mmmmfhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhh5mmmmmmmmmbmmmmmmmmmmmmmmmmmmmmm
hhhhhhhhh5m777m099m00990mbmmbmmmmmmmmmm8mmmmfhhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhh5m777m000mb0mm000mmmmmmmm55mm5mm
hhhhhhhhh5m707m0m09990m0mbmmbmmmmmmmmmm8mmmmfhhhhhhhhhhhhhh8hhhhhhhhhhhhhhhhhhhhhh9hhhhhhhhhhhhh5m7b7mm0mb0m0m000mmmmmmm555mmm5m
hhhhhhhhh5m777mm0mm000m00bmmbmmfffffff8fffffffffffffffffff8fffffffhhhhhhhhhhhhhhh9hhhhhhhhhhhhhh5m7b7m000b0m0m0mmmmmmm55555m5m5m
hhhhhhhhh5mmmmmmmmmmmmmmmbmbmm5mmmmmmm8mmmmmmmmmmmmmmmmmmm8mmmmmmfhhhhhhhhhhhhhh9hhhhhhhhhhhhhhh5mmmbmmmbmmmmmmmmmmmmm55555m5m5m
hhhhhhhhh5mmmmmmmmmmmmmmmmbbmm5m000m008m0m0m000m00mmmmmmm8mmmmmmmfhhhhhhhhhhhhh9hhhhhhhhhhhhhhhh5mmmbmmmbmmmmmmmmmmmmm55555m5m5m
hhhhhhhhh5m777m000m00mmmmmbbmm5m000mm08mm0mm00mm000mmmmmm8mmmmmmmfhhhhhhhhhhhhh9hhhhhhhhhhhhhhhh5m777bmb0m000m00mmmmmmmm555mmm5m
hhhhhhhhh5m707mm0mm0m0mmmmmbmm5m0m0m008m0m0m000m0m0mmmmm8mmmmmmmmfhhhhhhhhhhhh9hhhhhhhhhhhhhhhhh5m707mb0mm000m0m0mmmmmmmm55mm5mm
hhhhhhhhh5m777m000m0m0mmmmmmmm5mmmmmmm8mmmmmmmmmmmmmmmm8mmmmmmmmmfhhhhhhhhhhh9hhhhhhhhhhhhhhhhhh5m777m00mm0mmm00mmmmmmmmmmmmmmmm
hhhhhhhhh5mmmmmmmmmmmmmmmmmmmm5mmmmmm8mmmmmmmmmmmmmmmmm8mmmmmmmmmfhhhhhhhhh99hhhhhhhhhhhhhhhhhhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
hhhhhhhhh5mmmmmmmmmmmmmmmmmmmm5m777m080m00mmmmmmm111m080m0m0m000mfhhhhhhhh9hhhhhhhhhhhhhhhhhhhhh55555555555555555555555555555555
hhhhhhhhh5m777m0m0m000m0mmmmmm5m787mm8mm0m0mmmmmm191m8m0m0m0mm0mmfhhhhhhh9hhhhh1111111111111111111111111111111111111111111111111
hhhhhhhhh5m707m0m0m0m0m0mmmmmm5m787m080m0m0mmmmmm1198000m000mm0mmfhhhhhh9hhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhh5m777mm0mm000m000mmmm5mmm8m8mmmmmmmmmmmmmm8m99mmmmmmmmmmfhhhh99hhhhhhh10aaa0aaa0a0a00a00aaa00000aaa0aa00aaa000000000001
hhhhhhhhh5mmmmmmmmmmmmmmmmmmmm5mmm8m8mmmmmmmmmmmmm8mmmm99mmmmmmmmfhh99hhhhhhhhh10a000aaa0a0a00000a0a0000000a00a0000a000000000001
hhhhhhhhh5555555555555555555555m77780m0m000m0mmm88mmmmmmm999mmmm9999hhhhhhhhhhh10aaa0a000aaa00a00aaa00a000a00aaa00a0000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m788m0m0m0m0m0888mmmmmmmmmmmm9999mfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m777880mm0888800mmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmm8888mmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m777m000m00mmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m707mm0mm0m0mmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m777m000m0m0mmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb1
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m777m0m0m000m0mmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m707m0m0m0m0m0mmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5m777mm0mm000m000mmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh5mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh55555555555555555555555555555555555hhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1000000000000000000000000000000000000000000000001
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1111111111111111111111111111111111111111111111111

__sfx__
010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
