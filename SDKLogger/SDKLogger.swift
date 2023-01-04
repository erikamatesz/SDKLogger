//
//  SDKLogger.swift
//  SDKLogger
//
//  Created by Erika C. Matesz Bueno on 04/01/23.
//

import Foundation
import os.log

public enum LogType {
    case `default`
    case error
    case info
    case request
    case response
    case warn
}

public final class SDKLogger {

    public init() {}

    public static func log(_ message: String, prefix: String = ":::") {
        generateLog(message: message, prefix: prefix)
    }

    public static func error(_ message: String, prefix: String = ":::") {
        generateLog(message: message, type: .error, prefix: prefix)
    }

    public static func info(_ message: String, prefix: String = ":::") {
        generateLog(message: message, type: .info, prefix: prefix)
    }

    public static func request(_ urlString: String, prefix: String = ":::") {
        generateLog(message: "URL: \(urlString)", type: .request, prefix: prefix)
    }

    public static func request(_ url: URL, prefix: String = ":::") {
        let url = "\(url.absoluteString)"
        request(url, prefix: prefix)
    }

    public static func response(_ url: String, statusCode: Int, prefix: String = ":::") {
        generateLog(message: "Request for URL \(url) got a \(statusCode) status code.", type: .response, prefix: prefix)
    }

    public static func warn(_ message: String, prefix: String = ":::") {
        generateLog(message: message, type: .warn, prefix: prefix)
    }

    public static func dump(_ object: Any, prefix: String = ":::") {
        Swift.dump(object, name: "\(prefix) 🟪 [DUMP]")
    }

    public static func items(of array: [Any], prefix: String = ":::") {
        array.forEach { item in
            print("\(prefix) 🟠 [ITEM]: \(item)")
        }
    }

    private static func generateLog(message: String, type: LogType = .default, prefix: String) {
        var symbol = ""
        var tag = ""

        switch type {
        case .default:
            symbol = "⬜️"
            tag = "LOG"
        case .error:
            symbol = "❌"
            tag = "ERROR"
        case .info:
            symbol = "🟦"
            tag = "INFO"
        case .request:
            symbol = "⤴️"
            tag = "REQUEST"
        case .response:
            symbol = "⤵️"
            tag = "RESPONSE"
        case .warn:
            symbol = "⚠️"
            tag = "WARNING"
        }

        os_log("%@ %@ [%@]: %@", log: .default, type: .default, prefix, symbol, tag, message)
    }

}
