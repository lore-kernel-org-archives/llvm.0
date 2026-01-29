Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6FB2FFF90
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648231; cv=none; b=Xa90zw4FDzkFOymzNKo7oxefWOhPklREnAIl2uriFRJpwvmLNGbQuoyTEWDwDaxbhQIXbniH/rTQSb6Ed7jX5W3jlqKSFuTq9o8l/Y162ySWnfdYQbIg2VOACIgDI2gVAxXUBJpc1VNUA3HLNflBy7Lk5TG+FCoOefCnsteusJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648231; c=relaxed/simple;
	bh=/t4AF7jnqhigQgZ2d4Fnqr4JkIMVuJcFMzzqPuGlCDA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YEvUlwgrIuLEevgacYPmmZ9h+wQH6DSQ4m8KQ2JBSCa3HiAT/fMPqc9VoBegNrHTtTzWgChl7j15jbKhbnRY1MdIFVD/RAciRkxN7QJw8CGHOo7HDDs173KTGIf/eeDF0PgmxNzO+1DczJ6dt1RS6N9k+5GdHqJA4GUd4tsR6CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jigcZvar; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jigcZvar"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b871328f6caso35747366b.3
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 16:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648227; x=1770253027; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEepWOxCVSc1aX29GPbB6p8VltBEKBk11LnhK9lypjY=;
        b=jigcZvarVZ94SxlOnOvMN2nXdpK/1wWGqGB9p64GFAqtqDxLJbxxB18Tksqpnvn1Ad
         ewUQ2c+JxzkBpv2qzZoAviEyHwFyR20ekMYTvQzXiKwoCl0VZKap3aX+keKC85mIbBK0
         ovmGSzzPXdAXpvd6+5khM7X17UI+Y/+g5O1yJTdWpIi5i8eaNFw2CDygflsS3LLaL8/M
         o1X01NZ0J8DUHIOFksFBrcAMfmTYNbsNIpc/WZMp801VIMC7cWU45KexXzQRRv3L7yXG
         K2UoMCAYLF2nW8LrXoLAkEMGkfVSrsfptqQNozVslwwy26Cfkncpk8x8Fk7ixl+UdO99
         6b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648227; x=1770253027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEepWOxCVSc1aX29GPbB6p8VltBEKBk11LnhK9lypjY=;
        b=UmzrvEWZXDyotNIVi0oXBmJ/RR15wFMpz8s4Cqj8e5g7KlBARA2cc4TY3NfycXuxwZ
         V3i0jtnrzJt2xk+pD4WTOawHkIl0LcrAflsaxevXx2pgQdoyse5hBrRdk4SfSXug6J2I
         yHrVFCktFSwPao4MjvitKxmHbg96z+olaSXGGn8/5Zi8Ng6lMiUHmRKjMKUK/djyWz0E
         t3JWCe8pitE4fIVbUSRY4DWBZ1Ks86l1QpQbGeELBcEDC4d/ofXjN1/UnwF2sEOd3Pbd
         +6+QkypJqHPJqgXqwd67vLMXwZKy03bjxM6oRlD9gVbQz4yQ0OxNuzPmz72Vlwvx2krp
         zn6g==
X-Forwarded-Encrypted: i=1; AJvYcCVlQTr8ysk0tZgbC0efOrlqvo4mH/RrIOuhB1HM2ZrDljKadyDQNYHHShuGwxnEcBgeJdbn@lists.linux.dev
X-Gm-Message-State: AOJu0Yza/3rZJWg3VJlgdq0EDfnsQQQ7gBBDp+Mgg8v9drmFnXqi5+NA
	KUxgRbrbxtXDuUCPFp2RGdwQEBgza60zaK+KgcO4V6UUuc8vP5/Fv5GkEBrD/gvJFQF1XeM1eIh
	OBw==
X-Received: from ejbdt12.prod.google.com ([2002:a17:906:b78c:b0:b87:2981:bb4b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97d1:b0:b87:1d79:bef4
 with SMTP id a640c23a62f3a-b8dab130284mr439369266b.9.1769648227185; Wed, 28
 Jan 2026 16:57:07 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:34 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-4-elver@google.com>
Subject: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
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
v2:
* Rebase.
---
 arch/arm64/include/asm/rwonce.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 712de3238f9a..3a50a1d0d17e 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -48,8 +48,11 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
+	auto __x = &(x);						\
+	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
+	auto __retp = &__ret;						\
 	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
+	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -74,7 +77,7 @@
 	default:							\
 		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	__u.__val;							\
+	*__ret;								\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.rc1.217.geba53bf80e-goog

