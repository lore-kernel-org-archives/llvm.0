Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FEC2F52;
	Mon, 17 Jul 2023 22:04:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666e97fcc60so3234378b3a.3;
        Mon, 17 Jul 2023 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689631480; x=1692223480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbBg1qhK9YTZ0sKHzhZcMzAk3NkTTX/1n/b9teLLE3k=;
        b=pKFC50AyGRPQt1B/FTQKbvTlG//MP6daamMY17PhBKatjdHCUeynXF4qBlwgQPcHVD
         TLFNA7cRdDtojThrqzBaWXlUCsdMtdUdn0l/JdVSr8DggO+cwEheGGBtXpoqO27wTpgG
         lcpAKzHO5Eqt64RiqkoXawdbWNm83QOqETOTH3+qgkY5VognwfniWLv/x5susfsMr5xL
         rostPYGWZzPTuWowdSXGmiLsqMLsQuHuFsxmDpbDjjc0MkltVAojPpNaqvuf+9VM2/+X
         ZTyQrgIrMaxuwaNRi+2UkzMzM421+DKJAWn1t6Ai4BDCbcRYA4R26PBNkKH6qgJYnuR8
         m4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689631480; x=1692223480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbBg1qhK9YTZ0sKHzhZcMzAk3NkTTX/1n/b9teLLE3k=;
        b=WFojWY1SFn08KitxJxSvyjN0AVAcZr+lEeeyE6YqGoK7lnwOICOCJfaOLdCb8uUcEC
         lmhKolQnxXdkmw6v2CSclcaHvuPJr1HP/7hcZBwzImnGfmWht9Rmh3OC5Q1kClyv7y2J
         pXXv0wPi7gLgcOdcvMbQV0r8T/BoMIfAaVN6OK7Q7YlkhmNQB4x7o+Y3kwYbeUko0gLa
         whoptoNwqBciiLjXv+8kgcyjM8UpVLIn860GW4uIogFEkq2oGsJ4SRidCYzfjM2z2W9Y
         Wiixcbas3eULnfTbBFribtI9FIkD6Ku5leUktybsNMcsUC1ycV/3mCBP6256USyF5gBx
         q8BQ==
X-Gm-Message-State: ABy/qLaQhPtuHT5Ke/3B64Io9A2+CMHsdj26FVY5QrPrJIXlnQB8VwNa
	ytUh4TbHhhdIgbip+KNW520=
X-Google-Smtp-Source: APBJJlHFav2HOy8yjaRTEjXbSFfJfB9R1L/v4XNmRQpLXJlO1CBfmH3qkIvoVRo9thSlgIkXMaicIg==
X-Received: by 2002:a05:6a20:8406:b0:104:ad71:f080 with SMTP id c6-20020a056a20840600b00104ad71f080mr14161794pzd.34.1689631479922;
        Mon, 17 Jul 2023 15:04:39 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id z68-20020a633347000000b0054fe7736ac1sm251622pgz.76.2023.07.17.15.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:04:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] lib/bitmap: workaround const_eval test build failure
Date: Mon, 17 Jul 2023 15:04:35 -0700
Message-Id: <20230717220435.57640-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with Clang, and when KASAN and GCOV_PROFILE_ALL are both
enabled, the test fails to build [1]:

>> lib/test_bitmap.c:920:2: error: call to '__compiletime_assert_239' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
           BUILD_BUG_ON(!__builtin_constant_p(res));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:185:1: note: expanded from here
   __compiletime_assert_239

Originally it was attributed to s390, which now looks seemingly wrong. The
issue is not related to bitmap code itself, but it breaks build for a given
configuration.

Disabling the const_eval test under that config may potentially hide other
bugs. Instead, workaround it by disabling GCOV for the test_bitmap unless
the compiler will get fixed.

[1] https://github.com/ClangBuiltLinux/linux/issues/1874

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307171254.yFcH97ej-lkp@intel.com/
Fixes: dc34d5036692 ("lib: test_bitmap: add compile-time optimization/evaluations assertions")
Co-developed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/Makefile      | 6 ++++++
 lib/test_bitmap.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 42d307ade225..1ffae65bb7ee 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -82,7 +82,13 @@ obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
 obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
+
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
+ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_KASAN),yy)
+# FIXME: Clang breaks test_bitmap_const_eval when KASAN and GCOV are enabled
+GCOV_PROFILE_test_bitmap.o := n
+endif
+
 obj-$(CONFIG_TEST_UUID) += test_uuid.o
 obj-$(CONFIG_TEST_XARRAY) += test_xarray.o
 obj-$(CONFIG_TEST_MAPLE_TREE) += test_maple_tree.o
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 187f5b2db4cf..4a678de9c350 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -1161,6 +1161,10 @@ static void __init test_bitmap_print_buf(void)
 	}
 }
 
+/*
+ * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are enabled.
+ * To workaround it, GCOV is force-disabled in Makefile for this configuration.
+ */
 static void __init test_bitmap_const_eval(void)
 {
 	DECLARE_BITMAP(bitmap, BITS_PER_LONG);
@@ -1186,11 +1190,7 @@ static void __init test_bitmap_const_eval(void)
 	 * the compiler is fixed.
 	 */
 	bitmap_clear(bitmap, 0, BITS_PER_LONG);
-#if defined(__s390__) && defined(__clang__)
-	if (!const_test_bit(7, bitmap))
-#else
 	if (!test_bit(7, bitmap))
-#endif
 		bitmap_set(bitmap, 5, 2);
 
 	/* Equals to `unsigned long bitopvar = BIT(20)` */
-- 
2.39.2

