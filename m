Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19E30C0FF
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204339; cv=none; b=bD3L0RzzCunksmGfCC079gn107/2ebzHgCBdj/lmuJ6y+gqLbnT4hVGgTgPAkAY9z8zyxcvChAaFujHrf3MdXVP7wPrHFnjWvcNs8aXTowBzL3d4aMA/nzvTc4hcJWSoRZmsKWZw2+SRRqfFKQqxUlWaoxC8BMnI1jClyxYdGyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204339; c=relaxed/simple;
	bh=YFPiP1mMv08oGnDoFVb56xSlzuYas8Ebz6py8GTO16E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RZkhvG+2lH1qRD38I1A71P17eVoBehxVLzjTZtErp6Bq1vG7xS6ZYBbNImxLIx32pEg2FxtFJEQQJzeqweeG5y4yzsT58afaNyOjdD7mAQmRTsuuhuLl7ulZUVBNTH3MRoD6ozwQNyvl1N3+v+fdNu/p8AnyBPUoZk9wR/vA+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrtag2Gm; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrtag2Gm"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-afcb72a8816so102332766b.0
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204335; x=1758809135; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRwMz0bPjU6VOADE1reTzyKkaNRl/lw6aWShINvk68c=;
        b=rrtag2Gm7fOfNakOSENlDkKiyXbWHg91uk6exCU4zVCGFQihNObTUapRUHh0GPQ+Am
         8z/0UkSAqG5PvkSEESxgbpVFs5p+BoiGYLMPj1uHUQGQmYzjHmCuWf/KxKOqwM33XDZy
         D6UiaNi4/nZBBI5UqGSB/pwH9Rn5RyDGze72mYdDv8Ah8dlYaTJ+B00d1aIO81glUNSS
         y4Ub7YD1F8K0P/RBnTae+lMZt1RIkKQ+tc6K9YJnd3eBIF0F8PIdTE6OHIYaj0AWMdg2
         HiTKUpeqg2Vyn9clBxM06mSduynod3U2+ovy0Real6lIGubm/cw9ICa7Mamb+MKDUaMi
         EHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204335; x=1758809135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRwMz0bPjU6VOADE1reTzyKkaNRl/lw6aWShINvk68c=;
        b=ahesc11DOgW3tskSAsyE3rpIB0Xsp4SM72B7HYTGcB8+QN+hLOb1R0Bv0D0Y2xT39c
         ebxHKcAS9fwoPJ9SAQ5Mpy19rCHIm0fA07h99djH6M22N/TObpBiiG7Cu+fiLIvQi5Km
         cn97y/p8gtOHSjp8ZZ6jfk0HbT+sVtokjE3kR943WTHPhj/XTgdp+FWIbmCcG4IEb2xV
         nkMl7syJ4OI7h3CtJf4oplomltgkD+uBg0B/8MYusuxHvT+l0fvIx8+QPHnbWzZ0e96Z
         4uRqErj5y0+T5/tDUKcOcjvNSWlhbkQ+Y5g4WqI4UWS1cua6muslpbID4TqpiYTRza/v
         HF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVVaVlYaXE9ckAnM8RY/BXWyvIQzuBFFjOSQCRHIDPvdkAyAYI+nVJxULpAyY6kLWvfIvF@lists.linux.dev
X-Gm-Message-State: AOJu0YwlUZDiIeuVhic1K4MySol51QlLIXa9w9zLNO7vZKMmPi8bmi4c
	kOOsyfHVHHLeWNWuZflpp9rFyw9OrpUQqEDjLKcOoHJXrWBHO/mw3aPmCeF8xHeMJHGeOtK7sKS
	taw==
X-Google-Smtp-Source: AGHT+IHNHC2FtU+Fx/5Wkbv7ZWVYfhqefeCuQqPWD0VkzesG9dShOlM75C662GySJ91SvXqJsD8LbBri2w==
X-Received: from ejctl10.prod.google.com ([2002:a17:907:c30a:b0:b0b:a3bb:15d1])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d8d:b0:b11:3760:9596
 with SMTP id a640c23a62f3a-b1bba5d1389mr603989266b.60.1758204334564; Thu, 18
 Sep 2025 07:05:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:14 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-4-elver@google.com>
Subject: [PATCH v3 03/35] compiler-capability-analysis: Add test stub
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
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
index 57e09615f88d..ac024861930f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2813,6 +2813,20 @@ config LINEAR_RANGES_TEST
 
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
index 392ff808c9b9..e677cb5cc777 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -332,4 +332,7 @@ obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
 obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
 
+CAPABILITY_ANALYSIS_test_capability-analysis.o := y
+obj-$(CONFIG_CAPABILITY_ANALYSIS_TEST) += test_capability-analysis.o
+
 subdir-$(CONFIG_FORTIFY_SOURCE) += test_fortify
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
2.51.0.384.g4c02a37b29-goog

