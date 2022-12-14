import Foundation

@main
enum IncBuildNumber {
    static func main() {
        
        guard let infoFile = ProcessInfo.processInfo
            .environment["INFOPLIST_FILE"]
        else {
            return
        }
        guard let projectDir = ProcessInfo.processInfo.environment["SRCROOT"] else {
            return
        }
        
        if var dict = NSDictionary(contentsOfFile:
                                    projectDir + "/" + infoFile) as? [String: Any] {
            guard
                let currentVersionString = dict["CFBundleShortVersionString"]
                    as? String,
                let currentBuildNumberString = dict["CFBundleVersion"] as? String,
                let currentBuildNumber = Int(currentBuildNumberString)
            else {
                return
            }
            
            dict["CFBundleVersion"] = "\(currentBuildNumber + 1)"
            
            if ProcessInfo.processInfo.environment["CONFIGURATION"] == "Release"
                || ProcessInfo.processInfo.environment["IS_BIG_UPDATE"] == "YES" {
                var versionComponents = currentVersionString
                    .components(separatedBy: ".")
                let lastComponent = (Int(versionComponents.last ?? "1") ?? 1)
                versionComponents[versionComponents.endIndex - 1] =
                "\(lastComponent + 1)"
                dict["CFBundleShortVersionString"] = versionComponents
                    .joined(separator: ".")
            }
            
            (dict as NSDictionary).write(
                toFile: projectDir + "/" + infoFile,
                atomically: true)
        }
    }
}

