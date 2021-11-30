Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851D2C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:46:06 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id n41-20020a05600c502900b003335ab97f41so12710521wmr.3
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ykQMG7f7HitTY02bjgroWOqQwac8nTYOVAZLqTXm/og=;
        b=qfKYXOVzY2MTzD2zIwUpOpLCYIanN5AfAyzY4pD6y/00NCNsZhMgCXyQuHgqHRjMQP
         2Q4GpB2kKiA9NG+mxwbdwhx/T6uztpsr0cPDZKwOOV4NBkpo8wKmqUMwj6QIZ50+WTGC
         rj+XujQ6x15SViviNrLc8ryKZTpDmfQ59NmqPKusALt7vIXW09vUdxRhx/IHgX0O1Fi0
         peXM6+tWJqwR46RttMZspmzxuv6mgkZjTPQRNEx0+Evh/SfhzkOebPUPea948l/PAD60
         8d8gkegUNMa+NHH1FPVvEqF67z8VdDW4GAXutQLRg58SDKDe/Mh9BClDvEsEpsff6SiM
         sbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ykQMG7f7HitTY02bjgroWOqQwac8nTYOVAZLqTXm/og=;
        b=nrygsv9veV7AEYshVIX7mwa+MYUpwn9OLTtWH88bKin4DvPvNFqz5nFLM3SgZ8WgC1
         KEifAtNxZEWVWhNSLBciPMsfxsg2pfcGxH9sCfA61qZYM2L4czWdSf4Mku06DjfeYGZB
         LIIaNMR+smkHRbqWZebkk1zBPAJm4uGV3cGFsOy6sEQOILrmgPzX/pk7pMb4s4ytaCId
         hhhPw6+5dfzntYT9A1ydUwL/UMIjzurfW+LhAo4Fv+L6ts/3tGYzPuk4XBUPiUTyhSob
         IIv0C8CKE657g4x+rjLg9QLFCozbgu7bSKaf7VgqqmuG6AjIs6BRt68JGcsyvnZ8omKW
         BgIw==
X-Gm-Message-State: AOAM531QyvmMUihpAFZB5eqfVP1iJ30LE3Hfyt6Oi6ByaAttW8SJOSPM
	3ExE2G4K6cNY0wjOGTY1EKZNNuwHjw==
X-Google-Smtp-Source: ABdhPJw6whH8Hls3EC+BgAy91BvIDfMtsebOG9cJCkHwE7EfRIVxArLwzYtCPhRhlBjkro/EFip+BpGtoQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr626212wmq.0.1638272763966; Tue, 30 Nov 2021 03:46:03 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:33 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-26-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 25/25] kcsan: Support WEAK_MEMORY with Clang where no
 objtool support exists
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

Clang and GCC behave a little differently when it comes to the
__no_sanitize_thread attribute, which has valid reasons, and depending
on context either one could be right.

Traditionally, user space ThreadSanitizer [1] still expects instrumented
builtin atomics (to avoid false positives) and __tsan_func_{entry,exit}
(to generate meaningful stack traces), even if the function has the
attribute no_sanitize("thread").

[1] https://clang.llvm.org/docs/ThreadSanitizer.html#attribute-no-sanitize-thread

GCC doesn't follow the same policy (for better or worse), and removes
all kinds of instrumentation if no_sanitize is added. Arguably, since
this may be a problem for user space ThreadSanitizer, we expect this may
change in future.

Since KCSAN != ThreadSanitizer, the likelihood of false positives even
without barrier instrumentation everywhere, is much lower by design.

At least for Clang, however, to fully remove all sanitizer
instrumentation, we must add the disable_sanitizer_instrumentation
attribute, which is available since Clang 14.0.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* New patch.
---
 include/linux/compiler_types.h | 13 ++++++++++++-
 lib/Kconfig.kcsan              |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 1d32f4c03c9e..3c1795fdb568 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -198,9 +198,20 @@ struct ftrace_likely_data {
 # define __no_kasan_or_inline __always_inline
 #endif
 
-#define __no_kcsan __no_sanitize_thread
 #ifdef __SANITIZE_THREAD__
+/*
+ * Clang still emits instrumentation for __tsan_func_{entry,exit}() and builtin
+ * atomics even with __no_sanitize_thread (to avoid false positives in userspace
+ * ThreadSanitizer). The kernel's requirements are stricter and we really do not
+ * want any instrumentation with __no_kcsan.
+ *
+ * Therefore we add __disable_sanitizer_instrumentation where available to
+ * disable all instrumentation. See Kconfig.kcsan where this is mandatory.
+ */
+# define __no_kcsan __no_sanitize_thread __disable_sanitizer_instrumentation
 # define __no_sanitize_or_inline __no_kcsan notrace __maybe_unused
+#else
+# define __no_kcsan
 #endif
 
 #ifndef __no_sanitize_or_inline
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index e4394ea8068b..63b70b8c5551 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -198,7 +198,7 @@ config KCSAN_WEAK_MEMORY
 	# We can either let objtool nop __tsan_func_{entry,exit}() and builtin
 	# atomics instrumentation in .noinstr.text, or use a compiler that can
 	# implement __no_kcsan to really remove all instrumentation.
-	depends on STACK_VALIDATION || CC_IS_GCC
+	depends on STACK_VALIDATION || CC_IS_GCC || CLANG_VERSION >= 140000
 	help
 	  Enable support for modeling a subset of weak memory, which allows
 	  detecting a subset of data races due to missing memory barriers.
-- 
2.34.0.rc2.393.gf8c9666880-goog

