/*:VRX         Main
*/
Main:
    signal on halt
Parse Arg ProgramPath FileName .
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Preparing file for transmission to WebLint site...")
/*------------------------------------------------------------------
 * Process the HTML file to send to WebLint
 *------------------------------------------------------------------*/
crlf=d2c(13)||d2c(10)
head="POST /cgi-bin/web-lint HTTP/1.0"||crlf
head=head||"Accept: */*; q=0.300"||crlf
head=head||"Accept: application/octet-stream; q=0.100"||crlf
head=head||"Accept: text/plain"||crlf
head=head||"Accept: text/html"||crlf
head=head||"User-Agent: Dirk Terrell's LintSock v. 1.0"||crlf
head=head||"Content-type: application/x-www-form-urlencoded"||crlf
file=ProgramPath||"\linttemp.txt"
/* Call the encode program */
'@"'||ProgramPath||"\encode"||'"' file "> linttemp.enc"
n=chars("linttemp.enc")
EncodedData=charin("linttemp.enc",,n)
rc=SysFileDelete("linttemp.enc")
rc=SysFileDelete(File)
EncodedData="url=&data="||EncodedData||"&show_source=Yes"
LED=Length(EncodedData)
head=head||"Content-length:" LED||crlf||crlf
data=head||EncodedData
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Connecting to WebLint site...")

/*------------------------------------------------------------------
 * choose port number
 *------------------------------------------------------------------*/
port = 80

/*------------------------------------------------------------------
 * get server name
 *------------------------------------------------------------------*/

server="www.unipress.com"
   rc = SockGetHostByName(server,"host.!")
   if (rc = 0) then
      do
      tmp=" Is the network connection down?"
      rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Could not resolve WebLint IP address!"||tmp)
      exit
      end

   server = host.!addr;
/*---------------------------------------------------------------
 * open socket
 *---------------------------------------------------------------*/
socket  = SockSocket("AF_INET","SOCK_STREAM",0)
if (socket = -1) then
   do
   tmp="Error on SockSocket:" errno
   rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Could not create socket for WebLint connection! "||tmp)
   exit
   end
/*---------------------------------------------------------------
 * connect socket
 *---------------------------------------------------------------*/
server.!family = "AF_INET"
server.!port   = port
server.!addr   = server

rc = SockConnect(socket,"server.!")
if (rc = -1) then
   do
   tmp="Error on SockConnect:" errno
   rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Could not connect to WebLint site! "||tmp)
   Call CloseSock
   exit
   end


/*------------------------------------------------------------------
 * send the data over
 *------------------------------------------------------------------*/
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Sending document to WebLint site...")
rc = SockSend(socket,data)

if (rc = -1) then
   do
   tmp="Error on SockSend:" errno
   rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Error sending document to WebLint site! "||tmp)
   Call CloseSock
   exit
   end

/*------------------------------------------------------------------
 * receive the result from the server
 *------------------------------------------------------------------*/
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Waiting for response from WebLint site...")
File2=ProgramPath||"\lintresp.txt"
rc=SysFileDelete(File2)
 do while SockRecv(socket, 'newdata', 1000) > 0
  call charout File2,newdata
 end

if (rc = -1) then
   do
   tmp="Error on SockRecv:" errno
   rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Error receiving response from WebLint site! "||tmp)
   Call CloseSock
   exit
   end

rc=Stream(File2,"C","Close")
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Processing WebLint response...")
i=0
File3=SysTempFileName(ProgramPath||"\wiz???.htm")
Do While Lines(File2)
   i=i+1
   a=Linein(File2)
   if i>5 then
        rc=Lineout(File3,a)
End
rc=Stream(File2,"C","Close")
rc=SysFileDelete(File2)
rc=Stream(File3,"C","Close")
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Loading response into Web Explorer...")
rc=SELECT_WINDOW("*IBM Web*",5) /* Returns 4 if window not found */
If rc<>0 then do
    /* Web Explorer is not running, so start it */
    rc=START_PROGRAM("explore.exe","-t 4 -Q" file3,ProgramPath)
    if rc<>0 then
        rc=VRMessage("Application","Web Explorer could not be started. Make sure that it is somewhere in your PATH.","Web Explorer Error")
End
Else Do
    /* Web Explorer is running, so just reload */
    rc=SELECT_WINDOW("*IBM Web*",100) /* Returns 4 if window not found */
    rc=KEYBOARD("o","C")
    rc=SELECT_WINDOW("* File",100) /* Returns 4 if window not found */
    rc=KEYBOARD(File3)
    rc=PUSHBUTTON_CLICK("OK")
    End
rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","")
Call CloseSock
exit

/*:VRX         CloseSock
*/
CloseSock: Procedure Expose socket
/*------------------------------------------------------------------
 * close socket (and catch signals)
 *------------------------------------------------------------------*/

rc = SockSoClose(socket)
if (rc = -1) then
   do
   rc=VRMethod("Application","PostQueue",0,1,"Call StatusUpdate","LintMessage","Error closing socket! "||errno)
   exit
   end


return

/*:VRX         Halt
*/
Halt:

exit

