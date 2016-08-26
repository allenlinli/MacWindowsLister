//Write a program in Swift 2.0 for Mac OS X, which lists user's windows (process name, non-empty window title) and marks the active one. The Swift playground version is sufficient.
//
//Deliverables:
//The source code and a short explanation of design choices.
//
//Please provide good quality code: working, succinct, easy to read and understand.
//
//E-mail your deliverables to tomasz@capisce.com.au
//
//Good luck!

import Cocoa

/*
 README:
 The program lists all the window with title, process name, isAcive. 
 
 It's not easy to find the active windows directly. I assume those windows with the "frontmostApplication" are the active windows. I made this assumption because I found out the the windows which ownerProcessID matched "frontmostApplication"'s processID have the correct window title, i.e. "ListMacWindows.playground" in this playground code.
 
 If I want to do it better, I will follow the points list below.
 1. Some windows might have childWindows that were included in my cgWindowListInfo. I would try to get
 all NSWorkspaces, NSApplications to get all the NSWindows to access childWindows.
 2. I thought I need to use Accessibility in Swift, but then I think I don't need it.
 
 
 */


//find all the windows (CGWindows)
let options = CGWindowListOption(arrayLiteral: CGWindowListOption.optionAll)
let cgWindowListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
let cgWindowListInfo2 = cgWindowListInfo as NSArray? as? [[String: AnyObject]]

//find the active apps process id
let frontMostAppID = Int(NSWorkspace.shared().frontmostApplication!.processIdentifier)

for windowDic in cgWindowListInfo2!
{
    var title = windowDic["kCGWindowName"] as? String
    title = (title?.characters.count != 0) ? title : nil
    
    // find windows non-empty title
    var printString = "Window: "
    if let title2 = title
    {
        printString += "title: \(title2), "
    }
    
    // find windows process name
    let processID = windowDic["kCGWindowNumber"] as! Int
    printString += "process name: " + String(processID)
    
    // find ative windows
    let ownerProcessID = windowDic["kCGWindowOwnerPID"] as! Int
    if frontMostAppID == ownerProcessID
    {
        printString += ", is an active window"
    }
    
    print(printString)
}
