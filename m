Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F86B2FCBE3
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791713; cv=none; b=lZMXjpJ8Vg7afH3gtBPTybulKFa+nuY6ndtVqwi52csOw5IS4JBTELl83NBolGeiLFQi122kiyVJoiqPeuO1FDIQylDQD5SuF8pvIOoihDh1FTFk2bDW7lw516WDiThaE7/K5VFG9Dx88mZT6wucHrkVcIFdehuNRzDZpzUY9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791713; c=relaxed/simple;
	bh=f5GCbVXBlczNwQ5Vaf6tzAND2FAuuEYvNWmS17pcDkI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpB1XTj6cT6Q5jrZoR5h6RSguiOnYQq+DvM3pr6L00Z7jPIrGYXuNNixqaWkZpvyeFFQsI1uun4UaGG6Hd5Xr2uCd2BKaLeP5dbaNt+Pqjdoy0qbj59tUfBdXjwjqHkSfgcgCikV8KVXuZz/2OaKKEDLXPkm+JR1cKHvXVdCGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGVnzdHa; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGVnzdHa"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso3820186a12.1
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769791710; x=1770396510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5YrrQBmasl55YNR+UE7+Tj54HTQyt4aQnFBBbSZIJY=;
        b=KGVnzdHah7s9+buXA8BLtpQMN0N4VtkokCU2M9Ut9sTLYtyGLd+K1q3n5eJsJHXL71
         gES9GCFH6dRs670GExPNXMv/LQtPy4k7CeRhAslcjTsDqGKf+7uw9tGsrshrnMD6iJGX
         AWvoq1jZzKJYKgkCnntSS1U1+X/lysLnwRAhHLFN6eFGIY8OfcbHCdFOJAPlf/VVqrhG
         l33qn+Ca3JlM9gSlP+Nk3ROvVffgl1jsdEwC0X1Nq1c8dcwD5+Zf9YrpCuoFl8UiD3C8
         f8bpZ5BsLaJeHlsXp0HwLg+szG9J8G6RVxPO6wlQXv+8IFybRMEGoFI6XtNDOoLBo22+
         yBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791710; x=1770396510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D5YrrQBmasl55YNR+UE7+Tj54HTQyt4aQnFBBbSZIJY=;
        b=EMK/PdcmSpHcJVzn5Rm6l4veGmNGqXGbKV6mmMT0KuOxwIe1x5Ui4WGql5ndQzPWZl
         IBJ8rw6Bun5kYnSpwDSQwlCqnONKmyMI36xL73Wym1kj0BH3R5Ihvxo3kQZZ5qBGx0Gx
         3riJVCEPM7wp9r5/7lxAUiFjC3YhyzQUeFN+5VRtDlcrnEoSuVUHqHvqoojpD9zicUx8
         2n2ntQ+hHzM5VLxQm+HBR9lRyw+QrLo2pVae1LkloRTxe5mj+cc+9Fvd2Uao2cme95IH
         gW5yoNeLJFOJkp4R3Pg+biisfapvCm9p7DRLTbBRnHnV4WOyshLAx7eBPL0yCZgFd04N
         Ywmg==
X-Forwarded-Encrypted: i=1; AJvYcCW3q+Zq72bY1rDkOpfhXo6iS5oW/alAbMYLMLBJnBTKHZM8SU4JTHuy8WivyD/3cdfgt9Mv@lists.linux.dev
X-Gm-Message-State: AOJu0YxrpHUECbGp5+oR1Ip2Ju/6oDy6esirfhp7ajXAKI7LIjkM4ng8
	Q2YNCW7XCJTzuZIrvs4HKK3vVpJLvLlL/6tKA03a9C9SE2qPYq5b88ikEoJ24Kg2
X-Gm-Gg: AZuq6aJufC9Z0mawoA7BFiXnyGBexCZ7bvK4H47bxDY8oifUeCrHIMzPDY7tgDTL+os
	oU3RPzsO+DaaDgOwbhkeEtmwuN1e2G8HHMKWkh0lTn7JNdYm8lAJRmHrQybxMXCRtxIbrwoY1A3
	f5gT6SU7Fz/Xf5TulUa+hx1geBcinsvjGkIPJBW+0yIWcBFrVIoqvinSxJyjiD/8cZNfjyvYkE0
	UNobhAYJfenj5Re2NlhsXQ+4x92KZSlst/wovBvQw3oOqOF05dT2Ng8NmcImKEC1mh+YsXvUiio
	6Wd+EPmJUuHPF4nltdEDFtVdaNTd7+Cvga/EtpWl5LYS+oli90RKXmIMjwKBWY6aIgW/PRfQo0+
	OatVmgfg+P1epzRaYWXLwLu/YJTlag8Sua0qJRl8Yn75mJb+qhPnEjUIBYyq6O7Hj/PNm+4iheP
	sy8v73teHDj7WzwDlctdk/eVxGMLow+LQ52TGOGcVvjtwDroKRNVDd
X-Received: by 2002:a05:6000:3105:b0:430:f5ed:83f9 with SMTP id ffacd0b85a97d-435f3a6ccacmr4297915f8f.2.1769786016653;
        Fri, 30 Jan 2026 07:13:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322f40sm22288828f8f.34.2026.01.30.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:13:36 -0800 (PST)
Date: Fri, 30 Jan 2026 15:13:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260130151334.2191973d@pumpkin>
In-Reply-To: <20260130132951.2714396-4-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Jan 2026 14:28:26 +0100
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
> Signed-off-by: Marco Elver <elver@google.com>

LGTM (for an obscure definition of G).

Reviewed-by: David Laight <david.laight.linux@gmail.com>

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
> index 42c9e8429274..b7de74d4bf07 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -45,8 +45,12 @@
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
> @@ -71,7 +75,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */

