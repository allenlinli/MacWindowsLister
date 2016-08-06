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


 //TODO: understand CGWindowListOption,
 
import Cocoa

class _QueueItem<T> {
    let value: T!
    var next: _QueueItem?
    
    init(_ newvalue: T?) {
        self.value = newvalue
    }
}

public class Queue<T> {
    
    public typealias Element = T
    
    var _front: _QueueItem<Element>
    var _back: _QueueItem<Element>
    
    public init () {
        // Insert dummy item. Will disappear when the first item is added.
        _back = _QueueItem(nil)
        _front = _back
    }
    
    /// Add a new item to the back of the queue.
    public func enqueue (value: Element) {
        _back.next = _QueueItem(value)
        _back = _back.next!
    }
    
    /// Return and remove the item at the front of the queue.
    public func dequeue () -> Element? {
        if let newhead = _front.next {
            _front = newhead
            return newhead.value
        } else {
            return nil
        }
    }
    
    public func isEmpty() -> Bool {
        return _front === _back
    }
}
///////////////////////////////////////////////////////////////////////////////////////

var queue = Queue<String>()



let options = CGWindowListOption(arrayLiteral: CGWindowListOption.OptionAll)
let windowListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
let infoList = windowListInfo as NSArray? as? [[String: AnyObject]]

//// MARK: Print the key window


//var keyWindowMessage = "the key window is windowID:\(keyWindow.)"
//print("the key window is windowID: ")

func findSubWindows(withID windowID: Int)
{
    // FIXME:only get NSWindow?
    let nsWindow = NSApp.windowWithWindowNumber(windowID)
    let windowTitle = cgwindow!.title
    if 
    
    print("process name:\(processName)")
    NSApp windowWithWindowNumber:windowNumber].
    if let lChildWindows = window.childWindows
    {
        for subWindow in lChildWindows
        {
            findSubWindows(subWindow)
        }
    }
}


if let lInfoList = infoList
{
    for windowDic in lInfoList
    {
        let processID = String(windowDic[kCGWindowOwnerPID as String])
        findSubWindows(processID)
        
        
    }
}




//
//for obj in infoList!
//{
//    print(obj.dynamicType)
//}



// should be an inner class of Queue, but inner classes and generics crash the compiler, SourceKit (repeatedly) and occasionally XCode.


///
/// A standard queue (FIFO - First In First Out). Supports simultaneous adding and removing, but only one item can be added at a time, and only one item can be removed at a time.
///
