Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470026CE39
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686316; cv=none; b=E+QUIaE3zeezpzCj3WwPlDdIfg5Xy++LL4ojzmuTRNAa0giRri2xIbyftjhlwy4UvG+ngcPx1TuIksp2MVu6j+74BxmakaA+TOfNjDqd44RRI0+vtLF9f9PdRJI+zs3G31BfBq34M3zPNtk0/qj0wVaKxcI+EsyA6RzIdMJamdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686316; c=relaxed/simple;
	bh=nP8Odpge9e+1m2eIIzLh58vN5z/ciiKpXbKsThkvUC0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGbwbHgaqPUh+g4ld49ePPuc4YWZfYZ3Js5gfe6r6zDbP9q9R8glv04H1BnlP5EXz2vYilt+2yO7mtDaBOQRcpt1YnctwZosJrcXS5KjmQUKJZODoztWI1YuirY40E48JDQs8jrUnpLG4Cpp8MvC0KzD1NhYT4rLutAlUzjKukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S01q+eMT; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S01q+eMT"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso8455285e9.0
        for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686313; x=1770291113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLXst4hKcwqR8aL0m9xNuTfU7cjH0z0TV7vdns2E8pI=;
        b=S01q+eMT71Ue91YKpqIA8WmbO1pBCV9Ov2HReUBQbU/2d6dfPYcl2c/v2e1u+QSP7j
         4gna7IybZfZPThsneO08ciQGGvmQuSaBX/AQjfXOKBKGB7194jj7zYW60/QWqpykYNoZ
         u2CAZj7ABRAEa7SYvj4Rpru9S0tmg7qp0Z3SnjtBuB+pvKFak9ym9Mk05V47FQKPd7Fc
         yUGPYksuS+chn8ErUilC8XyPQmUodmjH7/F0JyZZZF/OL1b1Eyv+F3Cra8B9ipY3/MID
         znNjQWxSzhLDat+oJg3AgY9+RhImFp5FMvAtsGjV/8HXUjN369EN59jjpCewy+9VJxGH
         FuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686313; x=1770291113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLXst4hKcwqR8aL0m9xNuTfU7cjH0z0TV7vdns2E8pI=;
        b=wAIXHGzFWBq0Sg7zTMiZNPcyfdc5NM1HNsCtH5vJpco70a4HG+pWYTp8Cu73aK0hoE
         0dK3qUCGNOnc6ZgCU4Er0v44i7BJth0GXn9S22XrnpWPGgbZ2zkxrZSIUSVr4hqEljhm
         BXbyfEQsyGs3/iF9KtsKGSOmuUIpDuBhZoloeTHGYgDkMMy86cHHHDiQ4mltDuunhviI
         VUnTV/J0YMH0FTAidAqSGh47t4BwM7hPm6Rp+VOJXAC+zysrvQxFUydVo9u+vsDO/Zci
         6I0pwP8G9miqk/mYVMh9w8LlmpQRaGQ+aoZC4wPt6DGWJTAUmf9Vg6RA54Xq94t8LJUm
         Xvkw==
X-Forwarded-Encrypted: i=1; AJvYcCWyPbf1ZYIo10oqe3ZYjns5/pnts442dYRnDP1vzsZ18JLIvFq6gl2zMwA9uJ+wX9lSZNtK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl9EDy+fUeYIl8fiscSDBbC+By+Kkx+D+5R93R/s083IZsPJfS
	r1nYw1bNVqyeTRJIWrAVZ36aSyyuLzE8FXE1rYEKHwiaALZX6cEr4lYvT4KanDnE
X-Gm-Gg: AZuq6aJ1oXOdZA9NM2ASKi3ghjysVXoQaytpfJAbx65Vh1VRWrdwQb15iCVEQTofTt0
	Exq3mrKtK9CWRvlAU+36H6DK3Xd0hhwjNREj0f3PBH6HiWMQK+xN/xam7YOV2t8ryJ5jjF7MVra
	udym7XSwKO0gIv666iQ6c2VFWxQyYo9OvErJMJ0kyHrqRMyaJhVKB4vcoVTxKYAQYIJmo7kK+tJ
	gHaTraMW5p4oa9bTqgJeq1YYsZ6LkuBWJTMqWXyF4hAd5VK5Cj0LVsiJgE6sFx0JKRvxZxbkBT1
	GqKwC5DbHZhkGGyuDpxCb5bhiho0MccepQCltA1bUNSYZNi9hHeQq3n0bT9O3qiaRQrtHhsYrFj
	sRgkO2p1QxLofkGd33LA6TADlXWlsbHiojBtL4nzbGN6SenC+RPAHfd+ZDQcwOPrHa6ePw7fshO
	9eNAiVQlutErDj4rcr2aJ584C9tWNhUBmpSpWkPXa45VumyN2QHW6h
X-Received: by 2002:a05:600c:c16b:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-48069c1a85bmr92237885e9.13.1769680343784;
        Thu, 29 Jan 2026 01:52:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf235sm177623235e9.0.2026.01.29.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:52:23 -0800 (PST)
Date: Thu, 29 Jan 2026 09:52:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129095219.6a3b8dc8@pumpkin>
In-Reply-To: <20260129005645.747680-4-elver@google.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jan 2026 01:52:34 +0100
Marco Elver <elver@google.com> wrote:

> When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> could see:
> 
> | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:976:2: note: spinlock acquired here
> |      976 |         spin_lock(lock_ptr);
> |          |         ^
> | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:966:6: note: spinlock acquired here
> |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> |          |      ^
> |    2 warnings generated.
> 
> Where we have:
> 
> 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> 	..
> 	void futex_q_lockptr_lock(struct futex_q *q)
> 	{
> 		spinlock_t *lock_ptr;
> 
> 		/*
> 		 * See futex_unqueue() why lock_ptr can change.
> 		 */
> 		guard(rcu)();
> 	retry:
> >>		lock_ptr = READ_ONCE(q->lock_ptr);  
> 		spin_lock(lock_ptr);
> 	...
> 	}
> 
> The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
> Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
> 'atomic ? __u.__val : q->lock_ptr',

Doesn't the previous patch remove that conditional?
This description should really refer to the code before this patch.

> and considers this the identity of
> the context lock given it can't see through the inline assembly;
> however, we simply want 'q->lock_ptr' as the canonical context lock.
> While for code generation the compiler simplified to __u.__val for
> pointers (8 byte case -> atomic), TSA's analysis (a) happens much
> earlier on the AST, and (b) would be the wrong deduction.
> 
> Now that we've gotten rid of the 'atomic' ternary comparison, we can
> return '__u.__val' through a pointer that we initialize with '&x', but
> then change with a pointer-to-pointer. When READ_ONCE()'ing a context
> lock pointer, TSA's alias analysis does not invalidate the initial alias
> when updated through the pointer-to-pointer, and we make it effectively
> "see through" the __READ_ONCE().

Some of that need to be a comment in the code.
I also suspect you've just found a bug in the TSA logic.

> 
> Code generation is unchanged.
> 
> Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Rebase.
> ---
>  arch/arm64/include/asm/rwonce.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 712de3238f9a..3a50a1d0d17e 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -48,8 +48,11 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> +	auto __x = &(x);						\
> +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> +	auto __retp = &__ret;						\
>  	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\

Can you define __val using typeof(__ret)?
Saves expanding the macro twice (although it isn't the horrid
__unqual_scaler_typeof() any more).

	David


> +	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -74,7 +77,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */

