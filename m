Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796F519DF4D
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769387595; cv=none; b=jBrIfXFqnalsY6JiM4vgeN4fPaPubdwCPq07erJBJ+wvxZzK1Ps/8zT5W+g8jNNLzW2LwEG7xeU6jI0tuKSikKfuyZxEoPH/BUuIwffI3BGLcFFonlbeu3RFBAYQZUbKYNtbE+XzBrdt7w1TO+ortjr788V9HygB5NZfxgKdzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769387595; c=relaxed/simple;
	bh=fyabtr/WWe4ln44fb6JDEbFXLec2d5CvMKWPch2hh8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g+l5JISn73BC763hUakdluINKo1t9y5Ppu1FAH+N1zpQ9IKM/cKhIy6dkpbhX8CECRNyEWECMUyl92J06XbWgOWDTX24SXLPIVmGxtum3UePgbVwETxrwykvEL/Uwqmh7pP1QM4LBLE3u+TPDEUc8O4xfBXraAitzkT4O+BmB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2C/8hKRN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2C/8hKRN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso31726765e9.3
        for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 16:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387593; x=1769992393; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzvRauRfmowbTuXqteNercyqQMxwj4TFlVBC4P/9vK8=;
        b=2C/8hKRNOaXgChhSc3nOQs0M5ruuEJnfzCJ16TL3bFwrCzyJJ1Oct4MYzjVjGb6MzF
         CfhpqjqnKKJQefmx4np/90jzggXfrZUgN1EG5KF0DCtljgdQWtYyoJnfM0iuJ1r5U8jh
         mwO7SKhm64X8aiK06ATJgwtJ3YZ4stK9AhNVzcd6JLtA8HWrFT0Xo/UCH4FX6P6DNoRo
         VPnuflzeaXy3c68Mxc5TQnNMFFzkGXJednipRonC1TldEinaxTYBcAAx/PujwxnpGhFr
         buTj93JpC561v0aJTwsVAKZeW0WwyvZm6dNcD6rQbVJbBZJ+GkfFlEQsE/d8P2ypP0zR
         keYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387593; x=1769992393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzvRauRfmowbTuXqteNercyqQMxwj4TFlVBC4P/9vK8=;
        b=MWVHYORsfWc2thWThdz7rmJkPOt0rQovSRrcJRRZ69/cU4GNA1v7Ox0H71+NBWLSEN
         LXOsrB/TI/J4qGEsYuN/Caoumzge/z2QIMPUMPO+hXd9jiQURynd8RYTNt7KbYUpToYA
         rtnVDrMmfvweEUbR1mhfWKe9V7TnUIya1xZCW6NZSXuctxVbx/k+dwXl/K/IYQmkFJY2
         TLHOFSd6S4Amjrq+M/e1t+R4w0txo8NNyjHGpERLy9XkudlaUghioFR6rRCZgsc7dsUi
         qC5NO691VnmIIcOiZVOAMJeiNlYBERaRHtnjv2hFR+wo4CJXbIAyXEI2yhn7gEZzL933
         QGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVuGqNRLRfWy6VjppzfzAGzSU1AZ0f8mQmfS3ZadGAme04pL/8UosjoBnQN1RW7kBuJRygD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+SozAON5xwT3IVHAH8JHfSPg8RvRw4b31Yt2QCmGapbix6VJA
	0mPK4dzgwNCZmsZdphDCCZIMOFXYyKqeKGONADYg6FY6nbTA+N+tL0nmPMl+kr7vp4Mg5kEJjAL
	tWA==
X-Received: from wmps41.prod.google.com ([2002:a05:600c:31a9:b0:480:4a03:7b7d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4684:b0:47e:e20e:bba3
 with SMTP id 5b1f17b1804b1-4805cd44c41mr51919685e9.7.1769387593066; Sun, 25
 Jan 2026 16:33:13 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:12 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-4-elver@google.com>
Subject: [PATCH 3/3] arm64, compiler-context-analysis: Permit alias analysis
 through __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
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

The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
'atomic ? __u.__val : q->lock_ptr', and considers this the identity of
the context lock given it can't see through the inline assembly;
however, we simply want 'q->lock_ptr' as the canonical context lock.
While for code generation the compiler simplified to __u.__val for
pointers (8 byte case -> atomic), TSA's analysis (a) happens much
earlier on the AST, and (b) would be the wrong deduction.

Now that we've gotten rid of the 'atomic' ternary comparison, we can
return '__u.__val' through a pointer that we initialize with '&x', but
then change with a pointer-to-pointer. When READ_ONCE()'ing a context
lock pointer, TSA's alias analysis does not invalidate the initial alias
when updated through the pointer-to-pointer, and we make it effectively
"see through" the __READ_ONCE().

Code generation is unchanged.

Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 9963948f4b44..85b1dd7b0274 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -31,8 +31,10 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
+	auto __x = &(x);						\
+	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
 	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -57,7 +59,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.52.0.457.g6b5491de43-goog

