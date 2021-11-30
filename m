Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783632C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:36 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id k15-20020adfe8cf000000b00198d48342f9so3535093wrn.0
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Iys8lzbI1Nma9PwE1F52pU9iK1Hh8M3Ac0otxw9nSQU=;
        b=J8vmyXS/GrvIPUiRrmnpXnM23vlbl8gTzQcjputy0NigdXskM1exWYnaspB797D3ft
         NXocSIAu50iDgAED/KttvbRMHhNCBHezQlIAnYRMZ9EPCRUB6BLKxpnwzxpiM39ki6iF
         pKduWtSrQDLyGQCqz3v0RRIdwfkFvzy28hNjq1+FBeiURxDnOysPWhEFvDI3ZK7AwxnE
         UCBCzkcCNrNRkugsGIh5jp9/fWoiC2jjF10Zv/FFkFd/qQiXeNsbmkpyElWbkd7+p4m6
         HTQRreCIEdhOMH2P8xe0yM+3SsOfimydVe+jG1AoZ81MRqit79EgVxBGt4D/Y5n4+XsH
         qjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Iys8lzbI1Nma9PwE1F52pU9iK1Hh8M3Ac0otxw9nSQU=;
        b=s/DFHpX3Rqt5uMdRhRVaVzIC2wUr0VwdO7mgBuOrn4zvlOAtpjrqeZ4Ak1HRJpeMKt
         9cbiUiDNQOh/4Le82vxmjXsuDntv/ZrMuJZREZFnuezCMR9AFLKUz9CS2exFIkP9H2DF
         5Uvh7jvNKV0uR+aXwzFNSJdp0eKnuzEzpeQoAN/jwbKR558cnfKl0hPmwGEv7BZNhv1V
         bWdN2ECzElgGUn2sh8lkQgYaj+Bbb+7wK9cBKrEP0w0Ec/Z2y86Lk1z1dbMdJrkOCNhy
         CPOzlOkxh8QsrxYZCuw7Qx5PyoGyUSKsI1R3JbX+gAuVuptTRDSvPG2ECfFNZ0wQrreW
         EQ4A==
X-Gm-Message-State: AOAM533YYA6VrOEJO+/WqkHLq+2LCM6lXP7Wjmr7rj1dmodI4SZ1fJ+b
	6nlmmM5oVw3527aGx1VFto3yIYiXUg==
X-Google-Smtp-Source: ABdhPJwVwVRvSp7fPNqadzmvPFUOPgjn135U4JnWgImgUWee4DG8AJGh488Q1cMCbq1Z+I47903wd1OauA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:1993:: with SMTP id
 t19mr4402473wmq.21.1638272734879; Tue, 30 Nov 2021 03:45:34 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:21 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-14-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 13/25] kcsan: selftest: Add test case to check memory
 barrier instrumentation
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Memory barrier instrumentation is crucial to avoid false positives. To
avoid surprises, run a simple test case in the boot-time selftest to
ensure memory barriers are still instrumented correctly.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/Makefile   |   2 +
 kernel/kcsan/selftest.c | 141 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index c2bb07f5bcc7..ff47e896de3b 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -11,6 +11,8 @@ CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
 	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
 
 obj-y := core.o debugfs.o report.o
+
+KCSAN_INSTRUMENT_BARRIERS_selftest.o := y
 obj-$(CONFIG_KCSAN_SELFTEST) += selftest.o
 
 CFLAGS_kcsan_test.o := $(CFLAGS_KCSAN) -g -fno-omit-frame-pointer
diff --git a/kernel/kcsan/selftest.c b/kernel/kcsan/selftest.c
index b4295a3892b7..08c6b84b9ebe 100644
--- a/kernel/kcsan/selftest.c
+++ b/kernel/kcsan/selftest.c
@@ -7,10 +7,15 @@
 
 #define pr_fmt(fmt) "kcsan: " fmt
 
+#include <linux/atomic.h>
+#include <linux/bitops.h>
 #include <linux/init.h>
+#include <linux/kcsan-checks.h>
 #include <linux/kernel.h>
 #include <linux/printk.h>
 #include <linux/random.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "encoding.h"
@@ -103,6 +108,141 @@ static bool __init test_matching_access(void)
 	return true;
 }
 
