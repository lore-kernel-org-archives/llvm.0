Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33621A314A
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738971530; cv=none; b=rmok3BBhmLP22ffIrU1DkOGQ20ps05ypagX+6dP/wJ/sXdevcRCV3f81WqTlZQIdQdWYjwuD/5XXFp2QGChjKyCFpeqkQuqyQwhAcQjLoXykF5Gr8W51H0XM5r47zyIiPzPtujrRlOfKshmMsPh0l95klq3wxZnFzAFbEILbUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738971530; c=relaxed/simple;
	bh=BkTWJoWP2WfdeOTFjlr/lcL4ibVk6vt/UZhSO/XKCNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TKzZFkwmVHNZhsk07ABqVc+hOoNHlkwRkj8hQHP6f0VoXxUCtH5oYDYMPLM3lW3urn5cC/Q0h/+/rlwo0dU9A7mANdne60siZpvrxgfjdIyk8tfN+CGOzcf+NY652pfL3db9I6IoSYdYsnOMavDHFDRvR8VDHVUaW3VPB+au7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7yTmeKM; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7yTmeKM"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd0d09215aso20889946d6.2
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 15:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738971527; x=1739576327; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gNXBg4daHIABB/yTMDVoSJWD25P1rTtltrI8i7arR5c=;
        b=K7yTmeKMuFa3o5hi6dlE37N6m9uaio6+RNYTbC27uEfTybmrFeiNE7T6wO29LcZbqj
         dsEFhVx9LGqSFv8LUHZcctLFcKeHV8YLyW3vHZvlumcADI8vSk6C1/VoYq+MBAQcoGAS
         VXNGm8Gf8I/eJbKguEkkvf0pLIRDK1xk6O6zOSRUNqdrPp5oPeZz25Y+Ton0Vc0R2PAS
         IY1r87EqxthIA1ctb+PPno26eSqq+eMkHBrSyodNAsPlJdQPCfNLdny0IujP2M33H8K1
         BiNeZXW9T9mhw+VnM12FVa0y39wK0+hZ5PBbcGf8WAaUO4oRRQXkNCPz6VbIXerUSbEl
         TmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738971527; x=1739576327;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNXBg4daHIABB/yTMDVoSJWD25P1rTtltrI8i7arR5c=;
        b=kmk3+nAJ/UTvoBm3vl3t2eGZmJr08st14qELS4lLWX+Tp8B96tvzMrOD3zamUCqsS0
         0VQ6i014JG67LRwpai9ITH9oh/x9AhEJx7zqEyNMOCk8GtEZA7y6f86j+8ClsQeyWAf1
         nDk4k/NO2Is9Pd7OTwHQsTTrce+E2vuph/cv5cWsPt4ZIPli6qYKpK2dBa5oaQQVHvZs
         bQux+ye2IfUGIuyzPSafl7WNSQtQFyGOfDoTwIOMXouZS66KMOXjfXlwlz2I2FXuAHjF
         MeSyKKDiWK13lLbVeP3HN+/1qCuBqjukV0Dj3bdnjSJWRGe2X9LX9vqWM+LGAf7uzFAR
         PoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF3/MBoT2yGVmT81ifSE9iPdlkqGj4reRyEr5sYMkpC3QVsVpVwmFnj9STQWaXvXl7Y481@lists.linux.dev
X-Gm-Message-State: AOJu0YwANEDG7+pi/DoQqi7LLU5rU81Y47u7p+j9yYDkNoWBZeLGpeM6
	80R6vrERBFOWsnY83/ZZanB6Fqfx8uPErpw45u8jnysZzxqsO8tLXAg0+ZZP
X-Gm-Gg: ASbGncut69BKBxkM37WN7pyTrZIhnjHLcpjmVg1k+itC2FLCaQQF0T5HSVjN/mKv3E0
	r0kWBZrPfJygshGq1JetLMPW1EOiCk0wHox/TWXe8g8X0wd58i7FqHLiNJoBCl+Ll/E+zxZCaVD
	t1nqPsvJeL7Th4znasdLOK7XFsnz8MxiTrpJE5vjIG4C8LjAis9UWUamnhXHyLEOkVjcTv3Spx8
	bH+9RROkd+/YLX7opZ5qs3jfqlwqa7k5sYdyFOn8AxaFmuhSpI8GsNPZ4bmtJW3r5czLoq52tTp
	V5omRIfJN8h4BlHgbgNmRZYNW/MVTdfXjzX5O38mkm13ApaZRA==
