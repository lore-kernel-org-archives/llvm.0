Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886751DEFF3
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865879; cv=none; b=GKaq9B2Gao4iMKfct62+QS5RkIGl0ebxa3DIuu+VB9VNUl4mmDrllw+OUIqPdEemW+I2eoFlNOwJQsNaHwsfPw0cVihO4JneYOYlOdfGzgrPIXkxO0WoOhC26RI1OB8+QQQWb2C0BdQOJF21hon0aCeQwzShePgE4SyEafW9ZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865879; c=relaxed/simple;
	bh=xGjyV1mmuJOCMCkvKm/wdONdE3U0T4zFS8a+y0DCXOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=drtiC0GGHQRQCOK9Kx/4ARyn3JtucFNmsZ9vV3VqkcHO6St2Z8jv4gmnKarRbn0VtzELm8CXndl5VxZXBw5YmhCtMuhQirP8pfx7dx41gKlx6Vy7KydrgGpf14zosDlj/nT/Ye4BEAugPwBls4w2CvwhNBMqwb5T64Lnz04j+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3xKdhqJd; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3xKdhqJd"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5dcd3da2aa6so1069750a12.2
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865876; x=1739470676; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NkeMRttk3RYqT58NIYnzD7f2BrALmFrVkg1AkAEzinM=;
        b=3xKdhqJdsyRAg9z+CncEkT8w9Tkyxwu8vONbeuyLC3dUoKPK4wfPQOcMlymlAuuIo5
         sufHSYKRG6MsOOWqmPKh8itMb8G8nxhhnBtiGsVevMS9THgbmheOjjQC+edA2z9EWDjT
         FOp4HklTiFpZJv9T7WSjGaEbFn3WMz08QMeWo99pwFJFx0s4RhrjCiiVCLnI82carZf+
         GXRDnrVURUB2o0QJvkK6oQEMvcjsLvSiByQIktizrJ7nYh60jZ7vDO6DIwg48LRilCEg
         Eh8nI6Ke5nuo2AMtw+1jut9tICsyxDxhqNFRAGvfrC4eLd4WTeWOEBXwNC8WuKJ5GEeF
         Y/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865876; x=1739470676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkeMRttk3RYqT58NIYnzD7f2BrALmFrVkg1AkAEzinM=;
        b=ePo3gZN0wjYluzWuHx97B0wOCyTRdkOYoLMTN0HRtXDuTnXzgKYd74eKPAX0nWcXvp
         4n3aqHp3QtXbiHwk/JMhnS+e77Z7PNFCHIuCWj55z/pk8mBK3F4aAXZCh1zxkCjkfTxO
         255gWsXBuvNxubm/eAE5v0KT/arku++nTVRicZsSdzu+t4noscZCrAJIW9oj8KIlY9Rv
         4u2LJhXnc9FftEoQr5ULazOnqf3XWfcIbQkZlwLk4ORR7OHp9Ast0hfRYYxTqgYGjT05
         wAJtEy6SkEAZesoSm97fTE6dIu0i+wEq8L0PuCw1K3SelZbOMSfx47zeFcClzLgi0jSy
         K2rg==
X-Forwarded-Encrypted: i=1; AJvYcCWX/xL1o3BHW8nLjOnkno9aXfmAOIljlm66UknVHNWDorgJdqu7uWOnk/YInNeqhyNkl5S4@lists.linux.dev
X-Gm-Message-State: AOJu0YwSWKQxHbO42ckPL7/MjxC1sh2IGhLFx3IsJErma3JIc5wDEnb7
	2qDl0VtDMUzkXCl0ivKByszFbuZmwiYkHHe4uqb4d9Ee1oCORTpePU2VpK/NKIthi5nU7greJQ=
	=
X-Google-Smtp-Source: AGHT+IGXY3SpDaruUK6VARumHi3XqNDM2oza8GEyGvEbUTnudtsurff0yLICaOG9kxpXPQLackltedLCRQ==
X-Received: from edat29.prod.google.com ([2002:a05:6402:241d:b0:5dc:764b:8e16])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2801:b0:5dc:d31a:398d
 with SMTP id 4fb4d7f45d1cf-5de450059cbmr548326a12.10.1738865875912; Thu, 06
 Feb 2025 10:17:55 -0800 (PST)
Date: Thu,  6 Feb 2025 19:09:58 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-5-elver@google.com>
Subject: [PATCH RFC 04/24] compiler-capability-analysis: Add test stub
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a simple test stub where we will add common supported patterns that
should not generate false positive of each new supported capability.

Signed-off-by: Marco Elver <elver@google.com>
---
 lib/Kconfig.debug              | 14 ++++++++++++++
 lib/Makefile                   |  3 +++
 lib/test_capability-analysis.c | 18 ++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 lib/test_capability-analysis.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 801ad28fe6d7..b76fa3dc59ec 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2764,6 +2764,20 @@ config LINEAR_RANGES_TEST
 
 	  If unsure, say N.
 
+config CAPABILITY_ANALYSIS_TEST
+	bool "Compiler capability-analysis warnings test"
+	depends on EXPERT
+	help
+	  This builds the test for compiler-based capability analysis. The test
+	  does not add executable code to the kernel, but is meant to test that
+	  common patterns supported by the analysis do not result in false
+	  positive warnings.
+
+	  When adding support for new capabilities, it is strongly recommended
+	  to add supported patterns to this test.
+
+	  If unsure, say N.
+
 config CMDLINE_KUNIT_TEST
 	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/Makefile b/lib/Makefile
index d5cfc7afbbb8..1dbb59175eb0 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -394,6 +394,9 @@ obj-$(CONFIG_CRC_KUNIT_TEST) += crc_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 
+CAPABILITY_ANALYSIS_test_capability-analysis.o := y
+obj-$(CONFIG_CAPABILITY_ANALYSIS_TEST) += test_capability-analysis.o
+
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
 obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
diff --git a/lib/test_capability-analysis.c b/lib/test_capability-analysis.c
new file mode 100644
index 000000000000..a0adacce30ff
--- /dev/null
+++ b/lib/test_capability-analysis.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Compile-only tests for common patterns that should not generate false
+ * positive errors when compiled with Clang's capability analysis.
+ */
+
+#include <linux/build_bug.h>
+
+/*
+ * Test that helper macros work as expected.
+ */
+static void __used test_common_helpers(void)
+{
+	BUILD_BUG_ON(capability_unsafe(3) != 3); /* plain expression */
+	BUILD_BUG_ON(capability_unsafe((void)2; 3;) != 3); /* does not swallow semi-colon */
+	BUILD_BUG_ON(capability_unsafe((void)2, 3) != 3); /* does not swallow commas */
+	capability_unsafe(do { } while (0)); /* works with void statements */
+}
-- 
2.48.1.502.g6dc24dfdaf-goog

