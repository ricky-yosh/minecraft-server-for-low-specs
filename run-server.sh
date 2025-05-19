#!/usr/bin/env sh

SESSION_NAME="minecraft"

# Check if session already exists
if screen -list | grep -q "$SESSION_NAME"; then
    echo "Server is already running!"
    echo "Use 'screen -r $SESSION_NAME' to attach"
    exit 1
fi

screen -dmS "$SESSION_NAME" java -Xms1536M -Xmx1536M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar purpur-1.21.5-2434.jar nogui

echo "Minecraft server started successfully!"
echo "Commands:"
echo "  Attach: screen -r $SESSION_NAME"
echo "  Check status: screen -ls"
