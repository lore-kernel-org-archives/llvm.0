Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BC37E2FC;
	Mon,  2 Feb 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048111; cv=none; b=dW7MwVds0t8Vp0lpGIGOzA/TDnA8GDDj5a8tyhrYuzcnQWjBgv3F59sL/xyPBqNCh7EcUeULKhfDjMxVbI6wYyCPPdtaBASFVAhhVyXJyoKlusYASEjGj7X2ApC8lRZLXLd3fTprXwR+7HzXpEH7ahWCxB0IR3OexUj9jwaZphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048111; c=relaxed/simple;
	bh=lbaT3Wn7HaF70WWCXFmd+UA5m1MOorBrpK2OiuM2Esg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfWK73SsHEB/WYQbnKqeOKHexGwBjmDwCWWeHnK2dc2B14w+PAOzkBdTplRgkPfmEYhLsIN91Pb9cQs6tjv5c5hcJf+GfO+yDjp+Eckgf19lH1N+QUU7K4kv7ycjzq2C7UmJb6QY/X5ZZgMj4H11EfJOkheMWTsMVVfEv/EhhFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wNqSq53U; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wNqSq53U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dVIbIJg+Lh1uAzVpPqFrGj6RXd0GzHbrSmXV1+k6BQk=; b=wNqSq53UyuF0zDpknxLZIyyJLL
	zoCnQJ/Lmv7KHvKKeUwHhDkoJfiumX+j5wZdqcL11wvlK4mfJrqA7f2NQrPR21IZIwHKAgNkU5uft
	PmAvtotrqPPxJ5AXHu0n/3m92Wo3eFumlblVS/7pQxSCyLBUNy2xxVcFmaBuavuiEekE+VdmE1Ssa
	lCesYtVUBBwauJWfQBDgTUlDgevXr0OTOymsP4PIgGOwl3y+N3vq4cg3sQRwXpgRGWSMSfWpEkb55
	SMdc54Ehzp9ArHSjL86QBNYOgaGUWbH1OmAJXW5VfpltkI5BicE7U/SlGvLPIWuGjju80Jb+E0caA
	UyS8r1Ag==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwMv-0000000GinO-07gZ;
	Mon, 02 Feb 2026 16:01:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8D9F3008E2; Mon, 02 Feb 2026 17:01:39 +0100 (CET)
Date: Mon, 2 Feb 2026 17:01:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
 <aYDEiOutq3_O8irP@willie-the-truck>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYDEiOutq3_O8irP@willie-the-truck>

On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:

> Since we're not providing acquire semantics for the non-atomic case,
> what we really want is the generic definition of __READ_ONCE() from
> include/asm-generic/rwonce.h here. The header inclusion mess prevents
> that, but why can't we just inline that definition here for the
> 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> we use that to implement __unqual_scalar_typeof() when it is available?

We are?

---

commit fd69b2f7d5f4e1d89cea4cdfa6f15e7fa53d8358
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Fri Jan 16 19:18:16 2026 +0100

    compiler: Use __typeof_unqual__() for __unqual_scalar_typeof()
    
    The recent changes to get_unaligned() resulted in a new sparse warning:
    
       net/rds/ib_cm.c:96:35: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
       net/rds/ib_cm.c:96:35: sparse:     expected void *
       net/rds/ib_cm.c:96:35: sparse:     got restricted __be64 const *
    
    The updated get_unaligned_t() uses __unqual_scalar_typeof() to get an
    unqualified type. This works correctly for the compilers, but fails for
    sparse when the data type is __be64 (or any other __beNN variant).
    
    On sparse runs (C=[12]) __beNN types are annotated with
    __attribute__((bitwise)).
    
    That annotation allows sparse to detect incompatible operations on __beNN
    variables, but it also prevents sparse from evaluating the _Generic() in
    __unqual_scalar_typeof() and map __beNN to a unqualified scalar type, so it
    ends up with the default, i.e. the original qualified type of a 'const
    __beNN' pointer. That then ends up as the first pointer argument to
    builtin_memcpy(), which obviously causes the above sparse warnings.
    
    The sparse git tree supports typeof_unqual() now, which allows to use it
    instead of the _Generic() based __unqual_scalar_typeof(). With that sparse
    correctly evaluates the unqualified type and keeps the __beNN logic intact.
    
    The downside is that this requires a top of tree sparse build and an old
    sparse version will emit a metric ton of incomprehensible error messages
    before it dies with a segfault.
    
    Therefore implement a sanity check which validates that the checker is
    available and capable of handling typeof_unqual(). Emit a warning if not so
    the user can take informed action.
    
    [ tglx: Move the evaluation of USE_TYPEOF_UNQUAL to compiler_types.h so it is
            set before use and implement the sanity checker ]
    
    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Peter Zijlstra <peterz@infradead.org>
    Signed-off-by: Thomas Gleixner <tglx@kernel.org>
    Acked-by: Ian Rogers <irogers@google.com>
    Link: https://patch.msgid.link/87ecnp2zh3.ffs@tglx
    Closes: https://lore.kernel.org/oe-kbuild-all/202601150001.sKSN644a-lkp@intel.com/

