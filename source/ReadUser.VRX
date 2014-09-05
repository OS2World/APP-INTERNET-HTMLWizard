/*:VRX         Main
*/
Main:
    signal on halt
Parse Arg IniFile
Do i=1 to 14
    UserTagHint.i=VRGetIni("User Tag" i,"Hint",IniFile,"NoClose")
    UserTag.i=VRGetIni("User Tag" i,"Tag",IniFile,"NoClose")
    UserTagBack.i=VRGetIni("User Tag" i,"Back",IniFile,"NoClose")
    UserTagAbbrev.i=VRGetIni("User Tag" i,"Abbrev",IniFile,"NoClose")
    If UserTagAbbrev.i="" then
        UserTagAbbrev.i="U"||i
End
UserTagBack.14=VRGetIni("User Tag" i,"Back",IniFile) /* To close ini file */
UserTag.0=14
UserTagHint.0=14
UserTagBack.0=14
UserTagAbbrev.0=14
rc=VRMethod("Application","PutVar","UserTag.")
rc=VRMethod("Application","PutVar","UserTagHint.")
rc=VRMethod("Application","PutVar","UserTagBack.")
rc=VRMethod("Application","PutVar","UserTagAbbrev.")
rc=VRMethod("Application","PostQueue",0,1,"Call SetUserTags")
Do ITag=1 to 14
    TagName="TB_UT"||ITag
    rc=VRMethod("Application","PutVar","TagName")
    rc=VRMethod("Application","PutVar","ITag")
    rc=VRMethod("Application","PostQueue",0,1,"Call UpdateUserTag")
End
exit

/*:VRX         Halt
*/
Halt:

exit

