Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4121FCC
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 03:43:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z12so364514wrp.9
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 20:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date;
        bh=miZrQWaUysTL9ggkNqg6I5SicK5PhMzgvLibs+1Gq4s=;
        b=XVV4DCcExfN2VscdId1WVrGRPSJlfWbg13oDnza5VF5BWMto8mEPnjSbtZiR0dFpMw
         ust8jOT13VL70Yv2SK/1kz2dYmuj+tOdRW4I1m9X+QGy3PGY0CA4kktajQ2CgfqRe8Tq
         ViQv2UCGE1nsQsOrDHiHjqDr8JkOm5E40o9Z2WfoFZz0AdwOkDdEARZ6uJ8wnByTFML+
         oX4DdzGY3Vp5LDUEAv2HKWhI7g5SF+H0RStm+MyObTJf963GUuyml+hrGaGJ/JmcXxJw
         oUovmXbPdyWLXpvsNs+7fwvyvMuOoxS3dFNiJf6TA7/bBJ/rvhxqblqC0mvpjJ0mdqmO
         zK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=miZrQWaUysTL9ggkNqg6I5SicK5PhMzgvLibs+1Gq4s=;
        b=0cUfUORiOZ1JaEsTgrSntvPXzldatxm+ox5eMwgEQT/9Bcq8Eifv65UEzMY4ItKGB7
         lFCV4FIPrvC4aYFVlzPA8zosONi4AGEZcYKEY9RY3kTIvKmgAnXKN3l1CstkUPN+9c7q
         6JABgZo4NyyMVbk9/Ia/gpSBaDsFWDmmCrl+rWfdU0a8YWZHLS7zVUzsYC89Eam0Ymb2
         7HAqFBjiNsiXmaKVmsAJfO9kK6/koixwO8rRmWWTocyPnRF/DH+bmeEMigRX+Nn5GBaX
         N56e7TXFYGXDU9yLxrDdYSAnoa0nlfh2BbFSUFSG0JB/K1qta3e/MdBS1j/PteSrUUUt
         1T0w==
X-Gm-Message-State: ACgBeo17pCNA1NQNrOBQJBgvlOJYLBmfcWPZ8J8VkXMwNLaP9uGtYpVI
	9IMUcOLMy6WKSS6epdNQM+Jtw8krPmDByQ==
X-Google-Smtp-Source: AA6agR5M9UWpYWY9QApJ+SJ+v4kPq/lbOZJ8cHKebPIizNMDljYhZC/f6f74AN0yCYwf3oL+yqt4/Q==
X-Received: by 2002:a5d:62cb:0:b0:228:6a13:24d9 with SMTP id o11-20020a5d62cb000000b002286a1324d9mr17574995wrv.497.1663040624800;
        Mon, 12 Sep 2022 20:43:44 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id r18-20020a5d4992000000b0022a403954c3sm9025271wrq.42.2022.09.12.20.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 20:43:44 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 13 Sep 2022 03:43:43 +0000 (UTC)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1365091032.18272.1663040624336@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.0-rc4-215-ge35ff25f9fda: Merge tag
 'linux-kselftest-kunit-fixes-6.0-rc5' of
 git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_18271_1834936591.1663040623824"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_18271_1834936591.1663040623824
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.0-rc4-215-ge35ff25f9fda: Merge tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23021
# First few build errors in logs:
# 00:05:09 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:09 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
# 00:08:22 make: *** [Makefile:1853: crypto] Error 2
# 00:15:17 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:15:17 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:15:42 make[3]: *** [scripts/Makefile.build:465: drivers/gpu/drm/selftests] Error 2
# 00:31:04 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1434:12: error: stack frame size (1080) exceeds limit (1024) in 'smu_v13_0_7_get_power_profile_mode' [-Werror,-Wframe-larger-than]
# 00:31:04 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o] Error 1
# 00:33:33 drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: stack frame size (1040) exceeds limit (1024) in 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]
# 00:33:34 make[3]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/core/rtw_security.o] Error 1

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23022

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.0-rc4-215-ge35ff25f9fda commit for tcwg_kernel:
commit e35ff25f9fda4385249f909bce21c8f759bc46d4
Merge: 22b2e2d6ab35 2a2dfc869d33
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Sep 9 14:13:36 2022 -0400

    Merge tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull KUnit fixes from Shuah Khan:
     "Two fixes to test build and a fix for incorrect taint reason reporting"
    
    * tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      tools: Add new "test" taint to kernel-chktaint
      kunit: fix Kconfig for build-in tests USB4 and Nitro Enclaves
      kunit: fix assert_type for comparison macros
