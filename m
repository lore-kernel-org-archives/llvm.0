Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5412C9D
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 01:44:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c126-20020a1c9a84000000b00346f9ebee43so13771475wme.4
        for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 17:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=xnq5eBAVPHdODJdap+RjRAXd+8ER/tGm9IqD3oxwEPA=;
        b=yH7JBptKJsI6dTnbIS9+qgU5jHW8/KRTrB/Mjl94kBuPpdH8Yo71pDJssobgqpuT8Y
         KM/PGEL5lZH1KPQeJGE5BFz6nVZQXaS3RJMbjSkpMd0HzYd3Y2RAHyVlCsGwHkQZKMDn
         rAr6+C6QX8MjyspUdA1tSqywSKq35AV3eZuINQ97obEij3lDXHFMYwcZwGaIsgWYQ9Tx
         HQMKdOdKT0/K/hO1vtAI6DEszeOn4PyBgvleGXI+DnbkPzNOvUbP/M/6T1TXLpC5sD4K
         sUOOF2ZvWpuLJazTkvySYuaJtUxBJzHHjoXPb5KHZfU6ovbsC8T6ANOgYqAVWPX3KgfQ
         c86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=xnq5eBAVPHdODJdap+RjRAXd+8ER/tGm9IqD3oxwEPA=;
        b=KE0TjrQu2dx1Rk4092My5oVJWJ5QuZy26pqzQ/1AyoVZfJO4qHsPpAe3mb5WyrV3uN
         Fv4WgTGt1zycWHK6Bmdj8x0zK9iRIb+NqQZFeTq71QBOGdSrkIXbTFLbQGrQtOQzHMRJ
         hQQQyAgbC9H/LpbY+FXSkLsqYkjZqCvqw29kMW9lwpW9GogHg3k/IPU/ncMj2JUPaJno
         W1cOzEc8A8440vP5BOL33QcV3e9fK91m7vXzMaAnsUm2b14sF9qI2lUvjg94Y3CtNMYJ
         V82u3M5CnuFsaPwc4B6tcm1e3DfbaZeUUkuqcf9XHOJZbf4MCH5qvJH3JbvTMOYV1OGW
         5A0w==
X-Gm-Message-State: AOAM530WgKEtfGV8blqg2lNNVSoxKeeVXReoFnDiIrOWOGnUYIbrMIJ7
	kWV6N88z7kCeM9L9aR1jQ+9LzQ==
X-Google-Smtp-Source: ABdhPJzm76D3+00b9F0WOpyENukUZj7iS+bpl4n4Si3YapuuIwLpUH2fC3TSFhJIeLl98JVdiA2mMA==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr21887055wmc.52.1642297468564;
        Sat, 15 Jan 2022 17:44:28 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id n14sm11818573wrf.107.2022.01.15.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 17:44:27 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 16 Jan 2022 01:44:26 +0000 (UTC)
To: John Ericson <John.Ericson@Obsidian.Systems>
Cc: llvm@lists.linux.dev
Message-ID: <367952371.12347.1642297467736@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [cmake] Use `GNUInstallDirs`
 to support custom installation dirs.
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12346_1337807972.1642297467043"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_12346_1337807972.1642297467043
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [cmake] Use `GNUInstallDirs` to support custom installation dirs.:
commit efeb50197091b2ade24c00b9d55814bc433a7fd1
Author: John Ericson <John.Ericson@Obsidian.Systems>

    [cmake] Use `GNUInstallDirs` to support custom installation dirs.

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
9
# First few build errors in logs:
# 00:00:31 make[1]: *** [scripts/kconfig/Makefile:87: defconfig] Error 1
# 00:00:31 make: *** [Makefile:619: defconfig] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
37

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-aarch64-mainline-defconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/build-efeb50197091b2ade24c00b9d55814bc433a7fd1/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/build-49597085022efca21caa7c8becbefe0a3436cf67/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-efeb50197091b2ade24c00b9d55814bc433a7fd1
cd investigate-llvm-efeb50197091b2ade24c00b9d55814bc433a7fd1

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-defconfig/8/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach efeb50197091b2ade24c00b9d55814bc433a7fd1
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 49597085022efca21caa7c8becbefe0a3436cf67
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit efeb50197091b2ade24c00b9d55814bc433a7fd1
Author: John Ericson <John.Ericson@Obsidian.Systems>
Date:   Tue Jan 11 05:35:14 2022 +0000

    [cmake] Use `GNUInstallDirs` to support custom installation dirs.
    
    This is the original patch in my GNUInstallDirs series, now last to merge as the final piece!
    
    It arose as a new draft of D28234. I initially did the unorthodox thing of pushing to that when I wasn't the original author, but since I ended up
    
     - Using `GNUInstallDirs`, rather than mimicking it, as the original author was hesitant to do but others requested.
    
     - Converting all the packages, not just LLVM, effecting many more projects than LLVM itself.
    
    I figured it was time to make a new revision.
    
    I have used this patch series (and many back-ports) as the basis of https://github.com/NixOS/nixpkgs/pull/111487 for my distro (NixOS), which was merged last spring (2021). It looked like people were generally on board in D28234, but I make note of this here in case extra motivation is useful.
    
    ---
    
    As pointed out in the original issue, a central tension is that LLVM already has some partial support for these sorts of things. Variables like `COMPILER_RT_INSTALL_PATH` have already been dealt with. Variables like `LLVM_LIBDIR_SUFFIX` however, will require further work, so that we may use `CMAKE_INSTALL_LIBDIR`.
    
    These remaining items will be addressed in further patches. What is here is now rote and so we should get it out of the way before dealing more intricately with the remainder.
    
    Reviewed By: #libunwind, #libc, #libc_abi, compnerd
    
    Differential Revision: https://reviews.llvm.org/D99484
