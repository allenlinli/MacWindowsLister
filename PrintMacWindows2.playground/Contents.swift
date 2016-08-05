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

//find all the cgWindows
let options = CGWindowListOption(arrayLiteral: CGWindowListOption.OptionAll)
let cgWindowListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
let cgWindowListInfo2 = cgWindowListInfo as NSArray? as? [[String: AnyObject]]

//find the active app process id
let frontMostAppID = Int(NSWorkspace.sharedWorkspace().frontmostApplication!.processIdentifier)

// MARK: anser area begin
for windowDic in cgWindowListInfo2!
{
    var title = windowDic["kCGWindowName"] as? String
    if title?.characters.count == 0
    {
        title = nil
    }
    
    //    var printString = "window: "+ title + ", processID:" + String(processID)
    var printString = "Window: "
    if let title2 = title
    {
        printString += "title: \(title2), "
    }
    
    
    let processID = windowDic["kCGWindowNumber"] as! Int
    printString += "process name: " + String(processID)
    
    
    let ownerProcessID = windowDic["kCGWindowOwnerPID"] as! Int
    if frontMostAppID == ownerProcessID
    {
        printString += ", is an active window"
    }
    
    print(printString)
    
}
