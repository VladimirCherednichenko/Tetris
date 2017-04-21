platform :ios, '10.0'
use_frameworks! 
inhibit_all_warnings!

target "Tetris" do
    pod "FBSDKCoreKit"
    pod "FBSDKShareKit"
    pod "FBSDKLoginKit"
end

post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
end
