#
# Be sure to run `pod lib lint ffmpeg-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ffmpeg-iOS'
  s.version          = '0.1.1'
  s.summary          = '自编译iOS平台ffmepg'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
自编译ffmpeg4.3.1版本, 内置libx264视频编码器, fdk-aac音频编码器;
                       DESC

  s.homepage         = 'https://github.com/1650479430@qq.com/ffmpeg-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1650479430@qq.com' => 'derainzhou@gmail.com' }
  s.source           = { :git => 'https://github.com/ZDerain/ffmpeg-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  # 仅支持arm64
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64' }
  s.static_framework = true
  
  s.swift_version = '5.0'
  
  # 添加x264
  s.subspec 'x264' do |x|
    x.source_files = 'ffmpeg-iOS/x264/include/**/*'
    x.public_header_files = 'ffmpeg-iOS/x264/include/**/*.h'
    x.header_mappings_dir = 'ffmpeg-iOS/x264/include'

    
    x.vendored_libraries = [
    'ffmpeg-iOS/x264/lib/libx264.a'
    ]
    
  end
  
  # 添加fdk-aac
  s.subspec 'fdk-aac' do |d|
    d.source_files = 'ffmpeg-iOS/fdk-aac/include/**/*'
    d.public_header_files = 'ffmpeg-iOS/fdk-aac/include/**/*.h'
    d.header_mappings_dir = 'ffmpeg-iOS/fdk-aac/include'

    d.vendored_libraries = [
    'ffmpeg-iOS/fdk-aac/lib/libfdk-aac.a'
    ]
  end

  # 添加ffmpeg
  s.subspec 'ffmpeg' do |f|
    
    f.public_header_files = 'ffmpeg-iOS/ffmpeg/include/**/*.h'
    f.header_mappings_dir = 'ffmpeg-iOS/ffmpeg/include'
    
    f.subspec 'libavdevice' do |libavdevice|
        libavdevice.source_files = 'ffmpeg-iOS/ffmpeg/include/libavdevice/*'
    end

    f.subspec 'libavfilter' do |libavfilter|
        libavfilter.source_files = 'ffmpeg-iOS/ffmpeg/include/libavfilter/*'
    end

    f.subspec 'libavformat' do |libavformat|
        libavformat.source_files = 'ffmpeg-iOS/ffmpeg/include/libavformat/*'
    end

    f.subspec 'libavutill' do |libavutil|
        libavutil.source_files = 'ffmpeg-iOS/ffmpeg/include/libavutil/*'
    end

    f.subspec 'libpostproc' do |libpostproc|
        libpostproc.source_files = 'ffmpeg-iOS/ffmpeg/include/libpostproc/*'
    end

    f.subspec 'libswresample' do |libswresample|
        libswresample.source_files = 'ffmpeg-iOS/ffmpeg/include/libswresample/*'
    end

    f.subspec 'libswscale' do |libswscale|
        libswscale.source_files = 'ffmpeg-iOS/ffmpeg/include/libswscale/*'
    end

    f.subspec 'libavcodec' do |libavcodec|
        libavcodec.source_files = 'ffmpeg-iOS/ffmpeg/include/libavcodec/*'
    end

    f.vendored_libraries = [
    'ffmpeg-iOS/ffmpeg/lib/libavcodec.a',
    'ffmpeg-iOS/ffmpeg/lib/libavdevice.a',
    'ffmpeg-iOS/ffmpeg/lib/libavfilter.a',
    'ffmpeg-iOS/ffmpeg/lib/libavformat.a',
    'ffmpeg-iOS/ffmpeg/lib/libavutil.a',
    'ffmpeg-iOS/ffmpeg/lib/libpostproc.a',
    'ffmpeg-iOS/ffmpeg/lib/libswresample.a',
    'ffmpeg-iOS/ffmpeg/lib/libswscale.a',
    ]
  end
  
  # 导入系统库
  s.libraries = 'iconv', 'bz2', 'z'
  s.frameworks = 'AudioToolBox', 'CoreMedia', 'VideoToolBox', 'AVFoundation'
end
