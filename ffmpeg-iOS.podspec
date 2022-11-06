#
# Be sure to run `pod lib lint ffmpeg-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ffmpeg-iOS'
  s.version          = '0.1.3'
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
  
  s.preserve_paths = ['ffmpeg-iOS/Module/module.modulemap', 'ffmpeg-iOS/Module/ffmpeg_iOS.h']
  s.pod_target_xcconfig = {
    # 路径根据实际情况进行引用，必须保证路径是正确的
    'SWIFT_INCLUDE_PATHS' => ['$(PODS_ROOT)/fmpeg-iOS/Module', '$(PODS_TARGET_SRCROOT)/fmpeg-iOS/Module']
  }
  
  # 添加x264
  s.subspec 'x264' do |x|
    x.source_files = 'ffmpeg-iOS/Sources/x264/include/**/*'
    x.private_header_files = 'ffmpeg-iOS/Sources/x264/include/x264/x264.h'
    x.header_mappings_dir = 'ffmpeg-iOS/Sources/x264/include'
    
    x.vendored_libraries = [
    'ffmpeg-iOS/Sources/x264/lib/libx264.a'
    ]
    
  end
  
  # 添加fdk-aac
  s.subspec 'fdk-aac' do |d|
    d.source_files = 'ffmpeg-iOS/Sources/fdk-aac/include/**/*'
    d.private_header_files = 'ffmpeg-iOS/Sources/fdk-aac/include/fdk-aac/*.h'
    d.header_mappings_dir = 'ffmpeg-iOS/Sources/fdk-aac/include'

    d.vendored_libraries = [
    'ffmpeg-iOS/Sources/fdk-aac/lib/libfdk-aac.a'
    ]
  end

  # 添加ffmpeg
  s.subspec 'ffmpeg' do |f|
    
    f.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/*.h'
    f.header_mappings_dir = 'ffmpeg-iOS/Sources/ffmpeg/include'
    
    f.subspec 'libavdevice' do |libavdevice|
        libavdevice.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavdevice/*'
        libavdevice.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavdevice/avdevice.h'
    end

    f.subspec 'libavfilter' do |libavfilter|
        libavfilter.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavfilter/*'
        libavfilter.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavfilter/avfilter.h'
    end

    f.subspec 'libavformat' do |libavformat|
        libavformat.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavformat/*'
        libavformat.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavformat/avformat.h'
    end

    f.subspec 'libavutil' do |libavutil|
        libavutil.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavutil/*'
        libavutil.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavutil/avutil.h'
    end

    f.subspec 'libpostproc' do |libpostproc|
        libpostproc.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libpostproc/*'
        libpostproc.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libpostproc/postprocess.h'
    end

    f.subspec 'libswresample' do |libswresample|
        libswresample.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libswresample/*'
        libswresample.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libswresample/swresample.h'
    end

    f.subspec 'libswscale' do |libswscale|
        libswscale.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libswscale/*'
        libswscale.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libswscale/swscale.h'
    end

    f.subspec 'libavcodec' do |libavcodec|
        libavcodec.source_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavcodec/*'
        libavcodec.public_header_files = 'ffmpeg-iOS/Sources/ffmpeg/include/libavcodec/avcodec.h'
    end

    f.vendored_libraries = [
    'ffmpeg-iOS/Sources/ffmpeg/lib/libavcodec.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libavdevice.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libavfilter.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libavformat.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libavutil.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libpostproc.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libswresample.a',
    'ffmpeg-iOS/Sources/ffmpeg/lib/libswscale.a',
    ]
  end
  
  # 导入系统库
  s.libraries = 'iconv', 'bz2', 'z'
  s.frameworks = 'AudioToolBox', 'CoreMedia', 'VideoToolBox', 'AVFoundation'
end
