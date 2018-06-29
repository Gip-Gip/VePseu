; Variables

    ORG $0080

DUMP = $30

wall1           DS 5
wall2a          DC 0
wall2b          DC 0
wall2c          DC 0
wall2d          DC 0
wall2e          DC 0
wall3a          DC 0
wall3b          DC 0
wall3c          DC 0
wall3d          DC 0
wall3e          DC 0
wall4a          DC 0
wall4b          DC 0

shadow2aa       DC 0
shadow2ba       DC 0
shadow2ca       DC 0
shadow2da       DC 0
shadow2ea       DC 0
shadow3aa       DC 0
shadow3ba       DC 0
shadow3ca       DC 0
shadow3da       DC 0
shadow3ea       DC 0

shadow1a        DC 0
shadow1b        DC 0
shadow1c        DC 0
shadow1d        DC 0
shadow1e        DC 0
shadow2ab       DC 0
shadow2bb       DC 0
shadow2cb       DC 0
shadow2db       DC 0
shadow2eb       DC 0
shadow3ab       DC 0
shadow3bb       DC 0
shadow3cb       DC 0
shadow3db       DC 0
shadow3eb       DC 0

playerPos       DC 0
mapWidth        DC 0

xGain           DC 0
xLoss           DC 0
yGain           DC 0
yLoss           DC 0

frameNum        DC 0

wallColour      DC 0
shadowColour    DC 0
drawingPlyr     DC 0

miniMapPtr      DC.W 0
mapPtr          DC.W 0

sprite:
spriteAddrH     DC 0
spriteAddrL     DC 0

spriteHeight    DC 0
spritePosY      DC 0

stepVol         DC 0
stepSnd         DC 0

    USAGE_REPORT "RAM", $80, $100