---
 clang-tools-extra/CMakeLists.txt                     |  1 +
 clang-tools-extra/clang-doc/tool/CMakeLists.txt      |  4 ++--
 .../find-all-symbols/tool/CMakeLists.txt             |  2 +-
 .../clang-include-fixer/tool/CMakeLists.txt          |  4 ++--
 clang-tools-extra/clang-tidy/CMakeLists.txt          |  2 +-
 clang-tools-extra/clang-tidy/tool/CMakeLists.txt     |  4 ++--
 clang-tools-extra/modularize/CMakeLists.txt          |  2 +-
 clang/CMakeLists.txt                                 |  8 +++++---
 clang/cmake/modules/AddClang.cmake                   |  5 +++--
 clang/tools/c-index-test/CMakeLists.txt              |  2 +-
 clang/tools/clang-format/CMakeLists.txt              | 12 ++++++------
 clang/tools/clang-nvlink-wrapper/CMakeLists.txt      |  2 +-
 clang/tools/clang-rename/CMakeLists.txt              |  4 ++--
 clang/tools/libclang/CMakeLists.txt                  |  2 +-
 clang/tools/scan-build-py/CMakeLists.txt             |  6 +++---
 clang/tools/scan-build/CMakeLists.txt                |  6 +++---
 clang/tools/scan-view/CMakeLists.txt                 |  4 ++--
 clang/utils/hmaptool/CMakeLists.txt                  |  2 +-
 compiler-rt/cmake/base-config-ix.cmake               |  6 +++---
 libc/CMakeLists.txt                                  |  2 ++
 libcxx/CMakeLists.txt                                |  8 +++++---
 libcxx/cmake/Modules/HandleLibCXXABI.cmake           |  5 +++--
 libcxxabi/CMakeLists.txt                             |  4 +++-
 libunwind/CMakeLists.txt                             |  6 ++++--
 llvm/cmake/modules/LLVMInstallSymlink.cmake          |  3 ++-
 mlir/CMakeLists.txt                                  |  6 ++++--
 mlir/cmake/modules/AddMLIR.cmake                     |  3 ++-
 openmp/CMakeLists.txt                                |  2 ++
 openmp/libompd/src/CMakeLists.txt                    |  2 +-
 openmp/runtime/src/CMakeLists.txt                    |  6 +++---
 openmp/tools/multiplex/CMakeLists.txt                |  2 +-
 polly/CMakeLists.txt                                 |  6 ++++--
 polly/cmake/CMakeLists.txt                           | 20 +++++++++++---------
 polly/lib/External/CMakeLists.txt                    |  2 +-
 pstl/CMakeLists.txt                                  |  6 ++++--
 35 files changed, 93 insertions(+), 68 deletions(-)

diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
index 2e73b6ba81d2..7b8274a97336 100644
--- a/clang-tools-extra/CMakeLists.txt
+++ b/clang-tools-extra/CMakeLists.txt
@@ -1,4 +1,5 @@
 include(CMakeDependentOption)
+include(GNUInstallDirs)
 
 option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
   "Include static analyzer checks in clang-tidy" ON)
diff --git a/clang-tools-extra/clang-doc/tool/CMakeLists.txt b/clang-tools-extra/clang-doc/tool/CMakeLists.txt
index 7e7147886916..fb8317b27293 100644
--- a/clang-tools-extra/clang-doc/tool/CMakeLists.txt
+++ b/clang-tools-extra/clang-doc/tool/CMakeLists.txt
@@ -19,9 +19,9 @@ target_link_libraries(clang-doc
   )
 
 install(FILES ../assets/clang-doc-default-stylesheet.css
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-doc)
 
 install(FILES ../assets/index.js
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-doc)
diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/CMakeLists.txt b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/CMakeLists.txt
index 8f5509d22e24..e6926a0d5bd1 100644
--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/CMakeLists.txt
+++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/CMakeLists.txt
@@ -20,5 +20,5 @@ target_link_libraries(find-all-symbols
   )
 
 install(PROGRAMS run-find-all-symbols.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT find-all-symbols)
diff --git a/clang-tools-extra/clang-include-fixer/tool/CMakeLists.txt b/clang-tools-extra/clang-include-fixer/tool/CMakeLists.txt
index 3936ac1e8a5a..5b9e00ab87cd 100644
--- a/clang-tools-extra/clang-include-fixer/tool/CMakeLists.txt
+++ b/clang-tools-extra/clang-include-fixer/tool/CMakeLists.txt
@@ -21,8 +21,8 @@ target_link_libraries(clang-include-fixer
   )
 
 install(PROGRAMS clang-include-fixer.el
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-include-fixer)
 install(PROGRAMS clang-include-fixer.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-include-fixer)
