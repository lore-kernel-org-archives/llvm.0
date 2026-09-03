Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181954FECD2
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467867; cv=none; b=HUxWbXpw5lXcYjfNC8oz1s5k3fMHfLFTIM7FoBQu7//PbHoJhyArc34CwoM1Zeq84i6PvA6jEeJPcXjIPPXJPctAzqKNEJ31GhkfWZBVRCm1IY0+IlOGbSrgY3IHydlLji4mSBe3aDMBaWQKGcGYFgG7oERmFxSH7k9T8S+FU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467867; c=relaxed/simple;
	bh=2UBlYQEyGWOQDtIcz85wPWpuQThTw5iKFdTHWIgVFSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Do+ejlVm9mtEe61b60Gg6HqJuEwbgIRn3q9EBouY6WnrekdQMIM8Uaj/SGV41Kt7O2KAzFdR5SLNrINYJxXttZGPpIIT4c9HX4V1mKJJs4m8Tnz5/I8wifjPhoHPeximzIpCGfQ4dwUA+lcrCOPGt9sxP8wMMOkDzZLBRJYA1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UINMliz1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UINMliz1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f96c5b722so231262f8f.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467856; x=1789072656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JG5wHGxobGMru3PHPCCaPFK+av72ZMxaO+XhGsfKu1Y=;
        b=UINMliz1fwR39Z6IZXzU2docYkmXwLBu3sLLkoBe4lZSre0TKTrxr4+6L8Hl9NYLOz
         cDlzA1siQlQ4sfaz+xgZQmAS9J9Iu+z0PvE8Ok9AxQSLBb54AVcn3IrmmtdhLY1Qq4RW
         8Fu+ukvQlRrPyGm5LOY4QiKPrm49BvyJvvp1wJRUIfa2UaVpYevpNECI3110LpQx0DUN
         R4i/AVHtMTpWQUGR8RxSAO+9qTUgjN4oPrwoZcLnjh7wM5r8nFMq8W52ChYOmOIV6AKu
         qilN2EkM0G8EI+4FMGVoXsWhkc2EkrUI1vPLnZya7Oahvx+GSyFSLFS4vrsR+/NycCRx
         pGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467856; x=1789072656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JG5wHGxobGMru3PHPCCaPFK+av72ZMxaO+XhGsfKu1Y=;
        b=Wdzp+lm4gPBQcAT4DsaYbx+uWE36NgTIhYl7sTTnnABy7nQDbGz1ODYSFBpLPpefpf
         DVlUO+Q3mBgVQZgMAQVJwzi4xMwQnyB9TbvENQOau5fhcDOBZvv+F3V0wwTUbefzzHz5
         WB2ydn7Ix69+qmsENcRqJGFfah6ryqYeHxixA6AZtOn3PQCb8+XsbzMWoiCc+QKgm46h
         JaS9RA1vv95zPndhfGGpFlcyaMZF3w9SMnmAVjBqfeUH2B5suV0UbUMFXsg6qythAwZK
         3YHJWWHF8g/TB607wq5Phbs3kwi5nPVp7N0UeC3i6d2KM2LuuPy1fdWoB1VblleQi82+
         AeYg==
X-Forwarded-Encrypted: i=1; AKwUvBwEhavZ912RlOQzM+Mu3YVLIv3A6JRcHzxKeAJ02xvhv+TdvNJMSeBfKn0VY7KZsbbKnDOB@lists.linux.dev
X-Gm-Message-State: AFuF++lPfVDY1dxYp49ywFM1J30K3Kmr+xp4fxZhOIc9l83K9lRT9jW3
	+dvHsS5I4viNazUWesGUYpVrVNv6CyFSxcFP8EHAYUGh4VUa3S8fuFwt
X-Gm-Gg: AYBFou0FbGBSl5mpKcPGYbItTJYjWBSuMAhqLrA1FCDDNvN9Drck94yavGEMDBRkl4J
	jZ13t+NSDET4rfTCe4zloseObndn4Yv59VG3Sp1JkDQBd9CM5S30Db26yiaBfe7sB2iPhluTyBn
	1hjI/Dq5xymE5S31bvWQtsuMQwe9cbZb/CTXGlw4OBdVMQYuFWyhOcc4SWYIf5mWCfGT9sEGVVP
	TQNyJ1HwO9cak/87Nf02EDnPJ0BxJ4TZHrodTieYYkIwazjCatVvyEBR5uzG4qLtqF5GcuSWURH
	KGJRbkHEbab5DRwDLkChFchyACJCAvdRH3bDEgW41T217KNgCMZkQhzINty2vmtwDoO3EUAXOHO
	uG7WsdiC9+unyq3xtd/qBHLzwzJZuRxKELC2c/mVCfZQ2P0SsTL8gAJQct9XWJPb7kP57ZEctwO
	YI/s7sq0ZMpsmWJsD6Cir4CjpmKcHw8G7Wsg1dG8pvvXRyzXCKC4wzkWKEbpk92R35Aa4oVhlFo
	xbKJzdOnhi+QpyhhaQAdE6gRMh1biL2olbhR0nyMNUxPWMAiU1B3bMpNInfLQP7dN4JXdvZOm95
	POt+G0zK8iEqBCPLldmKty+tPxSJw0MulLeNCsoU7yl2wm0a+yGkCkeWIHD3ciGI4Aoou5v6tht
	zh5W8
