Pod::Spec.new do |s|
  s.name             = "Executorch"
  s.version          = "0.1.0"
  s.author           = { 'Cat' => 'a599231042@gmail.com' }
  s.license          = { :type => "BSD" }
  s.homepage         = "https://docs.pytorch.org/executorch/stable/index.html"
#   s.source           = { :path => '.' }
  s.source           = { :git => 'httpshttps://github.com/cat-x/Executorch_Pod', :tag => '0.1.0' }
  s.summary          = "The executorch library for iOS"
  s.description      = "The executorch library for iOS."
  s.platforms        = { :ios => "14.0" }
  s.default_subspecs = "Core"

  s.user_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => '$(inherited) "$(PODS_ROOT)/Executorch/install/include/"',
    "OTHER_LDFLAGS" => '$(inherited) -force_load "$(PODS_ROOT)/Executorch/install/lib/libexecutorch_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libbackend_coreml_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libbackend_mps_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libbackend_xnnpack_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libkernels_optimized_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libkernels_quantized_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libkernels_custom_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libkernels_portable_ios.a"',
#      "OTHER_LDFLAGS" => '-force_load "$(PODS_ROOT)/Executorch/install/lib/libbackend_coreml_ios.a" -force_load "$(PODS_ROOT)/Executorch/install/lib/libexecutorch_ios.a"',
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    "CLANG_ENABLE_OBJC_WEAK" => "YES",
    "GCC_C_LANGUAGE_STANDARD" => "c17",
    "CLANG_CXX_LIBRARY" => "libc++"
#    "OTHER_CPLUSPLUSFLAGS" => "-std=c++17 -stdlib=libc++"
  }

  s.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => '$(inherited) "$(PODS_ROOT)/Executorch/install/include/"',
    "VALID_ARCHS" => "x86_64 arm64"
  }

#  s.libraries = ["c++", "stdc++", "sqlite3"]
  s.libraries = ["sqlite3"]
  s.frameworks = ["Accelerate", "Metal", "MetalPerformanceShaders", "MetalPerformanceShadersGraph", "CoreML"]

  s.subspec "Core" do |ss|
    ss.dependency "Executorch/Torch"
    ss.source_files = "src/*.{h,cpp,c,cc}"
#     ss.public_header_files = ["src/Executorch.h"]
    ss.public_header_files = [
      "src/Executorch.h",
#       "install/include/executorch/ExecuTorchError.h",
#       "install/include/executorch/ExecuTorchLog.h",
#       "install/include/executorch/ExecuTorchModule.h",
#       "install/include/executorch/ExecuTorchTensor.h",
#       "install/include/executorch/ExecuTorchValue.h"
    ]
#    ss.compiler_flags = '-std=c++17'
  end

  s.subspec "Torch" do |ss|
    ss.header_mappings_dir = "install/include/"
    ss.preserve_paths = "install/include/**/*.{h,cpp,cc,c}"
    ss.vendored_libraries = "install/lib/*.a"
#     ss.libraries = ["c++", "stdc++", "sqlite3"]
    ss.libraries = ["sqlite3"]
#    ss.frameworks = ["Accelerate", "Metal", "MetalPerformanceShaders", "MetalPerformanceShadersGraph", "CoreML"]
#    ss.compiler_flags = '-std=c++17'
  end
end