diff --git a/clang-tools-extra/clang-tidy/CMakeLists.txt b/clang-tools-extra/clang-tidy/CMakeLists.txt
index 455645050d93..075e9f9909d6 100644
--- a/clang-tools-extra/clang-tidy/CMakeLists.txt
+++ b/clang-tools-extra/clang-tidy/CMakeLists.txt
@@ -113,7 +113,7 @@ add_subdirectory(utils)
 
 if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
   install(DIRECTORY .
-    DESTINATION include/clang-tidy
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/clang-tidy"
     COMPONENT clang-tidy-headers
     FILES_MATCHING
     PATTERN "*.h"
diff --git a/clang-tools-extra/clang-tidy/tool/CMakeLists.txt b/clang-tools-extra/clang-tidy/tool/CMakeLists.txt
index ad3255b024fc..4b8c93801501 100644
--- a/clang-tools-extra/clang-tidy/tool/CMakeLists.txt
+++ b/clang-tools-extra/clang-tidy/tool/CMakeLists.txt
@@ -52,9 +52,9 @@ target_link_libraries(clang-tidy
 
 
 install(PROGRAMS clang-tidy-diff.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-tidy)
 install(PROGRAMS run-clang-tidy.py
-  DESTINATION bin
+  DESTINATION "${CMAKE_INSTALL_BINDIR}"
   COMPONENT clang-tidy
   RENAME run-clang-tidy)
diff --git a/clang-tools-extra/modularize/CMakeLists.txt b/clang-tools-extra/modularize/CMakeLists.txt
index 4caae81c49b6..fb17e353c39f 100644
--- a/clang-tools-extra/modularize/CMakeLists.txt
+++ b/clang-tools-extra/modularize/CMakeLists.txt
@@ -23,5 +23,5 @@ clang_target_link_libraries(modularize
   )
 
 install(TARGETS modularize
-        RUNTIME DESTINATION bin
+        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
         COMPONENT clang-extras)
diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
index 7ea37850ad60..e3f62db221fd 100644
--- a/clang/CMakeLists.txt
+++ b/clang/CMakeLists.txt
@@ -1,5 +1,7 @@
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 # If we are not building as a part of LLVM, build Clang as an
 # standalone project, using LLVM as an external library:
 if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
@@ -424,7 +426,7 @@ include_directories(BEFORE
 
 if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
   install(DIRECTORY include/clang include/clang-c
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     COMPONENT clang-headers
     FILES_MATCHING
     PATTERN "*.def"
@@ -433,7 +435,7 @@ if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
     )
 
   install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include/clang
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     COMPONENT clang-headers
     FILES_MATCHING
     PATTERN "CMakeFiles" EXCLUDE
@@ -453,7 +455,7 @@ if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
 
   add_custom_target(bash-autocomplete DEPENDS utils/bash-autocomplete.sh)
   install(PROGRAMS utils/bash-autocomplete.sh
-          DESTINATION share/clang
+          DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
           COMPONENT bash-autocomplete)
   if(NOT LLVM_ENABLE_IDE)
     add_llvm_install_targets(install-bash-autocomplete
diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddClang.cmake
index 5752f4277444..9bbbfc032b7d 100644
--- a/clang/cmake/modules/AddClang.cmake
+++ b/clang/cmake/modules/AddClang.cmake
@@ -1,3 +1,4 @@
+include(GNUInstallDirs)
 include(LLVMDistributionSupport)
 
 function(clang_tablegen)
@@ -120,7 +121,7 @@ macro(add_clang_library name)
           ${export_to_clangtargets}
           LIBRARY DESTINATION lib${LLVM_LIBDIR_SUFFIX}
           ARCHIVE DESTINATION lib${LLVM_LIBDIR_SUFFIX}
-          RUNTIME DESTINATION bin)
+          RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
 
         if (NOT LLVM_ENABLE_IDE)
           add_llvm_install_targets(install-${lib}
@@ -159,7 +160,7 @@ macro(add_clang_tool name)
     get_target_export_arg(${name} Clang export_to_clangtargets)
     install(TARGETS ${name}
       ${export_to_clangtargets}
-      RUNTIME DESTINATION bin
+      RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
       COMPONENT ${name})
 
     if(NOT LLVM_ENABLE_IDE)
diff --git a/clang/tools/c-index-test/CMakeLists.txt b/clang/tools/c-index-test/CMakeLists.txt
index 99c6081db2d6..0ae1b4e55244 100644
--- a/clang/tools/c-index-test/CMakeLists.txt
+++ b/clang/tools/c-index-test/CMakeLists.txt
@@ -49,7 +49,7 @@ if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
     set_property(TARGET c-index-test APPEND PROPERTY INSTALL_RPATH
        "@executable_path/../../lib")
   else()
-    set(INSTALL_DESTINATION bin)
+    set(INSTALL_DESTINATION "${CMAKE_INSTALL_BINDIR}")
   endif()
 
   install(TARGETS c-index-test
diff --git a/clang/tools/clang-format/CMakeLists.txt b/clang/tools/clang-format/CMakeLists.txt
index 35ecdb11253c..bbdef93b576b 100644
--- a/clang/tools/clang-format/CMakeLists.txt
+++ b/clang/tools/clang-format/CMakeLists.txt
@@ -21,20 +21,20 @@ if( LLVM_LIB_FUZZING_ENGINE OR LLVM_USE_SANITIZE_COVERAGE )
 endif()
 
 install(PROGRAMS clang-format-bbedit.applescript
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-format)
 install(PROGRAMS clang-format-diff.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-format)
 install(PROGRAMS clang-format-sublime.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-format)
 install(PROGRAMS clang-format.el
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-format)
 install(PROGRAMS clang-format.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-format)
 install(PROGRAMS git-clang-format
-  DESTINATION bin
+  DESTINATION "${CMAKE_INSTALL_BINDIR}"
   COMPONENT clang-format)
diff --git a/clang/tools/clang-nvlink-wrapper/CMakeLists.txt b/clang/tools/clang-nvlink-wrapper/CMakeLists.txt
index 033392f1c2bd..2c979e509795 100644
--- a/clang/tools/clang-nvlink-wrapper/CMakeLists.txt
+++ b/clang/tools/clang-nvlink-wrapper/CMakeLists.txt
@@ -22,4 +22,4 @@ target_link_libraries(clang-nvlink-wrapper
   ${CLANG_NVLINK_WRAPPER_LIB_DEPS}
   )
 
-install(TARGETS clang-nvlink-wrapper RUNTIME DESTINATION bin)
+install(TARGETS clang-nvlink-wrapper RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
diff --git a/clang/tools/clang-rename/CMakeLists.txt b/clang/tools/clang-rename/CMakeLists.txt
index cda8e29ec5b1..58da000272f6 100644
--- a/clang/tools/clang-rename/CMakeLists.txt
+++ b/clang/tools/clang-rename/CMakeLists.txt
@@ -19,8 +19,8 @@ clang_target_link_libraries(clang-rename
   )
 
 install(PROGRAMS clang-rename.py
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-rename)
 install(PROGRAMS clang-rename.el
-  DESTINATION share/clang
+  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
   COMPONENT clang-rename)
diff --git a/clang/tools/libclang/CMakeLists.txt b/clang/tools/libclang/CMakeLists.txt
index bf88dca0a34b..4e0647971ab4 100644
--- a/clang/tools/libclang/CMakeLists.txt
+++ b/clang/tools/libclang/CMakeLists.txt
@@ -186,7 +186,7 @@ endif()
 if(INTERNAL_INSTALL_PREFIX)
   set(LIBCLANG_HEADERS_INSTALL_DESTINATION "${INTERNAL_INSTALL_PREFIX}/include")
 else()
-  set(LIBCLANG_HEADERS_INSTALL_DESTINATION include)
+  set(LIBCLANG_HEADERS_INSTALL_DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
 endif()
 
 install(DIRECTORY ../../include/clang-c
diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-build-py/CMakeLists.txt
index c9f1cb7d6b2a..061dc7ef4dd9 100644
--- a/clang/tools/scan-build-py/CMakeLists.txt
+++ b/clang/tools/scan-build-py/CMakeLists.txt
@@ -43,7 +43,7 @@ foreach(BinFile ${BinFiles})
                          ${CMAKE_BINARY_DIR}/bin/scan-build-py
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/bin/scan-build)
     install (PROGRAMS "bin/scan-build"
-             DESTINATION bin
+             DESTINATION "${CMAKE_INSTALL_BINDIR}"
              RENAME scan-build-py
              COMPONENT scan-build-py)
     list(APPEND Depends ${CMAKE_BINARY_DIR}/bin/scan-build-py)
@@ -56,7 +56,7 @@ foreach(BinFile ${BinFiles})
                          ${CMAKE_BINARY_DIR}/bin/
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/bin/${BinFile})
     install(PROGRAMS bin/${BinFile}
-            DESTINATION bin
+            DESTINATION "${CMAKE_INSTALL_BINDIR}"
             COMPONENT scan-build-py)
     list(APPEND Depends ${CMAKE_BINARY_DIR}/bin/${BinFile})
   endif()
@@ -72,7 +72,7 @@ foreach(lib ${LibExecs})
                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/libexec/${lib})
   list(APPEND Depends ${CMAKE_BINARY_DIR}/libexec/${lib})
   install(PROGRAMS libexec/${lib}
-          DESTINATION libexec
+          DESTINATION "${CMAKE_INSTALL_LIBEXECDIR}"
           COMPONENT scan-build-py)
 endforeach()
 
diff --git a/clang/tools/scan-build/CMakeLists.txt b/clang/tools/scan-build/CMakeLists.txt
index 74334e53c9b1..4a578b4c6f3e 100644
--- a/clang/tools/scan-build/CMakeLists.txt
+++ b/clang/tools/scan-build/CMakeLists.txt
@@ -47,7 +47,7 @@ if(CLANG_INSTALL_SCANBUILD)
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/bin/${BinFile})
     list(APPEND Depends ${CMAKE_BINARY_DIR}/bin/${BinFile})
     install(PROGRAMS bin/${BinFile}
-            DESTINATION bin
+            DESTINATION "${CMAKE_INSTALL_BINDIR}"
             COMPONENT scan-build)
   endforeach()
 
@@ -61,7 +61,7 @@ if(CLANG_INSTALL_SCANBUILD)
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/libexec/${LibexecFile})
     list(APPEND Depends ${CMAKE_BINARY_DIR}/libexec/${LibexecFile})
     install(PROGRAMS libexec/${LibexecFile}
-            DESTINATION libexec
+            DESTINATION "${CMAKE_INSTALL_LIBEXECDIR}"
             COMPONENT scan-build)
   endforeach()
 
@@ -89,7 +89,7 @@ if(CLANG_INSTALL_SCANBUILD)
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/share/scan-build/${ShareFile})
     list(APPEND Depends ${CMAKE_BINARY_DIR}/share/scan-build/${ShareFile})
     install(FILES share/scan-build/${ShareFile}
-            DESTINATION share/scan-build
+            DESTINATION "${CMAKE_INSTALL_DATADIR}/scan-build"
             COMPONENT scan-build)
   endforeach()
 
diff --git a/clang/tools/scan-view/CMakeLists.txt b/clang/tools/scan-view/CMakeLists.txt
index eccc6b83195b..07aec76ee66f 100644
--- a/clang/tools/scan-view/CMakeLists.txt
+++ b/clang/tools/scan-view/CMakeLists.txt
@@ -20,7 +20,7 @@ if(CLANG_INSTALL_SCANVIEW)
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/bin/${BinFile})
     list(APPEND Depends ${CMAKE_BINARY_DIR}/bin/${BinFile})
     install(PROGRAMS bin/${BinFile}
-            DESTINATION bin
+            DESTINATION "${CMAKE_INSTALL_BINDIR}"
             COMPONENT scan-view)
   endforeach()
 
@@ -34,7 +34,7 @@ if(CLANG_INSTALL_SCANVIEW)
                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/share/${ShareFile})
     list(APPEND Depends ${CMAKE_BINARY_DIR}/share/scan-view/${ShareFile})
     install(FILES share/${ShareFile}
-            DESTINATION share/scan-view
+            DESTINATION "${CMAKE_INSTALL_DATADIR}/scan-view"
             COMPONENT scan-view)
   endforeach()
 
