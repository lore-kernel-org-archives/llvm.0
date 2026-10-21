Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602665;
	b=HOxSxWMA6wnqRDzBl7Dna0joDc2DKks9buluXpz3ZWuHMInvsMqB71zYvjQo4YGCdH21
	 DXgLAWT+06NAnFMuP7v4iZ2EkD6Ae9Jf6cdRyXKpfZMu4nhe5Ayb++qV6UVyeeIRyPvEl
	 nGTCeMvrVxh7bM1nDfa7dZvEzPal3Xpk8xR2qsw0GUeAWwj+j+AgwswXqbmUK/NOttKve
	 DmGAgVl00OYYooy3xqwqJb6uWVpM7XohCF6tLUfh8fHp17ii8hAQNMxSjX0nA3cIEjcUy
	 fdu8zfO15FRK0lpIy3SAQ1SzFAd2cDHEMuCZ1UWvdIci4tGDADWglQ5JrV8eGxapewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YorFNtdLTCPqnOJgGiZt6vRk0rsZ/6+OBLRyulcOSSI=;
	b=zT9lOGQRdQe72Or3xE/UR2D7xj+R2jdZ11qZO+3muC/FzEBB6Tet91HGEAXeCYIotS0R
	 P1QrKWCcIglWzkJR+w4r970S9I+MgCiABeERwRNGLEh9iFftwVnRtiUWasfMaqde7kCpv
	 iFvGey//OPEMMtSODAXbsInjSt5H7fqsNcgqi75VL/MwWQ5TKajvMPBL6yxA2yKFF+Z51
	 avVRwvU34Heounq1qITj/jTM3/yjgEuY9EfFVd/HUR2I/aj60M/nSVV11lX3RN3LSPOZ/
	 dnDaUi1Jf1ZByBOwmpYNLFjFI6atFV22L/Fcs5/Q46c2gGiws3PkfyqqEgTm1GWuuMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ouBTPqH8;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1DE606A319
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ouBTPqH8
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so3768436eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602664; x=1793207464; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YorFNtdLTCPqnOJgGiZt6vRk0rsZ/6+OBLRyulcOSSI=;
        b=ouBTPqH87uJ3fisZ4gNd8NJEShK+WrMakMC5jfaym5+J8F+55U5CpUHJThvGsCOAOK
         jyg0XJ8Yzu7i9AO4YFgzwjH7pJ40q1Z0U1JRA8pXjI91Ofnn/76tDlAUCBVxtaHVifmd
         H4GwcD3lkKUodk+FpA7ZrvIcy0tN8EwKMfRIgFhDvYVLrrGDrK1/262sOttu+22Et+hR
         6nqdNy4R2TYqyTA0kx8gTL0X0CwJYQb64HejmnzS9180fK1hzf+Qsg2MQp+/KDJ0rbQo
         /vxjRkHgPb5PCUUVTklJICa05zWOz0vdCVz6BC+GBElCuqA5uQKnXWsDY2eZWcjsBGQM
         uHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602664; x=1793207464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YorFNtdLTCPqnOJgGiZt6vRk0rsZ/6+OBLRyulcOSSI=;
        b=qLO+SPalmjQh6vk3PyF4T96Bukw3dJSA5JS4eKW706VHx5N87eKr2IvwFknf822fGR
         QD4dchCASvpV/VVEseJaHOuF2dyf+osdDis6ay/5cPHheRlCFN0AxMnYvaHgMWVwJNZY
         21hTqGKqN6LimrPWzBIT6Wwck/jKQHJxUYw6qdG6nVH9GHzPeiQ+xPwi16vt6axn614A
         pbkKG/4Tk85Lb5Pzizlvt7pQ328zcFLbF/46/3iXQfnRm4sDtPJSZAw/66s5IiCJ4r9C
         +9G0Mq7hsMQiEpsIRwAG+PRowx4dBR380vMvvYHlDwNWQM55u/7CGBJSEz7jrZNTuRQC
         E8XA==