X-Google-Smtp-Source: AGHT+IFgwe+y0rnFQIDXEowT8WZlxbeKXv4NpGTED5yOqbyNN1kdkaooufe+2Y2XJ+62b9eMKCK6CA==
X-Received: by 2002:a05:6214:2125:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6e4456e0c44mr73149906d6.38.1738971526687;
        Fri, 07 Feb 2025 15:38:46 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:c58e:ed03:1b60:c56d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43baacbbasm22006416d6.73.2025.02.07.15.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:38:45 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Feb 2025 18:38:41 -0500
Subject: [PATCH] blackhole_dev: convert self-test to KUnit
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-blackholedev-kunit-convert-v1-1-8ef0dc1ff881@gmail.com>
X-B4-Tracking: v=1; b=H4sIAICZpmcC/x3MQQqAIBBA0avErBuwiYi6SrQwm2ooNLQkkO6ex
 F+9zU8Q2AsH6IsEnqMEcTajKgswm7Yro8zZQIoaRarF6dBm39zBM0fcbysXGmcj+ws73ZCucqo
 myIPT8yLPPx/G9/0A2TrPEmwAAAA=
X-Change-ID: 20250207-blackholedev-kunit-convert-9a52a1a1a032
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Convert this very simple smoke test to a KUnit test.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 --kconfig_add CONFIG_NET=y blackholedev
---
 lib/Kconfig.debug                                  | 20 +++++-----
 lib/Makefile                                       |  2 +-
 ...{test_blackhole_dev.c => blackhole_dev_kunit.c} | 45 ++++++++--------------
 tools/testing/selftests/net/Makefile               |  2 +-
 tools/testing/selftests/net/test_blackhole_dev.sh  | 11 ------
 5 files changed, 28 insertions(+), 52 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1af972a92d06..238321830993 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2557,15 +2557,6 @@ config TEST_BPF
 
 	  If unsure, say N.
 
-config TEST_BLACKHOLE_DEV
-	tristate "Test blackhole netdev functionality"
-	depends on m && NET
-	help
-	  This builds the "test_blackhole_dev" module that validates the
-	  data path through this blackhole netdev.
-
-	  If unsure, say N.
-
 config FIND_BIT_BENCHMARK
 	tristate "Test find_bit functions"
 	help
@@ -2888,6 +2879,17 @@ config USERCOPY_KUNIT_TEST
 	  on the copy_to/from_user infrastructure, making sure basic
 	  user/kernel boundary testing is working.
 
+config BLACKHOLE_DEV_KUNIT_TEST
+	tristate "Test blackhole netdev functionality" if !KUNIT_ALL_TESTS
+	depends on NET
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the "blackhole_dev_kunit" module that validates the
+	  data path through this blackhole netdev.
+
+	  If unsure, say N.
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index d5cfc7afbbb8..19ff6993c2bc 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -102,7 +102,6 @@ obj-$(CONFIG_TEST_RUNTIME) += tests/
 obj-$(CONFIG_TEST_DEBUG_VIRTUAL) += test_debug_virtual.o
 obj-$(CONFIG_TEST_MEMCAT_P) += test_memcat_p.o
 obj-$(CONFIG_TEST_OBJAGG) += test_objagg.o
-obj-$(CONFIG_TEST_BLACKHOLE_DEV) += test_blackhole_dev.o
 obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 obj-$(CONFIG_TEST_LOCKUP) += test_lockup.o
 obj-$(CONFIG_TEST_HMM) += test_hmm.o
@@ -393,6 +392,7 @@ obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
 obj-$(CONFIG_CRC_KUNIT_TEST) += crc_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
+obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) += blackhole_dev_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
diff --git a/lib/test_blackhole_dev.c b/lib/blackhole_dev_kunit.c
similarity index 70%
rename from lib/test_blackhole_dev.c
rename to lib/blackhole_dev_kunit.c
index ec290ac2a0d9..f8f5184d5b43 100644
--- a/lib/test_blackhole_dev.c
+++ b/lib/blackhole_dev_kunit.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * This module tests the blackhole_dev that is created during the
+ * This tests the blackhole_dev that is created during the
  * net subsystem initialization. The test this module performs is
  * by injecting an skb into the stack with skb->dev as the
  * blackhole_dev and expects kernel to behave in a sane manner
