require "appium_capybara"

desired_caps_android_chrome = {
  platform:        "android",
  deviceName:      "simulator",
  platformName:    "Android",
  # platformVersion: "6.0", # usar somente se souber a versao exata do sistema
  browserName: "Chrome"
}

desired_caps_android_app = {
  platform:        "android",
  deviceName:      "simulator",
  platformName:    "Android",
  # platformVersion: "6.0", # usar somente se souber a versao exata do sistema
  appActivity:     "com.android.calculator2.Calculator", # obter informacao usando APK Info ou outro app
  appPackage:      "com.android.calculator2"
}

url = "http://localhost:4723/wd/hub" # or a sauce labs url

Capybara.register_driver(:appium) do |app|
    appium_lib_options = {
      server_url:           url
    }
    all_options = {
      appium_lib:  appium_lib_options,
      caps:        desired_caps_android_chrome #definir qual tipo de dispositivo e se é app ou navegador a ser testado
    }
    Appium::Capybara::Driver.new app, all_options
end

Capybara.default_driver = :appium
