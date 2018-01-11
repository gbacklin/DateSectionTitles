/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 Custom class for the Event entity.
 The timeStamp and title are persistent attributes; the sectionIdentifier is transient and derived from timeStamp.
 * timeStamp is the date on which the event occurred.
 * title is displayed in the table view rows.
 When the default data is created in the application delegate, the title is initialized to a string representation of the date.
 * sectionIdentifier is used to divide the events into sections in the table view.
 sectionIdentifier is a string value representing the number ((year * 1000) + month). Using this value, events can be correctly ordered and grouped regardless of the actual name of the month. It is calculated and cached on demand in the custom accessor method.
 */

import Foundation
import CoreData


extension APLEvent {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<APLEvent> {
        return NSFetchRequest<APLEvent>(entityName: "APLEvent")
    }
    
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var title: String?
    
    @objc dynamic var sectionIdentifier: String? {
        /*
         Sections are organized by month and year. Create the section identifier as a string representing the number (year * 1000) + month; this way they will be correctly ordered chronologically regardless of the actual name of the month.
         */
        let calendar: Calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .month, .year], from: timestamp! as Date)
        let timeValue = dateComponents.year!*1000 + dateComponents.month!
        let tmp = "\(timeValue)"
        
        return tmp
    }
    
    
}
