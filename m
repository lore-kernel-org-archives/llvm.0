Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F450276
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771264846; cv=none; b=RIcxVO3jPARFK4cvPRataPLB3Oy9ALBQLHHDuG126z7TXaOgklig3swSG4rwi5GVeKB8uLjem5IllTDH1UV0VD0gkbCBWdajMMFOnmPu2uLY+f+V8qWV8nInr//opjjnHjX81pXJmBAuS2a0jy6Ex0aKcWQqp0fTUpeUWaL+r6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771264846; c=relaxed/simple;
	bh=qBNPuZc2vkYNiY2EW78MeppBVWhwwBSAOSsJYIiH0a8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzjYFsnN+YUTXZ4wS5vIAtg0kcD93FFLuJSrPOqQKg81VLLTQ76BgnTil14K19/Zjqacc+NmViDMa48mmCSp+sA9aCZyZStm3watgk50LLsrodbLHO0j6n7QlfH5jHV76Nqel+6VaQU+OJFiDpkFSZqdHXqf8JaKOaX3HNk2gKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCksCSvf; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCksCSvf"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48372efa020so24249035e9.2
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 10:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771264843; x=1771869643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlnrkNiHMMWqhc/Lf+03YWMo+lQDLVH+FdrzL4wse3w=;
        b=fCksCSvf3VT5BkKICxvwMoDaguZwjnGn5klzxkktUx9DXOy1EFFheOFfW2IQY9w8AB
         OTOUQXS8garBfo7I6HXbAH5qTDpg26uTynZ6E9A/wOgT2THExnNyNA95E17hZVvC8CTH
         CaNdPwCsxkPjkA30YjuLfnm7eYi3OcykmvPuuPivax4yeK5LbTpW2JVnYGBkzR+jSG/3
         eC6YUuVvTrK9Jpl28f33fsodpBW2b2bQrNP7boQcs/ly48KP1PypI2GdLE3ZMHpaNy7/
         QaFm8cGDl/xeTWrqFROxrQbsANsHJwuRL1ZeRAx9RpGJVJvW1ivytBFE67EvJiG85aPB
         wP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771264843; x=1771869643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DlnrkNiHMMWqhc/Lf+03YWMo+lQDLVH+FdrzL4wse3w=;
        b=vK1Kf6Z4jBGEOiqfyH89CIPA7L/v5+VHOxwYeLTu5P28HfKTZ11Y/i8SGXyWidbaQB
         o/S8Uy7b2Lc8ZhQUYJuO5SwtxKfW/HSnexH7cVDkVpZ0ChBz/l6cP0vFwxjwW/Wvwyc7
         Ie/HWDbPgiJdY2aod+awWpDhPcwEaWp2Jxe7m0tmptlNWshPAd8FBdghPLDrQ7TlIEn2
         L6A83ZRzaMklubB7ogh0q4vAgF8hjr7shuCoOUjZzNPO7T4tzb8LExyKjv/Zf5+y1zaS
         6r94PmvyH/alffuTQ9KTDVyvr32ZJn2dmU+G3dpPVnZLNzyeVip0YX1LhoIX773PDjLY
         hhNw==
X-Forwarded-Encrypted: i=1; AJvYcCWiE4H3Qy5+LGOaYusB/CpU4cENt7awd93/JvnE7jwP3sKvT41GC6M0geeemcQoxsqTZ6p6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3OvhYM+ctANt/ZKKyZ+KT0UVyju/OS+oUVX6Rw5OSKDXX/ewN
	AIurW8iX09GGcY96lEuslLEvsOyfvjBZUB3nBeqtrr0A6YvirVsfd8BZ
X-Gm-Gg: AZuq6aKOVR/YtOCFiB4ivomsn8tnh20hCJauvKv9JW0D93BX5mFD44BYHn8Im3rF3LH
	7Guv3RfGSjUDlNlYhFNh4d1ahSRKZLYwSkraBFEHL/G0eVWsX7vThUQuuXofNrtWTroehjqBWHH
	of415BbBtULqLH7TKtqwRJxe+QQbAqpBwkxD+Kh5L906usQEQpubsBmRJkOUemO6N0c6qynjJO/
	6EfhFurcN/4trbtPHPAz1dXeOXNFRGkt04qXNhftvQtGTRoQiNnduMx5JDSFYjTedo551ycMD+C
	oRIbHvePkgd4XnxGaxgvNs4vwI7uTF83wAdOVv7GlgfDNE0H5cQu9ANbLdM7k5RZNgBmh7GVsgN
	jq4WeShWNIYNbb2V2YsKZZy8MU9YS7c+ETWNVh/otLcogMoZWio4mmwveo6xe4MAa+Nu2QHKNn1
	FwZE4JYgn1MYBir7m7BaXbFyMi7akdclP2pSIcTY4q0PkHp+SWshSLWBKpVr99iP/A
X-Received: by 2002:a05:600c:4443:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48379b318bamr123202395e9.0.1771264842769;
        Mon, 16 Feb 2026 10:00:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm351895235e9.4.2026.02.16.10.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:00:42 -0800 (PST)
Date: Mon, 16 Feb 2026 18:00:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Al Viro
 <viro@zeniv.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216180040.6a93807a@pumpkin>
In-Reply-To: <20260216142436.2207937-4-elver@google.com>
References: <20260216142436.2207937-2-elver@google.com>
	<20260216142436.2207937-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Feb 2026 15:16:23 +0100
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

Did you try adding OPTIMZER_HIDE_VAR(lock_ptr) here?
That might force the TSA logic to use 'where lock_ptr points to'
instead of trying to allow an unlock(q->lock_ptr) (or similar)
which is clearly entirely broken.

Testing a compile with the unlock() missing ought to generate the
warning - if not you've just confused the code enough the it stops
caring.

	David

> 		spin_lock(lock_ptr);
> 	...
> 	}
> 
> At the time of the above report (prior to removal of the 'atomic' flag),
> Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
> 'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
> this as the identity of the context lock given it cannot "see through"
> the inline assembly; however, we want 'q->lock_ptr' as the canonical
> context lock.
> 
> While for code generation the compiler simplified to '__u.__val' for
> pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
> much earlier on the AST, and (b) would be the wrong deduction.
> 
> Now that we've gotten rid of the 'atomic' ternary comparison, we can
> return '__u.__val' through a pointer that we initialize with '&x', but
> then update via a pointer-to-pointer. When READ_ONCE()'ing a context
> lock pointer, TSA's alias analysis does not invalidate the initial alias
> when updated through the pointer-to-pointer, and we make it effectively
> "see through" the __READ_ONCE().
> 
> Code generation is unchanged.
> 
> Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> Cc: Peter Zijlstra <peterz@infradead.org>
> Tested-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v3:
> * Use 'typeof(*__ret)'.
> * Commit message.
> 
> v2:
> * Rebase.
> ---
>  arch/arm64/include/asm/rwonce.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 9fd24cef3376..0f3a01d30f66 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -42,8 +42,12 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> -	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> +	auto __x = &(x);						\
> +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> +	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
> +	auto __retp = &__ret;						\
> +	union { typeof(*__ret) __val; char __c[1]; } __u;		\
> +	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -68,7 +72,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */

