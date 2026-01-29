Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3237F0F0
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681023; cv=none; b=cSGnUkFdftD6xoF35AdW/nVx4MDQ3OBZbSAw6wtsra/XNvvvVyE8fphm502KtEUbWEfk99tWbBjZwlfywQDf74RYZf3E8vWlaeixv8IxFCCF0T6VnCvfh3erEvpR3Gc4eV5fL67iejMRqcQg2FL/GeOX20lBF2pyMRUlACkU9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681023; c=relaxed/simple;
	bh=PmTSUQ+h2ZqYnbujZAT0kP3eFJi2MleWFHp5ZIEnQGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbRP1XYNf15ROLFZ2DpEiIu4d0DERTtVMFRjea/rkh+8HKhPCcfd8d7NoB3EWzM0X2FyaoDRWXu4C1ax4+/Y/inXkHq2iHKuP/QljXMEAu8KJYHEecC9ozM7z2XqDySF4wiwkX4PiBwvLXscsAlgGX67xqzlG6AJxA6Xg0bcPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxexpzLD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxexpzLD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so10554155e9.0
        for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681015; x=1770285815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN9ZJ2CDowvxIQYtuX8i4e7sp+a9+p0zkDa4YiBDAsQ=;
        b=AxexpzLDaUbjc6dnzoBAsUMf2RJn2d9Q0o6Y5mWyEvJinqhS7bdd3lEGnaDcJLoUrK
         2ly3/g52yLcY5XfilMeGUBvkBtaZymktr1+06oqPAqrF1PgoYcB9BtmR8A4NYz6ej7cq
         2zoqop0ev7TtVDvZq2Botr6PZvqW7yUN/amB+Fw5XlCDAGMowbSbF2zqUYXkNSVbRcu5
         urBW+i/HD3n6SFEEcIxdy1CnCK5+KZCpSL5YnHAtLxa9Q717bapQ4KmXeWKvzJcWg6S3
         J3cku8tK1oRQISKJc2fpl9SXzWXzsDJfc81ULEh8CNLc9BtIAE5aMN8llGeL0SosercY
         Qynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681015; x=1770285815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TN9ZJ2CDowvxIQYtuX8i4e7sp+a9+p0zkDa4YiBDAsQ=;
        b=ebeaKuGwbNtRvGr+s5p+uPc9EnDdYJHKiplEooouIf86rFXqb14Gfynrej6qMGFVn/
         VwjDcgGc2/kd9b2KWKhVun3xLlSkjbqZHvbUY0/qtEE4dcNRhOEFm+jXJySaYW6lc2S9
         vWjtBc+5pCQiArgMOX1wH6biM5kPK2pnJtItH+dFoT1qZ1Npm9sv3I4lkSIi69RRDC03
         f28rwhAOUSR5Q4maYHsdTzw7xMjsT8RSRgj+6AUCMxUF348mV9R4u7RhHW5GU9XQTjy8
         74L5NBISh34sSUBoaA8zyUOwAQaBWzhEompLANq16XDrck5WGnrkM9ACtu1G0t5M2agt
         zg6w==
X-Forwarded-Encrypted: i=1; AJvYcCVwDEcG3KjuHgaEKSZhKQIBQxLLYB4rps2e4oZi/6XaWJL5njVaNYx6hG/vufPjj+QmNvoe@lists.linux.dev
X-Gm-Message-State: AOJu0YwPqxpMVN984DX+ULsHwZ/+NlLxmVMv3MRFk1yHQQETvkKcHWqf
	cuOWAZ2251fBz9OADOsD1+kyDMB3MtKgMxdVttWH3bCOPLJxG24OOANK
X-Gm-Gg: AZuq6aJgX+Byk9tB+3ERGqGzC9dJNEApOOU9lyI2IWxk4UrtqLjC/rNLR2QwVwiMWgV
	diaWSfEZxE12NxLZ1tR8Qy5MiENjr37S9VG+2peN2NY/mujJgyRS5dFeQ302JmyoOFJIpjiDzb4
	a/6QIdXIXSho0LC3Fi78IPqLJ+QZ0b7FeEYxF6T1d4bhJzsalCY1xzsOsYf1Orsg50d9ZzmUll4
	BL8AbBt6spPmmwLFrJ3Uw5iLksL8vy5Y+5MJKrVpR1nW+yBVz2pCGAmTNxYzZuoqy7vQ80fy5EE
	wHgcxn9Ms+jK7IqKT4+JGpHYVTKfh7BVZKClYu3h6nEYiaBEXp5OIGKdPm/rs4MghoajhNyEwd1
	2fVkQec/kIVOGJI1cx6FNn3yBPvLJTTFIrsNXJ5mf7QNKIe6jlN5ZaaV+DzueqWZa1KiMsndCIi
	DIOVcNuPY1mOzQiD2XJkEnDlv1D5cJqxf8El8B+YsBscFJizt4lwBD
X-Received: by 2002:a05:600c:1385:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-48069c66fd7mr94238255e9.26.1769681014646;
        Thu, 29 Jan 2026 02:03:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm174245575e9.7.2026.01.29.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:03:34 -0800 (PST)
Date: Thu, 29 Jan 2026 10:03:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129100332.500248d3@pumpkin>
In-Reply-To: <20260129005645.747680-3-elver@google.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jan 2026 01:52:33 +0100
Marco Elver <elver@google.com> wrote:

> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
>    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
>    just integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
> 
> Once our minimum compiler versions are bumped, this just becomes
> TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> 
> One subtle point here is that non-integer types of __val could be const
> or volatile within the union with the old __unqual_scalar_typeof(), if
> the passed variable is const or volatile. This would then result in a
> forced load from the stack if __u.__val is volatile; in the case of
> const, it does look odd if the underlying storage changes, but the
> compiler is told said member is "const" -- it smells like UB.
> 
> 2. Eliminate the atomic flag and ternary conditional expression. Move
>    the fallback volatile load into the default case of the switch,
>    ensuring __u is unconditionally initialized across all paths.
>    The statement expression now unconditionally returns __u.__val.
> 
...
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Add __rwonce_typeof_unqual() as fallback for old compilers.
> ---
>  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..712de3238f9a 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,23 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers to infer an unqualified type.
> + *
> + * Uses the fact that auto is supposed to drop qualifiers. Unlike

Maybe:
	In all versions of clang 'auto' correctly drops qualifiers.
A reminder in here that this is clang only might also clarify things.

> + * typeof_unqual(), the type must be complete (defines an unevaluated local
> + * variable); this must trivially hold because __READ_ONCE() returns a value.

Not sure that is needed.

> + *
> + * Another caveat is that because of array-to-pointer decay, an array is
> + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.

gcc < 11.0 stops it being used elsewhere.
Something shorter?
	The arrary-to-pointer decay doesn't matter here.

  David

> + */
> +#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +49,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +72,9 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
> +	__u.__val;							\
>  })
>  
>  #endif	/* !BUILD_VDSO */