+/*
+ * Correct memory barrier instrumentation is critical to avoiding false
+ * positives: simple test to check at boot certain barriers are always properly
+ * instrumented. See kcsan_test for a more complete test.
+ */
+static bool __init test_barrier(void)
+{
+#ifdef CONFIG_KCSAN_WEAK_MEMORY
+	struct kcsan_scoped_access *reorder_access = &current->kcsan_ctx.reorder_access;
+#else
+	struct kcsan_scoped_access *reorder_access = NULL;
+#endif
+	bool ret = true;
+	arch_spinlock_t arch_spinlock = __ARCH_SPIN_LOCK_UNLOCKED;
+	DEFINE_SPINLOCK(spinlock);
+	atomic_t dummy;
+	long test_var;
+
+	if (!reorder_access || !IS_ENABLED(CONFIG_SMP))
+		return true;
+
+#define __KCSAN_CHECK_BARRIER(access_type, barrier, name)					\
+	do {											\
+		reorder_access->type = (access_type) | KCSAN_ACCESS_SCOPED;			\
+		reorder_access->size = 1;							\
+		barrier;									\
+		if (reorder_access->size != 0) {						\
+			pr_err("improperly instrumented type=(" #access_type "): " name "\n");	\
+			ret = false;								\
+		}										\
+	} while (0)
+#define KCSAN_CHECK_READ_BARRIER(b)  __KCSAN_CHECK_BARRIER(0, b, #b)
+#define KCSAN_CHECK_WRITE_BARRIER(b) __KCSAN_CHECK_BARRIER(KCSAN_ACCESS_WRITE, b, #b)
+#define KCSAN_CHECK_RW_BARRIER(b)    __KCSAN_CHECK_BARRIER(KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND, b, #b)
+
+	kcsan_nestable_atomic_begin(); /* No watchpoints in called functions. */
+
+	KCSAN_CHECK_READ_BARRIER(mb());
+	KCSAN_CHECK_READ_BARRIER(rmb());
+	KCSAN_CHECK_READ_BARRIER(smp_mb());
+	KCSAN_CHECK_READ_BARRIER(smp_rmb());
+	KCSAN_CHECK_READ_BARRIER(dma_rmb());
+	KCSAN_CHECK_READ_BARRIER(smp_mb__before_atomic());
+	KCSAN_CHECK_READ_BARRIER(smp_mb__after_atomic());
+	KCSAN_CHECK_READ_BARRIER(smp_mb__after_spinlock());
+	KCSAN_CHECK_READ_BARRIER(smp_store_mb(test_var, 0));
+	KCSAN_CHECK_READ_BARRIER(smp_store_release(&test_var, 0));
+	KCSAN_CHECK_READ_BARRIER(xchg(&test_var, 0));
+	KCSAN_CHECK_READ_BARRIER(xchg_release(&test_var, 0));
+	KCSAN_CHECK_READ_BARRIER(cmpxchg(&test_var, 0,  0));
+	KCSAN_CHECK_READ_BARRIER(cmpxchg_release(&test_var, 0,  0));
+	KCSAN_CHECK_READ_BARRIER(atomic_set_release(&dummy, 0));
+	KCSAN_CHECK_READ_BARRIER(atomic_add_return(1, &dummy));
+	KCSAN_CHECK_READ_BARRIER(atomic_add_return_release(1, &dummy));
+	KCSAN_CHECK_READ_BARRIER(atomic_fetch_add(1, &dummy));
+	KCSAN_CHECK_READ_BARRIER(atomic_fetch_add_release(1, &dummy));
+	KCSAN_CHECK_READ_BARRIER(test_and_set_bit(0, &test_var));
+	KCSAN_CHECK_READ_BARRIER(test_and_clear_bit(0, &test_var));
+	KCSAN_CHECK_READ_BARRIER(test_and_change_bit(0, &test_var));
+	KCSAN_CHECK_READ_BARRIER(clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_READ_BARRIER(__clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_READ_BARRIER(clear_bit_unlock_is_negative_byte(0, &test_var));
+	arch_spin_lock(&arch_spinlock);
+	KCSAN_CHECK_READ_BARRIER(arch_spin_unlock(&arch_spinlock));
+	spin_lock(&spinlock);
+	KCSAN_CHECK_READ_BARRIER(spin_unlock(&spinlock));
+
+	KCSAN_CHECK_WRITE_BARRIER(mb());
+	KCSAN_CHECK_WRITE_BARRIER(wmb());
+	KCSAN_CHECK_WRITE_BARRIER(smp_mb());
+	KCSAN_CHECK_WRITE_BARRIER(smp_wmb());
+	KCSAN_CHECK_WRITE_BARRIER(dma_wmb());
+	KCSAN_CHECK_WRITE_BARRIER(smp_mb__before_atomic());
+	KCSAN_CHECK_WRITE_BARRIER(smp_mb__after_atomic());
+	KCSAN_CHECK_WRITE_BARRIER(smp_mb__after_spinlock());
+	KCSAN_CHECK_WRITE_BARRIER(smp_store_mb(test_var, 0));
+	KCSAN_CHECK_WRITE_BARRIER(smp_store_release(&test_var, 0));
+	KCSAN_CHECK_WRITE_BARRIER(xchg(&test_var, 0));
+	KCSAN_CHECK_WRITE_BARRIER(xchg_release(&test_var, 0));
+	KCSAN_CHECK_WRITE_BARRIER(cmpxchg(&test_var, 0,  0));
+	KCSAN_CHECK_WRITE_BARRIER(cmpxchg_release(&test_var, 0,  0));
+	KCSAN_CHECK_WRITE_BARRIER(atomic_set_release(&dummy, 0));
+	KCSAN_CHECK_WRITE_BARRIER(atomic_add_return(1, &dummy));
+	KCSAN_CHECK_WRITE_BARRIER(atomic_add_return_release(1, &dummy));
+	KCSAN_CHECK_WRITE_BARRIER(atomic_fetch_add(1, &dummy));
+	KCSAN_CHECK_WRITE_BARRIER(atomic_fetch_add_release(1, &dummy));
+	KCSAN_CHECK_WRITE_BARRIER(test_and_set_bit(0, &test_var));
+	KCSAN_CHECK_WRITE_BARRIER(test_and_clear_bit(0, &test_var));
+	KCSAN_CHECK_WRITE_BARRIER(test_and_change_bit(0, &test_var));
+	KCSAN_CHECK_WRITE_BARRIER(clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_WRITE_BARRIER(__clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_WRITE_BARRIER(clear_bit_unlock_is_negative_byte(0, &test_var));
+	arch_spin_lock(&arch_spinlock);
+	KCSAN_CHECK_WRITE_BARRIER(arch_spin_unlock(&arch_spinlock));
+	spin_lock(&spinlock);
+	KCSAN_CHECK_WRITE_BARRIER(spin_unlock(&spinlock));
+
+	KCSAN_CHECK_RW_BARRIER(mb());
+	KCSAN_CHECK_RW_BARRIER(wmb());
+	KCSAN_CHECK_RW_BARRIER(rmb());
+	KCSAN_CHECK_RW_BARRIER(smp_mb());
+	KCSAN_CHECK_RW_BARRIER(smp_wmb());
+	KCSAN_CHECK_RW_BARRIER(smp_rmb());
+	KCSAN_CHECK_RW_BARRIER(dma_wmb());
+	KCSAN_CHECK_RW_BARRIER(dma_rmb());
+	KCSAN_CHECK_RW_BARRIER(smp_mb__before_atomic());
+	KCSAN_CHECK_RW_BARRIER(smp_mb__after_atomic());
+	KCSAN_CHECK_RW_BARRIER(smp_mb__after_spinlock());
+	KCSAN_CHECK_RW_BARRIER(smp_store_mb(test_var, 0));
+	KCSAN_CHECK_RW_BARRIER(smp_store_release(&test_var, 0));
+	KCSAN_CHECK_RW_BARRIER(xchg(&test_var, 0));
+	KCSAN_CHECK_RW_BARRIER(xchg_release(&test_var, 0));
+	KCSAN_CHECK_RW_BARRIER(cmpxchg(&test_var, 0,  0));
+	KCSAN_CHECK_RW_BARRIER(cmpxchg_release(&test_var, 0,  0));
+	KCSAN_CHECK_RW_BARRIER(atomic_set_release(&dummy, 0));
+	KCSAN_CHECK_RW_BARRIER(atomic_add_return(1, &dummy));
+	KCSAN_CHECK_RW_BARRIER(atomic_add_return_release(1, &dummy));
+	KCSAN_CHECK_RW_BARRIER(atomic_fetch_add(1, &dummy));
+	KCSAN_CHECK_RW_BARRIER(atomic_fetch_add_release(1, &dummy));
+	KCSAN_CHECK_RW_BARRIER(test_and_set_bit(0, &test_var));
+	KCSAN_CHECK_RW_BARRIER(test_and_clear_bit(0, &test_var));
+	KCSAN_CHECK_RW_BARRIER(test_and_change_bit(0, &test_var));
+	KCSAN_CHECK_RW_BARRIER(clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_RW_BARRIER(__clear_bit_unlock(0, &test_var));
+	KCSAN_CHECK_RW_BARRIER(clear_bit_unlock_is_negative_byte(0, &test_var));
+	arch_spin_lock(&arch_spinlock);
+	KCSAN_CHECK_RW_BARRIER(arch_spin_unlock(&arch_spinlock));
+	spin_lock(&spinlock);
+	KCSAN_CHECK_RW_BARRIER(spin_unlock(&spinlock));
+
+	kcsan_nestable_atomic_end();
+
+	return ret;
+}
+
 static int __init kcsan_selftest(void)
 {
 	int passed = 0;
@@ -120,6 +260,7 @@ static int __init kcsan_selftest(void)
 	RUN_TEST(test_requires);
 	RUN_TEST(test_encode_decode);
 	RUN_TEST(test_matching_access);
+	RUN_TEST(test_barrier);
 
 	pr_info("selftest: %d/%d tests passed\n", passed, total);
 	if (passed != total)
-- 
2.34.0.rc2.393.gf8c9666880-goog

