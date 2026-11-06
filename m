Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948639;
	b=RulNLNIe/i4HEB/6aqS70Z1TIIPZqKvkmuobMiX9Cv65tPYsUUZPs59H8UyWfhZnPWJh
	 o9pVEAyZqoIQfo+/GhKP/r5i6yJrECfrrZk+gVTABwXLu4E3IBCM9NOCl3bMM1d6+aurC
	 JbB7+hOUJngorJ90vhoHXa/AFUGgJT1mVGx6GiOpWw3R5iBvMC50BSjgERbmkjPib3vYV
	 Fi1iud0MQZ/ZTMoWWdwH90aot49dsZwkYipbrN9eiXuLGbaJXecutiAedZP/PP5EY3L03
	 0FrLReC5Jm6Tx6n66buCJNakPDObiz+NEi5AWBj+HlbU3nzo+W/Q7B8/ZD+fg8SMGlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tAyntz1J/6fIgkIxeixMhdCRnz0dYDQrstn98DEnQvo=;
	b=kMixS4B9d8i681sAfxeW/YO5pSU57PvPDYQJKg3RuJj/6BhLHBdBGF8BqysNaAQFyMzS
	 6GqRBs0Q1yLnoj5g3LRgCF3QN89v3yzeHRMQKRi+lUMp2hHBEIPqtX50T9Q0OtQ866ZQG
	 teMCXOFqkXWwWhz7ogbKmqu7xrztHNSuUV9s0onzgZlltEnWm0V/+St4ymIH2b4+rBZqs
	 vVvp/T9cukV4Il+7zXc3HEx0y7RQjmPSdbwSixs/oxHMqN10JayibtHbeQ91+Z7fv277t
	 pMiYS6he91hGeEC+IvLj6NvYmsUrtQoEPWMYVS8p7cCK4SXAdfhBovdfKrQwXe0RrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LmF+MS7I;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D70606D811
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D70606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LmF+MS7I
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso732772eec.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948637; x=1794553437; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAyntz1J/6fIgkIxeixMhdCRnz0dYDQrstn98DEnQvo=;
        b=LmF+MS7IIQD2bxJQrkI9f2wWIVfLp27aTyqW/4ae2nvc7TAlVqLu72XwrhJIE5CgjM
         nM2ITn+K2QII+260lc1W4yuMfVec9OQHQpCimUUu/l5VLMYTtNsFCNhZh1CpMa1CFMiQ
         BXI0NeK7y291WA6eBTQlZ5gyTLSBVmV4ohCY6amHbijYkQs/H+LlU8j8mzaguoI1tmml
         imr5M1C/KNFXCL0gM0qHYksDWAKmoVZ23hOFdAV/jdDKR8NjTaelQnlR6YNVHh4tIwY+
         PY4h1R0WcWxscaagqxPWL77XkH24Id0FY5k9Tr3zCCONDo1G7Gfz8YCXbqxpSzi87Lh7
         Jtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948637; x=1794553437;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAyntz1J/6fIgkIxeixMhdCRnz0dYDQrstn98DEnQvo=;
        b=gRwKfeVN/Mn4GPAZwKfl6Xhek+RPh+CAXWgmSfd/k0PommsJCmw8Gdh4M7GRAyLBBB
         TUITXfyW8rTaajN8ZeZOEhB9UAhrZRYmUD82Ch/bqfjRGIxv3/Bjw7jh7qeyq0FhSqlM
         yTqQCrURsLuCTxYHigsZr1m68tke8zefWL0OfKOGnbTKGjQGNf4EMi9MIx23jAQsHkea
         N8j6QBu1o1+Vw+th26Uqm4FWaRCL2aMW013CEQuTeReUd8KZHueN5GrXZbevngdg8PVo
         jSYpiKYoEm6cmdf9lqaleuLhEAmcvRVmtadtFtGzUIGJ9XFZQ7PLAYJoI/RJeu/Z/kf+
         VFyA==
