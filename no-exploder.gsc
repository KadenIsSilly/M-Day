// mp/zombies/no-exploder
// Made by Kaden

init()
{
    level thread onplayerconnect();
}

onplayerconnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        // Remove exploder mutator
        if (isDefined(level.mutators))
            level.mutators["exploder"] = undefined;
    }
}