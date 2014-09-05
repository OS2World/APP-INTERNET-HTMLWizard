/*:VRX         Main
*/
/*  Main
*/
Main:
/*  Process the arguments.
    Get the parent window.
*/
    parse source . calledAs .
    parent = ""
    argCount = arg()
    argOff = 0
    if( calledAs \= "COMMAND" )then do
        if argCount >= 1 then do
            parent = arg(1)
            argCount = argCount - 1
            argOff = 1
        end
    end
    InitArgs.0 = argCount
    if( argCount > 0 )then do i = 1 to argCount
        InitArgs.i = arg( i + argOff )
    end
    drop calledAs argCount argOff

/*  Load the windows
*/
    call VRInit
    parse source . . spec
    _VREPrimaryWindowPath = ,
        VRParseFileName( spec, "dpn" ) || ".VRW"
    _VREPrimaryWindow = ,
        VRLoad( parent, _VREPrimaryWindowPath )
    drop parent spec
    if( _VREPrimaryWindow == "" )then do
        call VRMessage "", "Cannot load window:" VRError(), ,
            "Error!"
        _VREReturnValue = 32000
        signal _VRELeaveMain
    end
/*  Process events
*/
    call Init
    signal on halt
    do while( \ VRGet( _VREPrimaryWindow, "Shutdown" ) )
        _VREEvent = VREvent()
        interpret _VREEvent
    end
_VREHalt:
    _VREReturnValue = Fini()
    call VRDestroy _VREPrimaryWindow
_VRELeaveMain:
    call VRFini
exit _VREReturnValue

VRLoadSecondary: procedure
    name = arg( 1 )

    window = VRLoad( VRWindow(), VRWindowPath(), name )
    call VRSet window, "Visible", 0
/*
    call VRMethod window, "CenterWindow"
    call VRMethod window, "Activate"
*/
return window

/*:VRX         AboutWindow_Close
*/
AboutWindow_Close:
    window = VRInfo( "Object" )
    call VRDestroy window
    drop window
return
/*:VRX         Accents_Acute_Click
*/
Accents_Acute_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="a" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_AAcute_Click
    End
    When Letter="e" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_EAcute_Click
    End
    When Letter="i" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_IAcute_Click
    End
    When Letter="o" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_OAcute_Click
    End
    When Letter="u" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_UAcute_Click
    End
    When Letter="y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_YAcute_Click
    End
    When Letter="A" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_AAcute_Click
    End
    When Letter="E" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_EAcute_Click
    End
    When Letter="I" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_IAcute_Click
    End
    When Letter="O" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_OAcute_Click
    End
    When Letter="U" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_UAcute_Click
    End
    When Letter="Y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_YAcute_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Acute accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */

return

/*:VRX         Accents_Circumflex_Click
*/
Accents_Circumflex_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="a" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_ACircumflex_Click
    End
    When Letter="e" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_ECircumflex_Click
    End
    When Letter="i" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_ICircumflex_Click
    End
    When Letter="o" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_OCircumflex_Click
    End
    When Letter="u" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_UCircumflex_Click
    End
    When Letter="y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_YCircumflex_Click
    End
    When Letter="A" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_ACircumflex_Click
    End
    When Letter="E" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_ECircumflex_Click
    End
    When Letter="I" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_ICircumflex_Click
    End
    When Letter="O" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_OCircumflex_Click
    End
    When Letter="U" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_UCircumflex_Click
    End
    When Letter="Y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_YCircumflex_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Circumflex accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */

return

/*:VRX         Accents_Grave_Click
*/
Accents_Grave_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="a" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_AGrave_Click
    End
    When Letter="e" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_EGrave_Click
    End
    When Letter="i" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_IGrave_Click
    End
    When Letter="o" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_OGrave_Click
    End
    When Letter="u" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_UGrave_Click
    End
    When Letter="y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_YGrave_Click
    End
    When Letter="A" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_AGrave_Click
    End
    When Letter="E" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_EGrave_Click
    End
    When Letter="I" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_IGrave_Click
    End
    When Letter="O" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_OGrave_Click
    End
    When Letter="U" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_UGrave_Click
    End
    When Letter="Y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_YGrave_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Grave accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */

return

/*:VRX         Accents_Slash_Click
*/
Accents_Slash_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="o" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_OSlash_Click
    End
    When Letter="O" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_OSlash_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Slash accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */

return

/*:VRX         Accents_Tilde_Click
*/
Accents_Tilde_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="n" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_NTilde_Click
    End
    When Letter="N" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_NTilde_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Tilde accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */


return

/*:VRX         Accents_Umlaut_Click
*/
Accents_Umlaut_Click: 
obj="MLE_1"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd & SelStart<>1 then do
rc=VRSet(obj,"SelectedStart",SelStart-1)
Letter=VRGet(obj,"SelectedText")
Select 
    When Letter="a" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_AUmlaut_Click
    End
    When Letter="e" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_EUmlaut_Click
    End
    When Letter="i" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_IUmlaut_Click
    End
    When Letter="o" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_OUmlaut_Click
    End
    When Letter="u" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_UUmlaut_Click
    End
    When Letter="y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Lower_YUmlaut_Click
    End
    When Letter="A" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_AUmlaut_Click
    End
    When Letter="E" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_EUmlaut_Click
    End
    When Letter="I" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_IUmlaut_Click
    End
    When Letter="O" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_OUmlaut_Click
    End
    When Letter="U" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_UUmlaut_Click
    End
    When Letter="Y" then do
        rc=VRMethod("MLE_1","Cut")
        Call Special_Upper_YUmlaut_Click
    End
Otherwise
    rc=VRMEssage("MainWindow","Umlaut accenting of this character is not supported in HTML.","Accenting Error","E")
    rc=VRSet(obj,"SelectedStart",SelStart)
End /* Select */
End /* If */

return

/*:VRX         ALinkColorButton_Click
*/
ALinkColorButton_Click: 
Parse Var ALinkColor "(" BGR "," BGG "," BGB ")"
rc=VRSet("RedSpin","Value",BGR)
rc=VRSet("GreenSpin","Value",BGG)
rc=VRSet("BlueSpin","Value",BGB)

return

/*:VRX         AnchorCancelButton_Click
*/
AnchorCancelButton_Click: 
If Selected<>0 then rc=VRMethod("MLE_1","Insert",Txt)
Call Anchors_Fini
return

/*:VRX         AnchorEntry_DragDrop
*/
AnchorEntry_DragDrop: 
rc=VRInfo("SourceFile.")
F=SourceFile.!SourceFile
LongName=""
If VRFileExists(F) then do
    rc=SysGetEA(F,".type","EA")
    Parse Var EA 11 EA2
    If EA2="WebExplorer_Url" then do
    /* This is a Web Explorer URL object */
        a=Linein(F)
        rc=Stream(F,"C","Close")
        Parse Var a URL .
        Parse Var URL  First "//" URLText
        rc=VRSet("AnchorEntry","Value",URLText)
        rc=VRSet("WWWSelect","Set",1)
        rc=SysGetEA(F,".longname","EA")
        Parse Var EA 5 LongName
        If rc<>0 then LongName=SourceFile.!SourceName
        LongName=Translate(LongName," ",d2c(10)) /* Get rid of LF */
        LongName=Translate(LongName," ",d2c(13)) /* Get rid of CR */
        LongName=Space(LongName) /* Get rid of extra spaces */
        rc=VRSet("AnchorTextEntry","Value",LongName)
        Return
    End
End
If Translate(SourceFile.!Operation)<>"COPY" then do
   rc=VRSet("AnchorEntry","Value",SourceFile.!SourceName)
   End
Else Do
   rc=VRSet("AnchorEntry","Value",SourceFile.!SourceFile)
End
Drop SourceFile.
return

/*:VRX         AnchorOKButton_Click
*/
AnchorOKButton_Click: 


/* Find out which type of anchor was selected */
    If VRGet("WWWSelect","Set")=1 then do
        URLText="http://"
        LastAnchorButton="WWWSelect"
        End
    Else
    If VRGet("GopherSelect","Set")=1 then do
        URLText="gopher://"
        LastAnchorButton="GopherSelect"
        End
    Else
    If VRGet("TelnetSelect","Set")=1 then do
        URLText="telnet://"
        LastAnchorButton="TelnetSelect"
        End
    Else
    If VRGet("FTPSelect","Set")=1 then do
        URLText="ftp://"
        LastAnchorButton="FTPSelect"
        End
    Else
    If VRGet("MailtoSelect","Set")=1 then do
        URLText="mailto:"
        LastAnchorButton="MailtoSelect"
        End
    Else
    If VRGet("NNTPSelect","Set")=1 then do
        URLText="nntp://"
        LastAnchorButton="NNTPSelect"
        End
    Else
    If VRGet("WAISSelect","Set")=1 then do
        URLText="wais://"
        LastAnchorButton="WAISSelect"
        End
    Else
    If VRGet("IntraSelect","Set")=1 then do
        URLText="#"
        LastAnchorButton="IntraSelect"
        End
    Else
    If VRGet("OtherSelect","Set")=1 then do
        URLText=""
        LastAnchorButton="OtherSelect"
        End
    URLText=URLText||VRGet("AnchorEntry","Value")
    AnchorText=VRGet("AnchorTextEntry","Value")
    If VRGet("IntraLand","Set")=1 then do
        LastAnchorButton="IntraLand"
        If VRGet("Options_Menu_Uppercase","Checked")=1 then
            tag='<A NAME="'||URLText||'">'||AnchorText||'</A>'
        Else
            tag='<a name="'||URLText||'">'||AnchorText||'</a>'
        End
    Else 
        Do
        If VRGet("Options_Menu_Uppercase","Checked")=1 then
            tag='<A HREF="'||URlText||'">'||AnchorText||'</A>'
        Else
            tag='<a href="'||URlText||'">'||AnchorText||'</a>'
        End
    PasteText=""
    Call Insert_Tag obj, tag, 0,1
    Call Anchors_Fini
return

/*:VRX         Anchors_Close
*/
Anchors_Close: 
    call Anchors_Fini
return

/*:VRX         Anchors_Create
*/
Anchors_Create: 
    call Anchors_Init
SelStart=VRGet("MLE_1","SelectedStart")
SelEnd=VRGet("MLE_1","SelectedEnd")
if SelStart=SelEnd then Do
    Selected=0
    Txt=""
    End
Else Do
    Selected=1
    Txt=VRGet("MLE_1","SelectedText")
    rc=VRMethod("MLE_1","Clear")
End
Call VRSet "AnchorTextEntry","Value",Txt
If LastAnchorButton<>"" then
   Call VRSet LastAnchorButton, "Set",1
/* This code remembers the intra-document anchor from a 
   previous jump, and strips off the leading characters
   to the # symbol
*/
If LastAnchorButton="IntraSelect" then 
    Do
        N=Length(URLText)
        J=Pos("#",URLText)
        If DataType(N)<>"NUM" | DataType(J)<>"NUM" then 
            Do
                URLText=""
                Leave
            End
        If N>1 & J>0 then 
            Do
                IntraDocJumpTarget=SubStr(URLText,J+1,N-J)
/*                rc=VRSet("AnchorEntry","Value",IntraDocJumpTarget) */
                URLText=""
            End
        Else
            URLText=""
    End
Else
   URLText=""

rc=VRMethod("AnchorTextEntry","SetFocus")
return

/*:VRX         Anchors_Fini
*/
Anchors_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         Anchors_Init
*/
Anchors_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         AskToTrashChanges
*/
AskToTrashChanges: 
Button.0=2
Button.1="Yes"
Button.2="No"
Msg="Do you really want to throw away changes to this file?"
rc=VRMessage("MainWindow",Msg,"Throw Away Changes?","Q","button.",1,2)
If rc=1 then
   OKToTrash=1
Else
   OKToTrash=0
return

/*:VRX         Background_Close
*/
Background_Close: 
    call Background_Fini
return

/*:VRX         Background_Create
*/
Background_Create: 
    call Background_Init
return

/*:VRX         Background_Fini
*/
Background_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         Background_Init
*/
Background_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
BGColor="(255,255,255)"
TextColor="(0,0,0)"
LinkColor="(0,0,255)"
VLinkColor="(255,0,0)"
ALinkColor="(0,255,0)"
ValueSetColor.0=18
/* Default colors for value set items */
tmp="(0,0,0);(255,255,255);(255,0,0);(0,255,0);(0,0,255);(255,255,0);(0,255,255);(255,0,255);(192,192,192);(170,170,170);(128,128,128);(64,64,64);(255,128,0);(0,128,0);(0,0,128);(192,192,0);(0,128,128);(128,0,128)"
Do i=1 to 18
    Parse Var tmp ValueSetColor.i ";" tmp
    rc=VRGetIni("BackgroundWindow","Color"||i,IniFile,"NoClose")
    If Pos("(",rc)<>0 then
        ValueSetColor.i=rc
End
rc=VRMethod("VS_1","SetAttributes","Values","ValueSetColor.")

return

/*:VRX         BackgroundCancelButton_Click
*/
BackgroundCancelButton_Click: 
Call Background_Fini
return

/*:VRX         BackgroundImageEntry_DragDrop
*/
BackgroundImageEntry_DragDrop: 
rc=VRInfo("SourceFile.")
If Translate(SourceFile.!Operation)<>"COPY" then do
/* Use just the file name */
   rc=VRSet("BackgroundImageEntry","Value",SourceFile.!SourceName)
   End
Else Do
/* Use the entire path */
   rc=VRSet("BackgroundImageEntry","Value",SourceFile.!SourceFile)
End

return

/*:VRX         BackGroundInsertTagButton_Click
*/
BackGroundInsertTagButton_Click: 
Parse Var BGColor "(" BGR "," BGG "," BGB ")"
Parse Var TextColor "(" TextR "," TextG "," TextB ")"
Parse Var LinkColor "(" LinkR "," LinkG "," LinkB ")"
Parse Var VLinkColor "(" VLinkR "," VLinkG "," VLinkB ")"
Parse Var ALinkColor "(" ALinkR "," ALinkG "," ALinkB ")"
BGR=D2X(BGR,2)
BGG=D2X(BGG,2)
BGB=D2X(BGB,2)
TextR=D2X(TextR,2)
TextG=D2X(TextG,2)
TextB=D2X(TextB,2)
LinkR=D2X(LinkR,2)
LinkG=D2X(LinkG,2)
LinkB=D2X(LinkB,2)
VLinkR=D2X(VLinkR,2)
VLinkG=D2X(VLinkG,2)
VLinkB=D2X(VLinkB,2)
ALinkR=D2X(ALinkR,2)
ALinkG=D2X(ALinkG,2)
ALinkB=D2X(ALinkB,2)
BGColor=' bgcolor="#'||BGR||BGG||BGB||'"'
TextColor=' text="#'||TextR||TextG||TextB||'"'
LinkColor=' link="#'||LinkR||LinkG||LinkB||'"'
VLinkColor=' vlink="#'||VLinkR||VLinkG||VLinkB||'"'
ALinkColor=' alink="#'||ALinkR||ALinkG||ALinkB||'"'
BGImage=VRGet("BackgroundImageEntry","Value")
If BGImage<>"" then Do
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
       BGImage=' BACKGROUND="'||BGImage||'"'
    Else
       BGImage=' background="'||BGImage||'"'
End
If VRGet("Options_Menu_Uppercase","Checked")=1 then
    Tag='<BODY'||BGimage||Translate(TextColor||BGColor||LinkColor||VLinkColor||ALinkColor)||'>'
Else
    Tag='<body'||BGimage||TextColor||BGColor||LinkColor||VLinkColor||ALinkColor||'>'
obj="MLE_1"
Call Insert_Tag obj, tag, 0,1
Call Background_Fini
return

/*:VRX         BGColorButton_Click
*/
BGColorButton_Click: 
Parse Var BGColor "(" BGR "," BGG "," BGB ")"
rc=VRSet("RedSpin","Value",BGR)
rc=VRSet("GreenSpin","Value",BGG)
rc=VRSet("BlueSpin","Value",BGB)
return

/*:VRX         BGSpinUpdate
*/
BGSpinUpdate: 
R=VRGet("RedSpin","Value")
G=VRGet("GreenSpin","Value")
B=VRGet("BlueSpin","Value")
tmp="("||R||","||G||","||B||")"
Select
    When VRGet("BGColorButton","Set")=1 then Do
        rc=VRSet("TextDisplay","BackColor",tmp)
        rc=VRSet("LinkDisplay","BackColor",tmp)
        rc=VRSet("VisitedLinkDisplay","BackColor",tmp)
        rc=VRSet("ActiveLinkDisplay","BackColor",tmp)
        BGColor=tmp
    End
    When VRGet("TextColorButton","Set")=1 then Do
        rc=VRSet("TextDisplay","ForeColor",tmp)
        TextColor=tmp
    End
    When VRGet("LinkColorButton","Set")=1 then Do
        rc=VRSet("LinkDisplay","ForeColor",tmp)
        LinkColor=tmp
    End
    When VRGet("VLinkColorButton","Set")=1 then Do
        rc=VRSet("VisitedLinkDisplay","ForeColor",tmp)
        VLinkColor=tmp
    End
    When VRGet("ALinkColorButton","Set")=1 then Do
        rc=VRSet("ActiveLinkDisplay","ForeColor",tmp)
        ALinkColor=tmp
    End
    Otherwise
        NOP
End /* Select */

return

/*:VRX         BlueSpin_Change
*/
BlueSpin_Change: 
Call BGSpinUpdate
return

/*:VRX         CleanTemp
*/
CleanTemp: 
    /* Delete any temporary files */
rc=VRMethod("Application","StartThread","DelTemp",ProgramPath)
rc=VRMethod("Application","StartThread","DelTemp",PPath)
return

/*:VRX         Edit_Menu_Copy_Click
*/
Edit_Menu_Copy_Click:
rc=VRMethod("MLE_1","Copy")
return

/*:VRX         Edit_Menu_Cut_Click
*/
Edit_Menu_Cut_Click:
rc=VRMethod("MLE_1","Cut")
FileIsDirty=1
return

/*:VRX         Edit_Menu_Find_Click
*/
Edit_Menu_Find_Click: 
Call VRSet "SearchWin","Visible",1
rc=VRMethod("TargetEntry","SetFocus")
return

/*:VRX         Edit_Menu_Paste_Click
*/
Edit_Menu_Paste_Click:
rc=VRMethod("MLE_1","Paste")
FileIsDirty=1
return

