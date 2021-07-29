Scriptname ConsoleDancePlayerScript extends ReferenceAlias  
{Represents the player}

Event OnInit()
    ListenForDanceConsoleCommands()
EndEvent

Event OnPlayerLoadGame()
    ListenForDanceConsoleCommands()
EndEvent

Function ListenForDanceConsoleCommands()
    RegisterForModEvent(CustomConsoleCommands.RegisterCommand("Dance"), "OnDanceCommand")
EndFunction

Event OnDanceCommand(string eventName, string command, float _, Form sender)
    ObjectReference selectedActor = Game.GetCurrentConsoleRef() as Actor
    if ! selectedActor
        selectedActor = GetActorReference()
    endIf
    string actorName = selectedActor.GetBaseObject().GetName()
    MiscUtil.PrintConsole("Dance, " + actorName + ", dance!")
    Debug.SendAnimationEvent(selectedActor, "IdleCiceroDance1")
EndEvent
