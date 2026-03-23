Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1550B3B95F2
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280041; cv=none; b=FKjJQeWLW2LyPVMnCtZVBeBms+mytOTi3CJIOF3hc6aMjXSeMM/Wmjbd5+eR7xDAtls+MpFtpzkmUaQ8ttZQ1tOyNCk3iw9NGN/CKcN8cV+G2Uff1TTT2fhbnAAX9nx9ywbfDWBa5zm/HQW1/QPWN1OrRuRfXi5WOcS8hTSfj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280041; c=relaxed/simple;
	bh=KO4xKau1nE+RDkAytpATvSkBrm+PtImuAX7m8bCUZnA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qRfqFh/HGERg4as2IC7zvswNNYKs86tzzTetQnpRoNUhVQn7fcfxaOwy7xIRe88Fa19KqYqzK2KUUwjjT0GDAw/LnLVixMergBmUEyUSPrFeV0ugx3Eak4xzMWRBnIwLqJH2N2TAN+XyoHSEJyFilY2nkuqgp6XwaULvu+lamMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lKZ1Hjqu; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lKZ1Hjqu"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853a9467c5so31536165e9.2
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774280037; x=1774884837; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m1gKTBBEujeuqMRQ06o8mhLxWVZ5+wlLBtBCcrKARJY=;
        b=lKZ1Hjqufgj1LCf0QgVz/yzjZE+a/7GGLrVgGPpI/Yhpyooi03b62tzFChCAqCsdzn
         VIXgAJdk+WHc8uXN4t03iHQ0wHZT6Nj3uwazTQ3uFYl5L4Gm35N+P1XMX07+XUgkqb6K
         F9CF/7sVymz6J49Tj3GWsGa0DjXZCG+68sFRRfU+m3xGwCS/baOScXpK5aaSo6VRb0U5
         jW3AGP5nPxSa18vulLn0PrEXkfm85ycQOK/3ifvze2CjZBx5SUgxLA+sK/TCAWIqyH5J
         6bZPG7Y80p8oyDoGRzje3Uh0h5k3vF1WmjXjhi4RZjd1253H0zXoPCGc8rV/Qduv1C9T
         RIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280037; x=1774884837;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1gKTBBEujeuqMRQ06o8mhLxWVZ5+wlLBtBCcrKARJY=;
        b=BMqTOy+EboReDNxhz19cPRZuE+xDHzXYQqywzGB0KqLjobXEGLFOybZSn2IYe1Z11j
         DVi7LII8n6VtEoATS3eIBzzgnQMJq3w/bqMeMGO4opyN3wqxmNqWyY/BtmmYsHlfCDUV
         oCHavBdr5WW8dzxUfxSbIRIkNg2bKQBYyJkh2/QHMHvheW7RANALzsF4nFfrMWjef69a
         kU84ePR0IP3YYP96u4JKXta4eWmby00SE49uq2XWQri7kcdX5xYuFr5P2FeKQ04Y+vu4
         GMo4M/OA7MhxmWHisQl8MGOBI/5+WQdzR9iC4OWjKYUoxRyWcx4menHSr196IifTCrW4
         tQEA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJl1vccYSrLEGGv9EpJXuRbXqS0RQCqPAfWwg/fvR0OdNPC8MQKf8n7MMW+Korgu3wEtF@lists.linux.dev
X-Gm-Message-State: AOJu0YyjbkIDxysOBqCV2p0X7IlvojRTOj6yhDdDpo0d1ATM9O00Nyns
	RQtgCc2vSR3eGAW5kMvfWMdfzz8kSmUF+RpwjxHspn7Q1YZbgQ1i/Y/bwoUdNENXTaqrTBBx83d
	xYA==
X-Received: from wmoo17.prod.google.com ([2002:a05:600d:111:b0:485:4ce0:d98f])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820d:b0:487:467:42a2
 with SMTP id 5b1f17b1804b1-487046744a1mr97974325e9.18.1774280037341; Mon, 23
 Mar 2026 08:33:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:33:32 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260323153351.1412355-1-elver@google.com>
Subject: [PATCH tip/locking/core] compiler-context-analysis: Add support for
 multi-argument guarded_by
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Clang 23 introduces support for multiple arguments in the `guarded_by`
and `pt_guarded_by` attributes [1]. This allows defining variables
protected by multiple context locks, where read access requires holding
at least one lock (shared or exclusive), and write access requires
holding all of them exclusively.

To use the feature while maintaining compatibility with Clang 22, add
the `__guarded_by_any()` and `__pt_guarded_by_any()` macros. On Clang 23
and newer, these expand to the underlying attributes; with older Clang
versions, they fall back to a no-op (false negatives possible).