X-Forwarded-Encrypted: i=1; AKwUvBypijijbeWGNFVXiMLq+IQsNGOBg4lduSeJuDSZDkoEIjFLY9XHEXT9tSZozd4e72sW4ku/@lists.linux.dev
X-Gm-Message-State: AFq9FYI5Goe244BcggLCUcY2SxUZ+4GdFnbTB/et1jiHTH1PHavSLByk
	nYnplW4Zo+6YGsId8SexvAoag4FrKUT0ud9O1aA8pDg725ikLV/kIiHiXZQymw/yJniOrqN+5AN
	y6soSbRSSRA==
X-Received: from dycoy10.prod.google.com ([2002:a05:7301:fc0a:b0:366:6d33:8d7e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00e:10b0:341:225b:d6f
 with SMTP id 5a478bee46e88-3674d34b779mr4318808eec.19.1792602663983; Wed, 21
 Oct 2026 10:11:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:28 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-3-irogers@google.com>
Subject: [PATCH v6 02/17] tools headers compiler: Synchronize compiler_types.h
 with the kernel sources
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Synchronize the non-__KERNEL__ sections of
tools/include/linux/compiler_types.h and
tools/include/linux/compiler-gcc.h with the kernel sources (including
___PASTE/__PASTE, BTF_TYPE_TAG, object-size helpers, asm_goto_output,
ASM_INPUT_*, asm_inline, __typeof_unqual__/__unqual_scalar_typeof,
__signed_scalar_typeof, __native_word, compiletime_assert, and the
__diag pragma helpers required by compiler-context-analysis.h), and
remove the duplicated definitions from tools/include/linux/compiler.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/compiler-gcc.h   |  72 +++++++++-
 tools/include/linux/compiler.h       |  50 +------
 tools/include/linux/compiler_types.h | 206 ++++++++++++++++++++++++++-
 3 files changed, 275 insertions(+), 53 deletions(-)

diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
index e20f98e14e81..e005e8d5dfda 100644
--- a/tools/include/linux/compiler-gcc.h
+++ b/tools/include/linux/compiler-gcc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _TOOLS_LINUX_COMPILER_H_
+#ifndef __LINUX_COMPILER_TYPES_H
 #error "Please do not include <linux/compiler-gcc.h> directly, include <linux/compiler.h> instead."
-#endif
+#endif /* __LINUX_COMPILER_TYPES_H */
 
 /*
  * Common definitions for all gcc versions go here.
@@ -33,10 +33,76 @@
 #define __packed	__attribute__((packed))
 #endif
 #ifndef __noreturn
-#define __noreturn	__attribute__((noreturn))
+#define __noreturn	__attribute__((__noreturn__))
 #endif
 #ifndef __aligned
 #define __aligned(x)	__attribute__((aligned(x)))
 #endif
 #define __printf(a, b)	__attribute__((format(printf, a, b)))
 #define __scanf(a, b)	__attribute__((format(scanf, a, b)))
+
+/*
+ * Turn individual warnings and errors on and off locally, depending
+ * on version.
+ */
+#define __diag_str1(s)		#s
+#define __diag_str(s)		__diag_str1(s)
+
+#ifdef __clang__
+#define __diag_clang(version, severity, s) \
+	__diag_clang_ ## version(__diag_clang_ ## severity s)
+
+/* Severity used in pragma directives */
+#define __diag_clang_ignore	ignored
+#define __diag_clang_warn	warning
+#define __diag_clang_error	error
+
+#define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
+
+#if __clang_major__ >= 23
+#define __diag_clang_23(s)	__diag(s)
+#else
+#define __diag_clang_23(s)
+#endif
+
+#define __diag_clang_all(s)	__diag(s)
+
+#define __diag_ignore_all(option, comment) \
+	__diag_clang(all, ignore, option)
+
+/*
+ * clang has horrible behavior with "g" or "rm" constraints for asm
+ * inputs, turning them into something worse than "m". Avoid using
+ * constraints with multiple possible uses (but "ir" seems to be ok):
+ *
+ *	https://github.com/llvm/llvm-project/issues/20571
+ */
+#define ASM_INPUT_G "ir"
+#define ASM_INPUT_RM "r"
+#define ASM_OUTPUT_RM "=r"
+
+#define CC_HAS_TYPEOF_UNQUAL (__clang_major__ > 19 || (__clang_major__ == 19 && __clang_minor__ > 0))
+#else /* !__clang__ */
+#define __diag_GCC(version, severity, s) \
+	__diag_GCC_ ## version(__diag_GCC_ ## severity s)
+
+/* Severity used in pragma directives */
+#define __diag_GCC_ignore	ignored
+#define __diag_GCC_warn		warning
+#define __diag_GCC_error	error
+
+#define __diag(s)		_Pragma(__diag_str(GCC diagnostic s))
+
+#if GCC_VERSION >= 80000
+#define __diag_GCC_8(s)		__diag(s)
+#else
+#define __diag_GCC_8(s)
+#endif
+
+#define __diag_GCC_all(s)	__diag(s)
+
+#define __diag_ignore_all(option, comment) \
+	__diag(__diag_GCC_ignore option)
+
+#define CC_HAS_TYPEOF_UNQUAL (__GNUC__ >= 14)
+#endif /* __clang__ */
diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index f2f54b038168..86d628ba8d60 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -1,41 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _TOOLS_LINUX_COMPILER_H_
-#define _TOOLS_LINUX_COMPILER_H_
+#ifndef __LINUX_COMPILER_H
+#define __LINUX_COMPILER_H
 
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler_types.h>
 
-#ifndef __compiletime_error
-# define __compiletime_error(message)
-#endif
-
-#ifdef __OPTIMIZE__
-# define __compiletime_assert(condition, msg, prefix, suffix)		\
-	do {								\
-		extern void prefix ## suffix(void) __compiletime_error(msg); \
-		if (!(condition))					\
-			prefix ## suffix();				\
-	} while (0)
-#else
-# define __compiletime_assert(condition, msg, prefix, suffix) do { } while (0)
-#endif
-
-#define _compiletime_assert(condition, msg, prefix, suffix) \
-	__compiletime_assert(condition, msg, prefix, suffix)
-
-/**
- * compiletime_assert - break build and emit msg if condition is false
- * @condition: a compile-time constant condition to check
- * @msg:       a message to emit if condition is false
- *
- * In tradition of POSIX assert, this macro will break the build if the
- * supplied condition is *false*, emitting the supplied error message if the
- * compiler has support to do so.
- */
-#define compiletime_assert(condition, msg) \
-	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
-
 /* Optimization barrier */
 /* The "volatile" is due to gcc bugs */
 #define barrier() __asm__ __volatile__("": : :"memory")
@@ -48,10 +18,6 @@
 #define __always_unused __attribute__((__unused__))
 #endif
 
-#ifndef __noreturn
-#define __noreturn __attribute__((__noreturn__))
-#endif
-
 #ifndef unreachable
 #define unreachable() __builtin_unreachable()
 #endif
@@ -68,11 +34,6 @@
 #define __naked __attribute__((__naked__))
 #endif
 
-/* Are two types/vars the same type (ignoring qualifiers)? */
-#ifndef __same_type
-# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
-#endif
-
 /*
  * This returns a constant expression while determining if an argument is
  * a constant expression, most importantly without evaluating the argument.
@@ -237,11 +198,6 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 	__u.__val;					\
 })
 
-
-/* Indirect macros required for expanded argument pasting, eg. __LINE__. */
-#define ___PASTE(a, b) a##b
-#define __PASTE(a, b) ___PASTE(a, b)
-
 #ifndef OPTIMIZER_HIDE_VAR
 /* Make the optimizer believe the variable can be manipulated arbitrarily. */
 #define OPTIMIZER_HIDE_VAR(var)						\
@@ -258,4 +214,4 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _TOOLS_LINUX_COMPILER_H */
+#endif /* __LINUX_COMPILER_H */
diff --git a/tools/include/linux/compiler_types.h b/tools/include/linux/compiler_types.h
index b3adbf5682f0..31e9f7d2a466 100644
--- a/tools/include/linux/compiler_types.h
+++ b/tools/include/linux/compiler_types.h
@@ -2,8 +2,6 @@
 #ifndef __LINUX_COMPILER_TYPES_H
 #define __LINUX_COMPILER_TYPES_H
 
-/* Builtins */
-
 /*
  * __has_builtin is supported on gcc >= 10, clang >= 3 and icc >= 21.
  * In the meantime, to support gcc < 10, we implement __has_builtin
@@ -13,6 +11,23 @@
 #define __has_builtin(x) (0)
 #endif
 
+/* Indirect macros required for expanded argument pasting, eg. __LINE__. */
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+
+#ifndef __ASSEMBLY__
+
+/*
+ * Skipped when running bindgen due to a libclang issue;
+ * see https://github.com/rust-lang/rust-bindgen/issues/2244.
+ */
+#if defined(CONFIG_DEBUG_INFO_BTF) && defined(CONFIG_PAHOLE_HAS_BTF_TAG) && \
+	__has_attribute(btf_type_tag) && !defined(__BINDGEN__)
+# define BTF_TYPE_TAG(value) __attribute__((btf_type_tag(#value)))
+#else
+# define BTF_TYPE_TAG(value) /* nothing */
+#endif
+
 #include <linux/compiler-context-analysis.h>
 
 /* Compiler specific macros. */
@@ -20,14 +35,101 @@
 #include <linux/compiler-gcc.h>
 #endif
 
+#ifndef __compiletime_error
+# define __compiletime_error(message)
+#endif
+
+#ifndef __noreturn
+# define __noreturn __attribute__((__noreturn__))
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+/*
+ * When the size of an allocated object is needed, use the best available
+ * mechanism to find it. (For cases where sizeof() cannot be used.)
+ *
+ * Optional: only supported since gcc >= 12
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Object-Size-Checking.html
+ * clang: https://clang.llvm.org/docs/LanguageExtensions.html#evaluating-object-size
+ */
+#if __has_builtin(__builtin_dynamic_object_size)
+#define __struct_size(p)	__builtin_dynamic_object_size(p, 0)
+#define __member_size(p)	__builtin_dynamic_object_size(p, 1)
+#else
+#define __struct_size(p)	__builtin_object_size(p, 0)
+#define __member_size(p)	__builtin_object_size(p, 1)
+#endif
+
+/*
+ * Determine if an attribute has been applied to a variable.
+ * Using __annotated needs to check for __annotated being available,
+ * or negative tests may fail when annotation cannot be checked. For
+ * example, see the definition of __is_cstr().
+ */
+#if __has_builtin(__builtin_has_attribute)
+#define __annotated(var, attr)	__builtin_has_attribute(var, attr)
+#endif
+
+/*
+ * Optional: only supported since gcc >= 15, clang >= 19
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005fcounted_005fby_005fref
+ * clang: https://clang.llvm.org/docs/LanguageExtensions.html#builtin-counted-by-ref
+ */
+#if __has_builtin(__builtin_counted_by_ref) && \
+    !defined(CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF)
+#define __flex_counter(FAM)	__builtin_counted_by_ref(FAM)
+#else
+#define __flex_counter(FAM)	((void *)NULL)
+#endif
+
+/*
+ * Some versions of gcc do not mark 'asm goto' volatile:
+ *
+ *  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=103979
+ *
+ * We do it here by hand, because it doesn't hurt.
+ */
 #ifndef asm_goto_output
-#define asm_goto_output(x...) asm goto(x)
+#define asm_goto_output(x...) asm volatile goto(x)
+#endif
+
+/*
+ * Clang has trouble with constraints with multiple
+ * alternative behaviors ("g" , "rm" and "=rm").
+ */
+#ifndef ASM_INPUT_G
+  #define ASM_INPUT_G "g"
+  #define ASM_INPUT_RM "rm"
+  #define ASM_OUTPUT_RM "=rm"
+#endif
+
+#ifdef CONFIG_CC_HAS_ASM_INLINE
+#define asm_inline asm __inline
+#else
+#define asm_inline asm
+#endif
+
+#ifndef __ASSEMBLY__
+/*
+ * Use __typeof_unqual__() when available.
+ */
+#if (defined(CC_HAS_TYPEOF_UNQUAL) && CC_HAS_TYPEOF_UNQUAL) || defined(__CHECKER__)
+# define USE_TYPEOF_UNQUAL 1
+#endif
+
+/* Are two types/vars the same type (ignoring qualifiers)? */
+#ifndef __same_type
+# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 #endif
 
 /*
  * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
  *			       non-scalar types unchanged.
  */
+#ifndef USE_TYPEOF_UNQUAL
 /*
  * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
  * is not type-compatible with 'signed char', and we define a separate case.
@@ -45,5 +147,103 @@
 			 __scalar_type_to_expr_cases(long),		\
 			 __scalar_type_to_expr_cases(long long),	\
 			 default: (x)))
+#else
+#define __unqual_scalar_typeof(x) __typeof_unqual__(x)
+#endif
+
+#endif /* !__ASSEMBLY__ */
+
+/*
+ * __signed_scalar_typeof(x) - Declare a signed scalar type, leaving
+ *			       non-scalar types unchanged.
+ */
+
+#define __scalar_type_to_signed_cases(type)				\
+		unsigned type:	(signed type)0,				\
+		signed type:	(signed type)0
+
+#define __signed_scalar_typeof(x) typeof(				\
+		_Generic((x),						\
+			 char:	(signed char)0,				\
+			 __scalar_type_to_signed_cases(char),		\
+			 __scalar_type_to_signed_cases(short),		\
+			 __scalar_type_to_signed_cases(int),		\
+			 __scalar_type_to_signed_cases(long),		\
+			 __scalar_type_to_signed_cases(long long),	\
+			 default: (x)))
+
+/* Is this type a native word size -- useful for atomic operations */
+#define __native_word(t) \
+	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
+	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
+
+#ifdef __OPTIMIZE__
+/*
+ * #ifdef __OPTIMIZE__ is only a good approximation; for instance "make
+ * CFLAGS_foo.o=-Og" defines __OPTIMIZE__, does not elide the conditional code
+ * and can break compilation with wrong error message(s). Combine with
+ * -U__OPTIMIZE__ when needed.
+ */
+# define __compiletime_assert(condition, msg, prefix, suffix)		\
+	do {								\
+		/*							\
+		 * __noreturn is needed to give the compiler enough	\
+		 * information to avoid certain possibly-uninitialized	\
+		 * warnings (regardless of the build failing).		\
+		 */							\
+		__noreturn extern void prefix ## suffix(void)		\
+			__compiletime_error(msg);			\
+		if (!(condition))					\
+			prefix ## suffix();				\
+	} while (0)
+#else
+# define __compiletime_assert(condition, msg, prefix, suffix) ((void)(condition))
+#endif
+
+#define _compiletime_assert(condition, msg, prefix, suffix) \
+	__compiletime_assert(condition, msg, prefix, suffix)
+
+/**
+ * compiletime_assert - break build and emit msg if condition is false
+ * @condition: a compile-time constant condition to check
+ * @msg:       a message to emit if condition is false
+ *
+ * In tradition of POSIX assert, this macro will break the build if the
+ * supplied condition is *false*, emitting the supplied error message if the
+ * compiler has support to do so.
+ */
+#define compiletime_assert(condition, msg) \
+	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
+
+#define compiletime_assert_atomic_type(t)				\
+	compiletime_assert(__native_word(t),				\
+		"Need native word sized stores/loads for atomicity.")
+
+/* Helpers for emitting diagnostics in pragmas. */
+#ifndef __diag
+#define __diag(string)
+#endif
+
+#ifndef __diag_GCC
+#define __diag_GCC(version, severity, string)
+#endif
+
+#ifndef __diag_clang
+#define __diag_clang(version, severity, string)
+#endif
+
+#define __diag_push()	__diag(push)
+#define __diag_pop()	__diag(pop)
+
+#define __diag_ignore(compiler, version, option, comment) \
+	__diag_ ## compiler(version, ignore, option)
+#define __diag_warn(compiler, version, option, comment) \
+	__diag_ ## compiler(version, warn, option)
+#define __diag_error(compiler, version, option, comment) \
+	__diag_ ## compiler(version, error, option)
+
+#ifndef __diag_ignore_all
+#define __diag_ignore_all(option, comment)
+#endif
 
 #endif /* __LINUX_COMPILER_TYPES_H */
-- 
2.56.0.218.g1ec904b173-goog

