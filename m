Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EAC47DD5D
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849097; cv=none; b=fc7cI4e7AlTIIWsvwICMEHbDY+p/vRD4Ggeboa9xV5plKzRnfZjxb8to+3VW6FRXl9KqDJ+3FVNoiF8LN0VwrFHoSIEEfUpJeVaZyw2TBegAmnAel/xMaLw2nd6w0PGstsG4l7fmR78D8iLUO1kskY3FpYCLtvPHKf28C56fwg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849097; c=relaxed/simple;
	bh=nyiOHNTpIqa5GShCRJT0qcUoKCXMtNXJhT/V9wsFm5c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MQ2qEzwDO2WF9ZejmRskNjoqt9M9jNup4qrG0YJGP+H7f5pbdvD7m68IX1XjNfl7jfeeS5WmCpSfEciGULsKrdf6du/sNgEaOAk77j0F4XxExjrh8g0wquEi/SBANT+QEQXH6riS9fz3AQReqYOybjGB3HT5A92ZtQwdzY6HwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nTjR68F7; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nTjR68F7"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43ff19e54beso6315211f8f.2
        for <llvm@lists.linux.dev>; Fri, 15 May 2026 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778849093; x=1779453893; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pbh4Qg73uwlfOIJjw2qYvzpJU0TMMQOLYio/xNC7lmc=;
        b=nTjR68F731eYdkcgynUEgmZltJumHxBJrzDI/LVchUujil2p4Nc4VJiDhMxmyopXFD
         QH1+vl14qOXAft0XUgjvijHqbE26nI8qfyuf9tz8yefml/DEGInTL269OWq8mjm0dLfC
         lDJpkAz/1FmXF7fsSBJYe8li803id7urehfkN60uK9j9+RGSFNm9kmdSBG8GyfIpbQKq
         QspFGlAd5oBk0bk1kEZ0q5pXYyq63FYJ026z0iGKdBY3UB/xo1WRNvZHEoqEatmQtxef
         wQfsh1rCfapgt3TVaJ/wafJJD+yAPE5AhWCjUMg+voFKVPyTXqm3gnHWI8fjyo/QKxnd
         bTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849093; x=1779453893;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pbh4Qg73uwlfOIJjw2qYvzpJU0TMMQOLYio/xNC7lmc=;
        b=DxrY3CBjGLYBTizBBzglgXSOdrrIL9aynXwvQP6dxPZGl3mcEPQMO8vu7TfoUHHxSj
         FlE7zamuWfNp5PIDUidcf3rgw5wChUvSmycZIar240OGg0jMjbhXsJ0KOBihDgE4s2aA
         04ozhdJ3COI5qBAdZo2N/W8URfYxvw0AA3lj+tMm1wmuieNOpr1HnRS/30nkMriiziwZ
         /e6Z4jrmXZ2kcJ5yrZYiBZlLRBluFobLFM5NTsKwO80ZNC92ceVFns6eWMXS1c6Oj1k9
         oKfrxF8NUnQB3N1g1sX9PKjZAdF/OOkgMFEfAC7RSZ9ydx5bCemXUZ9Fh8yPKQJ38bg3
         NymQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R79Q5gmiKu3TNdPEdL7EBvl/HbJJQRG4pNtGR3fxet2eaUQaEwkClbi82UYs+numNbJdG@lists.linux.dev
X-Gm-Message-State: AOJu0YzwiyjM9prwJAWLZUtNoXMYUshjoUfA+PEoi09adt52MEv8UEvE
	oceXJuUQHn86JRMRu9y6VuosXMtt7lykF6ZBFHoEW7ppXxI54Dsl/J7fiFrDavDlIsJbEUNuCWO
	b3w==
X-Received: from wmg20.prod.google.com ([2002:a05:600c:22d4:b0:48a:73ac:6247])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34cd:b0:488:936a:6220
 with SMTP id 5b1f17b1804b1-48fe61f2c03mr56743685e9.21.1778849093510; Fri, 15
 May 2026 05:44:53 -0700 (PDT)
Date: Fri, 15 May 2026 14:43:31 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515124426.2227783-1-elver@google.com>
Subject: [PATCH tip/locking/core v3] compiler-context-analysis: Bump required
 Clang version to 23
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Clang 23 introduces several major improvements:

1. Support for multiple arguments in the `guarded_by` and
   `pt_guarded_by` attributes [1]. This allows defining variables
   protected by multiple context locks, where read access requires
   holding at least one lock (shared or exclusive), and write access
   requires holding all of them exclusively.