@@ -9,9 +9,8 @@
  * Copyright (c) 2018, Mahesh Bandewar <maheshb@google.com>
  */
 
-#include <linux/init.h>
+#include <kunit/test.h>
 #include <linux/module.h>
-#include <linux/printk.h>
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
 #include <linux/udp.h>
@@ -25,17 +24,15 @@
 
 #define UDP_PORT 1234
 
-static int __init test_blackholedev_init(void)
+static void test_blackholedev(struct kunit *test)
 {
 	struct ipv6hdr *ip6h;
 	struct sk_buff *skb;
 	struct udphdr *uh;
 	int data_len;
-	int ret;
 
 	skb = alloc_skb(SKB_SIZE, GFP_KERNEL);
-	if (!skb)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, skb);
 
 	/* Reserve head-room for the headers */
 	skb_reserve(skb, HEAD_SIZE);
@@ -68,32 +65,20 @@ static int __init test_blackholedev_init(void)
 	skb->dev = blackhole_netdev;
 
 	/* Now attempt to send the packet */
-	ret = dev_queue_xmit(skb);
-
-	switch (ret) {
-	case NET_XMIT_SUCCESS:
-		pr_warn("dev_queue_xmit() returned NET_XMIT_SUCCESS\n");
-		break;
-	case NET_XMIT_DROP:
-		pr_warn("dev_queue_xmit() returned NET_XMIT_DROP\n");
-		break;
-	case NET_XMIT_CN:
-		pr_warn("dev_queue_xmit() returned NET_XMIT_CN\n");
-		break;
-	default:
-		pr_err("dev_queue_xmit() returned UNKNOWN(%d)\n", ret);
-	}
-
-	return 0;
+	KUNIT_EXPECT_EQ(test, dev_queue_xmit(skb), NET_XMIT_SUCCESS);
 }
 
-static void __exit test_blackholedev_exit(void)
-{
-	pr_warn("test_blackholedev module terminating.\n");
-}
+static struct kunit_case blackholedev_cases[] = {
+	KUNIT_CASE(test_blackholedev),
+	{},
+};
+
+static struct kunit_suite blackholedev_suite = {
+	.name = "blackholedev",
+	.test_cases = blackholedev_cases,
+};
 
-module_init(test_blackholedev_init);
-module_exit(test_blackholedev_exit);
+kunit_test_suite(blackholedev_suite);
 
 MODULE_AUTHOR("Mahesh Bandewar <maheshb@google.com>");
 MODULE_DESCRIPTION("module test of the blackhole_dev");
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 73ee88d6b043..afa4bcdc5833 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -7,7 +7,7 @@ CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
 CFLAGS += -I../
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh \
-	      rtnetlink.sh xfrm_policy.sh test_blackhole_dev.sh
+	      rtnetlink.sh xfrm_policy.sh
 TEST_PROGS += fib_tests.sh fib-onlink-tests.sh pmtu.sh udpgso.sh ip_defrag.sh
 TEST_PROGS += udpgso_bench.sh fib_rule_tests.sh msg_zerocopy.sh psock_snd.sh
 TEST_PROGS += udpgro_bench.sh udpgro.sh test_vxlan_under_vrf.sh reuseport_addr_any.sh
diff --git a/tools/testing/selftests/net/test_blackhole_dev.sh b/tools/testing/selftests/net/test_blackhole_dev.sh
deleted file mode 100755
index 3119b80e711f..000000000000
--- a/tools/testing/selftests/net/test_blackhole_dev.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-# Runs blackhole-dev test using blackhole-dev kernel module
-
-if /sbin/modprobe -q test_blackhole_dev ; then
-	/sbin/modprobe -q -r test_blackhole_dev;
-	echo "test_blackhole_dev: ok";
-else
-	echo "test_blackhole_dev: [FAIL]";
-	exit 1;
-fi

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-blackholedev-kunit-convert-9a52a1a1a032

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