* llvm-release-arm-mainline-allmodconfig
** Failure after v6.0-rc4-215-ge35ff25f9fda: Merge tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainline-allmodconfig/396/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainline-allmodconfig/396/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainline-allmodconfig/395/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-e35ff25f9fda4385249f909bce21c8f759bc46d4
cd investigate-linux-e35ff25f9fda4385249f909bce21c8f759bc46d4

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainline-allmodconfig/396/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainline-allmodconfig/395/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit e35ff25f9fda4385249f909bce21c8f759bc46d4
Merge: 22b2e2d6ab35 2a2dfc869d33
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Sep 9 14:13:36 2022 -0400

    Merge tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull KUnit fixes from Shuah Khan:
     "Two fixes to test build and a fix for incorrect taint reason reporting"
    
    * tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      tools: Add new "test" taint to kernel-chktaint
      kunit: fix Kconfig for build-in tests USB4 and Nitro Enclaves
      kunit: fix assert_type for comparison macros

commit 2a2dfc869d3345ccdd91322b023f4b0da84acbe7
Author: Joe Fradley <joefradley@google.com>
Date:   Tue Aug 23 21:19:33 2022 -0700

    tools: Add new "test" taint to kernel-chktaint
    
    Commit c272612cb4a2 ("kunit: Taint the kernel when KUnit tests are run")
    added a new taint flag for when in-kernel tests run. This commit adds
    recognition of this new flag in kernel-chktaint.
    
    With this change the correct reason will be reported if the kernel is
    tainted because of a test run.
    Amended Commit log: Shuah Khan <skhan@linuxfoundation.org>
    
    Reviewed-by: David Gow <davidgow@google.com>
    Signed-off-by: Joe Fradley <joefradley@google.com>
    Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/debugging/kernel-chktaint | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-chktaint
index f1af27ce9f20..279be06332be 100755
--- a/tools/debugging/kernel-chktaint
+++ b/tools/debugging/kernel-chktaint
@@ -187,6 +187,7 @@ else
 	echo " * auxiliary taint, defined for and used by distros (#16)"
 
 fi
+
 T=`expr $T / 2`
 if [ `expr $T % 2` -eq 0 ]; then
 	addout " "
@@ -195,6 +196,14 @@ else
 	echo " * kernel was built with the struct randomization plugin (#17)"
 fi
 
+T=`expr $T / 2`
+if [ `expr $T % 2` -eq 0 ]; then
+	addout " "
+else
+	addout "N"
+	echo " * an in-kernel test (such as a KUnit test) has been run (#18)"
+fi
+
 echo "For a more detailed explanation of the various taint flags see"
 echo " Documentation/admin-guide/tainted-kernels.rst in the Linux kernel sources"
 echo " or https://kernel.org/doc/html/latest/admin-guide/tainted-kernels.html"

commit 793f55b2971e3a95d77ad08e9da2a3dc6c946cd7
Author: Nico Pache <npache@redhat.com>
Date:   Wed Aug 10 19:40:56 2022 -0400

    kunit: fix Kconfig for build-in tests USB4 and Nitro Enclaves
    
    Both the USB4 and Nitro Enclaves KUNIT tests are now able to be compiled
    if KUNIT is compiled as a module. This leads to issues if KUNIT is being
    packaged separately from the core kernel and when KUNIT is run baremetal
    without the required driver compiled into the kernel.
    
    Fixes: 635dcd16844b ("thunderbolt: test: Use kunit_test_suite() macro")
    Fixes: fe5be808fa6c ("nitro_enclaves: test: Use kunit_test_suite() macro")
    Signed-off-by: Nico Pache <npache@redhat.com>
    Reviewed-by: David Gow <davidgow@google.com>
    Reviewed-by: Andra Paraschiv <andraprs@amazon.com>
    Acked-by: Brendan Higgins <brendanhiggins@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/thunderbolt/Kconfig         | 3 +--
 drivers/virt/nitro_enclaves/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index e76a6c173637..f12d0a3ee3e2 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -29,8 +29,7 @@ config USB4_DEBUGFS_WRITE
 
 config USB4_KUNIT_TEST
 	bool "KUnit tests" if !KUNIT_ALL_TESTS
