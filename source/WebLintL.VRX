/*:VRX         Main
*/
Main:
    signal on halt
Parse Arg ProgramPath File3 .
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Checking document Weblint...")
tmp=ProgramPath||'\weblint -x netscape' File3 '>' ProgramPath||'\weblint.tmp'
rc=SysFileDelete(ProgramPath||"\weblint.tmp")
address cmd '"@'||tmp||'"'
wi=0
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Parsing WebLint results...")
Do While Lines('weblint.tmp')>0
   a=Linein('weblint.tmp') 
   If a<> "" then Do
       wi=wi+1
       Parse Var a "(" Line ")" Rest
       WLResponse.wi="Line" Line||Rest
       End
   Else Do
       WLResponse.1="No errors were found in the HTML document."
       wi=1
       End
End
WLResponse.0=wi
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","")
rc=VRMethod("Application","PutVar","WLResponse.")
rc=VRMethod("Application","PostQueue",0,1,"Call VRLoadSecondary WLResponse")


exit

/*:VRX         Halt
*/
Halt:

exit

