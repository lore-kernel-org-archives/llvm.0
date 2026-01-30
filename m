Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F630EF9B
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779816; cv=none; b=dZJSc4K9AfkBjiTFYZNl950s6U+f4AgUrK4Y85xHvk2heGuxlq5V03fVaU5VcBey76BJmY1kpFq0rNrwtGfqerRjWZAr/JvQ8ZjWob/DwtP0ZM4MoPc23NMUPG9PBn4uG5FWXmqKmD60Qtbo4pbCyiWbhUY93BIfniFoz6adexs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779816; c=relaxed/simple;
	bh=T4dPZtG1oh8ppeo/D7aOCiu7eQficsG0EdVSGiJeJNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MTvFA2NzPLi4zczyqTqROGxZcmD6K7P0E1NpGmqRtJcmyuKKjbBOcDs0ujGT4eK+a5O7+TP81JMQqC6YGh+ZTYXOQAWtG8hs0HCuT/zg8QM0dfWpTDSZjK0j2zln4chs0/kM+Ez2huuFQT9ojlb5JK1c1d7c4JhyuUcVfJMbzxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kf4n6PI2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kf4n6PI2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-480711d09f1so34382865e9.0
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779813; x=1770384613; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIZZgTWN+WVkGCe2DzZUi2LmQSShjbtn6Lr33NLpRdc=;
        b=kf4n6PI2Ou818Y8ZAnRGaN2W6lueAKv4zQyNnLemH8DAfMZSgHosViEYEFgOT98oxa
         mnTvCLbZFyZQF2YcCBeFNxW1WOurLZNC4nVQ6CkgEoX7Tx50CpU2+j29t+ouSOAqJQSQ
         eHp2SUGNtdbQ/BA7wgfyUKoTnEGeoypflkf4iGx2RRJu5qh9EDQjCiNtqGCeBG0LC/Xs
         pqHXo/ajz4Jekge4qO34gLL3NXl/cVsQXXXuhd7R+eRr24T0vvOWyuWTyLAzQjo4DBe2
         mLr5nr5KA/OWOE/2YGerUC2Ms+yID7wo50cjB9irYRAoHryjlWmWd/Kc/s7Wwe55u3us
         0i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779813; x=1770384613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIZZgTWN+WVkGCe2DzZUi2LmQSShjbtn6Lr33NLpRdc=;
        b=p7D3q2dpbzDOwRdBpy5NNZ5yj2Z5PR2u/QZqHIk5yEXM25P5y6x6UYZxs60orb7/wD
         yXu5botaxG02yt4q1h0eiHS3t/srR3CHPBjkwck6m22E+I/XQSCXkzoGsxhjdvs4Sam3
         0n4NR693bHKqeWe6TOJfLkOLbmubU9Gub2j6gSNUPS/gYxq2yKe2WRwO6eLm0seoXsip
         F810vqjjoV4yPcxRFws6xOq4wU2lnSCpsiM2V7ttiOC/6/+2d6/BpVfzLE1JRSqvySHr
         wJnuTSK8jOqMZdo/PsAgUVxPklsy/AThyoCFGdC5Ecy9g+Fnts/OZGSU+Wfw6dT0VaYz
         ggfA==
X-Forwarded-Encrypted: i=1; AJvYcCWkMNEsw0XpBLREcEb6VEKrZy3wIxSIvpKG0YadlE/K4HcCNS4Z5q+G1IB82jUMhiaqQT/t@lists.linux.dev
X-Gm-Message-State: AOJu0YwoAKRRtcCIbxckMsEYnEpXpHORdiF21TgL8gjtgw8P4Ra7Nlft
	4ltI9LQbGJtqDyAz6njDK+GpcLsLuWvx+OYCA3nEsndGZqpDUoYpMPF00ZPtDA5kpCUlV4cRvI0
	y7A==
X-Received: from wmot9.prod.google.com ([2002:a05:600c:4509:b0:477:7aa2:99cb])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4a3:b0:480:6c75:ddce
 with SMTP id 5b1f17b1804b1-482db49da16mr40851245e9.33.1769779813044; Fri, 30
 Jan 2026 05:30:13 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:26 +0100
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-4-elver@google.com>
Subject: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
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
index 42c9e8429274..b7de74d4bf07 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -45,8 +45,12 @@
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
@@ -71,7 +75,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.rc1.225.gd81095ad13-goog