-	depends on (USB4=m || KUNIT=y)
-	depends on KUNIT
+	depends on USB4 && KUNIT=y
 	default KUNIT_ALL_TESTS
 
 config USB4_DMA_TEST
diff --git a/drivers/virt/nitro_enclaves/Kconfig b/drivers/virt/nitro_enclaves/Kconfig
index ce91add81401..dc4d25c26256 100644
--- a/drivers/virt/nitro_enclaves/Kconfig
+++ b/drivers/virt/nitro_enclaves/Kconfig
@@ -17,7 +17,7 @@ config NITRO_ENCLAVES
 
 config NITRO_ENCLAVES_MISC_DEV_TEST
 	bool "Tests for the misc device functionality of the Nitro Enclaves" if !KUNIT_ALL_TESTS
-	depends on NITRO_ENCLAVES && KUNIT
+	depends on NITRO_ENCLAVES && KUNIT=y
 	default KUNIT_ALL_TESTS
 	help
 	  Enable KUnit tests for the misc device functionality of the Nitro

commit aded3cad909581c60335037112c4f86bbfe90f17
Author: Sander Vanheule <sander@svanheule.net>
Date:   Sun Aug 21 17:01:47 2022 +0200

    kunit: fix assert_type for comparison macros
    
    When replacing KUNIT_BINARY_*_MSG_ASSERTION() macros with
    KUNIT_BINARY_INT_ASSERTION(), the assert_type parameter was not always
    correctly transferred.  Specifically, the following errors were
    introduced:
      - KUNIT_EXPECT_LE_MSG() uses KUNIT_ASSERTION
      - KUNIT_ASSERT_LT_MSG() uses KUNIT_EXPECTATION
      - KUNIT_ASSERT_GT_MSG() uses KUNIT_EXPECTATION
    
    A failing KUNIT_EXPECT_LE_MSG() test thus prevents further tests from
    running, while failing KUNIT_ASSERT_{LT,GT}_MSG() tests do not prevent
    further tests from running.  This is contrary to the documentation,
    which states that failing KUNIT_EXPECT_* macros allow further tests to
    run, while failing KUNIT_ASSERT_* macros should prevent this.
    
    Revert the KUNIT_{ASSERTION,EXPECTATION} switches to fix the behaviour
    for the affected macros.
    
    Fixes: 40f39777ce4f ("kunit: decrease macro layering for integer asserts")
    Signed-off-by: Sander Vanheule <sander@svanheule.net>
    Reviewed-by: Daniel Latypov <dlatypov@google.com>
    Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/kunit/test.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index c958855681cc..840a2c375065 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -826,7 +826,7 @@ do {									       \
 
 #define KUNIT_EXPECT_LE_MSG(test, left, right, fmt, ...)		       \
 	KUNIT_BINARY_INT_ASSERTION(test,				       \
-				   KUNIT_ASSERTION,			       \
+				   KUNIT_EXPECTATION,			       \
 				   left, <=, right,			       \
 				   fmt,					       \
 				    ##__VA_ARGS__)
@@ -1116,7 +1116,7 @@ do {									       \
 
 #define KUNIT_ASSERT_LT_MSG(test, left, right, fmt, ...)		       \
 	KUNIT_BINARY_INT_ASSERTION(test,				       \
-				   KUNIT_EXPECTATION,			       \
+				   KUNIT_ASSERTION,			       \
 				   left, <, right,			       \
 				   fmt,					       \
 				    ##__VA_ARGS__)
@@ -1157,7 +1157,7 @@ do {									       \
 
 #define KUNIT_ASSERT_GT_MSG(test, left, right, fmt, ...)		       \
 	KUNIT_BINARY_INT_ASSERTION(test,				       \
-				   KUNIT_EXPECTATION,			       \
+				   KUNIT_ASSERTION,			       \
 				   left, >, right,			       \
 				   fmt,					       \
 				    ##__VA_ARGS__)
</cut>
------=_Part_18271_1834936591.1663040623824--