2. Function pointer support [2]. We can now add attributes to function
   pointers just like we do on normal functions.

3. A fix to use arrays of locks [3]. Each index is now correctly treated
   as a separate lock instance.

4. A fix for implicit member access in attributes [4]. This allows to
   use __guarded_by(&foo->lock) correctly.

Overall that makes it worthwhile bumping the compiler version instead of
trying to make both Clang 22 and later work while supporting these new
features.

Link: https://github.com/llvm/llvm-project/pull/186838 [1]
Link: https://github.com/llvm/llvm-project/pull/191187 [2]
Link: https://github.com/llvm/llvm-project/pull/148551 [3]
Link: https://github.com/llvm/llvm-project/pull/194457 [4]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Rebase and update laundry-list of new features and fixes.

v2:
* Bump version instead of __guarded_by_any workaround.
---
 Documentation/dev-tools/context-analysis.rst |  2 +-
 include/linux/compiler-context-analysis.h    | 30 ++++++++++++++------
 lib/Kconfig.debug                            |  4 +--
 lib/test_context-analysis.c                  | 24 ++++++++++++++++
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
index 54d9ee28de98..8e71e1e75b5b 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -17,7 +17,7 @@ features. To enable for Clang, configure the kernel with::
 
     CONFIG_WARN_CONTEXT_ANALYSIS=y
 
-The feature requires Clang 22 or later.
+The feature requires Clang 23 or later.
 
 The analysis is *opt-in by default*, and requires declaring which modules and
 subsystems should be analyzed in the respective `Makefile`::
diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index a9317571e6af..8302ebc2ea8c 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -39,12 +39,14 @@
 # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
 
 /**
- * __guarded_by - struct member and globals attribute, declares variable
- *                only accessible within active context
+ * __guarded_by() - struct member and globals attribute, declares variable
+ *                  only accessible within active context
+ * @...: context lock instance pointer(s)
  *
  * Declares that the struct member or global variable is only accessible within
- * the context entered by the given context lock. Read operations on the data
- * require shared access, while write operations require exclusive access.
+ * the context entered by the given context lock(s). Read operations on the data
+ * require shared access to at least one of the context locks, while write
+ * operations require exclusive access to all listed context locks.
  *
  * .. code-block:: c
  *
@@ -52,17 +54,24 @@
  *		spinlock_t lock;
  *		long counter __guarded_by(&lock);
  *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long counter __guarded_by(&lock1, &lock2);
+ *	};
  */
 # define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
 
 /**
- * __pt_guarded_by - struct member and globals attribute, declares pointed-to
- *                   data only accessible within active context
+ * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
+ *                     data only accessible within active context
+ * @...: context lock instance pointer(s)
  *
  * Declares that the data pointed to by the struct member pointer or global
  * pointer is only accessible within the context entered by the given context
- * lock. Read operations on the data require shared access, while write
- * operations require exclusive access.
+ * lock(s). Read operations on the data require shared access to at least one
+ * of the context locks, while write operations require exclusive access to all
+ * listed context locks.
  *
  * .. code-block:: c
  *
@@ -70,6 +79,11 @@
  *		spinlock_t lock;
  *		long *counter __pt_guarded_by(&lock);
  *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long *counter __pt_guarded_by(&lock1, &lock2);
+ *	};
  */
 # define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8ff5adcfe1e0..b0f3028a213d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
 
 config WARN_CONTEXT_ANALYSIS
 	bool "Compiler context-analysis warnings"
-	depends on CC_IS_CLANG && CLANG_VERSION >= 220100
+	depends on CC_IS_CLANG && CLANG_VERSION >= 230000
 	# Branch profiling re-defines "if", which messes with the compiler's
 	# ability to analyze __cond_acquires(..), resulting in false positives.
 	depends on !TRACE_BRANCH_PROFILING
@@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
 	  and releasing user-definable "context locks".
 
 	  Clang's name of the feature is "Thread Safety Analysis". Requires
-	  Clang 22.1.0 or later.
+	  Clang 23 or later.
 
 	  Produces warnings by default. Select CONFIG_WERROR if you wish to
 	  turn these warnings into errors.
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 06b4a6a028e0..316f4dfcda65 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
 struct test_mutex_data {
 	struct mutex mtx;
 	int counter __guarded_by(&mtx);
+
+	struct mutex mtx2;
+	int anyread __guarded_by(&mtx, &mtx2);
+	int *anyptr __pt_guarded_by(&mtx, &mtx2);
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
2.54.0.563.g4f69b47b94-goog

