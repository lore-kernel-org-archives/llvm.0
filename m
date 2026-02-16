Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C92FFF98
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253442; cv=none; b=LU0lYPTsLWkO8Pde6vB/m5IvZ92/AoGy3t5iT4PAO6UKWbtehYZBYBa4gLqBeuh2pSdCcsKq7/kRBH60PBzumZt+oMHmQG7o7oeHXDVkOrsODqe8/v+4ONbsil7NY6gqbdkByUb3ylX6Ja+/tP1pICBE8eGaXLRQ9ED7wbkrIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253442; c=relaxed/simple;
	bh=Ip1FGe9THDnU9YMANqAopIxPtcAKpyNKkQY8BLBr/bU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uav1GfIQr8DxOhoRxvcwLtdS4xchVAimRmr3Vga9JYm+RoywMG0B+dLejy0+4O1OxKynK1u7HDcad+qyuC2eUN9o+HhMh23J/FvvNAb8iGTYd6k72ozdD7D3Oqfn60ACdrTI6n09kNwSae5tFu9iIqCnQiX+bbIeplz/niuRjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gn1q21/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gn1q21/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4368060a5e5so3677140f8f.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253439; x=1771858239; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYdVr7BD//ML3cPspm8e51p1r/jn9khxfOY35saBUOQ=;
        b=0gn1q21/WKfP9Bn0GgYnVE53KEFxQJaQw9NdJ5N952zbwkj1QwbyOBb31aVh57y2k2
         /Yv60z1PqUkiuJCoSyOHHrXrRa3QxPjJ4rdSNKZrS7CBX403BjScSxF6j2gyC6nvqVeS
         EHLYFPVb+2srra3tbhddzd+g1PvMtuL7RMRPgPUCMAxfQJQCMPOwtzauDdwBW61scBzf
         JI8Wna6KIdksJ4cdXDbqqTstoXWAMvLAwkusYS1Rop3y5yJq7DrIjTYMKPCaGRuLPb32
         iJgvndMnwMpIxJOK4TOnZZFx1m8e/C9VtXTsyBNqemterRA0krxqJNzr2a8Z/xjMToQF
         ncqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253439; x=1771858239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYdVr7BD//ML3cPspm8e51p1r/jn9khxfOY35saBUOQ=;
        b=U/Khv6EF0jrH0VAmU8U114KFAeauX+jZ8oyiZGw8kWvzDSwD3II6EDh1PbuqA6GacR
         U73ma0zZFbZZDC1ybRa8zagr9T9RPudhggYsq1ttqArKFhODeEkyJBHA6U7K6HGYVIxI
         4Ol2z2RcBom3A9OUPJP2bGMpvMD+My9lbJi/JlrX3a817Dl91SryO8OXFXVuEI13+app
         G4wWPeBZEt1LDhJvqgQUtasXEWUkLmZLn4CPkG3FPZ/teqhIZKrymJQyIdxqjHgxmCsY
         vXNQdlWC+DBWE3DO9L0w89slpuVExN4B9CJdONLH79nRERh2uttZw8tEhgDuiwzeHtTq
         WzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnstbjyiGfdLSuA4cilrThA053g54iROzfyTCh18kGYNJMktjKPPXcQtxYK32xFrIiuvTm@lists.linux.dev
X-Gm-Message-State: AOJu0YzIZPxkPVdSrVc3S0DbbpJpudoOAaTvh785mDNJQYwmef7G8GtC
	eaH84dcNBQINHd0ILO2KGRCK8ANn25LjkJPO2itEIwT5TUZMNtNn8nd9QxvW69ne4MV3sITtLrA
	TNw==
X-Received: from wrqa11.prod.google.com ([2002:adf:f7cb:0:b0:437:72d9:7316])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:613:b0:435:a0ca:bdca
 with SMTP id ffacd0b85a97d-4379dbae796mr14728899f8f.57.1771253438836; Mon, 16
 Feb 2026 06:50:38 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:23 +0100
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-4-elver@google.com>
Subject: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
could see:

| kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
|      982 | }
|          | ^
|    kernel/futex/core.c:976:2: note: spinlock acquired here
|      976 |         spin_lock(lock_ptr);
|          |         ^
| kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
|      982 | }
|          | ^
|    kernel/futex/core.c:966:6: note: spinlock acquired here
|      966 | void futex_q_lockptr_lock(struct futex_q *q)
|          |      ^
|    2 warnings generated.

Where we have:

	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
	..
	void futex_q_lockptr_lock(struct futex_q *q)
	{
		spinlock_t *lock_ptr;

		/*
		 * See futex_unqueue() why lock_ptr can change.
		 */
		guard(rcu)();
	retry:
>>		lock_ptr = READ_ONCE(q->lock_ptr);
		spin_lock(lock_ptr);
	...
	}

At the time of the above report (prior to removal of the 'atomic' flag),
Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
this as the identity of the context lock given it cannot "see through"
the inline assembly; however, we want 'q->lock_ptr' as the canonical
context lock.

While for code generation the compiler simplified to '__u.__val' for
pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
much earlier on the AST, and (b) would be the wrong deduction.

Now that we've gotten rid of the 'atomic' ternary comparison, we can
return '__u.__val' through a pointer that we initialize with '&x', but
then update via a pointer-to-pointer. When READ_ONCE()'ing a context
lock pointer, TSA's alias analysis does not invalidate the initial alias
when updated through the pointer-to-pointer, and we make it effectively
"see through" the __READ_ONCE().

Code generation is unchanged.

Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Tested-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Use 'typeof(*__ret)'.
* Commit message.

v2:
* Rebase.
---
 arch/arm64/include/asm/rwonce.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 9fd24cef3376..0f3a01d30f66 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -42,8 +42,12 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
-	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
+	auto __x = &(x);						\
+	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
+	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
+	auto __retp = &__ret;						\
+	union { typeof(*__ret) __val; char __c[1]; } __u;		\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -68,7 +72,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.335.g19a08e0c02-goog

