//
//  Extension+Date.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension Date {
    public func convertToDayOfWeekShort() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    public func convertToDayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    public func convertToHourMinuteAmPm() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    public func convertToHourMinute() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: self)
    }
    
    public func convertToDayMonthYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    
    public func convertToDayShortMonth() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        return dateFormatter.string(from: self)
    }
    
    public func convertToDayShortMonthYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    public func convertToFullDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.string(from: self)
    }
    
    public func convertTo(format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    public func timeAgoSince() -> String {
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        if let year = components.year, year >= 2 {
            return "\(year) " + "years ago"
        }
        
        if let year = components.year, year >= 1 {
            return "Last year"
        }
        
        if let month = components.month, month >= 2 {
            return "\(month) " + "months ago"
        }
        
        if let month = components.month, month >= 1 {
            return "Last month"
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week) " + "weeks ago"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "Last week"
        }
        
        if let day = components.day, day >= 2 {
            return "\(day) " + "days ago"
        }
        
        if let day = components.day, day >= 1 {
            return "Yesterday"
        }
        
        if let hour = components.hour, hour >= 2 {
            return "\(hour) " + "hours ago"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "An hour ago"
        }
        
        if let minute = components.minute, minute >= 2 {
            return "\(minute) " + "minutes ago"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "A minute ago"
        }
        
        if let second = components.second, second >= 3 {
            return "\(second) " + "seconds ago"
        }
        
        return "Just now"
    }
}