diff --git a/clang/utils/hmaptool/CMakeLists.txt b/clang/utils/hmaptool/CMakeLists.txt
index 62f2de0cb15c..f0d9866782b8 100644
--- a/clang/utils/hmaptool/CMakeLists.txt
+++ b/clang/utils/hmaptool/CMakeLists.txt
@@ -10,7 +10,7 @@ add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/bin/${CLANG_HM
 
 list(APPEND Depends ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/bin/${CLANG_HMAPTOOL})
 install(PROGRAMS ${CLANG_HMAPTOOL}
-        DESTINATION bin
+        DESTINATION "${CMAKE_INSTALL_BINDIR}"
         COMPONENT hmaptool)
 
 add_custom_target(hmaptool ALL DEPENDS ${Depends})
diff --git a/compiler-rt/cmake/base-config-ix.cmake b/compiler-rt/cmake/base-config-ix.cmake
index 1ada0ab30ba0..7d7d2264cdd8 100644
--- a/compiler-rt/cmake/base-config-ix.cmake
+++ b/compiler-rt/cmake/base-config-ix.cmake
@@ -108,13 +108,13 @@ else(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR AND NOT APPLE)
   set(COMPILER_RT_INSTALL_LIBRARY_DIR "${default_install_path}" CACHE PATH
     "Path where built compiler-rt libraries should be installed.")
 endif()
-extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" bin)
+extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" "${CMAKE_INSTALL_BINDIR}")
 set(COMPILER_RT_INSTALL_BINARY_DIR "${default_install_path}" CACHE PATH
   "Path where built compiler-rt executables should be installed.")
-extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" include)
+extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" "${CMAKE_INSTALL_INCLUDEDIR}")
 set(COMPILER_RT_INSTALL_INCLUDE_DIR "${default_install_path}" CACHE PATH
   "Path where compiler-rt headers should be installed.")
-extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" share)
+extend_path(default_install_path "${COMPILER_RT_INSTALL_PATH}" "${CMAKE_INSTALL_DATADIR}")
 set(COMPILER_RT_INSTALL_DATA_DIR "${default_install_path}" CACHE PATH
   "Path where compiler-rt data files should be installed.")
 
diff --git a/libc/CMakeLists.txt b/libc/CMakeLists.txt
index 6e68246d6ceb..b692a570e30b 100644
--- a/libc/CMakeLists.txt
+++ b/libc/CMakeLists.txt
@@ -1,5 +1,7 @@
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 # Use old version of target_sources command which converts the source
 # file paths to full paths.
 cmake_policy(SET CMP0076 OLD)
diff --git a/libcxx/CMakeLists.txt b/libcxx/CMakeLists.txt
index f78fb77ceb37..b44b16088eff 100644
--- a/libcxx/CMakeLists.txt
+++ b/libcxx/CMakeLists.txt
@@ -10,6 +10,8 @@ endif()
 #===============================================================================
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 set(LLVM_COMMON_CMAKE_UTILS "${CMAKE_CURRENT_SOURCE_DIR}/../cmake")
 
 # Add path for custom modules
@@ -412,9 +414,9 @@ endif ()
 # TODO: Projects that depend on libc++ should use LIBCXX_GENERATED_INCLUDE_DIR
 # instead of hard-coding include/c++/v1.
 
-set(LIBCXX_INSTALL_INCLUDE_DIR "include/c++/v1" CACHE PATH
+set(LIBCXX_INSTALL_INCLUDE_DIR "${CMAKE_INSTALL_INCLUDEDIR}/c++/v1" CACHE PATH
     "Path where target-agnostic libc++ headers should be installed.")
-set(LIBCXX_INSTALL_RUNTIME_DIR bin CACHE PATH
+set(LIBCXX_INSTALL_RUNTIME_DIR "${CMAKE_INSTALL_BINDIR}" CACHE PATH
     "Path where built libc++ runtime libraries should be installed.")
 
 if(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR AND NOT APPLE)
@@ -423,7 +425,7 @@ if(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR AND NOT APPLE)
   set(LIBCXX_GENERATED_INCLUDE_TARGET_DIR "${LLVM_BINARY_DIR}/include/${LLVM_DEFAULT_TARGET_TRIPLE}/c++/v1")
   set(LIBCXX_INSTALL_LIBRARY_DIR lib${LLVM_LIBDIR_SUFFIX}/${LLVM_DEFAULT_TARGET_TRIPLE} CACHE PATH
       "Path where built libc++ libraries should be installed.")
-  set(LIBCXX_INSTALL_INCLUDE_TARGET_DIR "include/${LLVM_DEFAULT_TARGET_TRIPLE}/c++/v1" CACHE PATH
+  set(LIBCXX_INSTALL_INCLUDE_TARGET_DIR "${CMAKE_INSTALL_INCLUDEDIR}/${LLVM_DEFAULT_TARGET_TRIPLE}/c++/v1" CACHE PATH
       "Path where target-specific libc++ headers should be installed.")
   if(LIBCXX_LIBDIR_SUBDIR)
     string(APPEND LIBCXX_LIBRARY_DIR /${LIBCXX_LIBDIR_SUBDIR})
diff --git a/libcxx/cmake/Modules/HandleLibCXXABI.cmake b/libcxx/cmake/Modules/HandleLibCXXABI.cmake
index 5a8a4a270a1a..d69405ddeeac 100644
--- a/libcxx/cmake/Modules/HandleLibCXXABI.cmake
+++ b/libcxx/cmake/Modules/HandleLibCXXABI.cmake
@@ -1,8 +1,9 @@
-
 #===============================================================================
 # Add an ABI library if appropriate
 #===============================================================================
 
+include(GNUInstallDirs)
+
 #
 # _setup_abi: Set up the build to use an ABI library
 #
@@ -63,7 +64,7 @@ macro(setup_abi_lib abidefines abishared abistatic abifiles abidirs)
 
         if (LIBCXX_INSTALL_HEADERS)
           install(FILES "${LIBCXX_BINARY_INCLUDE_DIR}/${fpath}"
-            DESTINATION include/c++/v1/${dstdir}
+            DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/c++/v1/${dstdir}"
             COMPONENT cxx-headers
             PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
             )
diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
index b73804390ba2..6b3bcef2851d 100644
--- a/libcxxabi/CMakeLists.txt
+++ b/libcxxabi/CMakeLists.txt
@@ -10,6 +10,8 @@ endif()
 
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 set(LLVM_COMMON_CMAKE_UTILS "${CMAKE_CURRENT_SOURCE_DIR}/../cmake")
 
 # Add path for custom modules
@@ -210,7 +212,7 @@ set(CMAKE_MODULE_PATH
   ${CMAKE_MODULE_PATH}
   )
 
-set(LIBCXXABI_INSTALL_RUNTIME_DIR bin CACHE PATH
+set(LIBCXXABI_INSTALL_RUNTIME_DIR "${CMAKE_INSTALL_BINDIR}" CACHE PATH
     "Path where built libc++abi runtime libraries should be installed.")
 
 if(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR AND NOT APPLE)
diff --git a/libunwind/CMakeLists.txt b/libunwind/CMakeLists.txt
index 33741aea8f77..340a103a4abe 100644
--- a/libunwind/CMakeLists.txt
+++ b/libunwind/CMakeLists.txt
@@ -8,6 +8,8 @@ endif()
 
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 set(LLVM_COMMON_CMAKE_UTILS "${CMAKE_CURRENT_SOURCE_DIR}/../cmake")
 
 # Add path for custom modules
@@ -137,9 +139,9 @@ set(CMAKE_MODULE_PATH
     "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
     ${CMAKE_MODULE_PATH})
 
-set(LIBUNWIND_INSTALL_INCLUDE_DIR include CACHE PATH
+set(LIBUNWIND_INSTALL_INCLUDE_DIR "${CMAKE_INSTALL_INCLUDEDIR}" CACHE PATH
     "Path where built libunwind headers should be installed.")
-set(LIBUNWIND_INSTALL_RUNTIME_DIR bin CACHE PATH
+set(LIBUNWIND_INSTALL_RUNTIME_DIR "${CMAKE_INSTALL_BINDIR}" CACHE PATH
     "Path where built libunwind runtime libraries should be installed.")
 
 if(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR AND NOT APPLE)
diff --git a/llvm/cmake/modules/LLVMInstallSymlink.cmake b/llvm/cmake/modules/LLVMInstallSymlink.cmake
index b5c35f706cb7..ef7f5ab5288d 100644
--- a/llvm/cmake/modules/LLVMInstallSymlink.cmake
+++ b/llvm/cmake/modules/LLVMInstallSymlink.cmake
@@ -6,7 +6,8 @@ include(GNUInstallDirs)
 
 function(install_symlink name target outdir)
   set(DESTDIR [Error replacing 'ENV' - Parameter var in token ENV is required but was not specfified]{DESTDIR})
-  set(bindir "${DESTDIR}${CMAKE_INSTALL_PREFIX}/${outdir}")
+  GNUInstallDirs_get_absolute_install_dir(bindir "${outdir}" BINDIR)
+  set(bindir "${DESTDIR}${bindir}")
 
   message(STATUS "Creating ${name}")
 
diff --git a/mlir/CMakeLists.txt b/mlir/CMakeLists.txt
index b1b79cf32542..63f69ed96d3f 100644
--- a/mlir/CMakeLists.txt
+++ b/mlir/CMakeLists.txt
@@ -1,5 +1,7 @@
 # MLIR project.
 
+include(GNUInstallDirs)
+
 # Check if MLIR is built as a standalone project.
 if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
   project(mlir)
@@ -173,7 +175,7 @@ endif()
 
 if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
   install(DIRECTORY include/mlir include/mlir-c
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     COMPONENT mlir-headers
     FILES_MATCHING
     PATTERN "*.def"
@@ -184,7 +186,7 @@ if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
     )
 
   install(DIRECTORY ${MLIR_INCLUDE_DIR}/mlir ${MLIR_INCLUDE_DIR}/mlir-c
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     COMPONENT mlir-headers
     FILES_MATCHING
     PATTERN "*.def"
diff --git a/mlir/cmake/modules/AddMLIR.cmake b/mlir/cmake/modules/AddMLIR.cmake
index 770d2aa06d2d..b45c44e0276b 100644
--- a/mlir/cmake/modules/AddMLIR.cmake
+++ b/mlir/cmake/modules/AddMLIR.cmake
@@ -1,3 +1,4 @@
+include(GNUInstallDirs)
 include(LLVMDistributionSupport)
 
 function(mlir_tablegen ofn)
@@ -371,7 +372,7 @@ function(add_mlir_library_install name)
     ${export_to_mlirtargets}
     LIBRARY DESTINATION lib${LLVM_LIBDIR_SUFFIX}
     ARCHIVE DESTINATION lib${LLVM_LIBDIR_SUFFIX}
-    RUNTIME DESTINATION bin
+    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
     # Note that CMake will create a directory like:
     #   objects-${CMAKE_BUILD_TYPE}/obj.LibName
     # and put object files there.
diff --git a/openmp/CMakeLists.txt b/openmp/CMakeLists.txt
index 7f11a05f5622..bffac035c53f 100644
--- a/openmp/CMakeLists.txt
+++ b/openmp/CMakeLists.txt
@@ -1,5 +1,7 @@
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 # Add cmake directory to search for custom cmake functions.
 set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
 
diff --git a/openmp/libompd/src/CMakeLists.txt b/openmp/libompd/src/CMakeLists.txt
index 9c203bdd6b4f..25a850ed457d 100644
--- a/openmp/libompd/src/CMakeLists.txt
+++ b/openmp/libompd/src/CMakeLists.txt
@@ -47,4 +47,4 @@ include_directories (
 INSTALL( TARGETS ompd
         LIBRARY DESTINATION ${OPENMP_INSTALL_LIBDIR}
         ARCHIVE DESTINATION ${OPENMP_INSTALL_LIBDIR}
-        RUNTIME DESTINATION bin )
+        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" )
diff --git a/openmp/runtime/src/CMakeLists.txt b/openmp/runtime/src/CMakeLists.txt
index e4f4e6e1e73f..27e748c4d6dc 100644
--- a/openmp/runtime/src/CMakeLists.txt
+++ b/openmp/runtime/src/CMakeLists.txt
@@ -346,19 +346,19 @@ add_dependencies(libomp-micro-tests libomp-test-deps)
 # We want to install libomp in DESTDIR/CMAKE_INSTALL_PREFIX/lib
 # We want to install headers in DESTDIR/CMAKE_INSTALL_PREFIX/include
 if(${OPENMP_STANDALONE_BUILD})
-  set(LIBOMP_HEADERS_INSTALL_PATH include)
+  set(LIBOMP_HEADERS_INSTALL_PATH "${CMAKE_INSTALL_INCLUDEDIR}")
 else()
   string(REGEX MATCH "[0-9]+\\.[0-9]+(\\.[0-9]+)?" CLANG_VERSION ${PACKAGE_VERSION})
   set(LIBOMP_HEADERS_INSTALL_PATH "${OPENMP_INSTALL_LIBDIR}/clang/${CLANG_VERSION}/include")
 endif()
 if(WIN32)
-  install(TARGETS omp RUNTIME DESTINATION bin)
+  install(TARGETS omp RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
   install(TARGETS ${LIBOMP_IMP_LIB_TARGET} ARCHIVE DESTINATION "${OPENMP_INSTALL_LIBDIR}")
   # Create aliases (regular copies) of the library for backwards compatibility
   set(LIBOMP_ALIASES "libiomp5md")
   foreach(alias IN LISTS LIBOMP_ALIASES)
     install(CODE "execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy \"${LIBOMP_LIB_FILE}\"
-      \"${alias}${LIBOMP_LIBRARY_SUFFIX}\" WORKING_DIRECTORY \"\${CMAKE_INSTALL_PREFIX}/bin\")")
+      \"${alias}${LIBOMP_LIBRARY_SUFFIX}\" WORKING_DIRECTORY \"\${CMAKE_INSTALL_BINDIR}\")")
     install(CODE "execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy \"${LIBOMP_IMP_LIB_FILE}\"
       \"${alias}${CMAKE_STATIC_LIBRARY_SUFFIX}\" WORKING_DIRECTORY \"\${CMAKE_INSTALL_PREFIX}/${OPENMP_INSTALL_LIBDIR}\")")
   endforeach()
diff --git a/openmp/tools/multiplex/CMakeLists.txt b/openmp/tools/multiplex/CMakeLists.txt
index 64317c112176..8b50e95899cc 100644
--- a/openmp/tools/multiplex/CMakeLists.txt
+++ b/openmp/tools/multiplex/CMakeLists.txt
@@ -4,7 +4,7 @@ if(LIBOMP_OMPT_SUPPORT)
   add_library(ompt-multiplex INTERFACE)
   target_include_directories(ompt-multiplex INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
 
-  install(FILES ompt-multiplex.h DESTINATION include)
+  install(FILES ompt-multiplex.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
 
   add_subdirectory(tests)
 endif()
diff --git a/polly/CMakeLists.txt b/polly/CMakeLists.txt
index fb62dbd3a09b..d6bcc8f7f285 100644
--- a/polly/CMakeLists.txt
+++ b/polly/CMakeLists.txt
@@ -1,3 +1,5 @@
+include(GNUInstallDirs)
+
 # Check if this is a in tree build.
 if (NOT DEFINED LLVM_MAIN_SRC_DIR)
   project(Polly)
@@ -124,13 +126,13 @@ include_directories(
 
 if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
   install(DIRECTORY include/
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     FILES_MATCHING
     PATTERN "*.h"
     )
 
   install(DIRECTORY ${POLLY_BINARY_DIR}/include/
-    DESTINATION include
+    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
     FILES_MATCHING
     PATTERN "*.h"
     PATTERN "CMakeFiles" EXCLUDE
diff --git a/polly/cmake/CMakeLists.txt b/polly/cmake/CMakeLists.txt
index 524d6069c117..9b508941a139 100644
--- a/polly/cmake/CMakeLists.txt
+++ b/polly/cmake/CMakeLists.txt
@@ -1,5 +1,6 @@
 # Keep this in sync with llvm/cmake/CMakeLists.txt!
 
+include(ExtendPath)
 include(FindPrefixFromConfig)
 
 set(LLVM_INSTALL_PACKAGE_DIR "lib${LLVM_LIBDIR_SUFFIX}/cmake/llvm")
@@ -83,17 +84,18 @@ file(GENERATE
 # Generate PollyConfig.cmake for the install tree.
 unset(POLLY_EXPORTS)
 find_prefix_from_config(POLLY_CONFIG_CODE POLLY_INSTALL_PREFIX "${POLLY_INSTALL_PACKAGE_DIR}")
-set(POLLY_CONFIG_LLVM_CMAKE_DIR "\${POLLY_INSTALL_PREFIX}/${LLVM_INSTALL_PACKAGE_DIR}")
-set(POLLY_CONFIG_CMAKE_DIR "\${POLLY_INSTALL_PREFIX}/${POLLY_INSTALL_PACKAGE_DIR}")
-set(POLLY_CONFIG_LIBRARY_DIRS "\${POLLY_INSTALL_PREFIX}/lib${LLVM_LIBDIR_SUFFIX}")
+extend_path(POLLY_CONFIG_LLVM_CMAKE_DIR "\${POLLY_INSTALL_PREFIX}" "${LLVM_INSTALL_PACKAGE_DIR}")
+extend_path(POLLY_CONFIG_CMAKE_DIR "\${POLLY_INSTALL_PREFIX}" "${POLLY_INSTALL_PACKAGE_DIR}")
+extend_path(POLLY_CONFIG_LIBRARY_DIRS "\${POLLY_INSTALL_PREFIX}" "lib${LLVM_LIBDIR_SUFFIX}")
+extend_path(base_includedir "\${POLLY_INSTALL_PREFIX}" "${CMAKE_INSTALL_INCLUDEDIR}")
 if (POLLY_BUNDLED_ISL)
   set(POLLY_CONFIG_INCLUDE_DIRS
-    "\${POLLY_INSTALL_PREFIX}/include"
-    "\${POLLY_INSTALL_PREFIX}/include/polly"
+    "${base_includedir}"
+    "${base_includedir}/polly"
     )
 else()
   set(POLLY_CONFIG_INCLUDE_DIRS
-    "\${POLLY_INSTALL_PREFIX}/include"
+    "${base_includedir}"
     ${ISL_INCLUDE_DIRS}
     )
 endif()
@@ -110,12 +112,12 @@ set(POLLY_EXPORTS
 foreach(tgt IN LISTS POLLY_CONFIG_EXPORTED_TARGETS)
   get_target_property(tgt_type ${tgt} TYPE)
   if (tgt_type STREQUAL "EXECUTABLE")
-    set(tgt_prefix "bin/")
+    set(tgt_prefix "${CMAKE_INSTALL_BINDIR}/")
   else()
-    set(tgt_prefix "lib/")
+    set(tgt_prefix "${CMAKE_INSTALL_LIBDIR}/")
   endif()
 
-  set(tgt_path "\${POLLY_INSTALL_PREFIX}/${tgt_prefix}$<TARGET_FILE_NAME:${tgt}>")
+  extend_path(tgt_path "\${POLLY_INSTALL_PREFIX}" "${tgt_prefix}$<TARGET_FILE_NAME:${tgt}>")
 
   if (NOT tgt_type STREQUAL "INTERFACE_LIBRARY")
     set(POLLY_EXPORTS
diff --git a/polly/lib/External/CMakeLists.txt b/polly/lib/External/CMakeLists.txt
index e3a5683fccdc..2f912e7daeb2 100644
--- a/polly/lib/External/CMakeLists.txt
+++ b/polly/lib/External/CMakeLists.txt
@@ -290,7 +290,7 @@ if (POLLY_BUNDLED_ISL)
     install(DIRECTORY
       ${ISL_SOURCE_DIR}/include/
       ${ISL_BINARY_DIR}/include/
-      DESTINATION include/polly
+      DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/polly"
       FILES_MATCHING
       PATTERN "*.h"
       PATTERN "CMakeFiles" EXCLUDE
diff --git a/pstl/CMakeLists.txt b/pstl/CMakeLists.txt
index 181f1164cf45..8784eb07b574 100644
--- a/pstl/CMakeLists.txt
+++ b/pstl/CMakeLists.txt
@@ -7,6 +7,8 @@
 #===----------------------------------------------------------------------===##
 cmake_minimum_required(VERSION 3.13.4)
 
+include(GNUInstallDirs)
+
 set(PARALLELSTL_VERSION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/include/pstl/internal/pstl_config.h")
 file(STRINGS "${PARALLELSTL_VERSION_FILE}" PARALLELSTL_VERSION_SOURCE REGEX "#define _PSTL_VERSION .*$")
 string(REGEX REPLACE "#define _PSTL_VERSION (.*)$" "\\1" PARALLELSTL_VERSION_SOURCE "${PARALLELSTL_VERSION_SOURCE}")
@@ -90,10 +92,10 @@ install(FILES "${CMAKE_CURRENT_BINARY_DIR}/ParallelSTLConfig.cmake"
               "${CMAKE_CURRENT_BINARY_DIR}/ParallelSTLConfigVersion.cmake"
         DESTINATION lib/cmake/ParallelSTL)
 install(DIRECTORY include/
-        DESTINATION include
+        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
         PATTERN "*.in" EXCLUDE)
 install(FILES "${PSTL_CONFIG_SITE_PATH}"
-        DESTINATION include)
+        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
 
 add_custom_target(install-pstl
                   COMMAND "${CMAKE_COMMAND}" -P "${PROJECT_BINARY_DIR}/cmake_install.cmake" -DCOMPONENT=ParallelSTL)
</cut>
------=_Part_12346_1337807972.1642297467043--