/*:VRX         Edit_Menu_ReplaceBackSlash_Click
*/
Edit_Menu_ReplaceBackSlash_Click: 
FileText=VRGet("MLE_1","Value")
FileText=Translate(FileText,"/","\")
rc=VRSet("MLE_1","Value",FileText)
FileIsDirty=1
Drop FileText
return

/*:VRX         Edit_Menu_Undo_Click
*/
Edit_Menu_Undo_Click:
rc=VRMethod("MLE_1","Undo")
rc=VRMethod(obj,"Insert",OldSelection)
OldSelection=""
return

/*:VRX         ExternalImageButton_Click
*/
ExternalImageButton_Click: 
Call VRSet "DT_1","Caption","Text for link:"
Call VRSet "InternalAlignTopButton","Enabled",0
Call VRSet "InternalAlignCenterButton","Enabled",0
Call VRSet "InternalAlignBottomButton","Enabled",0
Call VRSet "ImageAnchorEntry","Enabled",1
Call VRSet "DT_6","Enabled",1
return

/*:VRX         File_Menu_Close_Click
*/
File_Menu_Close_Click:
Button.0=3
Button.1="Yes"
Button.2="No"
Button.3="Cancel"
If FileIsDirty=1 & RingReadOnly.CurrentRingFile=0 then Do
     If FileName<>"" then Do
         Msg="Save changes made to" FileName||"?"
         rc=VRMessage("MainWindow",Msg,"Save changes?","Q","button.",1,3)
         If rc=1 then Call File_Menu_Save_Click
         If rc=3 then Return
         End
     Else
         Call File_Menu_SaveAs_Click
     If rc=3 then Return
End
Call RemoveFromRing
return

/*:VRX         File_Menu_CloseAll_Click
*/
File_Menu_CloseAll_Click: 
Call RingCheckIfDirty
return

/*:VRX         File_Menu_CloseMenu_Click
*/
File_Menu_CloseMenu_Click: 
return

/*:VRX         File_Menu_DeleteTemp_Click
*/
File_Menu_DeleteTemp_Click: 
/* Delete any temporary files */
rc=VRDeleteFile(ProgramPath||"\wiz*.htm")
rc=VRDeleteFile(PPath||"\wiz*.htm")

return

/*:VRX         File_Menu_Exit_Click
*/
File_Menu_Exit_Click: 
Call Quit
return

/*:VRX         File_Menu_InsertFile_Click
*/
File_Menu_InsertFile_Click:
CR_LF="0d0a"x
/* Get a filename from the user */
FileName2=VRFileDialog("MainWindow","Select a File","O")
Call InsertFile
return

/*:VRX         File_Menu_New_Click
*/
File_Menu_New_Click: 
If CurrentRingCount<10 then Do
    Call SaveToRing
    CurrentRingCount=CurrentRingCount+1
    CurrentRingFile=CurrentRingCount
    RingText.CurrentRingFile=BaseText
    RingName.CurrentRingFile=""
    RingDirty.CurrentRingFile=-1
    RingPresentPath.CurrentRingFile=WorkingPath
    rc=VRSet("Ring_Menu_"||CurrentRingCount,"Caption","<untitled>")
    rc=VRSet("Ring_Menu_"||CurrentRingFile,"Visible",1)
    Call RingDisplay
    End
Else Do
    Button.0=1
    Button.1="OK"
    msg="Only 10 files may be open at one time."
    rc=VRMessage("MainWindow",Msg,"File Limit Reached","Q","button.",1,1)
    Return
    End    
return

/*:VRX         File_Menu_Open_Click
*/
File_Menu_Open_Click:
CR_LF="0d0a"x
If CurrentRingCount=10 then Do
    Button.0=1
    Button.1="OK"
    msg="Only 10 files may be open at one time."
    rc=VRMessage("MainWindow",Msg,"File Limit Reached","Q","button.",1,1)
    End
Else Do
/* Get a filename from the user */
    OldName=FileName
    Call SaveToRing
    FileName=VRFileDialog("MainWindow","Select an HTML File","O",PresentPath)
    /* Read in the file */
    If FileName="" then 
       FileName=OldName
    Else Do
       Call CleanTemp
       Call ReadFile
    End
    Call UpdateRecall
End
return

/*:VRX         File_Menu_Preview_Click
*/
File_Menu_Preview_Click:
FileText=VRGet("MLE_1","Value")
TempFile="htmlwiz.tmp"
TempFileFull=ProgramPath||"\"||TempFile
File3=SysTempFileName(ProgramPath||"\wiz???.htm")
If VRFileExists(TempFileFull) then
   rc=VRDeleteFile(TempFileFull)
rc=LINEOUT(TempFileFull,FileText)
rc=Stream(TempFileFull,"C","Close")
    /* Translate foreign characters if translation mode is active */
    if TransChar then do 
        tmp='"'||ProgramPath||"\txt2html"||'"' '"'||TempFileFull||'"' '"'||File3||'"' '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRDeleteFile(ProgramPath||"\"||TempFile)
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
            return
        end
    End
    Else Do /* Translation mode not active, so rename htmlwiz.tmp to a temp file */
        rc=VRRenameFile(ProgramPath||"\"||Tempfile,File3)
    End
/* Move the temp. file to the working directory so links and images will work. */
If FileName="" | FileName="FILENAME" then 
   FileName=ProgramPath
PPath=VRParseFilePath(FileName,"DP")
File4=PPath||"\"||VRParseFilePath(File3,"NE")
rc=VRCopyFile(File3,File4)
rc=SysFileDelete(ProgramPath||"\wiztmp.htm")
If File3<>File4 then
    rc=SysFileDelete(File3)
rc=SELECT_WINDOW("*IBM Web*",5) /* Returns 4 if window not found */
If rc<>0 then do
    /* Web Explorer is not running, so start it */
    rc=START_PROGRAM("explore.exe","-t 8 -Q" File4,PPath)
    if rc<>0 then
        rc=VRMessage("Application","Web Explorer could not be started. Make sure that it is somewhere in your PATH.","Web Explorer Error")
End
Else Do
    /* Web Explorer is running, so just reload */
    rc=SELECT_WINDOW("*IBM Web*",100) /* Returns 4 if window not found */
    rc=KEYBOARD("o","C")
    rc=WAIT("125")
    rc=SELECT_WINDOW("* File",100) /* Returns 4 if window not found */
    len=Length(File4)
    Do i=1 to len by 30
        keys=Strip(SubStr(File4,i,30))
        rc=KEYBOARD(keys)
    End
    rc=WAIT("250")
    rc=PUSHBUTTON_CLICK("OK")
    End
return

/*:VRX         File_Menu_Save_Click
*/
File_Menu_Save_Click:
If FileName="" | FileName="FILENAME"|FileName="<untitled>" then do
    Call File_Menu_SaveAs_Click
    end
else do
  If VRIsDir(FileName)=1 then do
    Call File_Menu_SaveAs_Click
    End
  Else Do
    If VRFileExists(FileName) then do
        rc=VRDeleteFile(FileName)
        end
    FileText=VRGet("MLE_1","Value")
    rc=LINEOUT(FileName,FileText)
    If rc<>0 then do
        rc=VRMessage("Application","An error occurred while trying to save the file. (Perhaps you do not have write access to the disk?) The file was not saved.","File Save Error")
        Return
    End
    rc=Lineout(FileName)
    if TransChar then do
        If VRFileExists("htmlwiz.tmp") then 
            rc=VRDeleteFile("htmlwiz.tmp")
        tmp='"'||ProgramPath||"\txt2html"||'"' '"'||FileName||'"' "htmlwiz.tmp" '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRCopyFile("htmlwiz.tmp",FileName)
            rc=VRDeleteFile("htmlwiz.tmp")
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
            Return 
       end
    End
  End
end
Call UpdateRecall
FileIsDirty=0
return

/*:VRX         File_Menu_SaveAs_Click
*/
File_Menu_SaveAs_Click:
/* Get the filename from the user */
OldName=FileName
OldDirty=FileIsDirty
FileName=VRFileDialog("MainWindow","Save HTML File As","S",PresentPath)
If FileName <> "" then do
    If VRFileExists(FileName) then do
        Button.0=2
        Button.1="Yes"
        Button.2="No"
        Msg="This file already exists. Do you wish to overwrite it?"
        rc=VRMessage("MainWindow",Msg,"Overwrite File?","Q","button.",1,2)
        If rc<>1 then do
            FileIsDirty=1
            FileName=OldName
            return
        End
        rc=VRDeleteFile(FileName)
    End
    FileText=VRGet("MLE_1","Value")
    rc=LINEOUT(FileName,FileText)
    If rc<>0 then do
        rc=VRMessage("Application","An error occurred while trying to save the file. (Perhaps you do not have write access to the disk?) The file was not saved.","File Save Error")
        Return
    End
    rc=Lineout(FileName)
    if TransChar then do
        If VRFileExists("htmlwiz.tmp") then 
            rc=VRDeleteFile("htmlwiz.tmp")
        tmp='"'||ProgramPath||"\txt2html"||'"' '"'||FileName||'"' "htmlwiz.tmp" '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRCopyFile("htmlwiz.tmp",FileName)
            rc=VRDeleteFile("htmlwiz.tmp")
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
        end
    End
    Call VRSet "MainWindow","Caption",ProgramName||" - "||FileName
    rc=VRSet("Ring_Menu_"||CurrentRingCount,"Caption",FileName)
    PresentPath=VRParseFilePath(FileName,"DP")||"\*.htm*"
    Call SaveToRing
    FileIsDirty=0
    Call UpdateRecall
end    
Else Do
    FileIsDirty=OldDirty
    FileName=OldName
End
return

/*:VRX         File_Menu_SaveNoTags_Click
*/
File_Menu_SaveNoTags_Click: 
FName=VRFileDialog("MainWindow","Save File As","S",PresentPath)
If FName <> "" then do
    If VRFileExists(FName) then
        rc=VRDeleteFile(FName)
    If VRFileExists("htmlwiz.tmp") then
        rc=VRDeleteFile("htmlwiz.tmp")
    HTMLText=VRGet("MLE_1","Value")
    rc=Lineout("htmlwiz.tmp",HTMLText)
    rc=Lineout("htmlwiz.tmp")
    Drop HTMLText
    tmp='"'||ProgramPath||'\tstrip"' "htmlwiz.tmp" '"'||FName||'"'
    address cmd '"@'||tmp||'"'
End
Call VRSet "MainWindow","StatusText",""

return

/*:VRX         File_Menu_Weblint_Click
*/
File_Menu_Weblint_Click:
FileText=VRGet("MLE_1","Value")
TempFile="htmlwiz.tmp"
If VRFileExists(ProgramPath||"\"||TempFile) then
   rc=VRDeleteFile(ProgramPath||"\"||TempFile)
If VRFileExists(ProgramPath||"\wiztmp.htm") then
   rc=VRDeleteFile(ProgramPath||"\wiztmp.htm")
If VRFileExists(ProgramPath||"\linttemp.txt") then
   rc=VRDeleteFile(ProgramPath||"\linttemp.txt")
rc=LINEOUT(ProgramPath||"\"||TempFile,FileText)
rc=Lineout(ProgramPath||"\"||TempFile) 
    /* Translate foreign characters if translation mode is active */
    if TransChar then do 
        If VRFileExists(ProgramPath||"\wiztmp.htm") then 
            rc=VRDeleteFile(ProgramPath||"\wiztmp.htm")
        tmp='"'||ProgramPath||"\txt2html"||'"' TempFile "wiztmp.htm" '"'||ProgramPath||"\trans.def"'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRDeleteFile(ProgramPath||"\"||TempFile)
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
        end
    End
    Else Do /* Translation mode not active, so rename htmlwiz.tmp to wiztmp.htm */
        rc=VRRenameFile(ProgramPath||"\"||Tempfile,ProgramPath||"\wiztmp.htm")
    End
rc=VRRenameFile(ProgramPath||"\"||"\wiztmp.htm",ProgramPath||"\linttemp.txt")
rc=VRMethod("Application","StartThread","Weblint",ProgramPath FileName)
return

/*:VRX         File_Menu_WeblintLocal_Click
*/
File_Menu_WeblintLocal_Click: 
FileText=VRGet("MLE_1","Value")
TempFile="htmlwiz.tmp"
File3=SysTempFileName(ProgramPath||"\wiz???.htm")
If VRFileExists(ProgramPath||"\"||TempFile) then
   rc=VRDeleteFile(ProgramPath||"\"||TempFile)
rc=LINEOUT(ProgramPath||"\"||TempFile,FileText)
rc=Lineout(ProgramPath||"\"||TempFile) 
    /* Translate foreign characters if translation mode is active */
    if TransChar then do 
        tmp='"'||ProgramPath||"\txt2html"||'"' TempFile '"'||File3||'"' '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRDeleteFile(ProgramPath||"\"||TempFile)
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
            Return
        end
    End
    Else Do /* Translation mode not active, so rename htmlwiz.tmp to a temp file */
        rc=VRRenameFile(ProgramPath||"\"||Tempfile,File3)
    End
/* Execute WebLint on main thread */
/*
rc=VRSet("MainWindow","StatusText","Checking document with WebLint...")
tmp=ProgramPath||'\weblint -x netscape' File3 "| RXQUEUE"
address cmd '"@'||tmp||'"'
wi=0
rc=VRSet("MainWindow","StatusText","Parsing WebLint results...")
Do While Queued()<>0
   Parse Pull a 
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
rc=VRSet("MainWindow","StatusText","")
Call VRLoadSecondary "WLResponse"
*/
/* Run Weblint on a separate thread */
rc=VRMethod("Application","StartThread","WeblintL",ProgramPath File3)

return

/*:VRX         FileMenuRecall1_Click
*/
FileMenuRecall1_Click: 
OKToTrash=1
/* non-ring code
If FileIsDirty=1 then
   Call File_Menu_SaveAs_Click
If FileIsDirty=1 then 
   Call AskToTrashChanges
*/
Call SaveToRing
If OKToTrash=1 then Do
    FileName=Recall.1
    Call ReadFile
End

return

/*:VRX         FileMenuRecall2_Click
*/
FileMenuRecall2_Click: 
OKToTrash=1
/* non-ring code
If FileIsDirty=1 then
   Call File_Menu_SaveAs_Click
If FileIsDirty=1 then 
   Call AskToTrashChanges
*/
Call SaveToRing
If OKToTrash=1 then Do
    Call ShiftRecall 2
    Call ReadFile
End
return

/*:VRX         FileMenuRecall3_Click
*/
FileMenuRecall3_Click: 
OKToTrash=1
/* non-ring code
If FileIsDirty=1 then
   Call File_Menu_SaveAs_Click
If FileIsDirty=1 then 
   Call AskToTrashChanges
*/
Call SaveToRing
If OKToTrash=1 then Do
    Call ShiftRecall 3
    Call ReadFile
End
return

/*:VRX         FileMenuRecall4_Click
*/
FileMenuRecall4_Click: 
OKToTrash=1
/* non-ring code
If FileIsDirty=1 then
   Call File_Menu_SaveAs_Click
If FileIsDirty=1 then 
   Call AskToTrashChanges
*/
Call SaveToRing
If OKToTrash=1 then Do
    Call ShiftRecall 4
    Call ReadFile
End
return

/*:VRX         FileMenuRecall5_Click
*/
FileMenuRecall5_Click: 
OKToTrash=1
/* non-ring code
If FileIsDirty=1 then
   Call File_Menu_SaveAs_Click
If FileIsDirty=1 then 
   Call AskToTrashChanges
*/
Call SaveToRing
If OKToTrash=1 then Do
    Call ShiftRecall 5
    Call ReadFile
End
return

/*:VRX         FindButton_Click
*/
FindButton_Click: 
FindText=VRGet("TargetEntry","Value")
If FindText="" then return
If VRGet("CaseCheck","Set")=1 then
    Case="Case"
Else
    Case=""
rc=VRMethod("MLE_1","Search",FindText,,Case)
if rc=-1 then do
    Button.0=1
    Button.1="OK"
    rc=VRMessage("MainWIndow","Target text was not found.","Find",,"Button.")
    Drop Button.
    End
return

/*:VRX         FindCancelButton_Click
*/
FindCancelButton_Click: 
Call VRSet "SearchWin","Visible",0
return

/*:VRX         Fini
*/
Fini:
    window = VRWindow()
    call VRSet window, "Visible", 0
    drop window
return 0

/*:VRX         Form_Cancel_Button_Click
*/
Form_Cancel_Button_Click: 
Call Forms_Fini
return

/*:VRX         Form_InsertTag_Button_Click
*/
Form_InsertTag_Button_Click: 
PasteText=""
If VRGet("FORM_Select","Set")=1 then do
    If VRGet("FORM_MethodGet","Set")=1 then
        type="get"
    Else
        type="post"
    Tag='<form action="'||VRGet("FORM_ACTION_Entry","Value")||'" method='||type||'>'
    Call Insert_Tag "MLE_1",Tag,0
    Call Insert_Tag "MLE_1",crlf||crlf||'</form>',9
End 
If VRGet("TEXTAREA_Select","Set")=1 then do        
    Tag='<textarea name="'||VRGet("TEXTAREA_NAME_Entry","Value")||'"',
    ||' ROWS='||VRGet("TEXTAREA_ROWS_Entry","Value"),
    ||' COLS='||VRGet("TEXTAREA_COLS_Entry","Value",1),
    ||'>'||crlf||'</textarea>'
    Call Insert_Tag "MLE_1",Tag,13
End
If VRGet("INPUT_Select","Set")=1 then do
    Tag='<input'
    tmp=VRGet("INPUT_NAME_Entry","Value")
    If tmp<>"" then do
        Tag=Tag||' name="'||tmp||'"'
        Call Insert_Tag "MLE_1",Tag,0
    End
/* Find the correct TYPE */
    Select
        When VRGet("INPUT_TYPE_TEXT_Select","Set")=1 then do
            Tag=' type=text'
            Call Insert_Tag "MLE_1",Tag,0
            tmp=VRGet("INPUT_MAX_ENTRY","Value")
            If tmp<>"" then do
                Tag=' max='||tmp
                Call Insert_Tag "MLE_1",Tag,0
            End
        End
        When VRGet("INPUT_TYPE_RADIO_Select","Set")=1 then do
            Tag=' type=radio'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_CHECKBOX_Select","Set")=1 then do
            Tag=' type=checkbox'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_DATE_Select","Set")=1 then do
            Tag=' type=date'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_INT_Select","Set")=1 then do
            Tag=' type=int'
            Call Insert_Tag "MLE_1",Tag,0
            tmp=VRGet("INPUT_MAX_ENTRY","Value")
            If tmp<>"" then do
                Tag=' max='||tmp
                Call Insert_Tag "MLE_1",Tag,0
            End
        End
        When VRGet("INPUT_TYPE_FLOAT_Select","Set")=1 then do
            Tag=' type=float'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_URL_Select","Set")=1 then do
            Tag=' type=url'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_SUBMIT_Select","Set")=1 then do
            Tag=' type=submit'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_RESET_Select","Set")=1 then do
            Tag=' type=reset'
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_RANGE_Select","Set")=1 then do
            Tag=' type=range'
            Call Insert_Tag "MLE_1",Tag,0
            Tag=' min='||VRGet("INPUT_TYPE_RANGE_MIN_Entry","Value")
            Call Insert_Tag "MLE_1",Tag,0
            Tag=' max='||VRGet("INPUT_TYPE_RANGE_MAX_Entry","Value")
            Call Insert_Tag "MLE_1",Tag,0
        End
        When VRGet("INPUT_TYPE_IMAGEMAP_Select","Set")=1 then do
            Tag=' type=imagemap'
            Call Insert_Tag "MLE_1",Tag,0
            tmp=VRGet("INPUT_TYPE_IMAGEMAP_SRC_Entry","Value")
            If tmp<>"" then do
                Tag=' src="'||tmp||'"'
                Call Insert_Tag "MLE_1",Tag,0
            End
            If VRGet("INPUT_TYPE_IMAGEMAP_ALIGNTOP_Select","Set")=1 then 
                Tag=' align=top'
            If VRGet("INPUT_TYPE_IMAGEMAP_ALIGNMIDDLE_Select","Set")=1 then 
                Tag=' align=middle'
            If VRGet("INPUT_TYPE_IMAGEMAP_ALIGNBOTTOM_Select","Set")=1 then 
                Tag=' align=bottom'
            Call Insert_Tag "MLE_1",Tag,0
        End
        Otherwise
            Say "Error in FORM window"
    End
    tmp=VRGet("INPUT_SIZE_Entry","Value")
    If tmp<>"" then do
        Tag=' size='||tmp
        Call Insert_Tag "MLE_1",Tag,0
    End
    tmp=VRGet("INPUT_VALUE_Entry","Value")
    If tmp<>"" then do
        Tag=' value='||tmp
        Call Insert_Tag "MLE_1",Tag,0
    End
/* Close the tag */
    Tag='>'||crlf
    Call Insert_Tag "MLE_1",Tag,0
End
return

/*:VRX         FORM_Select_Click
*/
FORM_Select_Click: 
/* Disable other items */
Call VRSet "INPUT_NAME_Entry","Enabled",0
Call VRSet "INPUT_VALUE_Entry","Enabled",0
Call VRSet "INPUT_SIZE_Entry","Enabled",0
Call VRSet "INPUT_MAX_Entry","Enabled",0
Call VRSet "GB_2","Enabled",0
Call VRSet "TEXTAREA_NAME_Entry","Enabled",0
Call VRSet "TEXTAREA_ROWS_Entry","Enabled",0
Call VRSet "TEXTAREA_COLS_Entry","Enabled",0
/* Enable FORM field */
Call VRSet "FORM_ACTION_Entry","Enabled",1
return

/*:VRX         Forms_Close
*/
Forms_Close: 
    call Forms_Fini
return

/*:VRX         Forms_Create
*/
Forms_Create: 
    call Forms_Init
return

/*:VRX         Forms_Fini
*/
Forms_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         Forms_Init
*/
Forms_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         GetIni
*/
GetIni: 
MLEFont=VRGetIni("MainWindow","MLEFont",IniFile,"NoClose")
If MLEFont<>"" & MLEFont<>"MLEFONT" then 
   rc=VRSet("MLE_1","Font",MLEFont)

MLEBackColor=VRGetIni("MainWindow","MLEBackColor",IniFile,"NoClose")
If MLEBackColor<>"" & MLEFont<>"MLEBACKCOLOR" then 
   rc=VRSet("MLE_1","BackColor",MLEBackColor)

MLEForeColor=VRGetIni("MainWindow","MLEForeColor",IniFile,"NoClose")
If MLEForeColor<>"" & MLEForeColor<>"MLEFORECOLOR" then 
   rc=VRSet("MLE_1","ForeColor",MLEForeColor)

TransChar=VRGetIni("MainWindow","TransChar",IniFile,"NoClose")
If TransChar="" | TransChar="TRANSCHAR" then 
    TransChar=0
Call VRSet "Options_Menu_Translate","Checked",TransChar
TagBarOrient=VRGetIni("Tagbar","TagBarOrientation",IniFile,"NoClose")
HideTagbar=VRGetIni("ToolBar","HideTagbar",IniFile,"NoClose")
If TagBarOrient="" | TagBarOrient="HIDETAGBAR" then 
    TagbarOrient=1
If HideTagbar="" | HideTagbar="HIDETAGBAR" then do
    HideTagbar=0
    NoIni=1
    End
AutoInsertPara=VRGetIni("MainWindow","AutoInsertPara",IniFile,"NoClose")
If AutoInsertPara="" | AutoInsertPara="AUTOINSERTPARA" then 
    AutoInsertPara=1
Else
    Call VRSet "Options_Menu_AutoInsertPara","Checked",AutoInsertPara
WW=VRGetIni("MainWindow","WordWrap",IniFile,"NoClose")
If WW="" | WW="WW" then 
    Call VRSet "Options_Menu_WordWrap","Checked",0
Else Do
    Call VRSet "Options_Menu_WordWrap","Checked",WW
    Call VRSet "MLE_1","WordWrap",WW
    End
InsertLI=VRGetIni("MainWindow","InsertLI",IniFile,"NoClose")
If InsertLI="" | InsertLI="INSERTLI" then
    InsertLI=1
Else
    Call VRSet "Options_Menu_Lists","Checked",InsertLI
UC=VRGetIni("MainWindow","UpperCase",IniFile,"NoClose")
If UC="" | UC="UC" then 
    Call VRSet "Options_Menu_Uppercase","Checked",1
Else
    Call VRSet "Options_Menu_Uppercase","Checked",UC
Do i=1 to 5
    Recall.i=VRGetIni("MainWindow","Recall"||i,IniFile,"NoClose")
    If Recall.i="RECALL"||i then Recall.i=""
    If Recall.i<>"" then do
       rc=VRSet("MItem_18","Visible",1)
       rc=VRSet("FileMenuRecall"||i,"Caption",Recall.i)
       rc=VRSet("FileMenuRecall"||i,"Visible",1)        
    End
End
Call UpdateRecall

return

/*:VRX         GreenSpin_Change
*/
GreenSpin_Change: 
Call BGSpinUpdate
return

/*:VRX         Halt
*/
Halt:
    signal _VREHalt
return

/*:VRX         Help_Menu_About_Click
*/
Help_Menu_About_Click:
rc=VRLoadSecondary("AboutWindow")
rc=VRMethod("AboutWindow","CenterWindow")
Call VRSet "AboutWindow","Visible",1
rc=VRMethod("AboutWindow","Activate")
return

/*:VRX         Help_Menu_View_Click
*/
Help_Menu_View_Click:
'start view "'||ProgramPath||'\htmlwiz.inf"'
return

/*:VRX         ImageAnchorEntry_DragDrop
*/
ImageAnchorEntry_DragDrop: 
rc=VRInfo("SourceFile.")
ImageName=SourceFile.!SourceFile
If Translate(SourceFile.!Operation)<>"COPY" then do
/* Use just the file name */
   rc=VRSet("ImageAnchorEntry","Value",SourceFile.!SourceName)
   End
Else Do
/* Use the entire path */
   rc=VRSet("ImageAnchorEntry","Value",SourceFile.!SourceFile)
End
Call ImageAnchorEntry_Verify
Drop SourceFile.

return

/*:VRX         ImageAnchorEntry_Verify
*/
ImageAnchorEntry_Verify: 
rc=VRGet("ImageAnchorEntry","Value")
Call ImageGetSize
Call VRSet "GIF_Width_Entry","Value",ImageWidth
Call VRSet "GIF_Height_Entry","Value",ImageHeight

return

/*:VRX         ImageCancelButton_Click
*/
ImageCancelButton_Click: 
If Selected<>0 then rc=VRMethod("MLE_1","Insert",Txt)
Call Images_Fini
return

/*:VRX         ImageGetSize
*/
ImageGetSize: 
ImageHeight=""
ImageWidth=""
    If FileName<>"" & FileName<>"FILENAME" then 
        F=VRParseFilePath(FileName,"DP")||"\"||rc
    Else
        F=rc
    If ImageName<>"" & ImageName<>"IMAGENAME" then
       F=ImageName
    im=VRFileExists(F)
    if im=1 then do
/* Found the image file, now see if it is GIF or JPEG */
        GIFType=Charin(F,1,6)
        rc=Stream(F,"C","Close")
        JPEGType=c2x(Charin(F,1,2))
        rc=Stream(F,"C","Close")
        FName=F
        Select
           when Pos("GIF",GIFType)<>0 then do 
                ImageType=GIF
                GIFType=Charin(F,,6)
                ByteL=Charin(F,,1)
                ByteH=Charin(F,,1)
                ImageWidth=c2d(ByteH||ByteL)
                ByteL=Charin(F,,1)
                ByteH=Charin(F,,1)
                ImageHeight=c2d(ByteH||ByteL)
                rc=Stream(F,"C","Close")
           end  /* Do */
           when JPEGType="FFD8" then do
              ImageType="JPEG"
              Hdr=C2X(CharIn(FName, 1, 2))
              NxtSeg=3
              ImageHeight="IMAGEHEIGHT"
                 Do While (Seg.Type<>"D9") & (NxtSeg<>-1) & (Imageheight="IMAGEHEIGHT")
                    NxtSeg=LitSegment(NxtSeg)
                 End
                 rc=Stream(F,"C","Close")
           end  /* Do */
           otherwise
              ImageType="<none>"
              ImageHeight=""
              ImageWidth=""
        end  /* select */
    End

return

/*:VRX         ImageNameEntry_DragDrop
*/
ImageNameEntry_DragDrop: 
If VRGet("ExternalImageButton","Set")=1 then Return
rc=VRInfo("SourceFile.")
ImageName=SourceFile.!SourceFile
If Translate(SourceFile.!Operation)<>"COPY" then do
/* Use just the file name */
   rc=VRSet("ImageNameEntry","Value",SourceFile.!SourceName)
   End
Else Do
/* Use the entire path */
   rc=VRSet("ImageNameEntry","Value",SourceFile.!SourceFile)
End
Call ImageNameEntry_Verify
Drop SourceFile.
return

/*:VRX         ImageNameEntry_Verify
*/
ImageNameEntry_Verify: 
rc=VRGet("ImageNameEntry","Value")
Call ImageGetSize
If im=1 then Do
   Call VRSet "GIF_Width_Entry","Value",ImageWidth
   Call VRSet "GIF_Height_Entry","Value",ImageHeight
End
return

/*:VRX         ImageOKButton_Click
*/
ImageOKButton_Click: 
obj="MLE_1"
If VRGet("InlineImageButton","Set")=1 then do
/* We have an inline image */
    NameText=VRGet("ImageNameEntry","Value")
    If VRGet("InternalAlignTopButton","Set")=1 then AlignTag=" align=top "
    If VRGet("InternalAlignCenterButton","Set")=1 then AlignTag=" align=middle "
    If VRGet("InternalAlignBottomButton","Set")=1 then AlignTag=" align=bottom "
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        AltText=' ALT="'||VRGet("Image_ALT_Entry","Value")||'"'
    Else
        AltText=' alt="'||VRGet("Image_ALT_Entry","Value")||'"'
    If AltText=' alt=""' | AltText=' ALT=""' then
       AltText=""
    WidthText=' width='||VRGet("GIF_Width_Entry","Value")
    if WidthText=' width=' then
       WidthText=""
    HeightText=' height='||VRGet("GIF_Height_Entry","Value")
    if HeightText=' height=' then
       HeightText=""
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag='<IMG SRC="'
    Else
        tag='<img src="'
    tag=tag||NameText
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag=tag||Translate('"'||AlignTag||WidthText||HeightText)||AltText||'>'
    Else
        Tag=tag||'"'||AlignTag||WidthText||HeightText||AltText||'>'
    tag=Space(tag)
    Call Insert_Tag obj, tag,0,1
    Call Images_Fini
    End
Else Do
/* We have an external image */
    AnchorText=VRGet("ImageAnchorEntry","Value")
    NameText=VRGet("ImageNameEntry","Value")
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag='<A HREF="'
    Else
        tag='<a href="'
    tag=tag||AnchorText
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag=tag||'">'||NameText||'</A>'
    Else
        Tag=tag||'">'||NameText||'</a>'
    tag=Space(tag)
    Call Insert_Tag obj, tag, 0,1
    Call Images_Fini
End

return

/*:VRX         Images_Close
*/
Images_Close: 
    call Images_Fini
return

/*:VRX         Images_Create
*/
Images_Create: 
    call Images_Init
SelStart=VRGet("MLE_1","SelectedStart")
SelEnd=VRGet("MLE_1","SelectedEnd")
If ImageName="IMAGENAME" then ImageName=""
if SelStart=SelEnd then Do
    Selected=0
    Txt=ImageName
    End
Else Do
    Selected=1
    Txt=VRGet("MLE_1","SelectedText")
    rc=VRMethod("MLE_1","Clear")
End
Call VRSet "ImageNameEntry","Value",Txt
Call ImageGetSize
Call VRSet "GIF_Width_Entry","Value",ImageWidth
Call VRSet "GIF_Height_Entry","Value",ImageHeight
rc=VRMethod("ImageNameEntry","SetFocus")
return

/*:VRX         Images_Fini
*/
Images_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
    drop ImageName
return
/*:VRX         Images_Init
*/
Images_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         Init
*/
Init:
    window = VRWindow()
    call VRMethod window, "CenterWindow"
    call VRSet window, "Visible", 0
    call VRMethod window, "Activate"
    drop window
return

/*:VRX         InlineImageButton_Click
*/
InlineImageButton_Click: 
Call VRSet "DT_1","Caption","Image:"
Call VRSet "InternalAlignTopButton","Enabled",1
Call VRSet "InternalAlignCenterButton","Enabled",1
Call VRSet "InternalAlignBottomButton","Enabled",1
Call VRSet "ImageAnchorEntry","Enabled",0
Call VRSet "DT_6","Enabled",0

return

/*:VRX         INPUT_Select_Click
*/
INPUT_Select_Click: 
/* Disable other items */
Call VRSet "FORM_ACTION_Entry","Enabled",0
Call VRSet "TEXTAREA_NAME_Entry","Enabled",0
Call VRSet "TEXTAREA_ROWS_Entry","Enabled",0
Call VRSet "TEXTAREA_COLS_Entry","Enabled",0
/* Enable INPUT fields */
Call VRSet "INPUT_NAME_Entry","Enabled",1
Call VRSet "INPUT_VALUE_Entry","Enabled",1
Call VRSet "INPUT_SIZE_Entry","Enabled",1
Call VRSet "INPUT_MAX_Entry","Enabled",1
Call VRSet "GB_2","Enabled",1
return

/*:VRX         Insert_Tag
*/
Insert_Tag:
/* Inserts a tag in the given object
   Back is the number of spaces to move
   the insertion point back when pasting 
   selected text into the tag */
Parse arg obj,tag, Back, nocap
If DataType(Back)<>"NUM" then return
If Back<0 then return
Obj="MLE_1"
/* Halt painting of edit window until done */
Call VRSet obj,"Painting",0
If VRGet("Options_Menu_Uppercase","Checked")=1 & Pos("&",tag)=0 & nocap<>1 then
    tag  = Translate(tag)
/* Look for selected text */
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
if SelStart=SelEnd then do
/* No Text has been selected so just insert the tag */
    rc=VRMethod(obj,"Insert",tag)
    L=Length(Tag)
/* Move the insertion point back */
    If PasteText<>"" & PasteText<>"PASTETEXT" then do
        TagLen=Length(Tag)
        Tag1=Substr(Tag,1,Taglen-Back)
        Tag2=SubStr(Tag,TagLen-Back+1)
        Txt=Tag1||PasteText||Tag2
        rc=VRMethod(obj,"Insert",Txt)
        Drop Txt
        PasteText=""
        End
    Else Do
        SelStart=VRGet(obj,"SelectedStart")
        SelEnd=VRGet(obj,"SelectedEnd")
        rc=VRSet(obj,"SelectedStart",SelStart-Back)
        rc=VRSet(obj,"SelectedEnd",SelStart-Back)   
        End
    PasteText=""
  end
else do
/* Text has been selected */
    TagLen=Length(Tag)
    Tag1=Substr(Tag,1,Taglen-Back)
    Tag2=SubStr(Tag,TagLen-Back+1)
    Txt=VRGet("MLE_1","SelectedText")
    OldSelection=Txt
    rc=VRMethod(obj,"Clear")
    Txt=Tag1||Txt||Tag2
/* Place the tag at the insertion point */
    rc=VRMethod(obj,"Insert",Txt)
    Drop Txt
end
/* Paint the edit window */
/* Don't let &xxx; entities affect Alt-z behavior */
If SubStr(Tag,1,1)<>"&" then Do
   LastTag=Tag
   LastBack=Back
   End
Call VRSet obj,"Painting",1
FileIsDirty=1
rc=VRMethod("MLE_1","SetFocus")
return

/*:VRX         InsertFile
*/
InsertFile: 
/* Read in the file */
If FileName2="" then Return
i=0
FS=Chars(FileName2)
If FS>10000 then
   Div=50
Else 
   Div=10
NChar=0
Do While Lines(FileName2)
    i=i+1
    FileLines.i=Linein(FileName2)
    Nchar=Nchar+Length(FileLines.i)
    If i//Div=0 then do
        tmp="Reading text file" Format(NChar/FS*100,3,0)||"%"
        rc=VRSet("MainWindow","StatusText",tmp)
    End
End
rc=Stream(FileName2,"C","Close")
FileLines.0=i
FileText=""
ptag="<p>"
If VRGet("Options_Menu_Uppercase","Checked")=1 then
    ptag  = Translate(ptag)
Do i=1 to FileLines.0
   If i//10=0 then
      rc=VRSet("MainWindow","StatusText","Processing text file: line" i "of" FileLines.0)
   If AutoInsertPara=1 then do
        If FileLines.i="" then do 
            n=Length(FileText)
            If n>=4 then 
                If Translate(Substr(FileText,n-4,3))<>"<P>" then 
                    FileLines.i=ptag
        End
        If Substr(FileLines.i,1,1)=" " | Substr(FileLines.i,1,1)=d2c(9) then do
            n=Length(FileText)
            If n>=4 then do
                If Translate(Substr(FileText,n-4,3))<>"<P>" then 
                    FileText=FileText||ptag||CR_LF
            End
        End
   End
   FileText=FileText||FileLines.i||CR_LF
End
If AutoInsertPara=1 then FileText=FileText||ptag||CR_LF
Drop FileLines
/* Put the text into the edit window */
rc=VRMethod("MLE_1","Insert",FileText)
rc=VRSet("MainWindow","StatusText","")
return

/*:VRX         InsertOL
*/
InsertOL: 
/* Halt painting of edit window until done */
Call VRSet obj,"Painting",0
/* Look for selected text */
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
if SelStart=SelEnd then do
/* No Text has been selected so just insert the tag */
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag=Translate(tag)
    Call Insert_Tag obj,tag,Back
  end
else do
/* Text has been selected so copy the text to a temp variable */
    SelLength=Max(SelStart,SelEnd)-Min(SelStart,SelEnd)
    TempStr2=SubStr(VRGet(obj,"Value"),SelStart,SelLength)
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        TempStr1="<OL>"||CR_LF
    else
        TempStr1="<ol>"||CR_LF
    TempStr3=""
    Do i=1 to SelLength
        NChar=SubStr(TempStr2,i,1)
        If i=SelLength & Pos(d2c(10),TempStr2)=0 then
            NChar=NChar||d2c(10)
        If Pos(d2c(10),NChar)<>0 then do
            TempStr3=Strip(Translate(Translate(TempStr3,"",lf),"",cr))
            if VRGet("Options_Menu_Uppercase","Checked")=1 then do
                TempStr1=TempStr1||"   <LI>"||TempStr3||"</LI>"||NChar
                end
            else do
                TempStr1=TempStr1||"   <li>"||TempStr3||"</li>"||NChar
                end
            TempStr3=""
            end
        Else
            TempStr3=TempStr3||NChar
    End
    rc=VRMethod(obj,"Clear")
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        TempStr1=TempStr1||"</OL>"||CR_LF
    else
        TempStr1=TempStr1||"</ol>"||CR_LF
    rc=VRMethod("MLE_1","Insert",TempStr1)
end
/* Paint the edit window */
Call VRSet obj,"Painting",1

return

/*:VRX         InsertUL
*/
InsertUL: 
/* Halt painting of edit window until done */
Call VRSet obj,"Painting",0
tag="<ul>"||crlf||"</ul>"
/* Look for selected text */
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
if SelStart=SelEnd then do
/* No Text has been selected so just insert the tag */
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        tag=Translate(tag)
    Call Insert_Tag obj,tag,Back
  end
else do
/* Text has been selected so copy the text to a temp variable */
    SelLength=Max(SelStart,SelEnd)-Min(SelStart,SelEnd)
    TempStr2=SubStr(VRGet(obj,"Value"),SelStart,SelLength)
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        TempStr1="<UL>"||CR_LF
    else
        TempStr1="<ul>"||CR_LF
    TempStr3=""
    Do i=1 to SelLength
        NChar=SubStr(TempStr2,i,1)
        If i=SelLength & Pos(d2c(10),TempStr2)=0 then
            NChar=NChar||d2c(10)
        If Pos(d2c(10),NChar)<>0 then do
            TempStr3=Strip(Translate(Translate(TempStr3,"",lf),"",cr))
            if VRGet("Options_Menu_Uppercase","Checked")=1 then
                TempStr1=TempStr1||"   <LI>"||TempStr3||"</LI>"||NChar
            else
                TempStr1=TempStr1||"   <li>"||TempStr3||"</li>"||NChar
            TempStr3=""
            end
        Else
            TempStr3=TempStr3||NChar
    End
    rc=VRMethod(obj,"Clear")
    if VRGet("Options_Menu_Uppercase","Checked")=1 then
        TempStr1=TempStr1||"</UL>"||CR_LF
    else
        TempStr1=TempStr1||"</ul>"||CR_LF
    rc=VRMethod("MLE_1","Insert",TempStr1)
end
/* Paint the edit window */
Call VRSet obj,"Painting",1

return

/*:VRX         IntraLand_Click
*/
IntraLand_Click: 
If LastAnchorButton="IntraSelect" then
    rc=VRSet("AnchorEntry","Value",IntraDocJumpTarget)
return

/*:VRX         LineDisplay
*/
LineDisplay: 
        NLines=VRMethod("MLE_1","QueryLineCount")
        ipt=VRGet("MLE_1","SelectedStart")
        
        LineNo=VRMethod("MLE_1","LineFromChar",ipt)+1
        tmp="Line" LineNo "of" NLines
        rc=VRSet("MainWindow","StatusText",tmp)
        drop tmp
return

/*:VRX         LinkColorButton_Click
*/
LinkColorButton_Click: 
Parse Var LinkColor "(" BGR "," BGG "," BGB ")"
rc=VRSet("RedSpin","Value",BGR)
rc=VRSet("GreenSpin","Value",BGG)
rc=VRSet("BlueSpin","Value",BGB)

return

/*:VRX         LitSegment
*/
LitSegment:         /* reads a JPEG segment's header from the input file */
Arg SegPos

Seg.marker=C2X(CharIn(FName, SegPos))
If Seg.marker<>"FF" Then
Do
     Return -1
End
Seg.Type=C2X(CharIn(FName))
Res=SegPos+2                  /* position of next segment */
If (Seg.Type="01") | ((Seg.Type>="D0") & (Seg.Type<="D9")) Then
Do   /* these segments contain no data nor length info */
     Seg.Len=0
End
Else
Do
     Seg.Len=C2D(CharIn(FName, , 2))
End
Res=Res+Seg.Len

If (Seg.Type="C0") | (Seg.Type="C2") Then
Do
     /* start of frame 0 */
     Imagebps=C2D(CharIn(FName))             /* bits per sample */
     Imageheight=C2D(CharIn(FName, , 2))
     Imagewidth=C2D(CharIn(FName, , 2))
End
Return Res

/*:VRX         LoadLibraries
*/
LoadLibraries: 
/*
rc=RxFuncAdd('SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs')
rc=SysLoadFuncs()
rc=rxfuncadd('APMTLoadFuncs', 'apmtext', 'APMTLoadFuncs')  /* entry points from the DLL */
rc=APMTLoadFuncs()
rc = INIT_SESSION()
If NoSocket=0 then do
    rc = RxFuncAdd("SockLoadFuncs","RxSock","SockLoadFuncs")
    rc=SockLoadFuncs()
    End
Else
    rc=VRSet("FileMenuWebLint","Enabled",0)
*/

/* Load rexxutil library functions */
If RxFuncQuery(SysLoadFuncs) then do
    rc=RxFuncAdd('SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs')
    If rc=0 then    
        rc=SysLoadFuncs()
    Else Do
        Call VRMessage "MainWIndow","The REXXUtil library could not be loaded and is required for HTML Wizard to run. Make sure rexxutil.dll is somewhere in your LIBPATH."
        Exit
    End
    End
Else
    rc=SysLoadFuncs()
/* Automation routines for driving Web Explorer */
If RxFuncQuery("APMTLoadFuncs") then do
    rc=rxfuncadd('APMTLoadFuncs', 'apmtext', 'APMTLoadFuncs')  /* entry points from the DLL */
    If rc=0 then do
        rc=APMTLoadFuncs()
        rc = INIT_SESSION()
    End
    Else Do
        Call VRMessage "MainWIndow","The Web Explorer automation library could not be loaded. Make sure apmtext.dll is in your HTML Wizard directory. HTML Wizard will continue, but you will be unable to preview with Web Explorer."
        Call VRSet "File_Menu_Preview", "Enabled", 0
    End
    End
Else Do
    rc=APMTLoadFuncs()
    rc = INIT_SESSION()
End
/*------------------------------------------------------------------
 * initialize socket package
 *------------------------------------------------------------------*/
If NoSocket=0 then do
    If RxFuncQuery("SockLoadFuncs") then do
        rc = RxFuncAdd("SockLoadFuncs","RxSock","SockLoadFuncs")
        If rc=0 then do
           rc=SockLoadFuncs()
           End
        Else Do
            Call VRMessage "MainWIndow","The REXX sockets library could not be loaded. Make sure rxsock.dll is in your HTML Wizard directory. HTML Wizard will continue, but you will be unable to check your documents with WebLint."
            Call VRSet "File_Menu_Weblint", "Enabled", 0
        End
    End
    Else
        rc=SockLoadFuncs()
End
Else
    Call VRSet "File_Menu_Weblint", "Enabled", 0
return

/*:VRX         MainWindow_Activate
*/
MainWindow_Activate: 
    
    If Grab=1 then do
      rc=VRMethod("MLE_1","SetFocus")
    End

return

/*:VRX         MainWindow_Close
*/
MainWindow_Close:
Call Quit
return

/*:VRX         MainWindow_Create
*/
MainWindow_Create:
ThisVersion=1.60
/* Check for number of uses in shareware version */
VerNum=VRGetIni("HTML Wizard","Version","User","NoClose")
If DataType(VerNum)<>"NUM" then VerNum=0
NumUses=VRGetIni("HTML Wizard","Uses","User","NoClose")
If NumUses="" then do
    rc=VRSetIni("HTML Wizard","Uses",1,"User","NoClose")
    NumUses=0
    End
If VerNum<ThisVersion then do
    NumUses=0
    rc=VRSetIni("HTML Wizard","Version",ThisVersion,"User","NoClose")
    End
NumUses=0 /* Comment this line for shareware version */
If NumUses>25 then do
    id=VRMessage("MainWindow","You have exceeded the number of trial usages of HTML Wizard. See the README file or htmlwiz.inf for registration information.","Free Trial Period Expired")
    Exit
    End
If NumUses>=16 then do
    id=VRMessage("MainWindow","You have only" 25-NumUses "usages of HTML Wizard left! See the README file or htmlwiz.inf for registration information.","Free Trial Period About to Expire")
    End
NumUses=NumUses+1
rc=VRSetIni("HTML Wizard","Uses",NumUses,"User")
CR_LF="0d0a"x
crlf=cr_lf
cr=d2c(13)
lf=d2c(10)
PasteText=""
IgnoreResize=1
FileName=""
ProgramName="HTML Wizard for OS/2"
ProgramPath=VRGet("Application","Program")
ProgramPath=VRParseFileName(ProgramPath,"DP")
IniFile=ProgramPath||"\htmlwiz.ini"
ProgramDrive=VRParseFileName(ProgramPath,"D")
CL=VRGet("Application","CommandLine")
If Pos("-NOSOCKET",Translate(CL))<>0 then
   NoSocket=1
Else
   NoSocket=0
If Pos("-GRABFOCUS",Translate(CL))<>0 then
   Grab=1
If Pos("-NOCONSOLE",Translate(CL))<>0 then
   rc=VRRedirectStdIO("Off")

tmp=""
Do i=1 to Words(CL)
    If SubStr(Word(CL,i),1,1)<>"-" then
        tmp=tmp Word(CL,i)
End
CL=Strip(tmp)
CurrDrive=VRCurrDrive()
CurrDir=VRCurrDir()
If Pos("\",Reverse(CurrDir))=1 then
    tmp="*.htm*"
Else
    tmp="\*.htm*"
rc=VRChDrive(ProgramDrive)
PresentPath=CurrDrive||CurrDir||tmp
WorkingPath=PresentPath
rc=VRChDrive(ProgramPath)
rc=VRChDir(ProgramPath)
Call LoadLibraries /* Load REXX external libraries */
rc=VRChDrive(CurrDrive)
rc=VRChDir(CurrDir)
Call GetIni  /* Get initial settings from htmlwiz.ini */
BaseText=""
CurrentRingFile=0
CurrentRingCount=0
If CL="" then Do
  If VRFileExists("default.htm") then Do
    TemplateName="default.htm"
    Call ReadFile TemplateName
    FileName=""
    Call SaveToRing
    BaseText=VRGet("MLE_1","Value")
    End
  Else Do
        CurrentRingFile=1
        CurrentRingCount=1
        BaseText="<html>"||crlf||"<head>"||crlf||"<title></title>"||crlf||"</head>"||crlf||crlf||"<body>"||crlf||crlf||"</body>"||crlf||"</html>"
        Call SaveToRing
    End
  Call VRSet "MLE_1","Value",BaseText
  End
Else Do
  If Pos(" ",CL)<>0 then do
      L=Length(CL)
      CL=SubStr(CL,2,L-2)  /* Remove quotes which gum up filenames with spaces */
  End
  Call ReadFile CL
  FileIsDirty=0
  FileName=CL
  Call UpdateRecall
End

Call VRLoadSecondary "SearchWin"
Call VRLoadSecondary "ToolBarHoriz"
Call VRLoadSecondary "ToolBar"

If NoIni<>1 then 
   Call VRSet "Options_Menu_HideTagbar","Checked",HideTagbar
/* Delete any temporary files */
rc=VRDeleteFile(ProgramPath||"\wiz*.htm")
LastAnchorButton=""
LastTag=""
LastBack=""
ImageName=""
OldSelection=""
ReadOnlyStatus=""
TemplateName="default.htm"
return

/*:VRX         MLE_1_ContextMenu
*/
MLE_1_ContextMenu:
Call VRMethod "Tags_Menu","Popup"
return

/*:VRX         MLE_1_DoubleClick
*/
MLE_1_DoubleClick: 
/* Turned this off after version 1.40, not sure why it was here to begin with
If FileIsDirty=1 then
    Call File_Menu_Save_Click
*/
return

/*:VRX         MLE_1_DragDrop
*/
MLE_1_DragDrop: 
rc=VRInfo("DropFile.")
If DropFile.!Type="WebExplorer_Url" then Do
    F=DropFile.!SourceFile
    LongName=""
    If VRFileExists(F) then do
            a=Linein(F)
            rc=Stream(F,"C","Close")
            Parse Var a URL .
            rc=SysGetEA(F,".longname","EA")
            Parse Var EA 5 LongName
            If rc<>0 then LongName=SourceFile.!SourceName
            LongName=Translate(LongName," ",d2c(10)) /* Get rid of LF */
            LongName=Translate(LongName," ",d2c(13)) /* Get rid of CR */
            LongName=Space(LongName) /* Get rid of extra spaces */
            If VRGet("Options_Menu_Uppercase","Checked")=1 then
                Tag='<A HREF="'||URL||'">'||LongName||'</A>'
            Else
                Tag='<a href="'||URL||'">'||LongName||'</a>'
            Call Insert_Tag "MLE_1",Tag,0,1
    End
    Return
End
If Translate(DropFile.!Operation)="COPY" then Do
    FileName2=DropFile.!SourceFile
    ImageName=FileName2
    Call ImageGetSize
    If ImageType="<none>" then 
        Call InsertFile
    Else Do
        Call VRLoadSecondary "Images","Wait"
    End
End
Else Do
    FileName2=DropFile.!SourceFile
    ImageName=FileName2
    Call ImageGetSize
    If ImageType="<none>" then Do
        If CurrentRingCount=10 then 
            Do
            Button.0=1
            Button.1="OK"
            msg="Only 10 files may be open at one time."
            rc=VRMessage("MainWindow",Msg,"File Limit Reached","Q","button.",1,1)
            End
        Else 
            Do
            Call CleanTemp
            Call SaveToRing
            FileName=DropFile.!SourceFile
            Call ReadFile
            Call UpdateRecall
            rc=VRMethod("MLE_1","SetFocus")
            End
        End
    Else Do
        ImageName=DropFile.!SourceName
        Call VRLoadSecondary "Images","Wait"
    End

End
return

/*:VRX         MLE_1_DragStart
*/
MLE_1_DragStart: 
/* This code eliminated in version 1.56 Beta B and later 
FileText=VRGet("MLE_1","Value")
TempFile="htmlwiz.tmp"
TempFileFull=ProgramPath||"\"||TempFile
IconFile=ProgramPath||"\htmlwiz.ico"
File3=SysTempFileName(ProgramPath||"\wiz???.htm")
If VRFileExists(TempFileFull) then
   rc=VRDeleteFile(TempFileFull)
rc=LINEOUT(TempFileFull,FileText)
rc=Stream(TempFileFull,"C","Close")
    /* Translate foreign characters if translation mode is active */
    if TransChar then do 
        tmp='"'||ProgramPath||"\txt2html"||'"' '"'||TempFileFull||'"' '"'||File3||'"' '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            rc=VRDeleteFile(ProgramPath||"\"||TempFile)
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not saved.","Translation Error")
            return
        end
    End
    Else Do /* Translation mode not active, so rename htmlwiz.tmp to a temp file */
        rc=VRRenameFile(ProgramPath||"\"||Tempfile,File3)
    End
/* Move the temp. file to the working directory so links and images will work. */
If FileName="" | FileName="FILENAME" then 
   FileName=ProgramPath
PPath=VRParseFilePath(FileName,"DP")
File4=PPath||"\"||VRParseFilePath(File3,"NE")
File4NoPath=VRParseFilePath(File3,"NE")
rc=VRCopyFile(File3,File4)
rc=SysFileDelete(ProgramPath||"\wiztmp.htm")
If File3<>File4 then
    rc=SysFileDelete(File3)
rc=VRMethod("MLE_1","StartDrag","Copy",IconFile,"<DRM_OS2FILE,DRF_TEXT>","Plain Text",PPath,File4NoPath)
*/
return

/*:VRX         MLE_1_KeyPress
*/
MLE_1_KeyPress:
obj="MLE_1"
keystring=VRGet(obj,"KeyString")
If VRGet("MLE_1","ReadOnly")=1 Then do
    If keystring="{Up}"|keystring="{Down}"|keystring="{PgUp}"|keystring="{PgDown}"|keystring="{Left}"|keystring="{Right}" then
        NOP
    Else
        Return
End

Select
    when keystring="{Backspace}" | keystring="{Del}" then do
        SelStart=VRGet(obj,"SelectedStart")
        SelEnd=VRGet(obj,"SelectedEnd")
        if SelStart=SelEnd then do
        /* No Text has been selected so just delete the character*/
           Return
         end
        else do
        /* Text has been selected so cut the text */
            rc=VRMethod(obj,"Clear")
            rc=VRSet(obj,"KeyString","")
            FileIsDirty=1
        end
        return
    end
    When keystring="{Alt}z" then do  
        Test=Translate(LastTag)
        Select 
            When Pos("<A HREF=",Test)<>0 then do
                Call VRLoadSecondary "Anchors","Wait"
                End
            When Pos("<A NAME=",Test)<>0 then do
                Call VRLoadSecondary "Anchors","Wait"
                End
            When Pos("<IMG",Test)<>0 then do
                Call VRLoadSecondary "Images","Wait"
                End
            Otherwise
                If LastTag<>"" then
                    Call Insert_Tag "MLE_1",LastTag,LastBack,1
        End /* Select */
        Return
    End
    When keystring="{Up}"|keystring="{Down}"|keystring="{PgUp}"|keystring="{PgDown}"|keystring="{Left}"|keystring="{Right}" then
        NOP
    Otherwise
        FileIsDirty=1
End
return

/*:VRX         Options_Menu_AutoInsertPara_Click
*/
Options_Menu_AutoInsertPara_Click: 
AutoInsertPara=\AutoInsertPara
Call VRSet "Options_Menu_AutoInsertPara","Checked",AutoInsertPara
return

/*:VRX         Options_Menu_HideTagbar_Click
*/
Options_Menu_HideTagbar_Click: 
HideTagbar=\HideTagbar
Call VRSet "Options_Menu_HideTagbar","Checked",HideTagbar
If TagBarOrient=0 then
    Call VRSet "ToolBarHoriz","Visible",\HideTagbar
Else
    Call VRSet "ToolBar","Visible",\HideTagbar
return

/*:VRX         Options_Menu_Lists_Click
*/
Options_Menu_Lists_Click: 
InsertLI=\InsertLI
Call VRSet "Options_Menu_Lists","Checked",InsertLI
return

/*:VRX         Options_Menu_Tagbar_Click
*/
Options_Menu_Tagbar_Click: 
If TagBarOrient=1 then do
    TagBarOrient=0
    Call VRSet "Options_Menu_Tagbar","Checked",0
    Call VRSet "ToolBar","Visible",0
    If HideTagbar=0 then 
        Call VRSet "ToolBarHoriz","Visible",1
    end
else do
    TagBarOrient=1
    Call VRSet "Options_Menu_Tagbar","Checked",1
    Call VRSet "ToolBarHoriz","Visible",0
    If HideTagbar=0 then 
        Call VRSet "ToolBar","Visible",1
    end
Call ReadUserTags
return

/*:VRX         Options_Menu_Translate_Click
*/
Options_Menu_Translate_Click: 
TransChar=\TransChar
Call VRSet "Options_Menu_Translate","Checked",TransChar
return

/*:VRX         Options_Menu_Uppercase_Click
*/
Options_Menu_Uppercase_Click:
Test=VRGet("Options_Menu_Uppercase","Checked")
Call VRSet "Options_Menu_Uppercase","Checked",\test
return

/*:VRX         Options_Menu_WordWrap_Click
*/
Options_Menu_WordWrap_Click:
Test=VRGet("Options_Menu_WordWrap","Checked")
Call VRSet "Options_Menu_WordWrap","Checked",\test
Call VRSet "MLE_1", "WordWrap", \Test
return

/*:VRX         PositionWindows
*/
PositionWindows: 
    top=VRGetIni("MainWindow","Top",IniFile,"NoClose")
    Height=VRGetIni("MainWindow","Height",IniFile,"NoClose")
    Left=VRGetIni("MainWindow","Left",IniFile,"NoClose")
    Width=VRGetIni("MainWindow","Width",IniFile,"NoClose")
    if DataType(Top)="NUM" then rc=VRSet("MainWindow","Top",Top)
    if DataType(Height)="NUM" then rc=VRSet("MainWindow","Height",Height)
    if DataType(Left)="NUM" then rc=VRSet("MainWindow","Left",Left)
    if DataType(Width)="NUM" then rc=VRSet("MainWindow","Width",Width)
/* Vertical Tagbar */
    top=VRGetIni("ToolBar","Top",IniFile,"NoClose")
/*    Height=VRGetIni("ToolBar","Height",IniFile,"NoClose") */
    Left=VRGetIni("ToolBar","Left",IniFile,"NoClose")
/*    Width=VRGetIni("ToolBar","Width",IniFile,"NoClose") */
    if DataType(Top)="NUM" then rc=VRSet("ToolBar","Top",Top)
/*    if DataType(Height)="NUM" then rc=VRSet("ToolBar","Height",Height) */
    if DataType(Left)="NUM" then rc=VRSet("ToolBar","Left",Left)
/*    if DataType(Width)="NUM" then rc=VRSet("ToolBar","Width",Width) */
/* Horizontal Tagbar */
    top=VRGetIni("ToolbarHoriz","Top",IniFile,"NoClose")
/*    Height=VRGetIni("ToolbarHoriz","Height",IniFile,"NoClose") */
    Left=VRGetIni("ToolbarHoriz","Left",IniFile,"NoClose")
/*    Width=VRGetIni("ToolbarHoriz","Width",IniFile) */
    if DataType(Top)="NUM" then rc=VRSet("ToolbarHoriz","Top",Top)
/*    if DataType(Height)="NUM" then rc=VRSet("ToolbarHoriz","Height",Height) */
    if DataType(Left)="NUM" then rc=VRSet("ToolbarHoriz","Left",Left)
/*    if DataType(Width)="NUM" then rc=VRSet("ToolbarHoriz","Width",Width) */
return

/*:VRX         Quit
*/
Quit:
Call RingCheckIfDirty
if rc=3 then Return /* User pressed Cancel on a File Save dialog */
rc=1
if rc=1 then do
    /* Delete any temporary files */
    rc=VRDeleteFile(ProgramPath||"\wiz*.htm")
    rc=VRDeleteFile(PPath||"\wiz*.htm")
    /* Save file recall list */
    Do i=1 to 5
        rc=VRSetIni("MainWindow","Recall"||i,Recall.i,IniFile,"NoClose")
    End
    /* Save window information */
    rc=VRSetIni("Tagbar","TagBarOrientation",TagBarOrient,IniFile,"NoClose")
    Top=VRGet("MainWindow","Top")
    Height=VRGet("MainWindow","Height")
    Left=VRGet("MainWindow","Left")
    Width=VRGet("MainWindow","Width")
    MLEFont=VRGet("MLE_1","Font")
    MLEBackColor=VRGet("MLE_1","BackColor")
    MLEForeColor=VRGet("MLE_1","ForeColor")
    rc=VRSetIni("MainWindow","MLEFont",MLEFont,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","MLEForeColor",MLEForeColor,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","MLEBackColor",MLEBackColor,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","Top",Top,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","Height",Height,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","Left",Left,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","Width",Width,IniFile,"NoClose")
    WW=VRGet("Options_Menu_WordWrap","Checked")
    rc=VRSetIni("MainWindow","WordWrap",WW,IniFile,"NoClose")
    UC=VRGet("Options_Menu_Uppercase","Checked")
    rc=VRSetIni("MainWindow","UpperCase",UC,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","InsertLI",InsertLI,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","AutoInsertPara",AutoInsertPara,IniFile,"NoClose")
    rc=VRSetIni("MainWindow","TransChar",TransChar,IniFile,"NoClose")
    rc=VRSetIni("ToolBar","HideTagbar",HideTagbar,IniFile,"NoClose")
/* Vertical Tagbar */
        Top=VRGet("ToolBar","Top")
        Height=VRGet("ToolBar","Height")
        Left=VRGet("ToolBar","Left")
        Width=VRGet("ToolBar","Width")
        rc=VRSetIni("ToolBar","Top",Top,IniFile,"NoClose")
        rc=VRSetIni("ToolBar","Height",Height,IniFile,"NoClose")
        rc=VRSetIni("ToolBar","Left",Left,IniFile,"NoClose")
        rc=VRSetIni("ToolBar","Width",Width,IniFile,"NoClose")
/* Horizontal Tagbar */
        Top=VRGet("ToolbarHoriz","Top")
        Height=VRGet("ToolbarHoriz","Height")
        Left=VRGet("ToolbarHoriz","Left")
        Width=VRGet("ToolbarHoriz","Width")
        rc=VRSetIni("ToolbarHoriz","Top",Top,IniFile,"NoClose")
        rc=VRSetIni("ToolbarHoriz","Height",Height,IniFile,"NoClose")
        rc=VRSetIni("ToolbarHoriz","Left",Left,IniFile,"NoClose")
        rc=VRSetIni("ToolbarHoriz","Width",Width,IniFile)
    window = VRWindow()
    call VRSet window, "Shutdown", 1
    drop window
end
return

/*:VRX         ReadFile
*/
ReadFile: 
Parse Arg F .
If CurrentRingCount=10 then Do
    Button.0=1
    Button.1="OK"
    msg="Only 10 files may be open at one time."
    rc=VRMessage("MainWindow",Msg,"File Limit Reached","Q","button.",1,1)
    Return
End
OldName=FileName
If F<>"" then FileName=F
/* Reads in a text file, with translation if active, and puts it in the MLE */
/* Read in the file */
    if \VRFileExists(FileName) then do
         rc=Beep(100,500)
         rc=VRMessage("Application","The file you specified does not exist.","File Open Error")
         FileName=OldName
         Return        
    End
    rc=VRSet("MainWindow","StatusText","Loading file ...")
    if TransChar then do
        If VRFileExists("htmlwiz.tmp") then 
            rc=VRDeleteFile("htmlwiz.tmp")
        tmp='"'||ProgramPath||"\html2txt"||'"' '"'||FileName||'"' "htmlwiz.tmp" '"'||ProgramPath||"\trans.def"||'"'
        address cmd '"@'||tmp||'"'
        if rc=0 then do
            NChars=Chars(ProgramPath||"\htmlwiz.tmp")
            FileText=Charin(ProgramPath"\htmlwiz.tmp",,NChars)
            rc=Stream(ProgramPath||"\htmlwiz.tmp","C","Close")
            rc=VRDeleteFile("htmlwiz.tmp")
        end
        else do
            rc=VRMessage("Application","An error occurred during translation of non-English characters. The file was not opened. See the Console Window for details.","Translation Error")
            FileName=OldName
            Return
        end
    End
    Else Do
            NChars=Chars(FileName)
            FileText=Charin(FileName,,NChars)
            rc=Stream(FileName,"C","Close")
    End
CurrentRingFile=CurrentRingCount+1
CurrentRingCount=CurrentRingFile
If FileName="" then
    F2="<untitled>"
Else
    F2=FileName
rc=VRSet("Ring_Menu_"||CurrentRingFile,"Caption",F2)
rc=VRSet("Ring_Menu_"||CurrentRingFile,"Visible",1)
/* Put the text into the edit window */
rc=VRSet("MLE_1","Value",FileText)
Drop FileText
rc=VRSet("MainWindow","Pointer","<Default>")
If F="" then
   Call VRSet "MainWindow","Caption",ProgramName||" - "||FileName
If PPath<>"" & PPath<>"PPATH" then
   rc=VRDeleteFile(PPath||"\wiz*.htm")
PresentPath=VRParseFilePath(FileName,"DP")||"\*.htm*"
FileIsDirty=-1
rc=VRSet("MainWindow","StatusText","")
RingReadOnly.CurrentRingFile=0
Do i=1 to CurrentRingCount-1
    If RingName.i=FileName & FileName<>"" then Do
        RingReadOnly.CurrentRingFile=1
        rc=VRSet("MLE_1","ReadOnly",1)
        Call StatusUpdate 
        Leave
        End
    Else Do
        Call StatusUpdate
        rc=VRSet("MLE_1","ReadOnly",0)
        End
End
Call SaveToRing
return

/*:VRX         ReadUserTags
*/
ReadUserTags: 
Do i=1 to 14
    UserTagHint.i=VRGetIni("User Tag" i,"Hint",IniFile,"NoClose")
    UserTag.i=VRGetIni("User Tag" i,"Tag",IniFile,"NoClose")
    UserTagBack.i=VRGetIni("User Tag" i,"Back",IniFile,"NoClose")
    UserTagAbbrev.i=VRGetIni("User Tag" i,"Abbrev",IniFile,"NoClose")
    If UserTagAbbrev.i="" then
        UserTagAbbrev.i="U"||i
    TagName="TB_UT"||i
    TagName2="TB_UT"||i||"B"
    If i<=12 then Do
        Call VRSet TagName,"HintText",UserTagHint.i
        Call VRSet TagName,"Caption",UserTagAbbrev.i
    End
    Call VRSet TagName2,"HintText",UserTagHint.i
    Call VRSet TagName2,"Caption",UserTagAbbrev.i
End
UserTagBack.14=VRGetIni("User Tag" i,"Back",IniFile) /* To close ini file */

return

/*:VRX         RedSpin_Change
*/
RedSpin_Change: 
Call BGSpinUpdate
return

/*:VRX         RemoveFromRing
*/
RemoveFromRing: 
If CurrentRingFile<>CurrentRingCount Then Do
    Do iring=CurrentRingFile+1 to CurrentRingCount
        j=iring-1
        RingText.j=RingText.iring
        RingName.j=RingName.iring
        RingDirty.j=RingDirty.iring
        RingPresentPath.j=RingPresentPath.iring
        rc=VRSet("Ring_Menu_"||j,"Caption",RingName.iring)
    End
    rc=VRSet("Ring_Menu_"||CurrentRingCount,"Visible",0)
    CurrentRingCount=CurrentRingCount-1
    End
Else
    Do
        rc=VRSet("Ring_Menu_"||CurrentRingCount,"Visible",0)
        CurrentRingCount=CurrentRingCount-1
        CurrentRingFile=CurrentRingCount
    End
If CurrentRingCount=0 then Do
    CurrentRingCount=1
    CurrentRingFile=1
    RingText.1=BaseText
    RingName.1=""
    RingDirty.1=-1
    RingPresentPath.1=WorkingPath
    rc=VRSet("Ring_Menu_1","Caption","<untitled>")
End
Call RingDisplay
Call SaveToRing
return

/*:VRX         ReplaceAllButton_Click
*/
ReplaceAllButton_Click: 
FindText=VRGet("TargetEntry","Value")
ReplaceText=VRGet("ReplacementEntry","Value")
If FindText="" then return
If VRGet("CaseCheck","Set")=1 then
    Case="Case"
Else
    Case=""
rc=VRMethod("MLE_1","Search",FindText,ReplaceText,Case,,,"ChangeAll")
if rc=-1 then do
    Button.0=1
    Button.1="OK"
    rc=VRMessage("MainWIndow","Target text was not found.","Replace All",,"Button.")
    Drop Button.
    End
Else Do
    Button.0=1
    Button.1="OK"
    rc=VRMessage("MainWIndow","All occurrences changed.","Replace All",,"Button.")
    Drop Button.
    End
return

/*:VRX         ReplaceButton_Click
*/
ReplaceButton_Click: 
ReplaceText=VRGet("ReplacementEntry","Value")
SelStart=VRGet("MLE_1","SelectedStart")
SelEnd=VRGet("MLE_1","SelectedEnd")
If SelStart=SelEnd then Return
rc=VRMethod("MLE_1","Insert",ReplaceText)
return

/*:VRX         ReplaceFindButton_Click
*/
ReplaceFindButton_Click: 
Call ReplaceButton_Click
Call FindButton_Click
return

/*:VRX         ReplacementEntry_Change
*/
ReplacementEntry_Change: 
rc=VRGet("ReplacementEntry","Value")
If length(rc)=0 then do
    Call VRSet "ReplaceAllButton","Enabled",0
    Call VRSet "ReplaceButton","Enabled",0
    End
Else Do
    Call VRSet "ReplaceAllButton","Enabled",1
    Call VRSet "ReplaceButton","Enabled",1
    End
return

/*:VRX         Ring_Back_Click
*/
Ring_Back_Click: 
Call SaveToRing
CurrentRingFile=CurrentRingFile-1
If CurrentRingFile<1 then
   CurrentRingFile=CurrentRingCount
Call RingDisplay

return

/*:VRX         Ring_Forward_Click
*/
Ring_Forward_Click: 
Call SaveToRing
CurrentRingFile=CurrentRingFile+1
If CurrentRingFile>CurrentRingCount then
   CurrentRingFile=1
Call RingDisplay
return

/*:VRX         Ring_Menu_10_Click
*/
Ring_Menu_10_Click: 
Call SaveToRing
CurrentRingFile=10
Call RingDisplay

return

/*:VRX         Ring_Menu_1_Click
*/
Ring_Menu_1_Click: 
Call SaveToRing
CurrentRingFile=1
Call RingDisplay
return

/*:VRX         Ring_Menu_2_Click
*/
Ring_Menu_2_Click: 
Call SaveToRing
CurrentRingFile=2
Call RingDisplay

return

/*:VRX         Ring_Menu_3_Click
*/
Ring_Menu_3_Click: 
Call SaveToRing
CurrentRingFile=3
Call RingDisplay

return

/*:VRX         Ring_Menu_4_Click
*/
Ring_Menu_4_Click: 
Call SaveToRing
CurrentRingFile=4
Call RingDisplay

return

/*:VRX         Ring_Menu_5_Click
*/
Ring_Menu_5_Click: 
Call SaveToRing
CurrentRingFile=5
Call RingDisplay

return

/*:VRX         Ring_Menu_6_Click
*/
Ring_Menu_6_Click: 
Call SaveToRing
CurrentRingFile=6
Call RingDisplay

return

/*:VRX         Ring_Menu_7_Click
*/
Ring_Menu_7_Click: 
Call SaveToRing
CurrentRingFile=7
Call RingDisplay

return

/*:VRX         Ring_Menu_8_Click
*/
Ring_Menu_8_Click: 
Call SaveToRing
CurrentRingFile=8
Call RingDisplay

return

/*:VRX         Ring_Menu_9_Click
*/
Ring_Menu_9_Click: 
Call SaveToRing
CurrentRingFile=9
Call RingDisplay

return

/*:VRX         Ring_Menu_Click
*/
Ring_Menu_Click: 

return

/*:VRX         RingCheckIfDirty
*/
RingCheckIfDirty: 
Call SaveToRing
Button.0=3
Button.1="Yes"
Button.2="No"
Button.3="Cancel"

Do i=1 to CurrentRingCount
    If RingDirty.i=1 & RingReadOnly.i=0 then Do
        CurrentRingFile=i
        Call RingDisplay
        If FileName<>"" then Do
            Msg="Save changes made to"||crlf||RingName.i||"?"
            rc=VRMessage("MainWindow",Msg,"Save changes?","Q","button.",1,3)
            If rc=1 then Call File_Menu_Save_Click
            If rc=3 then Return
            End
        Else
            Call File_Menu_SaveAs_Click
        If rc=3 then Return
     End
End
N=CurrentRingCount
Do i=1 to N
    Call RemoveFromRing
End
return

/*:VRX         RingDisplay
*/
RingDisplay: 
rc=VRSet("MLE_1","Value",RingText.CurrentRingFile)
FileName=RingName.CurrentRingFile
FileIsDirty=RingDirty.CurrentRingFile
PresentPath=RingPresentPath.CurrentRingFile
If RingReadOnly.CurrentRingFile=1 then Do
    rc=VRSet("MLE_1","ReadOnly",1)
    End
Else Do
    rc=VRSet("MLE_1","ReadOnly",0)
    End
Call VRSet "MainWindow","Caption",ProgramName||" - "||FileName
Call StatusUpdate
If DataType(RingCursor.CurrentRingFile)="NUM" then Do
    rc=VRSet("MLE_1","Painting",0)
    rc=VRSet("MLE_1","SelectedStart",RingCursor.CurrentRingFile)
    rc=VRSet("MLE_1","SelectedEnd",RingCursor.CurrentRingFile)
    rc=VRSet("MLE_1","Painting",1)
End
return

/*:VRX         SaveToRing
*/
SaveToRing: 
RingText.CurrentRingFile=VRGet("MLE_1","Value")
If FileName<>"" then 
    RingName.CurrentRingFile=FileName
Else
    RingName.CurrentRingFile="<untitled>"
RingDirty.CurrentRingFile=FileIsDirty
RingCursor.CurrentRingFile=VRGet("MLE_1","SelectedStart")
RingReadOnly.CurrentRingFile=VRGet("MLE_1","ReadOnly")
RingPresentPath.CurrentRingFile=PresentPath
If FileName="" then
    F2="<untitled>"
Else
    F2=FileName
Call VRSet "MainWindow","Caption",ProgramName||" - "||F2
rc=VRSet("Ring_Menu_"||CurrentRingFile,"Caption",F2)
rc=VRSet("Ring_Menu_"||CurrentRingFile,"Visible",1)
return

/*:VRX         SearchWin_Close
*/
SearchWin_Close: 
    call SearchWin_Fini
return

/*:VRX         SearchWin_Create
*/
SearchWin_Create: 
    call SearchWin_Init
    If Grab=1 then do
      rc=VRMethod("MLE_1","SetFocus")
    End

return

/*:VRX         SearchWin_Fini
*/
SearchWin_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SearchWin_Init
*/
SearchWin_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 0
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SetUserTags
*/
SetUserTags: 
rc=VRMethod("Application","GetVar","UserTag.")
rc=VRMethod("Application","GetVar","UserTagHint.")
rc=VRMethod("Application","GetVar","UserTagBack.")
rc=VRMethod("Application","GetVar","UserTagAbbrev.")

return

/*:VRX         ShiftRecall
*/
ShiftRecall: 
Parse Arg Start .
FileName=Recall.Start
/* Shifts recall files down beginning at Start and moving up, first
   menu item is set to that originally at Start position
*/
Do i=Start to 2 by -1
    k=i-1
    Recall.i=Recall.k
    rc=VRSet("FileMenuRecall"||i,"Caption",Recall.i)
End
Recall.1=FileName
rc=VRSet("FileMenuRecall1","Caption",Recall.1)
return

/*:VRX         Special_Ampersand_Click
*/
Special_Ampersand_Click: 
Tag="&amp;"
obj="MLE_1"
Call Insert_Tag obj,tag,0
return

/*:VRX         Special_Copyright_Click
*/
Special_Copyright_Click: 
Tag="&copy;"
Call Insert_Tag "MLE_1",Tag,0
return

/*:VRX         Special_Currency_Cent_Click
*/
Special_Currency_Cent_Click: 
Call Insert_Tag "MLE_1","&cent;",0
return

/*:VRX         Special_Currency_CurrencySign_Click
*/
Special_Currency_CurrencySign_Click: 
Call Insert_Tag "MLE_1","&curren;",0
return

/*:VRX         Special_Currency_Pound_Click
*/
Special_Currency_Pound_Click: 
Call Insert_Tag "MLE_1","&pound;",0
return

/*:VRX         Special_Currency_Yen_Click
*/
Special_Currency_Yen_Click: 
Call Insert_Tag "MLE_1","&yen;",0
return

/*:VRX         Special_DblQuote_Click
*/
Special_DblQuote_Click: 
obj="MLE_1"
tag="&quot;"
Call Insert_Tag obj,tag,0

return

/*:VRX         Special_Greater_Click
*/
Special_Greater_Click: 
obj="MLE_1"
tag="&gt;"
Call Insert_Tag obj,tag,0

return

/*:VRX         Special_InvertedE_Click
*/
Special_InvertedE_Click: 
Call Insert_Tag "MLE_1","&iexcl;",0
return

/*:VRX         Special_InvertedQ_Click
*/
Special_InvertedQ_Click: 
Call Insert_Tag "MLE_1","&iquest;",0
return

/*:VRX         Special_Less_Click
*/
Special_Less_Click: 
obj="MLE_1"
tag="&lt;"
Call Insert_Tag obj,tag,0

return

/*:VRX         Special_Lower_AAcute_Click
*/
Special_Lower_AAcute_Click: 
tag="&aacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_ACircumflex_Click
*/
Special_Lower_ACircumflex_Click: 
tag="&acirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_AEDiphthong_Click
*/
Special_Lower_AEDiphthong_Click: 
obj="MLE_1"
tag="&aelig;"
Call Insert_Tag obj,tag,0
return

/*:VRX         Special_Lower_AGrave_Click
*/
Special_Lower_AGrave_Click: 
tag="&agrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_ARing_Click
*/
Special_Lower_ARing_Click: 
tag="&aring;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_ATilde_Click
*/
Special_Lower_ATilde_Click: 
tag="&atilde;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_AUmlaut_Click
*/
Special_Lower_AUmlaut_Click: 
tag="&auml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_CCedilla_Click
*/
Special_Lower_CCedilla_Click: 
tag="&ccedil;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_EAcute_Click
*/
Special_Lower_EAcute_Click: 
tag="&eacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_ECircumflex_Click
*/
Special_Lower_ECircumflex_Click: 
tag="&ecirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_EGrave_Click
*/
Special_Lower_EGrave_Click: 
tag="&egrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_eth_Click
*/
Special_Lower_eth_Click: 
tag="&eth;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_EUmlaut_Click
*/
Special_Lower_EUmlaut_Click: 
tag="&euml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_IAcute_Click
*/
Special_Lower_IAcute_Click: 
tag="&iacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_ICircumflex_Click
*/
Special_Lower_ICircumflex_Click: 
tag="&icirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_IGrave_Click
*/
Special_Lower_IGrave_Click: 
tag="&igrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_IUmlaut_Click
*/
Special_Lower_IUmlaut_Click: 
tag="&iuml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_NTilde_Click
*/
Special_Lower_NTilde_Click: 
tag="&ntilde;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OAcute_Click
*/
Special_Lower_OAcute_Click: 
tag="&oacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OCircumflex_Click
*/
Special_Lower_OCircumflex_Click: 
tag="&ocirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OGrave_Click
*/
Special_Lower_OGrave_Click: 
tag="&ograve;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OSlash_Click
*/
Special_Lower_OSlash_Click: 
tag="&oslash;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OTilde_Click
*/
Special_Lower_OTilde_Click: 
tag="&otilde;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_OUmlaut_Click
*/
Special_Lower_OUmlaut_Click: 
tag="&ouml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_SharpS_Click
*/
Special_Lower_SharpS_Click: 
tag="&szlig;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_Thorn_Click
*/
Special_Lower_Thorn_Click: 
tag="&thorn;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_UAcute_Click
*/
Special_Lower_UAcute_Click: 
tag="&uacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_UCircumflex_Click
*/
Special_Lower_UCircumflex_Click: 
tag="&ucirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_UGrave_Click
*/
Special_Lower_UGrave_Click: 
tag="&ugrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_UUmlaut_Click
*/
Special_Lower_UUmlaut_Click: 
tag="&uuml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_YAcute_Click
*/
Special_Lower_YAcute_Click: 
tag="&yacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Lower_YUmlaut_Click
*/
Special_Lower_YUmlaut_Click: 
tag="&yuml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Manuscript_Paragraph_Click
*/
Special_Manuscript_Paragraph_Click: 
Call Insert_Tag "MLE_1","&para;",0
return

/*:VRX         Special_Manuscript_Section_Click
*/
Special_Manuscript_Section_Click: 
Call Insert_Tag "MLE_1","&sect;",0
return

/*:VRX         Special_Math_12_Click
*/
Special_Math_12_Click: 
Call Insert_Tag "MLE_1","&frac12;",0
return

/*:VRX         Special_Math_14_Click
*/
Special_Math_14_Click: 
Call Insert_Tag "MLE_1","&frac14;",0
return

/*:VRX         Special_Math_34_Click
*/
Special_Math_34_Click: 
Call Insert_Tag "MLE_1","&frac34;",0
return

/*:VRX         Special_Math_Cubed_Click
*/
Special_Math_Cubed_Click: 
Call Insert_Tag "MLE_1","&sup3;",0
return

/*:VRX         Special_Math_Degree_Click
*/
Special_Math_Degree_Click: 
Call Insert_Tag "MLE_1","&deg;",0
return

/*:VRX         Special_Math_Divide_Click
*/
Special_Math_Divide_Click: 
Call Insert_Tag "MLE_1","&divide;",0
return

/*:VRX         Special_Math_Micron_Click
*/
Special_Math_Micron_Click: 
Call Insert_Tag "MLE_1","&micro;",0
return

/*:VRX         Special_Math_Multiply_Click
*/
Special_Math_Multiply_Click: 
Call Insert_Tag "MLE_1","&times;",0
return

/*:VRX         Special_Math_PlusMinus_Click
*/
Special_Math_PlusMinus_Click: 
Call Insert_Tag "MLE_1","&plusmn;",0
return

/*:VRX         Special_Math_Squared_Click
*/
Special_Math_Squared_Click: 
Call Insert_Tag "MLE_1","&sup2;",0
return

/*:VRX         Special_NBSpace_Click
*/
Special_NBSpace_Click: 
tag="&nbsp;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Registered_Click
*/
Special_Registered_Click: 
Call Insert_Tag "MLE_1","&reg;",0
return

/*:VRX         Special_Upper_AAcute_Click
*/
Special_Upper_AAcute_Click: 
tag="&Aacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_ACircumflex_Click
*/
Special_Upper_ACircumflex_Click: 
tag="&Acirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_AEDiphthong_Click
*/
Special_Upper_AEDiphthong_Click: 
tag="&AElig;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_AGrave_Click
*/
Special_Upper_AGrave_Click: 
tag="&Agrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_ARing_Click
*/
Special_Upper_ARing_Click: 
tag="&Aring;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_ATilde_Click
*/
Special_Upper_ATilde_Click: 
tag="&Atilde;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_AUmlaut_Click
*/
Special_Upper_AUmlaut_Click: 
tag="&Auml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_CCedilla_Click
*/
Special_Upper_CCedilla_Click: 
tag="&Ccedil;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_EAcute_Click
*/
Special_Upper_EAcute_Click: 
tag="&Eacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_ECircumflex_Click
*/
Special_Upper_ECircumflex_Click: 
tag="&Ecirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_EGrave_Click
*/
Special_Upper_EGrave_Click: 
tag="&Egrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_Eth_Click
*/
Special_Upper_Eth_Click: 
tag="&ETH;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_EUmlaut_Click
*/
Special_Upper_EUmlaut_Click: 
tag="&Euml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_IAcute_Click
*/
Special_Upper_IAcute_Click: 
tag="&Iacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_ICircumflex_Click
*/
Special_Upper_ICircumflex_Click: 
tag="&Icirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_IGrave_Click
*/
Special_Upper_IGrave_Click: 
tag="&Igrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_IUmlaut_Click
*/
Special_Upper_IUmlaut_Click: 
tag="&Iuml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_NTilde_Click
*/
Special_Upper_NTilde_Click: 
tag="&Ntilde;"
Call Insert¥
Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OAcute_Click
*/
Special_Upper_OAcute_Click: 
tag="&Oacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OCircumflex_Click
*/
Special_Upper_OCircumflex_Click: 
tag="&Ocirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OGrave_Click
*/
Special_Upper_OGrave_Click: 
tag="&Ograve;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OSlash_Click
*/
Special_Upper_OSlash_Click: 
tag="&Oslash;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OTilde_Click
*/
Special_Upper_OTilde_Click: 
tag="&Otilde;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_OUmlaut_Click
*/
Special_Upper_OUmlaut_Click: 
tag="&Ouml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_Thorn_Click
*/
Special_Upper_Thorn_Click: 
tag="&THORN;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_UAcute_Click
*/
Special_Upper_UAcute_Click: 
tag="&Uacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_UCircumflex_Click
*/
Special_Upper_UCircumflex_Click: 
tag="&Ucirc;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_UGrave_Click
*/
Special_Upper_UGrave_Click: 
tag="&Ugrave;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_UUmlaut_Click
*/
Special_Upper_UUmlaut_Click: 
tag="&Uuml;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         Special_Upper_YAcute_Click
*/
Special_Upper_YAcute_Click: 
tag="&Yacute;"
Call Insert_Tag "MLE_1",tag,0
return

/*:VRX         StatusUpdate
*/
StatusUpdate: 
Parse Arg PostString
Msg=VRInfo("LintMessage")
If Msg<>"" then 
    Msg=Msg||PostString
Else
    Msg=PostString
If RingReadOnly.CurrentRingFile=1 then Do
    ReadOnlyStatus=" (Read Only)"
    End
Else Do
    ReadOnlyStatus=""
    End
NLines=VRMethod("MLE_1","QueryLineCount")
Position=VRGet("MLE_1","SelectedStart")
tmp=translate(SubStr(VRGet("MLE_1","Value"),1,Position), '          1')
LineNumber = words(tmp)+1
If FileName="" then
    FN="<untitled>"
Else
    FN=FileName
If VRGet("Options_Menu_WordWrap","Checked")=1 then 
    Msg=FN Msg
Else
    Msg="Line" LineNumber "of" NLines "in" FN||ReadOnlyStatus Msg

rc=VRSet("MainWindow","StatusText",Space(Msg))
return

/*:VRX         Table_ALIGN_Click
*/
Table_ALIGN_Click: 
Select 
   When VRGet("Table_ALIGN_LEFT_Button","Set")=1 then
        Value="left"
   When VRGet("Table_ALIGN_RIGHT_Button","Set")=1 then
        Value="right"
   When VRGet("Table_ALIGN_CENTER_Button","Set")=1 then
        Value="center"
   When VRGet("Table_ALIGN_JUSTIFY_Button","Set")=1 then
        Value="justify"
   When VRGet("Table_ALIGN_DECIMAL_Button","Set")=1 then
        Value="decimal"
   Otherwise
        Value=""
End /* Select */
obj="MLE_1"
tag=" align="||Value
Call Insert_Tag obj,tag,0
return

/*:VRX         Table_BORDER_Click
*/
Table_BORDER_Click: 
obj="MLE_1"
tag=" BORDER"
Call Insert_Tag obj,tag,0

return

/*:VRX         Table_COLSPAN_Click
*/
Table_COLSPAN_Click: 
Value=VRGet("Table_COLSPAN_Entry","Value")
obj="MLE_1"
tag=" COLSPAN="||Value
Call Insert_Tag obj,tag,0

return

/*:VRX         Table_ROWSPAN_Click
*/
Table_ROWSPAN_Click: 
Value=VRGet("Table_ROWSPAN_Entry","Value")
obj="MLE_1"
tag=" ROWSPAN="||Value
Call Insert_Tag obj,tag,0

return

/*:VRX         Table_TD_Click
*/
Table_TD_Click: 
obj="MLE_1"
tag="<td></td>"
Call Insert_Tag obj,tag,5

return

/*:VRX         Table_TH_Click
*/
Table_TH_Click: 
obj="MLE_1"
tag="<th></th>"
Call Insert_Tag obj,tag,5

return

/*:VRX         Table_TR_Click
*/
Table_TR_Click: 
obj="MLE_1"
tag="<tr></tr>"
Call Insert_Tag obj,tag,5

return

/*:VRX         Tables_Close
*/
Tables_Close: 
    call Tables_Fini
return

/*:VRX         Tables_Create
*/
Tables_Create: 
    call Tables_Init
return

/*:VRX         Tables_Fini
*/
Tables_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         Tables_Init
*/
Tables_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         Tags_Menu_Address_Click
*/
Tags_Menu_Address_Click:
Call TB_ADD_Click
return

/*:VRX         Tags_Menu_Anchor_Click
*/
Tags_Menu_Anchor_Click:
Call TB_ANC_Click
return

/*:VRX         Tags_Menu_Background_Click
*/
Tags_Menu_Background_Click: 
Call VRLoadSecondary "Background"
return

/*:VRX         Tags_Menu_BlockQuote_Click
*/
Tags_Menu_BlockQuote_Click:
Call TB_BQ_Click
return

/*:VRX         Tags_Menu_Bold_Click
*/
Tags_Menu_Bold_Click:
Call TB_BLD_Click
return

/*:VRX         Tags_Menu_Center_Click
*/
Tags_Menu_Center_Click: 
Call TB_CTR_Click
return

/*:VRX         Tags_Menu_Cite_Click
*/
Tags_Menu_Cite_Click: 
obj='MLE_1'
tag='<cite></cite>'
Call Insert_Tag obj,tag,7

return

/*:VRX         Tags_Menu_Code_Click
*/
Tags_Menu_Code_Click: 
obj='MLE_1'
tag='<code></code>'
Call Insert_Tag obj,tag,7

return

/*:VRX         Tags_Menu_Definition_Click
*/
Tags_Menu_Definition_Click: 
obj='MLE_1'
tag='<dfn></dfn>'
Call Insert_Tag obj,tag,6

return

/*:VRX         Tags_Menu_DescriptiveList_Click
*/
Tags_Menu_DescriptiveList_Click:
Call TB_DL_Click
return

/*:VRX         Tags_Menu_DescriptiveListDescription_Click
*/
Tags_Menu_DescriptiveListDescription_Click:
Call TB_DD_Click
return

/*:VRX         Tags_Menu_DescriptiveListTitle_Click
*/
Tags_Menu_DescriptiveListTitle_Click:
Call TB_DT_Click
return

/*:VRX         Tags_Menu_Directory_Click
*/
Tags_Menu_Directory_Click:
Call TB_DIR_Click
return

/*:VRX         Tags_Menu_Document_Body_Click
*/
Tags_Menu_Document_Body_Click: 
obj='MLE_1'
tag='<body></body>'
Call Insert_Tag obj,tag,7

return

/*:VRX         Tags_Menu_Document_Head_Click
*/
Tags_Menu_Document_Head_Click: 
obj='MLE_1'
tag='<head></head>'
Call Insert_Tag obj,tag,7

return

/*:VRX         Tags_Menu_Document_HTML_Click
*/
Tags_Menu_Document_HTML_Click: 
obj='MLE_1'
tag='<html></html>'
Call Insert_Tag obj,tag,7

return

/*:VRX         Tags_Menu_Document_Title_Click
*/
Tags_Menu_Document_Title_Click:
obj='MLE_1'
tag='<title></title>'
Call Insert_Tag obj,tag,8

return

/*:VRX         Tags_Menu_Emphasis_Click
*/
Tags_Menu_Emphasis_Click: 
Call TB_EMP_Click
return

/*:VRX         Tags_Menu_FixedWidth_Click
*/
Tags_Menu_FixedWidth_Click: 
Call TB_TT_Click
return

/*:VRX         Tags_Menu_Font_Click
*/
Tags_Menu_Font_Click: 
obj='MLE_1'
Buttons.0=2
Default=1
Buttons.1="Ok"
Esc=2
Buttons.Esc="Cancel"
Contents="12"
rc=VRPrompt(VRWindow(),"Enter the font size:","Contents","Font Tag","Buttons.",Default,Esc)
If rc<>0 then do
    tag="<font size="||Contents||">"||crlf||crlf||"</font>"
    Call Insert_Tag obj,tag,9
End
return

/*:VRX         Tags_Menu_Forms_Click
*/
Tags_Menu_Forms_Click: 
Call VRLoadSecondary "Forms"
return

/*:VRX         Tags_Menu_Heading1_Click
*/
Tags_Menu_Heading1_Click:
Call TB_H1_Click
return

/*:VRX         Tags_Menu_Heading2_Click
*/
Tags_Menu_Heading2_Click:
Call TB_H2_Click
return

/*:VRX         Tags_Menu_Heading3_Click
*/
Tags_Menu_Heading3_Click:
Call TB_H3_Click
return

/*:VRX         Tags_Menu_Heading4_Click
*/
Tags_Menu_Heading4_Click:
Call TB_H4_Click
return

/*:VRX         Tags_Menu_Heading5_Click
*/
Tags_Menu_Heading5_Click:
Call TB_H5_Click
return

/*:VRX         Tags_Menu_Heading6_Click
*/
Tags_Menu_Heading6_Click:
Call TB_H6_Click
return

/*:VRX         Tags_Menu_Images_Click
*/
Tags_Menu_Images_Click: 
Call TB_IMG_Click
return

/*:VRX         Tags_Menu_Italic_Click
*/
Tags_Menu_Italic_Click:
Call TB_ITL_Click
return

/*:VRX         Tags_Menu_LineBreak_Click
*/
Tags_Menu_LineBreak_Click:
Call TB_LB_Click
return

/*:VRX         Tags_Menu_ListItem_Click
*/
Tags_Menu_ListItem_Click:
Call TB_LI_Click
return

/*:VRX         Tags_Menu_NumberedList_Click
*/
Tags_Menu_NumberedList_Click:
Call TB_OL_Click
return

/*:VRX         Tags_Menu_Paragraph_Click
*/
Tags_Menu_Paragraph_Click:
Call TB_P_Click
return

/*:VRX         Tags_Menu_PreformattedText_Click
*/
Tags_Menu_PreformattedText_Click:
Call TB_PRE_Click
return

/*:VRX         Tags_Menu_SeparatorLine_Click
*/
Tags_Menu_SeparatorLine_Click:
Call TB_HR_Click
return

/*:VRX         Tags_Menu_Strong_Click
*/
Tags_Menu_Strong_Click: 
obj='MLE_1'
tag='<strong></strong>'
Call Insert_Tag obj,tag,9
return

/*:VRX         Tags_Menu_Tables_Click
*/
Tags_Menu_Tables_Click: 
obj="MLE_1"
tag="<table>"||crlf||crlf||"</table>"
Call Insert_Tag obj,tag,9
Call VRLoadSecondary "Tables"

return

/*:VRX         Tags_Menu_Underline_Click
*/
Tags_Menu_Underline_Click: 
Call TB_U_Click
return

/*:VRX         Tags_Menu_UnnumberedList_Click
*/
Tags_Menu_UnnumberedList_Click:
Call TB_UL_Click
return

/*:VRX         TargetEntry_Change
*/
TargetEntry_Change: 
rc=VRGet("TargetEntry","Value")
If length(rc)=0 then do
    Call VRSet "FindButton","Enabled",0
    End
Else Do
    Call VRSet "FindButton","Enabled",1
    End
return

/*:VRX         TB_ADD1_Click
*/
TB_ADD1_Click: 
obj="MLE_1"
tag="<address></address>"
Call Insert_Tag obj,tag,10
return

/*:VRX         TB_ADD1_ContextMenu
*/
TB_ADD1_ContextMenu: 
rc=VRMethod("TB_ADD1","InvokeHelp")
return

/*:VRX         TB_ADD_Click
*/
TB_ADD_Click: 
obj="MLE_1"
tag="<address></address>"
Call Insert_Tag obj,tag,10
return

/*:VRX         TB_ADD_ContextMenu
*/
TB_ADD_ContextMenu: 
rc=VRMethod("TB_ADD","InvokeHelp")
return

/*:VRX         TB_ANC1_Click
*/
TB_ANC1_Click: 
Call VRLoadSecondary "Anchors","Wait"
return

/*:VRX         TB_ANC_Click
*/
TB_ANC_Click: 
Call VRLoadSecondary "Anchors","Wait"
return

/*:VRX         TB_BLD1_Click
*/
TB_BLD1_Click: 
obj='MLE_1'
tag='<b></b>'
Call Insert_Tag obj,tag,4
return

/*:VRX         TB_BLD1_ContextMenu
*/
TB_BLD1_ContextMenu: 
rc=VRMethod("TB_BLD1","InvokeHelp")
return

/*:VRX         TB_BLD_Click
*/
TB_BLD_Click: 
obj='MLE_1'
tag='<b></b>'
Call Insert_Tag obj,tag,4
return

/*:VRX         TB_BLD_ContextMenu
*/
TB_BLD_ContextMenu: 
rc=VRMethod("TB_BLD","InvokeHelp")
return

/*:VRX         TB_BQ1_Click
*/
TB_BQ1_Click: 
obj="MLE_1"
tag="<blockquote></blockquote>"
Call Insert_Tag obj,tag,13
return

/*:VRX         TB_BQ1_ContextMenu
*/
TB_BQ1_ContextMenu: 
rc=VRMethod("TB_BQ1","InvokeHelp")
return

/*:VRX         TB_BQ_Click
*/
TB_BQ_Click: 
obj="MLE_1"
tag="<blockquote></blockquote>"
Call Insert_Tag obj,tag,13
return

/*:VRX         TB_BQ_ContextMenu
*/
TB_BQ_ContextMenu: 
rc=VRMethod("TB_BQ","InvokeHelp")
return

/*:VRX         TB_CTR1_Click
*/
TB_CTR1_Click: 
obj="MLE_1"
tag='<center></center>'
Call Insert_Tag obj, tag, 9

return

/*:VRX         TB_CTR_Click
*/
TB_CTR_Click: 
obj="MLE_1"
tag='<center></center>'
Call Insert_Tag obj, tag, 9

return

/*:VRX         TB_DD1_Click
*/
TB_DD1_Click: 
obj="MLE_1"
tag="<dd></dd>"
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_DD1_ContextMenu
*/
TB_DD1_ContextMenu: 
rc=VRMethod("TB_DD1","InvokeHelp")
return

/*:VRX         TB_DD_Click
*/
TB_DD_Click: 
obj="MLE_1"
tag="<dd></dd>"
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_DD_ContextMenu
*/
TB_DD_ContextMenu: 
rc=VRMethod("TB_DD","InvokeHelp")
return

/*:VRX         TB_DIR1_Click
*/
TB_DIR1_Click: 
obj="MLE_1"
tag="<dir></dir>"
Call Insert_Tag obj,tag,6
return

/*:VRX         TB_DIR1_ContextMenu
*/
TB_DIR1_ContextMenu: 
rc=VRMethod("TB_DIR1","InvokeHelp")
return

/*:VRX         TB_DIR_Click
*/
TB_DIR_Click: 
obj="MLE_1"
tag="<dir></dir>"
Call Insert_Tag obj,tag,6
return

/*:VRX         TB_DIR_ContextMenu
*/
TB_DIR_ContextMenu: 
rc=VRMethod("TB_DIR","InvokeHelp")
return

/*:VRX         TB_DL1_Click
*/
TB_DL1_Click: 
obj='MLE_1'
tag='<dl>'||CR_LF||CR_LF||'</dl>'
Call Insert_Tag obj,tag,6
return

/*:VRX         TB_DL1_ContextMenu
*/
TB_DL1_ContextMenu: 
rc=VRMethod("TB_DL1","InvokeHelp")
return

/*:VRX         TB_DL_Click
*/
TB_DL_Click: 
obj='MLE_1'
tag='<dl>'||CR_LF||CR_LF||'</dl>'
Call Insert_Tag obj,tag,6
return

/*:VRX         TB_DL_ContextMenu
*/
TB_DL_ContextMenu: 
rc=VRMethod("TB_DL","InvokeHelp")
return

/*:VRX         TB_DT1_Click
*/
TB_DT1_Click: 
obj="MLE_1"
tag="<dt></dt>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_DT1_ContextMenu
*/
TB_DT1_ContextMenu: 
rc=VRMethod("TB_DT1","InvokeHelp")
return

/*:VRX         TB_DT_Click
*/
TB_DT_Click: 
obj="MLE_1"
tag="<dt></dt>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_DT_ContextMenu
*/
TB_DT_ContextMenu: 
rc=VRMethod("TB_DT","InvokeHelp")
return

/*:VRX         TB_EMP1_Click
*/
TB_EMP1_Click: 
obj='MLE_1'
tag='<em></em>'
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_EMP1_ContextMenu
*/
TB_EMP1_ContextMenu: 
rc=VRMethod("TB_EMP1","InvokeHelp")
return

/*:VRX         TB_EMP_Click
*/
TB_EMP_Click: 
obj='MLE_1'
tag='<em></em>'
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_EMP_ContextMenu
*/
TB_EMP_ContextMenu: 
rc=VRMethod("TB_EMP","InvokeHelp")
return

/*:VRX         TB_H11_Click
*/
TB_H11_Click: 
obj="MLE_1"
tag="<h1></h1>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H1_Click
*/
TB_H1_Click: 
obj="MLE_1"
tag="<h1></h1>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H1_ContextMenu
*/
TB_H1_ContextMenu: 
rc=VRMethod("TB_H1","InvokeHelp")
return

/*:VRX         TB_H21_Click
*/
TB_H21_Click: 
obj="MLE_1"
tag="<h2></h2>"
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_H2_Click
*/
TB_H2_Click: 
obj="MLE_1"
tag="<h2></h2>"
Call Insert_Tag obj,tag,5

return

/*:VRX         TB_H2_ContextMenu
*/
TB_H2_ContextMenu: 
rc=VRMethod("TB_H2","InvokeHelp")
return

/*:VRX         TB_H31_Click
*/
TB_H31_Click: 
obj="MLE_1"
tag="<h3></h3>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H3_Click
*/
TB_H3_Click: 
obj="MLE_1"
tag="<h3></h3>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H3_ContextMenu
*/
TB_H3_ContextMenu: 
rc=VRMethod("TB_H3","InvokeHelp")
return

/*:VRX         TB_H41_Click
*/
TB_H41_Click: 
obj="MLE_1"
tag="<h4></h4>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H4_Click
*/
TB_H4_Click: 
obj="MLE_1"
tag="<h4></h4>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H4_ContextMenu
*/
TB_H4_ContextMenu: 
rc=VRMethod("TB_H4","InvokeHelp")
return

/*:VRX         TB_H51_Click
*/
TB_H51_Click: 
obj="MLE_1"
tag="<h5></h5>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H5_Click
*/
TB_H5_Click: 
obj="MLE_1"
tag="<h5></h5>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H5_ContextMenu
*/
TB_H5_ContextMenu: 
rc=VRMethod("TB_H5","InvokeHelp")
return

/*:VRX         TB_H61_Click
*/
TB_H61_Click: 
obj="MLE_1"
tag="<h6></h6>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H6_Click
*/
TB_H6_Click: 
obj="MLE_1"
tag="<h6></h6>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_H6_ContextMenu
*/
TB_H6_ContextMenu: 
rc=VRMethod("TB_H6","InvokeHelp")
return

/*:VRX         TB_HR1_Click
*/
TB_HR1_Click: 
obj="MLE_1"
tag="<hr>"||CR_LF
Call Insert_Tag obj,tag,0
return

/*:VRX         TB_HR_Click
*/
TB_HR_Click: 
obj="MLE_1"
tag="<hr>"||CR_LF
Call Insert_Tag obj,tag,0
return

/*:VRX         TB_IMG1_Click
*/
TB_IMG1_Click: 
Call VRLoadSecondary "Images","Wait"
return

/*:VRX         TB_IMG_Click
*/
TB_IMG_Click: 
Call VRLoadSecondary "Images","Wait"
return

/*:VRX         TB_ITL1_Click
*/
TB_ITL1_Click: 
obj='MLE_1'
tag='<i></i>'
Call Insert_Tag obj,tag,4
return

/*:VRX         TB_ITL1_ContextMenu
*/
TB_ITL1_ContextMenu: 
rc=VRMethod("TB_ITL1","InvokeHelp")
return

/*:VRX         TB_ITL_Click
*/
TB_ITL_Click: 
obj='MLE_1'
tag='<i></i>'
Call Insert_Tag obj,tag,4
return

/*:VRX         TB_ITL_ContextMenu
*/
TB_ITL_ContextMenu: 
rc=VRMethod("TB_ITL","InvokeHelp")
return

/*:VRX         TB_LB1_Click
*/
TB_LB1_Click: 
Call TB_LB_Click
return

/*:VRX         TB_LB1_ContextMenu
*/
TB_LB1_ContextMenu: 
rc=VRMethod("TB_LB1","InvokeHelp")
return

/*:VRX         TB_LB_Click
*/
TB_LB_Click: 
obj="MLE_1"
tag="<br>"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd then 
    Call Insert_Tag obj,tag,0
Else 
Do   /* Text was selected so insert <br> tags */
    Txt=VRGet("MLE_1","SelectedText")
    rc=VRMethod("MLE_1","Clear")
    If VRFileExists("wiz.tmp") then
        rc=VRDeleteFile("wiz.tmp")
    rc=LINEOUT("wiz.tmp",Txt)
    rc=Lineout("wiz.tmp")
    i=0
    Do While Lines("wiz.tmp")
        i=i+1
        FileLines.i=Linein("wiz.tmp")
    End
    FileLines.0=i
    FileText=""
    ptag="<br>"
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        ptag  = Translate(ptag)
    Do i=1 to FileLines.0
            If FileLines.i="" then do 
                n=Length(FileText)
                If n>4 then 
                    If Translate(Substr(FileText,n-4,3))<>"<BR>" then 
                        FileLines.i=ptag
            End
            If Substr(FileLines.i,1,1)=" " | Substr(FileLines.i,1,1)=d2c(9) then do
                n=Length(FileText)
                If n>4 then do
                    If Translate(Substr(FileText,n-4,3))<>"<BR>" then 
                        FileText=FileText||ptag||CR_LF
                End
            End
            FileText=FileText||FileLines.i||CR_LF
    End
    rc=VRMethod("MLE_1","Insert",FileText)
    Drop FileLines.
    Drop FileText
    Drop Txt
    If VRFileExists("wiz.tmp") then
        rc=VRDeleteFile("wiz.tmp")
End
return

/*:VRX         TB_LB_ContextMenu
*/
TB_LB_ContextMenu: 
rc=VRMethod("TB_LB","InvokeHelp")
return

/*:VRX         TB_LI1_Click
*/
TB_LI1_Click: 
obj="MLE_1"
tag="<li></li>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_LI_Click
*/
TB_LI_Click: 
obj="MLE_1"
tag="<li></li>"
Call Insert_Tag obj,tag,5
return

/*:VRX         TB_LI_ContextMenu
*/
TB_LI_ContextMenu: 
rc=VRMethod("TB_LI","InvokeHelp")
return

/*:VRX         TB_OL1_Click
*/
TB_OL1_Click: 
obj='MLE_1'
tag="<ol>"||crlf||"</ol>"
Back=6
Call InsertOL
Call VRMethod "MLE_1", "SetFocus"
return

/*:VRX         TB_OL1_ContextMenu
*/
TB_OL1_ContextMenu: 
rc=VRMethod("TB_OL1","InvokeHelp")
return

/*:VRX         TB_OL_Click
*/
TB_OL_Click: 
obj='MLE_1'
tag="<ol>"||crlf||"</ol>"
Back=6
Call InsertOL
Call VRMethod "MLE_1", "SetFocus"
return

/*:VRX         TB_OL_ContextMenu
*/
TB_OL_ContextMenu: 
rc=VRMethod("TB_OL","InvokeHelp")
return

/*:VRX         TB_P1_Click
*/
TB_P1_Click: 
Call TB_P_Click
return

/*:VRX         TB_P1_ContextMenu
*/
TB_P1_ContextMenu: 
rc=VRMethod("TB_P1","InvokeHelp")
return

/*:VRX         TB_P_Click
*/
TB_P_Click: 
obj="MLE_1"
tag="<p>"
SelStart=VRGet(obj,"SelectedStart")
SelEnd=VRGet(obj,"SelectedEnd")
If SelStart=SelEnd then
        Call Insert_Tag obj,tag,0
Else 
Do   /* Text was selected so insert <P> tags */
    Txt=VRGet("MLE_1","SelectedText")
    rc=VRMethod("MLE_1","Clear")
    If VRFileExists("wiz.tmp") then
        rc=VRDeleteFile("wiz.tmp")
    rc=LINEOUT("wiz.tmp",Txt)
    rc=Lineout("wiz.tmp")
    i=0
    Do While Lines("wiz.tmp")
        i=i+1
        FileLines.i=Linein("wiz.tmp")
    End
    FileLines.0=i
    FileText=""
    ptag="<p>"
    If VRGet("Options_Menu_Uppercase","Checked")=1 then
        ptag  = Translate(ptag)
    Do i=1 to FileLines.0
            If FileLines.i="" then do 
                n=Length(FileText)
                If n>4 then 
                    If Translate(Substr(FileText,n-4,3))<>"<P>" then 
                        FileLines.i=ptag
            End
            If Substr(FileLines.i,1,1)=" " | Substr(FileLines.i,1,1)=d2c(9) then do
                n=Length(FileText)
                If n>4 then do
                    If Translate(Substr(FileText,n-4,3))<>"<P>" then 
                        FileText=FileText||ptag||CR_LF
                End
            End
            FileText=FileText||FileLines.i||CR_LF
    End
    rc=VRMethod("MLE_1","Insert",FileText)
    Drop FileLines.
    Drop FileText
    Drop Txt
    If VRFileExists("wiz.tmp") then
        rc=VRDeleteFile("wiz.tmp")
End
return

/*:VRX         TB_P_ContextMenu
*/
TB_P_ContextMenu: 
rc=VRMethod("TB_P","InvokeHelp")
return

/*:VRX         TB_PRE1_Click
*/
TB_PRE1_Click: 
obj='MLE_1'
tag='<pre>'||CR_LF||CR_LF||'</pre>'
Call Insert_Tag obj,tag,7
return

/*:VRX         TB_PRE1_ContextMenu
*/
TB_PRE1_ContextMenu: 
rc=VRMethod("TB_PRE1","InvokeHelp")
return

/*:VRX         TB_PRE_Click
*/
TB_PRE_Click: 
obj='MLE_1'
tag='<pre>'||CR_LF||CR_LF||'</pre>'
Call Insert_Tag obj,tag,7
return

/*:VRX         TB_PRE_ContextMenu
*/
TB_PRE_ContextMenu: 
rc=VRMethod("TB_PRE","InvokeHelp")
return

/*:VRX         TB_T1_Click
*/
TB_T1_Click: 
obj="MLE_1"
tag="<strong></strong>"
Call Insert_Tag obj,tag,9
return

/*:VRX         TB_T_Click
*/
TB_T_Click: 
obj="MLE_1"
tag="<strong></strong>"
Call Insert_Tag obj,tag,9
return

/*:VRX         TB_TT1_Click
*/
TB_TT1_Click: 
obj="MLE_1"
tag='<tt></tt>'
Call Insert_Tag obj, tag, 5

return

/*:VRX         TB_TT_Click
*/
TB_TT_Click: 
obj="MLE_1"
tag='<tt></tt>'
Call Insert_Tag obj, tag, 5

return

/*:VRX         TB_U1_Click
*/
TB_U1_Click: 
obj="MLE_1"
tag='<U></U>'
Call Insert_Tag obj, tag, 4

return

/*:VRX         TB_U_Click
*/
TB_U_Click: 
obj="MLE_1"
tag='<U></U>'
Call Insert_Tag obj, tag, 4

return

/*:VRX         TB_UL1_Click
*/
TB_UL1_Click: 
obj='MLE_1'
Back=6
Call InsertUL
Call VRMethod "MLE_1","SetFocus"
return

/*:VRX         TB_UL1_ContextMenu
*/
TB_UL1_ContextMenu: 
rc=VRMethod("TB_UL1","InvokeHelp")
return

/*:VRX         TB_UL_Click
*/
TB_UL_Click: 
obj='MLE_1'
Back=6
Call InsertUL
Call VRMethod "MLE_1","SetFocus"
return

/*:VRX         TB_UL_ContextMenu
*/
TB_UL_ContextMenu: 
rc=VRMethod("TB_UL","InvokeHelp")
return

/*:VRX         TB_UT10_Click
*/
TB_UT10_Click: 
Call Insert_Tag "MLE_1",UserTag.10,UserTagBack.10
return

/*:VRX         TB_UT10_ContextMenu
*/
TB_UT10_ContextMenu: 
TagNumber=10
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT10B_Click
*/
TB_UT10B_Click: 
Call Insert_Tag "MLE_1",UserTag.10,UserTagBack.10
return

/*:VRX         TB_UT10B_ContextMenu
*/
TB_UT10B_ContextMenu: 
TagNumber=10
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT11_Click
*/
TB_UT11_Click: 
Call Insert_Tag "MLE_1",UserTag.11,UserTagBack.11
return

/*:VRX         TB_UT11_ContextMenu
*/
TB_UT11_ContextMenu: 
TagNumber=11
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT11B_Click
*/
TB_UT11B_Click: 
Call Insert_Tag "MLE_1",UserTag.11,UserTagBack.11
return

/*:VRX         TB_UT11B_ContextMenu
*/
TB_UT11B_ContextMenu: 
TagNumber=11
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT12_Click
*/
TB_UT12_Click: 
Call Insert_Tag "MLE_1",UserTag.12,UserTagBack.12
return

/*:VRX         TB_UT12_ContextMenu
*/
TB_UT12_ContextMenu: 
TagNumber=12
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT12B_Click
*/
TB_UT12B_Click: 
Call Insert_Tag "MLE_1",UserTag.12,UserTagBack.12
return

/*:VRX         TB_UT12B_ContextMenu
*/
TB_UT12B_ContextMenu: 
TagNumber=12
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT13B_Click
*/
TB_UT13B_Click: 
Call Insert_Tag "MLE_1",UserTag.13,UserTagBack.13
return

/*:VRX         TB_UT13B_ContextMenu
*/
TB_UT13B_ContextMenu: 
TagNumber=13
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT14B_Click
*/
TB_UT14B_Click: 
Call Insert_Tag "MLE_1",UserTag.14,UserTagBack.14
return

/*:VRX         TB_UT14B_ContextMenu
*/
TB_UT14B_ContextMenu: 
TagNumber=14
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT1_Click
*/
TB_UT1_Click: 
Call Insert_Tag "MLE_1",UserTag.1,UserTagBack.1
return

/*:VRX         TB_UT1_ContextMenu
*/
TB_UT1_ContextMenu: 
TagNumber=1
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT1B_Click
*/
TB_UT1B_Click: 
Call Insert_Tag "MLE_1",UserTag.1,UserTagBack.1
return

/*:VRX         TB_UT1B_ContextMenu
*/
TB_UT1B_ContextMenu: 
TagNumber=1
Call VRLoadSecondary("UserTags")
return

/*:VRX         TB_UT2_Click
*/
TB_UT2_Click: 
Call Insert_Tag "MLE_1",UserTag.2,UserTagBack.2

return

/*:VRX         TB_UT2_ContextMenu
*/
TB_UT2_ContextMenu: 
TagNumber=2
Call VRLoadSecondary("UserTags")
return

/*:VRX         TB_UT2B_Click
*/
TB_UT2B_Click: 
Call Insert_Tag "MLE_1",UserTag.2,UserTagBack.2

return

/*:VRX         TB_UT2B_ContextMenu
*/
TB_UT2B_ContextMenu: 
TagNumber=2
Call VRLoadSecondary("UserTags")
return

/*:VRX         TB_UT3_Click
*/
TB_UT3_Click: 
Call Insert_Tag "MLE_1",UserTag.3,UserTagBack.3

return

/*:VRX         TB_UT3_ContextMenu
*/
TB_UT3_ContextMenu: 
TagNumber=3
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT3B_Click
*/
TB_UT3B_Click: 
Call Insert_Tag "MLE_1",UserTag.3,UserTagBack.3

return

/*:VRX         TB_UT3B_ContextMenu
*/
TB_UT3B_ContextMenu: 
TagNumber=3
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT4_Click
*/
TB_UT4_Click: 
Call Insert_Tag "MLE_1",UserTag.4,UserTagBack.4
return

/*:VRX         TB_UT4_ContextMenu
*/
TB_UT4_ContextMenu: 
TagNumber=4
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT4B_Click
*/
TB_UT4B_Click: 
Call Insert_Tag "MLE_1",UserTag.4,UserTagBack.4
return

/*:VRX         TB_UT4B_ContextMenu
*/
TB_UT4B_ContextMenu: 
TagNumber=4
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT5_Click
*/
TB_UT5_Click: 
Call Insert_Tag "MLE_1",UserTag.5,UserTagBack.5
return

/*:VRX         TB_UT5_ContextMenu
*/
TB_UT5_ContextMenu: 
TagNumber=5
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT5B_Click
*/
TB_UT5B_Click: 
Call Insert_Tag "MLE_1",UserTag.5,UserTagBack.5
return

/*:VRX         TB_UT5B_ContextMenu
*/
TB_UT5B_ContextMenu: 
TagNumber=5
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT6_Click
*/
TB_UT6_Click: 
Call Insert_Tag "MLE_1",UserTag.6,UserTagBack.6
return

/*:VRX         TB_UT6_ContextMenu
*/
TB_UT6_ContextMenu: 
TagNumber=6
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT6B_Click
*/
TB_UT6B_Click: 
Call Insert_Tag "MLE_1",UserTag.6,UserTagBack.6
return

/*:VRX         TB_UT6B_ContextMenu
*/
TB_UT6B_ContextMenu: 
TagNumber=6
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT7_Click
*/
TB_UT7_Click: 
Call Insert_Tag "MLE_1",UserTag.7,UserTagBack.7
return

/*:VRX         TB_UT7_ContextMenu
*/
TB_UT7_ContextMenu: 
TagNumber=7
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT7B_Click
*/
TB_UT7B_Click: 
Call Insert_Tag "MLE_1",UserTag.7,UserTagBack.7
return

/*:VRX         TB_UT7B_ContextMenu
*/
TB_UT7B_ContextMenu: 
TagNumber=7
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT8_Click
*/
TB_UT8_Click: 
Call Insert_Tag "MLE_1",UserTag.8,UserTagBack.8
return

/*:VRX         TB_UT8_ContextMenu
*/
TB_UT8_ContextMenu: 
TagNumber=8
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT8B_Click
*/
TB_UT8B_Click: 
Call Insert_Tag "MLE_1",UserTag.8,UserTagBack.8
return

/*:VRX         TB_UT8B_ContextMenu
*/
TB_UT8B_ContextMenu: 
TagNumber=8
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT9_Click
*/
TB_UT9_Click: 
Call Insert_Tag "MLE_1",UserTag.9,UserTagBack.9
return

/*:VRX         TB_UT9_ContextMenu
*/
TB_UT9_ContextMenu: 
TagNumber=9
Call VRLoadSecondary("UserTags")

return

/*:VRX         TB_UT9B_Click
*/
TB_UT9B_Click: 
Call Insert_Tag "MLE_1",UserTag.9,UserTagBack.9
return

/*:VRX         TB_UT9B_ContextMenu
*/
TB_UT9B_ContextMenu: 
TagNumber=9
Call VRLoadSecondary("UserTags")

return

/*:VRX         TEXTAREA_Select_Click
*/
TEXTAREA_Select_Click: 
/* Disable other items */
Call VRSet "INPUT_NAME_Entry","Enabled",0
Call VRSet "INPUT_VALUE_Entry","Enabled",0
Call VRSet "INPUT_SIZE_Entry","Enabled",0
Call VRSet "INPUT_MAX_Entry","Enabled",0
Call VRSet "GB_2","Enabled",0
Call VRSet "FORM_ACTION_Entry","Enabled",0
/* Enable TEXTAREA fields */
Call VRSet "TEXTAREA_NAME_Entry","Enabled",1
Call VRSet "TEXTAREA_ROWS_Entry","Enabled",1
Call VRSet "TEXTAREA_COLS_Entry","Enabled",1

return

/*:VRX         TextColorButton_Click
*/
TextColorButton_Click: 
Parse Var TextColor "(" BGR "," BGG "," BGB ")"
rc=VRSet("RedSpin","Value",BGR)
rc=VRSet("GreenSpin","Value",BGG)
rc=VRSet("BlueSpin","Value",BGB)

return

/*:VRX         TM_1_Trigger
*/
TM_1_Trigger: 
Call StatusUpdate
return

/*:VRX         ToolBar_Close
*/
ToolBar_Close: 
    call ToolBar_Fini
return

/*:VRX         ToolBar_Create
*/
ToolBar_Create: 
    call ToolBar_Init
If ToolBarHorizCreated=1 then do
    Call PositionWindows
    Call VRSet "MainWindow","Visible",1
    rc=VRMethod("Application","StartThread","ReadUser", IniFile)
    /* Call ReadUserTags */
    FileIsDirty=-1
    End
Else
    ToolBarCreated=1
If Grab=1 then do
   rc=VRMethod("MLE_1","SetFocus")
End

return

/*:VRX         ToolBar_Fini
*/
ToolBar_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         ToolBar_Init
*/
ToolBar_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
    end
    drop window
If TagBarOrient=1 then do
    Call VRSet "Options_Menu_Tagbar","Checked",1
    Call VRSet "Toolbar", "Visible",\HideTagbar
    End
IgnoreResize=0
return

/*:VRX         ToolBarHoriz_Close
*/
ToolBarHoriz_Close: 
    call ToolBarHoriz_Fini
return

/*:VRX         ToolBarHoriz_Create
*/
ToolBarHoriz_Create: 
    call ToolBarHoriz_Init
If ToolBarCreated=1 then do
    Call PositionWindows
    Call VRSet "MainWindow","Visible",0
    rc=VRMethod("Application","StartThread","ReadUser", IniFile)
    /* Call ReadUserTags */
    FileIsDirty=-1
    End
Else
    ToolBarHorizCreated=1
If Grab=1 then do
   rc=VRMethod("MLE_1","SetFocus")
End

return

/*:VRX         ToolBarHoriz_Fini
*/
ToolBarHoriz_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         ToolBarHoriz_Init
*/
ToolBarHoriz_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
    end
    drop window
If TagBarOrient=0 then do
    Call VRSet "Options_Menu_Tagbar","Checked",0
    Call VRSet "ToolbarHoriz", "Visible",\HideTagbar
    End
IgnoreResize=0
return

/*:VRX         UpdateRecall
*/
UpdateRecall: 
/* Updates list of most recently edited files */
If Recall.1=FileName | FileName="" then Return
Do i=2 to 5
    If Recall.i=FileName Then Do
        Call ShiftRecall i
        Return
    End
End
Do i=5 to 2 by -1
    k=i-1
    Recall.i=Recall.k
    If Recall.i<>"" then do
       rc=VRSet("FileMenuRecall"||i,"Caption",Recall.i)
       rc=VRSet("FileMenuRecall"||i,"Visible",1)
    End
End
Recall.1=FileName
rc=VRSet("FileMenuRecall"||i,"Caption",Recall.1)
rc=VRSet("FileMenuRecall"||i,"Visible",1)
rc=VRSet("MItem_18","Visible",1)
return

/*:VRX         UpdateUserTag
*/
UpdateUserTag: 
rc=VRMethod("Application","GetVar","ITag")
rc=VRMethod("Application","GetVar","TagName")
TagName2=TagName||"B"
If ITag<=12 then do
    rc=VRSet(TagName,"HintText",UserTagHint.ITag)
    rc=VRSet(TagName,"Caption",UserTagAbbrev.ITag)
End
rc=VRSet(TagName2,"HintText",UserTagHint.ITag)
rc=VRSet(TagName2,"Caption",UserTagAbbrev.ITag)

return

/*:VRX         UserTags_Close
*/
UserTags_Close: 
    call UserTags_Fini
return

/*:VRX         UserTags_Create
*/
UserTags_Create: 
    call UserTags_Init
return

/*:VRX         UserTags_Fini
*/
UserTags_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         UserTags_Init
*/
UserTags_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
If UserTagHint.TagNumber="USERTAGHINT." then UserTagHint.TagNumber=""
Call VRSet "UT_Hint_Entry","Value",UserTagHint.TagNumber
If UserTag.TagNumber="USERTAG." then UserTag.TagNumber=""
Call VRSet "UT_Tag_Entry","Value",UserTag.TagNumber
If UserTagAbbrev.Tagnumber="USERTAGABBREV." then UserTagAbbrev.Tagnumber=""
Call VRSet "UT_Tag_Entry","Value",UserTag.TagNumber
Call VRSet "UT_Abbrev_Entry","Value",UserTagAbbrev.Tagnumber
return

/*:VRX         UT_CancelButton_Click
*/
UT_CancelButton_Click: 
Call UserTags_Fini
return

/*:VRX         UT_SaveButton_Click
*/
UT_SaveButton_Click: 
/* Get insertion point for pasted text */
SelStart=VRGet("UT_Tag_Entry","SelectedStart")
i=TagNumber
UserTag.i=VRGet("UT_Tag_Entry","Value")
UserTagBack.i=Length(UserTag.i)-SelStart+1
UserTagHint.i=VRGet("UT_Hint_Entry","Value")
UserTagAbbrev.i=VRGet("UT_Abbrev_Entry","Value")
rc=VRSetIni("User Tag" TagNumber,"Hint",UserTagHint.i,IniFile,"NoClose")
rc=VRSetIni("User Tag" TagNumber,"Tag",UserTag.i,IniFile,"NoClose")
rc=VRSetIni("User Tag" TagNumber,"Back",UserTagBack.i,IniFile)
rc=VRSetIni("User Tag" TagNumber,"Abbrev",UserTagAbbrev.i,IniFile)
TagName="TB_UT"||i
TagName2="TB_UT"||i||"B"
If i<=12 then Do
    Call VRSet TagName,"HintText",UserTagHint.i
    Call VRSet TagName,"Caption",UserTagAbbrev.i
End
Call VRSet TagName2,"HintText",UserTagHint.i
Call VRSet TagName2,"Caption",UserTagAbbrev.i
Call UserTags_Fini
return

/*:VRX         VLinkColorButton_Click
*/
VLinkColorButton_Click: 
Parse Var VLinkColor "(" BGR "," BGG "," BGB ")"
rc=VRSet("RedSpin","Value",BGR)
rc=VRSet("GreenSpin","Value",BGG)
rc=VRSet("BlueSpin","Value",BGB)

return

/*:VRX         VS_1_Click
*/
VS_1_Click: 
VSIndex=VRGet("VS_1","Selected")
Color=ValueSetColor.VSIndex
Parse Var Color "(" R "," G "," B ")"
rc=VRSet("RedSPin","Value",R)
rc=VRSet("GreenSPin","Value",G)
rc=VRSet("BlueSPin","Value",B)
Call BGSpinUpdate
return

/*:VRX         VS_1_ContextMenu
*/
VS_1_ContextMenu: 
R=VRGet("RedSPin","Value")
G=VRGet("GreenSPin","Value")
B=VRGet("BlueSPin","Value")
VSIndex=VRGet("VS_1","Selected")
ValueSetColor.VSIndex="("||R||","||G||","||B||")"
rc=VRMethod("VS_1","SetAttributes","Values","ValueSetColor.")
rc=VRSetIni("BackgroundWindow","Color"||VSIndex,ValueSetColor.VSIndex,IniFile)
 
return

/*:VRX         WLResponse_Close
*/
WLResponse_Close: 
    call WLResponse_Fini
return

/*:VRX         WLResponse_Create
*/
WLResponse_Create: 
    call WLResponse_Init
rc=VRMethod("Application","GetVar","WLResponse.")
txt=""
Do wi=1 to WLResponse.0
   txt=txt||WLResponse.wi||crlf||crlf
End
If txt="" then txt="No errors were found in the HTML document."
rc=VRSet("MLE_2","Value",txt)
drop txt
Drop WLResponse.
return

/*:VRX         WLResponse_Fini
*/
WLResponse_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         WLResponse_Init
*/
WLResponse_Init: 
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