diff --git a/Makefile b/Makefile
index 9d38125263fb..179c9d9a56dd 100644
--- a/Makefile
+++ b/Makefile
@@ -1187,6 +1187,14 @@ CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
 # the checker needs the correct machine size
 CHECKFLAGS += $(if $(CONFIG_64BIT),-m64,-m32)
 
+# Validate the checker is available and functional
+ifneq ($(KBUILD_CHECKSRC), 0)
+  ifneq ($(shell $(srctree)/scripts/checker-valid.sh $(CHECK) $(CHECKFLAGS)), 1)
+    $(warning C=$(KBUILD_CHECKSRC) specified, but $(CHECK) is not available or not up to date)
+    KBUILD_CHECKSRC = 0
+  endif
+endif
+
 # Default kernel image to build when no specific target is given.
 # KBUILD_IMAGE may be overruled on the command line or
 # set in the environment
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 04487c9bd751..c601222b495a 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -230,16 +230,6 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	__BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
 				"must be non-C-string (not NUL-terminated)")
 
-/*
- * Use __typeof_unqual__() when available.
- *
- * XXX: Remove test for __CHECKER__ once
- * sparse learns about __typeof_unqual__().
- */
-#if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
-# define USE_TYPEOF_UNQUAL 1
-#endif
-
 /*
  * Define TYPEOF_UNQUAL() to use __typeof_unqual__() as typeof
  * operator when available, to return an unqualified type of the exp.
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index d3318a3c2577..377df1e64096 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -562,6 +562,14 @@ struct ftrace_likely_data {
 #define asm_inline asm
 #endif
 
+#ifndef __ASSEMBLY__
+/*
+ * Use __typeof_unqual__() when available.
+ */
+#if CC_HAS_TYPEOF_UNQUAL || defined(__CHECKER__)
+# define USE_TYPEOF_UNQUAL 1
+#endif
+
 /* Are two types/vars the same type (ignoring qualifiers)? */
 #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 
@@ -569,6 +577,7 @@ struct ftrace_likely_data {
  * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
  *			       non-scalar types unchanged.
  */
+#ifndef USE_TYPEOF_UNQUAL
 /*
  * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
  * is not type-compatible with 'signed char', and we define a separate case.
@@ -586,6 +595,10 @@ struct ftrace_likely_data {
 			 __scalar_type_to_expr_cases(long),		\
 			 __scalar_type_to_expr_cases(long long),	\
 			 default: (x)))
+#else
+#define __unqual_scalar_typeof(x) __typeof_unqual__(x)
+#endif
+#endif /* !__ASSEMBLY__ */
 
 /* Is this type a native word size -- useful for atomic operations */
 #define __native_word(t) \
diff --git a/scripts/checker-valid.sh b/scripts/checker-valid.sh
new file mode 100755
index 000000000000..625a789ed1c8
--- /dev/null
+++ b/scripts/checker-valid.sh
@@ -0,0 +1,19 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0
+
+[ ! -x "$(command -v "$1")" ] && exit 1
+
+tmp_file=$(mktemp)
+trap "rm -f $tmp_file" EXIT
+
+cat << EOF >$tmp_file
+static inline int u(const int *q)
+{
+	__typeof_unqual__(*q) v = *q;
+	return v;
+}
+EOF
+
+# sparse happily exits with 0 on error so validate
+# there is none on stderr. Use awk as grep is a pain with sh -e
+$@ $tmp_file 2>&1 | awk -v c=1 '/error/{c=0}END{print c}'
