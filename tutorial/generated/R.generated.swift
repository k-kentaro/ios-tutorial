//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `QiitaClient`.
    static let qiitaClient = _R.storyboard.qiitaClient()
    /// Storyboard `StandFM`.
    static let standFM = _R.storyboard.standFM()
    /// Storyboard `StyleHaus`.
    static let styleHaus = _R.storyboard.styleHaus()
    /// Storyboard `UserDefaults`.
    static let userDefaults = _R.storyboard.userDefaults()
    /// Storyboard `YouTube`.
    static let youTube = _R.storyboard.youTube()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "QiitaClient", bundle: ...)`
    static func qiitaClient(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.qiitaClient)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "StandFM", bundle: ...)`
    static func standFM(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.standFM)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "StyleHaus", bundle: ...)`
    static func styleHaus(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.styleHaus)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "UserDefaults", bundle: ...)`
    static func userDefaults(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.userDefaults)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "YouTube", bundle: ...)`
    static func youTube(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.youTube)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 30 images.
  struct image {
    /// Image `STYLEHAUS`.
    static let stylehauS = Rswift.ImageResource(bundle: R.hostingBundle, name: "STYLEHAUS")
    /// Image `STYLEHAUSimage1`.
    static let stylehauSimage1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "STYLEHAUSimage1")
    /// Image `STYLEHAUSimage2`.
    static let stylehauSimage2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "STYLEHAUSimage2")
    /// Image `STYLEHAUSimage3`.
    static let stylehauSimage3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "STYLEHAUSimage3")
    /// Image `YouTubeIcon`.
    static let youTubeIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "YouTubeIcon")
    /// Image `YouTubeThumbnail1`.
    static let youTubeThumbnail1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "YouTubeThumbnail1")
    /// Image `YouTubeThumbnail2`.
    static let youTubeThumbnail2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "YouTubeThumbnail2")
    /// Image `fm-list`.
    static let fmList = Rswift.ImageResource(bundle: R.hostingBundle, name: "fm-list")
    /// Image `fm-plus`.
    static let fmPlus = Rswift.ImageResource(bundle: R.hostingBundle, name: "fm-plus")
    /// Image `fmImage1`.
    static let fmImage1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "fmImage1")
    /// Image `fmImage2`.
    static let fmImage2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "fmImage2")
    /// Image `fmImage3`.
    static let fmImage3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "fmImage3")
    /// Image `fmImage4`.
    static let fmImage4 = Rswift.ImageResource(bundle: R.hostingBundle, name: "fmImage4")
    /// Image `follow`.
    static let follow = Rswift.ImageResource(bundle: R.hostingBundle, name: "follow")
    /// Image `geme`.
    static let geme = Rswift.ImageResource(bundle: R.hostingBundle, name: "geme")
    /// Image `list`.
    static let list = Rswift.ImageResource(bundle: R.hostingBundle, name: "list")
    /// Image `live`.
    static let live = Rswift.ImageResource(bundle: R.hostingBundle, name: "live")
    /// Image `music`.
    static let music = Rswift.ImageResource(bundle: R.hostingBundle, name: "music")
    /// Image `news`.
    static let news = Rswift.ImageResource(bundle: R.hostingBundle, name: "news")
    /// Image `pixlr-bg-result`.
    static let pixlrBgResult = Rswift.ImageResource(bundle: R.hostingBundle, name: "pixlr-bg-result")
    /// Image `plus`.
    static let plus = Rswift.ImageResource(bundle: R.hostingBundle, name: "plus")
    /// Image `shadow`.
    static let shadow = Rswift.ImageResource(bundle: R.hostingBundle, name: "shadow")
    /// Image `sports`.
    static let sports = Rswift.ImageResource(bundle: R.hostingBundle, name: "sports")
    /// Image `up`.
    static let up = Rswift.ImageResource(bundle: R.hostingBundle, name: "up")
    /// Image `videoView`.
    static let videoView = Rswift.ImageResource(bundle: R.hostingBundle, name: "videoView")
    /// Image `サーチアイコン`.
    static let サーチアイコン = Rswift.ImageResource(bundle: R.hostingBundle, name: "サーチアイコン")
    /// Image `ハート`.
    static let ハート = Rswift.ImageResource(bundle: R.hostingBundle, name: "ハート")
    /// Image `ホームアイコン`.
    static let ホームアイコン = Rswift.ImageResource(bundle: R.hostingBundle, name: "ホームアイコン")
    /// Image `メニュー`.
    static let メニュー = Rswift.ImageResource(bundle: R.hostingBundle, name: "メニュー")
    /// Image `人物アイコン`.
    static let 人物アイコン = Rswift.ImageResource(bundle: R.hostingBundle, name: "人物アイコン")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "STYLEHAUS", bundle: ..., traitCollection: ...)`
    static func stylehauS(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.stylehauS, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "STYLEHAUSimage1", bundle: ..., traitCollection: ...)`
    static func stylehauSimage1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.stylehauSimage1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "STYLEHAUSimage2", bundle: ..., traitCollection: ...)`
    static func stylehauSimage2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.stylehauSimage2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "STYLEHAUSimage3", bundle: ..., traitCollection: ...)`
    static func stylehauSimage3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.stylehauSimage3, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "YouTubeIcon", bundle: ..., traitCollection: ...)`
    static func youTubeIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.youTubeIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "YouTubeThumbnail1", bundle: ..., traitCollection: ...)`
    static func youTubeThumbnail1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.youTubeThumbnail1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "YouTubeThumbnail2", bundle: ..., traitCollection: ...)`
    static func youTubeThumbnail2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.youTubeThumbnail2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fm-list", bundle: ..., traitCollection: ...)`
    static func fmList(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmList, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fm-plus", bundle: ..., traitCollection: ...)`
    static func fmPlus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmPlus, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fmImage1", bundle: ..., traitCollection: ...)`
    static func fmImage1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmImage1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fmImage2", bundle: ..., traitCollection: ...)`
    static func fmImage2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmImage2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fmImage3", bundle: ..., traitCollection: ...)`
    static func fmImage3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmImage3, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fmImage4", bundle: ..., traitCollection: ...)`
    static func fmImage4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fmImage4, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "follow", bundle: ..., traitCollection: ...)`
    static func follow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.follow, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "geme", bundle: ..., traitCollection: ...)`
    static func geme(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.geme, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "list", bundle: ..., traitCollection: ...)`
    static func list(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.list, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "live", bundle: ..., traitCollection: ...)`
    static func live(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.live, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "music", bundle: ..., traitCollection: ...)`
    static func music(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.music, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "news", bundle: ..., traitCollection: ...)`
    static func news(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.news, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pixlr-bg-result", bundle: ..., traitCollection: ...)`
    static func pixlrBgResult(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pixlrBgResult, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "plus", bundle: ..., traitCollection: ...)`
    static func plus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.plus, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "shadow", bundle: ..., traitCollection: ...)`
    static func shadow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.shadow, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sports", bundle: ..., traitCollection: ...)`
    static func sports(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sports, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "up", bundle: ..., traitCollection: ...)`
    static func up(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.up, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "videoView", bundle: ..., traitCollection: ...)`
    static func videoView(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.videoView, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "サーチアイコン", bundle: ..., traitCollection: ...)`
    static func サーチアイコン(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.サーチアイコン, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ハート", bundle: ..., traitCollection: ...)`
    static func ハート(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ハート, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ホームアイコン", bundle: ..., traitCollection: ...)`
    static func ホームアイコン(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ホームアイコン, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "メニュー", bundle: ..., traitCollection: ...)`
    static func メニュー(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.メニュー, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "人物アイコン", bundle: ..., traitCollection: ...)`
    static func 人物アイコン(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.人物アイコン, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 4 nibs.
  struct nib {
    /// Nib `ListTableViewCell`.
    static let listTableViewCell = _R.nib._ListTableViewCell()
    /// Nib `LiveListCell`.
    static let liveListCell = _R.nib._LiveListCell()
    /// Nib `TableViewCell`.
    static let tableViewCell = _R.nib._TableViewCell()
    /// Nib `VideoTableViewCell`.
    static let videoTableViewCell = _R.nib._VideoTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ListTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.listTableViewCell) instead")
    static func listTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.listTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "LiveListCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.liveListCell) instead")
    static func liveListCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.liveListCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.tableViewCell) instead")
    static func tableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.tableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "VideoTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.videoTableViewCell) instead")
    static func videoTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.videoTableViewCell)
    }
    #endif

    static func listTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ListTableViewCell? {
      return R.nib.listTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ListTableViewCell
    }

    static func liveListCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LiveListCell? {
      return R.nib.liveListCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LiveListCell
    }

    static func tableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TableViewCell? {
      return R.nib.tableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TableViewCell
    }

    static func videoTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> VideoTableViewCell? {
      return R.nib.videoTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? VideoTableViewCell
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _ListTableViewCell.validate()
      try _VideoTableViewCell.validate()
    }

    struct _ListTableViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "ListTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ListTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ListTableViewCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "ハート", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ハート' is used in nib 'ListTableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    struct _LiveListCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "LiveListCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LiveListCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LiveListCell
      }

      fileprivate init() {}
    }

    struct _TableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "TableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TableViewCell
      }

      fileprivate init() {}
    }

    struct _VideoTableViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "VideoTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> VideoTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? VideoTableViewCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "pixlr-bg-result", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'pixlr-bg-result' is used in nib 'VideoTableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try qiitaClient.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try standFM.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try styleHaus.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try userDefaults.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try youTube.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "AccentColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'AccentColor' is used in storyboard 'Main', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct qiitaClient: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = QiitaClientViewController

      let bundle = R.hostingBundle
      let name = "QiitaClient"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct standFM: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = StandFMViewController

      let bundle = R.hostingBundle
      let name = "StandFM"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "bell") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'bell' is used in storyboard 'StandFM', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "chevron.backward") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'chevron.backward' is used in storyboard 'StandFM', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "fm-plus", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'fm-plus' is used in storyboard 'StandFM', but couldn't be loaded.") }
        if UIKit.UIImage(named: "follow", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'follow' is used in storyboard 'StandFM', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ホームアイコン", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ホームアイコン' is used in storyboard 'StandFM', but couldn't be loaded.") }
        if UIKit.UIImage(named: "人物アイコン", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '人物アイコン' is used in storyboard 'StandFM', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct styleHaus: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = StyleHausViewController

      let bundle = R.hostingBundle
      let name = "StyleHaus"

      static func validate() throws {
        if UIKit.UIImage(named: "STYLEHAUS", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'STYLEHAUS' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "bell") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'bell' is used in storyboard 'StyleHaus', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "shadow", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'shadow' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if UIKit.UIImage(named: "サーチアイコン", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'サーチアイコン' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ハート", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ハート' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ホームアイコン", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ホームアイコン' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if UIKit.UIImage(named: "メニュー", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'メニュー' is used in storyboard 'StyleHaus', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct userDefaults: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UserDefaultsViewController

      let bundle = R.hostingBundle
      let name = "UserDefaults"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "plus") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'plus' is used in storyboard 'UserDefaults', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct youTube: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = YouTubeViewController

      let bundle = R.hostingBundle
      let name = "YouTube"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "chevron.backward") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'chevron.backward' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "display") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'display' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "geme", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'geme' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "homekit") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'homekit' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "live", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'live' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "magnifyingglass") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'magnifyingglass' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "music", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'music' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if UIKit.UIImage(named: "news", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'news' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if UIKit.UIImage(named: "pixlr-bg-result", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'pixlr-bg-result' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "play.fill") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'play.fill' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "play.rectangle.on.rectangle") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'play.rectangle.on.rectangle' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "play.tv") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'play.tv' is used in storyboard 'YouTube', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "plus", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'plus' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if UIKit.UIImage(named: "sports", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'sports' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if UIKit.UIImage(named: "up", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'up' is used in storyboard 'YouTube', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