Link: https://github.com/llvm/llvm-project/pull/186838 [1]
Requested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler-context-analysis.h | 66 ++++++++++++++++++++---
 init/Kconfig                              |  5 ++
 lib/test_context-analysis.c               | 24 +++++++++
 3 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 00c074a2ccb0..a0d135e500dd 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -39,8 +39,9 @@
 # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
 
 /**
- * __guarded_by - struct member and globals attribute, declares variable
- *                only accessible within active context
+ * __guarded_by() - struct member and globals attribute, declares variable
+ *                  only accessible within active context
+ * @x: context lock instance pointer
  *
  * Declares that the struct member or global variable is only accessible within
  * the context entered by the given context lock. Read operations on the data
@@ -53,11 +54,12 @@
  *		long counter __guarded_by(&lock);
  *	};
  */
-# define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
+# define __guarded_by(x)		__attribute__((guarded_by(x)))
 
 /**
- * __pt_guarded_by - struct member and globals attribute, declares pointed-to
- *                   data only accessible within active context
+ * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
+ *                     data only accessible within active context
+ * @x: context lock instance pointer
  *
  * Declares that the data pointed to by the struct member pointer or global
  * pointer is only accessible within the context entered by the given context
@@ -71,7 +73,53 @@
  *		long *counter __pt_guarded_by(&lock);
  *	};
  */
-# define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
+# define __pt_guarded_by(x)		__attribute__((pt_guarded_by(x)))
+
+/**
+ * __guarded_by_any() - struct member and globals attribute, declares variable
+ *                      only accessible within active contexts
+ * @...: context lock instance pointers
+ *
+ * Declares that the struct member or global variable is protected by multiple
+ * context locks. Write access requires all listed context locks to be held
+ * exclusively; read access requires at least one of them to be held (shared or
+ * exclusive).
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long counter __guarded_by_any(&lock1, &lock2);
+ *	};
+ */
+# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
+#  define __guarded_by_any(...)		__attribute__((guarded_by(__VA_ARGS__)))
+# else
+#  define __guarded_by_any(...)
+# endif
+
+/**
+ * __pt_guarded_by_any() - struct member and globals attribute, declares pointed-to
+ *                         data only accessible within active contexts
+ * @...: context lock instance pointers
+ *
+ * Declares that the data pointed to by the struct member pointer or global
+ * pointer is protected by multiple context locks. Write access requires all
+ * listed context locks to be held exclusively; read access requires at least
+ * one of them to be held (shared or exclusive).
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long *counter __pt_guarded_by_any(&lock1, &lock2);
+ *	};
+ */
+# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
+#  define __pt_guarded_by_any(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
+# else
+#  define __pt_guarded_by_any(...)
+# endif
 
 /**
  * context_lock_struct() - declare or define a context lock struct
@@ -158,8 +206,10 @@
 # define __assumes_ctx_lock(...)
 # define __assumes_shared_ctx_lock(...)
 # define __returns_ctx_lock(var)
-# define __guarded_by(...)
-# define __pt_guarded_by(...)
+# define __guarded_by(x)
+# define __pt_guarded_by(x)
+# define __guarded_by_any(...)
+# define __pt_guarded_by_any(...)
 # define __excludes_ctx_lock(...)
 # define __requires_ctx_lock(...)
 # define __requires_shared_ctx_lock(...)
diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..9f9a800822ff 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -158,6 +158,11 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 
+config CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
+	# supported since clang 23
+	depends on CC_IS_CLANG
+	def_bool $(success,echo 'typedef int __attribute__((capability("l"))) L; L l1; L l2; int __attribute__((guarded_by(&l1, &l2))) x;' | $(CC) -x c - -c -o /dev/null -Werror)
+
 config LD_CAN_USE_KEEP_IN_OVERLAY
 	# ld.lld prior to 21.0.0 did not support KEEP within an overlay description
 	# https://github.com/llvm/llvm-project/pull/130661
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 06b4a6a028e0..691fb2d6fc45 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
 struct test_mutex_data {
 	struct mutex mtx;
 	int counter __guarded_by(&mtx);
+
+	struct mutex mtx2;
+	int anyread __guarded_by_any(&mtx, &mtx2);
+	int *anyptr __pt_guarded_by_any(&mtx, &mtx2);
 };
 
 static void __used test_mutex_init(struct test_mutex_data *d)
@@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
 	}
 }
 
+static void __used test_mutex_multiguard(struct test_mutex_data *d)
+{
+	mutex_lock(&d->mtx);
+	(void)d->anyread;
+	(void)*d->anyptr;
+	mutex_unlock(&d->mtx);
+
+	mutex_lock(&d->mtx2);
+	(void)d->anyread;
+	(void)*d->anyptr;
+	mutex_unlock(&d->mtx2);
+
+	mutex_lock(&d->mtx);
+	mutex_lock(&d->mtx2);
+	d->anyread++;
+	(*d->anyptr)++;
+	mutex_unlock(&d->mtx2);
+	mutex_unlock(&d->mtx);
+}
+
 struct test_seqlock_data {
 	seqlock_t sl;
 	int counter __guarded_by(&sl);
-- 
2.53.0.1018.g2bb0e51243-goog