X-Received: by 2002:a05:6000:4b0f:b0:484:3647:d977 with SMTP id ffacd0b85a97d-485872df445mr2610818f8f.27.1788467855677;
        Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 5/5] slab: test ERR_PTR handling in kfree and hardened usercopy
Date: Thu,  3 Sep 2026 22:37:20 +0200
Message-Id: <20260903203720.63689-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit coverage that kfree() warns and returns for ERR_PTR values
while remaining silent for NULL and ZERO_SIZE_PTR.

Add an LKDTM test that verifies hardened usercopy rejects an ERR_PTR
before attempting the copy.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/misc/lkdtm/usercopy.c           | 27 +++++++++++++++++++++++++
 lib/tests/slub_kunit.c                  | 18 +++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/misc/lkdtm/usercopy.c b/drivers/misc/lkdtm/usercopy.c
index 67db57249a34..10751e48211f 100644
--- a/drivers/misc/lkdtm/usercopy.c
+++ b/drivers/misc/lkdtm/usercopy.c
@@ -4,6 +4,7 @@
  * hardening.
  */
 #include "lkdtm.h"
+#include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
@@ -273,6 +274,31 @@ static void do_usercopy_slab_whitelist(bool to_user)
 }
 
 /* Callable tests. */
+static void lkdtm_USERCOPY_ERR_PTR(void)
+{
+	unsigned long user_addr;
+	size_t size = unconst + 1;
+
+	user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
+			    PROT_READ | PROT_WRITE,
+			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	if (user_addr >= TASK_SIZE) {
+		pr_warn("Failed to allocate user memory\n");
+		return;
+	}
+
+	pr_info("attempting bad one-byte copy_to_user() from ERR_PTR\n");
+	if (copy_to_user((void __user *)user_addr, ERR_PTR(-EINVAL), size)) {
+		pr_warn("copy_to_user failed, but lacked Oops\n");
+		goto free_user;
+	}
+	pr_err("FAIL: ERR_PTR usercopy not detected!\n");
+	pr_expected_config_param(CONFIG_HARDENED_USERCOPY, "hardened_usercopy");
+
+free_user:
+	vm_munmap(user_addr, PAGE_SIZE);
+}
+
 static void lkdtm_USERCOPY_SLAB_SIZE_TO(void)
 {
 	do_usercopy_slab_size(true);
@@ -439,6 +465,7 @@ void __exit lkdtm_usercopy_exit(void)
 }
 
 static struct crashtype crashtypes[] = {
+	CRASHTYPE(USERCOPY_ERR_PTR),
 	CRASHTYPE(USERCOPY_SLAB_SIZE_TO),
 	CRASHTYPE(USERCOPY_SLAB_SIZE_FROM),
 	CRASHTYPE(USERCOPY_SLAB_WHITELIST_TO),
diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 923d8646bca1..079563387007 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -507,6 +507,23 @@ static void test_zero_size_alloc(struct kunit *test)
 	kvfree(ZERO_SIZE_PTR);
 }
 
+static void test_kfree_err_ptr(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		kfree(NULL);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		kfree(ZERO_SIZE_PTR);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		kfree(ERR_PTR(-EINVAL));
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -532,6 +549,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
 	KUNIT_CASE(test_zero_size_alloc),
+	KUNIT_CASE(test_kfree_err_ptr),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..d3e38c1c75cd 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -70,6 +70,7 @@ REFCOUNT_DEC_AND_TEST_SATURATED Saturation detected: still saturated
 REFCOUNT_SUB_AND_TEST_SATURATED Saturation detected: still saturated
 #REFCOUNT_TIMING timing only
 #ATOMIC_TIMING timing only
+USERCOPY_ERR_PTR Kernel memory exposure attempt detected from ERR_PTR
 USERCOPY_SLAB_SIZE_TO
 USERCOPY_SLAB_SIZE_FROM
 USERCOPY_SLAB_WHITELIST_TO
-- 
2.53.0

