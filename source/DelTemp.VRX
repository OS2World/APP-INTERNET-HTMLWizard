/*:VRX         Main
*/
Main:
    signal on halt
Parse Arg Path
rc=VRDeleteFile(Path||"\wiz*.htm")

exit

/*:VRX         Halt
*/
Halt:

exit