X-Forwarded-Encrypted: i=1; AKwUvBwGsV+Ceb2JyajuCLVmVpbJGdCk4z1m88ynOn8Fq6nlII/vS0l6+bcHqakLIzTNvh+tTQOO@lists.linux.dev
X-Gm-Message-State: APuU4Z+2kZBRh3ekAQFBzH7XPt1wvG0GpEHnzZeHpfL2aqACZNFXsUJB
	+EzovhZSBn9xoMkzoBJhbwsu2HHoJWwKlXKlBYhwBUt+/gbtk0DzD1njie1ZGlI4UOz4rFvUELM
	YswGTBAB7CA==
X-Received: from dycpp5.prod.google.com ([2002:a05:7301:dd85:b0:36b:7a3b:dba4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d813:b0:36f:6b99:f94d
 with SMTP id 5a478bee46e88-36f75b1f80cmr2017684eec.20.1793948637160; Thu, 05
 Nov 2026 23:03:57 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:27 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-4-irogers@google.com>
Subject: [PATCH v10 03/20] tools headers: Synchronize linux/compiler-context-analysis.h
 with the kernel sources
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Replace the no-op stub tools/include/linux/compiler-context-analysis.h
with the full kernel implementation from
include/linux/compiler-context-analysis.h and add it to
tools/perf/check-headers.sh so future changes are tracked.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
 tools/perf/check-headers.sh                   |   1 +
 2 files changed, 480 insertions(+), 39 deletions(-)

diff --git a/tools/include/linux/compiler-context-analysis.h b/tools/include/linux/compiler-context-analysis.h
index 13a9115e9e58..024e303188ad 100644
--- a/tools/include/linux/compiler-context-analysis.h
+++ b/tools/include/linux/compiler-context-analysis.h
@@ -1,42 +1,482 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
-#define _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
-
 /*
  * Macros and attributes for compiler-based static context analysis.
- * No-op stubs for tools.
- */
-
-#define __guarded_by(...)
-#define __pt_guarded_by(...)
-
-#define context_lock_struct(name, ...)	struct __VA_ARGS__ name
-
-#define __no_context_analysis
-#define __context_unsafe(comment)
-#define context_unsafe(...)		({ __VA_ARGS__; })
-#define context_unsafe_alias(p)
-#define disable_context_analysis()
-#define enable_context_analysis()
-
-#define __must_hold(...)
-#define __must_not_hold(...)
-#define __acquires(...)
-#define __cond_acquires(ret, x)
-#define __releases(...)
-#define __acquire(x)			(void)0
-#define __release(x)			(void)0
-
-#define __must_hold_shared(...)
-#define __acquires_shared(...)
-#define __cond_acquires_shared(ret, x)
-#define __releases_shared(...)
-#define __acquire_shared(x)		(void)0
-#define __release_shared(x)		(void)0
-
-#define __acquire_ret(call, expr)	(call)
-#define __acquire_shared_ret(call, expr) (call)
-#define __acquires_ret
-#define __acquires_shared_ret
-
-#endif /* _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H */
+ */
+
+#ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
+#define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
+
+#if defined(WARN_CONTEXT_ANALYSIS) && !defined(__CHECKER__) && !defined(__GENKSYMS__)
+
+/*
+ * These attributes define new context lock (Clang: capability) types.
+ * Internal only.
+ */
+# define __ctx_lock_type(name)			__attribute__((capability(#name)))
+# define __reentrant_ctx_lock			__attribute__((reentrant_capability))
+# define __acquires_ctx_lock(...)		__attribute__((acquire_capability(__VA_ARGS__)))
+# define __acquires_shared_ctx_lock(...)	__attribute__((acquire_shared_capability(__VA_ARGS__)))
+# define __try_acquires_ctx_lock(ret, var)	__attribute__((try_acquire_capability(ret, var)))
+# define __try_acquires_shared_ctx_lock(ret, var) __attribute__((try_acquire_shared_capability(ret, var)))
+# define __releases_ctx_lock(...)		__attribute__((release_capability(__VA_ARGS__)))
+# define __releases_shared_ctx_lock(...)	__attribute__((release_shared_capability(__VA_ARGS__)))
+# define __returns_ctx_lock(var)		__attribute__((lock_returned(var)))
+
+/*
+ * The below are used to annotate code being checked. Internal only.
+ */
+# define __excludes_ctx_lock(...)		__attribute__((locks_excluded(__VA_ARGS__)))
+# define __requires_ctx_lock(...)		__attribute__((requires_capability(__VA_ARGS__)))
+# define __requires_shared_ctx_lock(...)	__attribute__((requires_shared_capability(__VA_ARGS__)))
+
+/*
+ * The "assert_capability" attribute is a bit confusingly named. It does not
+ * generate a check. Instead, it tells the analysis to *assume* the capability
+ * is held. This is used for augmenting runtime assertions, that can then help
+ * with patterns beyond the compiler's static reasoning abilities.
+ */
+# define __assumes_ctx_lock(...)		__attribute__((assert_capability(__VA_ARGS__)))
+# define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
+
+/**
+ * __guarded_by() - struct member and globals attribute, declares variable
+ *                  only accessible within active context
+ * @...: context lock instance pointer(s)
+ *
+ * Declares that the struct member or global variable is only accessible within
+ * the context entered by the given context lock(s). Read operations on the data
+ * require shared access to at least one of the context locks, while write
+ * operations require exclusive access to all listed context locks.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock;
+ *		long counter __guarded_by(&lock);
+ *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long counter __guarded_by(&lock1, &lock2);
+ *	};
+ */
+# define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
+
+/**
+ * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
+ *                     data only accessible within active context
+ * @...: context lock instance pointer(s)
+ *
+ * Declares that the data pointed to by the struct member pointer or global
+ * pointer is only accessible within the context entered by the given context
+ * lock(s). Read operations on the data require shared access to at least one
+ * of the context locks, while write operations require exclusive access to all
+ * listed context locks.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock;
+ *		long *counter __pt_guarded_by(&lock);
+ *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long *counter __pt_guarded_by(&lock1, &lock2);
+ *	};
+ */
+# define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
+
+/**
+ * context_lock_struct() - declare or define a context lock struct
+ * @name: struct name
+ *
+ * Helper to declare or define a struct type that is also a context lock.
+ *
+ * .. code-block:: c
+ *
+ *	context_lock_struct(my_handle) {
+ *		int foo;
+ *		long bar;
+ *	};
+ *
+ *	struct some_state {
+ *		...
+ *	};
+ *	// ... declared elsewhere ...
+ *	context_lock_struct(some_state);
+ *
+ * Note: The implementation defines several helper functions that can acquire
+ * and release the context lock.
+ */
+# define context_lock_struct(name, ...)									\
+	struct __ctx_lock_type(name) __VA_ARGS__ name;							\
+	static __always_inline void __acquire_ctx_lock(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __acquires_ctx_lock(var) { }	\
+	static __always_inline void __acquire_shared_ctx_lock(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __acquires_shared_ctx_lock(var) { } \
+	static __always_inline bool __try_acquire_ctx_lock(const struct name *var, bool ret)		\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_ctx_lock(1, var)	\
+	{ return ret; }											\
+	static __always_inline bool __try_acquire_shared_ctx_lock(const struct name *var, bool ret)	\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_shared_ctx_lock(1, var) \
+	{ return ret; }											\
+	static __always_inline void __release_ctx_lock(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __releases_ctx_lock(var) { }	\
+	static __always_inline void __release_shared_ctx_lock(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __releases_shared_ctx_lock(var) { } \
+	static __always_inline void __assume_ctx_lock(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_ctx_lock(var) { }				\
+	static __always_inline void __assume_shared_ctx_lock(const struct name *var)			\
+		__attribute__((overloadable)) __assumes_shared_ctx_lock(var) { }			\
+	struct name
+
+/**
+ * disable_context_analysis() - disables context analysis
+ *
+ * Disables context analysis. Must be paired with a later
+ * enable_context_analysis().
+ */
+# define disable_context_analysis()				\
+	__diag_push();						\
+	__diag_ignore_all("-Wunknown-warning-option", "")	\
+	__diag_ignore_all("-Wthread-safety", "")		\
+	__diag_ignore_all("-Wthread-safety-pointer", "")
+
+/**
+ * enable_context_analysis() - re-enables context analysis
+ *
+ * Re-enables context analysis. Must be paired with a prior
+ * disable_context_analysis().
+ */
+# define enable_context_analysis() __diag_pop()
+
+/**
+ * __no_context_analysis - function attribute, disables context analysis
+ *
+ * Function attribute denoting that context analysis is disabled for the
+ * whole function. Prefer use of `context_unsafe()` where possible.
+ */
+# define __no_context_analysis	__attribute__((no_thread_safety_analysis))
+
+#else /* !WARN_CONTEXT_ANALYSIS */
+
+# define __ctx_lock_type(name)
+# define __reentrant_ctx_lock
+# define __acquires_ctx_lock(...)
+# define __acquires_shared_ctx_lock(...)
+# define __try_acquires_ctx_lock(ret, var)
+# define __try_acquires_shared_ctx_lock(ret, var)
+# define __releases_ctx_lock(...)
+# define __releases_shared_ctx_lock(...)
+# define __assumes_ctx_lock(...)
+# define __assumes_shared_ctx_lock(...)
+# define __returns_ctx_lock(var)
+# define __guarded_by(...)
+# define __pt_guarded_by(...)
+# define __excludes_ctx_lock(...)
+# define __requires_ctx_lock(...)
+# define __requires_shared_ctx_lock(...)
+# define __acquire_ctx_lock(var)			do { } while (0)
+# define __acquire_shared_ctx_lock(var)		do { } while (0)
+# define __try_acquire_ctx_lock(var, ret)		(ret)
+# define __try_acquire_shared_ctx_lock(var, ret)	(ret)
+# define __release_ctx_lock(var)			do { } while (0)
+# define __release_shared_ctx_lock(var)		do { } while (0)
+# define __assume_ctx_lock(var)			do { (void)(var); } while (0)
+# define __assume_shared_ctx_lock(var)			do { (void)(var); } while (0)
+# define context_lock_struct(name, ...)		struct __VA_ARGS__ name
+# define disable_context_analysis()
+# define enable_context_analysis()
+# define __no_context_analysis
+
+#endif /* WARN_CONTEXT_ANALYSIS */
+
+/**
+ * context_unsafe() - disable context checking for contained code
+ *
+ * Disables context checking for contained statements or expression.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_data {
+ *		spinlock_t lock;
+ *		int counter __guarded_by(&lock);
+ *	};
+ *
+ *	int foo(struct some_data *d)
+ *	{
+ *		// ...
+ *		// other code that is still checked ...
+ *		// ...
+ *		return context_unsafe(d->counter);
+ *	}
+ */
+#define context_unsafe(...)		\
+({					\
+	disable_context_analysis();	\
+	__VA_ARGS__;			\
+	enable_context_analysis()	\
+})
+
+/**
+ * __context_unsafe() - function attribute, disable context checking
+ * @comment: comment explaining why opt-out is safe
+ *
+ * Function attribute denoting that context analysis is disabled for the
+ * whole function. Forces adding an inline comment as argument.
+ */
+#define __context_unsafe(comment) __no_context_analysis
+
+/**
+ * context_unsafe_alias() - helper to insert a context lock "alias barrier"
+ * @p: pointer aliasing a context lock or object containing context locks
+ *
+ * No-op function that acts as a "context lock alias barrier", where the
+ * analysis rightfully detects that we're switching aliases, but the switch is
+ * considered safe but beyond the analysis reasoning abilities.
+ *
+ * This should be inserted before the first use of such an alias.
+ *
+ * Implementation Note: The compiler ignores aliases that may be reassigned but
+ * their value cannot be determined (e.g. when passing a non-const pointer to an
+ * alias as a function argument).
+ */
+#define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
+static inline void _context_unsafe_alias(void **p) { (void)p; }
+
+/**
+ * token_context_lock() - declare an abstract global context lock instance
+ * @name: token context lock name
+ *
+ * Helper that declares an abstract global context lock instance @name, but not
+ * backed by a real data structure (linker error if accidentally referenced).
+ * The type name is `__ctx_lock_@name`.
+ */
+#define token_context_lock(name, ...)					\
+	context_lock_struct(__ctx_lock_##name, ##__VA_ARGS__) {};	\
+	extern const struct __ctx_lock_##name *name
+
+/**
+ * token_context_lock_instance() - declare another instance of a global context lock
+ * @ctx: token context lock previously declared with token_context_lock()
+ * @name: name of additional global context lock instance
+ *
+ * Helper that declares an additional instance @name of the same token context
+ * lock class @ctx. This is helpful where multiple related token contexts are
+ * declared, to allow using the same underlying type (`__ctx_lock_@ctx`) as
+ * function arguments.
+ */
+#define token_context_lock_instance(ctx, name)		\
+	extern const struct __ctx_lock_##ctx *name
+
+/*
+ * Common keywords for static context analysis.
+ */
+
+/**
+ * __must_hold() - function attribute, caller must hold exclusive context lock
+ *
+ * Function attribute declaring that the caller must hold the given context
+ * lock instance(s) exclusively.
+ */
+#define __must_hold(...)	__requires_ctx_lock(__VA_ARGS__)
+
+/**
+ * __must_not_hold() - function attribute, caller must not hold context lock
+ *
+ * Function attribute declaring that the caller must not hold the given context
+ * lock instance(s).
+ */
+#define __must_not_hold(...)	__excludes_ctx_lock(__VA_ARGS__)
+
+/**
+ * __acquires() - function attribute, function acquires context lock exclusively
+ *
+ * Function attribute declaring that the function acquires the given context
+ * lock instance(s) exclusively, but does not release them.
+ */
+#define __acquires(...)		__acquires_ctx_lock(__VA_ARGS__)
+
+/*
+ * Clang's analysis does not care precisely about the value, only that it is
+ * either zero or non-zero. So the __cond_acquires() interface might be
+ * misleading if we say that @ret is the value returned if acquired. Instead,
+ * provide symbolic variants which we translate.
+ */
+#define __cond_acquires_impl_true(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_false(x, ...)    __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_0(x, ...)        __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_NULL(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+
+/**
+ * __cond_acquires() - function attribute, function conditionally
+ *                     acquires a context lock exclusively
+ * @ret: abstract value returned by function if context lock acquired
+ * @x: context lock instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given context lock instance @x exclusively, but does not release it. The
+ * function return value @ret denotes when the context lock is acquired.
+ *
+ * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
+ */
+#define __cond_acquires(ret, x) __cond_acquires_impl_##ret(x)
+
+/**
+ * __releases() - function attribute, function releases a context lock exclusively
+ *
+ * Function attribute declaring that the function releases the given context
+ * lock instance(s) exclusively. The associated context(s) must be active on
+ * entry.
+ */
+#define __releases(...)		__releases_ctx_lock(__VA_ARGS__)
+
+/*
+ * Clang's analysis does not care precisely about the value, only that it is
+ * either zero or non-zero. So the __cond_acquires() interface might be
+ * misleading if we say that @ret is the value returned if acquired. Instead,
+ * provide symbolic variants which we translate.
+ */
+#define __cond_acquires_impl_not_true(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_false(x, ...)    __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_not_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_0(x, ...)        __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_not_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_NULL(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+
+/**
+ * __cond_releases() - function attribute, function conditionally
+ *                     releases a context lock exclusively
+ * @ret: abstract value returned by function if context lock releases
+ * @x: context lock instance pointer
+ *
+ * Function attribute declaring that the function conditionally releases the
+ * given context lock instance @x exclusively. The associated context(s) must
+ * be active on entry. The function return value @ret denotes when the context
+ * lock is released.
+ *
+ * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
+ *
+ * NOTE: clang does not have a native attribute for this; instead implement
+ *       it as an unconditional release and a conditional acquire for the
+ *       inverted condition -- which is semantically equivalent.
+ */
+#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)
+
+/**
+ * __acquire() - function to acquire context lock exclusively
+ * @x: context lock instance pointer
+ *
+ * No-op function that acquires the given context lock instance @x exclusively.
+ */
+#define __acquire(x)		__acquire_ctx_lock(x)
+
+/**
+ * __release() - function to release context lock exclusively
+ * @x: context lock instance pointer
+ *
+ * No-op function that releases the given context lock instance @x.
+ */
+#define __release(x)		__release_ctx_lock(x)
+
+/**
+ * __must_hold_shared() - function attribute, caller must hold shared context lock
+ *
+ * Function attribute declaring that the caller must hold the given context
+ * lock instance(s) with shared access.
+ */
+#define __must_hold_shared(...)	__requires_shared_ctx_lock(__VA_ARGS__)
+
+/**
+ * __acquires_shared() - function attribute, function acquires context lock shared
+ *
+ * Function attribute declaring that the function acquires the given
+ * context lock instance(s) with shared access, but does not release them.
+ */
+#define __acquires_shared(...)	__acquires_shared_ctx_lock(__VA_ARGS__)
+
+/**
+ * __cond_acquires_shared() - function attribute, function conditionally
+ *                            acquires a context lock shared
+ * @ret: abstract value returned by function if context lock acquired
+ * @x: context lock instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given context lock instance @x with shared access, but does not release it.
+ * The function return value @ret denotes when the context lock is acquired.
+ *
+ * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
+ */
+#define __cond_acquires_shared(ret, x) __cond_acquires_impl_##ret(x, _shared)
+
+/**
+ * __releases_shared() - function attribute, function releases a
+ *                       context lock shared
+ *
+ * Function attribute declaring that the function releases the given context
+ * lock instance(s) with shared access. The associated context(s) must be
+ * active on entry.
+ */
+#define __releases_shared(...)	__releases_shared_ctx_lock(__VA_ARGS__)
+
+/**
+ * __acquire_shared() - function to acquire context lock shared
+ * @x: context lock instance pointer
+ *
+ * No-op function that acquires the given context lock instance @x with shared
+ * access.
+ */
+#define __acquire_shared(x)	__acquire_shared_ctx_lock(x)
+
+/**
+ * __release_shared() - function to release context lock shared
+ * @x: context lock instance pointer
+ *
+ * No-op function that releases the given context lock instance @x with shared
+ * access.
+ */
+#define __release_shared(x)	__release_shared_ctx_lock(x)
+
+/**
+ * __acquire_ret() - helper to acquire context lock of return value
+ * @call: call expression
+ * @ret_expr: acquire expression that uses __ret
+ */
+#define __acquire_ret(call, ret_expr)		\
+	({					\
+		__auto_type __ret = call;	\
+		__acquire(ret_expr);		\
+		__ret;				\
+	})
+
+/**
+ * __acquire_shared_ret() - helper to acquire context lock shared of return value
+ * @call: call expression
+ * @ret_expr: acquire shared expression that uses __ret
+ */
+#define __acquire_shared_ret(call, ret_expr)	\
+	({					\
+		__auto_type __ret = call;	\
+		__acquire_shared(ret_expr);	\
+		__ret;				\
+	})
+
+/*
+ * Attributes to mark functions returning acquired context locks.
+ *
+ * This is purely cosmetic to help readability, and should be used with the
+ * above macros as follows:
+ *
+ *   struct foo { spinlock_t lock; ... };
+ *   ...
+ *   #define myfunc(...) __acquire_ret(_myfunc(__VA_ARGS__), &__ret->lock)
+ *   struct foo *_myfunc(int bar) __acquires_ret;
+ *   ...
+ */
+#define __acquires_ret		__no_context_analysis
+#define __acquires_shared_ret	__no_context_analysis
+
+#endif /* _LINUX_COMPILER_CONTEXT_ANALYSIS_H */
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..c6b2ecadf9b1 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -23,6 +23,7 @@ declare -a FILES=(
   "include/linux/bits.h"
   "include/vdso/bits.h"
   "include/linux/cfi_types.h"
+  "include/linux/compiler-context-analysis.h"
   "include/linux/const.h"
   "include/vdso/const.h"
   "include/vdso/unaligned.h"
-- 
2.56.0.455.g6c5a503b38-goog

