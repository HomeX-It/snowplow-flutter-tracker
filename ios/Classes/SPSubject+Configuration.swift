//
//  SPSubject+Configuration.swift
//  snowplow_flutter_tracker
//
//  Created by DanielDPeter on 07.04.21.
//

import SnowplowTracker

extension SPSubject {
    func configure(with configuration: [String: Any]) {
        if configuration["platformContext"] as? Bool ?? false, getPlatformDict()?.getAsDictionary()?.isEmpty ?? true {
            setPlatformDict()
        }

        if configuration["geoContext"] as? Bool ?? false,
           getGeoLocationDict()?.isEmpty ?? true {
            setGeoDict()
        }

        if let userId = configuration["userId"] as? String {
            setUserId(userId)
        }

        if let viewportWidth = configuration["viewportWidth"] as? Int,
           let viewportHeight = configuration["viewportHeight"] as? Int {
            setViewPortWithWidth(viewportWidth,andHeight: viewportHeight)
        }

        if let screenResolutionWidth = configuration["screenResolutionWidth"] as? Int,
           let screenResolutionHeight = configuration["screenResolutionHeight"] as? Int {
            setResolutionWithWidth(screenResolutionWidth, andHeight: screenResolutionHeight)
        }

        if let colorDepth = configuration["colorDepth"] as? Int {
            setColorDepth(colorDepth)
        }

        if let timezone = configuration["timezone"] as? String {
            setTimezone(timezone)
        }

        if let language = configuration["language"] as? String {
            setLanguage(language)
        }

        if let ipAddress = configuration["ipAddress"] as? String {
            setIpAddress(ipAddress)
        }

        if let userAgent = configuration["userAgent"] as? String {
            setUseragent(userAgent)
        }

        if let networkUserId = configuration["networkUserId"] as? String {
            setNetworkUserId(networkUserId)
        }

        if let domainUserId = configuration["domainUserId"] as? String {
            setDomainUserId(domainUserId)
        }
    }
}
