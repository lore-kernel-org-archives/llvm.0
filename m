Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92D328B7F
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785895; cv=none; b=htjXYTJXuBRPsG3elNm6bY07auOdMbDvHOy9mRx5Xg5yzxmI10F3Cg/cLM1dMQvtfYcJnjGZ33Y0r6+Cabl/qLCATMOrgwKHdBLEUULCGqNIUTNHhYpWmnEPJsRXh4AJPapjHjYXsBHZufvvohmookd2zHp/F6/i2OVwp5SGhO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785895; c=relaxed/simple;
	bh=3ZzkHDiRx9RWrjA0tqJGVroDV0m8eZ1eDjoSR6HBmMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cedaZh9fjNC6+UieE9Y5AQhaP3yJAMImG2X6/BKk/nbjE7yLlmBDqxmjip9a3nUtVExAUXehyyLVPT/8M9MYiTOwYnUjpIX0WbW/P3Zsp8+QdF+uVIm+1di+4j1fgzZROZj3Sx5/VxAn5q4vbzgWLrdVGMhyJSaH4ZqXfY9vc0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk5eyaz5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk5eyaz5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1259259f8f.3
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785892; x=1770390692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh3exhkonU1Gf9pge3mRJuPjuTBZP+7nM/nKjCyUulk=;
        b=bk5eyaz5FejYVevTqO587APaoJzKX4IZRsOBaJnEya/B61fgsxczg46Cu0C6gA/36d
         8bx9ZI0ZWmyalGWinSpKo9diXE1y/lqXsWLNgMf/1OlkoIpvUh2tTBNGy5COb0BLZY0F
         lJeSfUYOS4aPqtBG+NlbkTcPJ8w3preZZBFJyIbIgnaYxLayon8lLLkvkOGAaRZVZ0DO
         OpOvBhJVo3LuWHxXIHOz968ERXH7gZJ/Z9UCTcXtxdJpomQoRVUcrJ9/m2tF8eC420Hx
         R7W02HhU2J/dXKwh9niAGnyQOMyDNtNCiwivYgRXjlWZynq6cS8cDGUpp/C6SVoHSQBd
         UASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785892; x=1770390692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mh3exhkonU1Gf9pge3mRJuPjuTBZP+7nM/nKjCyUulk=;
        b=Fad1flJhI7/OBKMej3EaTs5sKxD5Yn9rzXc5NSTwsm4XuPgxpZHeesGKrcn47DCT+e
         FBgIS3y7yQgAVhx5mtv6tQiU+GN7BqmgNoqfybacD9lXip0KUV7ooR5fj9JVi9/1PiuI
         QueSz2GWjXksSZO3MUXJPGVRvfMuXVdPDvjI9/26LVq9IRJevNYQSi6LQPeYiqbgjfds
         VtAQ3DDf+HulzDvMnDegIwnagvmFKofmM+a7itApxUSn8JYwjldonyUftS1loEjKo77d
         C9rcnEbFUa1KEe+wSjt0C6kLxAPZaLZe2ZbzYO+z/GW3Eq7EpgwcbN8EITrO+3wGEqLE
         tmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLUnRt1P1lEMFYS1GqbkF9VbE/DUkNeqhHj6A323PXAWwRNGyDACPVvih595SwzuWTRVQO@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg9X3L+hDeLyGr1cxVNbvvCuXJkhJlrTJKHZacK9WuCgKXnqb+
	JPFEZsIFTCOcun58boZpMW5g6WFkWHwn2ZtdKsPViJTClMFL6mqfEvB9
X-Gm-Gg: AZuq6aJYCEslaahknNsKDngN9T9GOvDyfB5MkewUNziAqqitifMZzIbv2LdsNJMt5ML
	EsMm8j1vtRB3e+fh4ThPULGWKl6MyGhUFA7azeiEVJ4ItPKnRQw8tBt8EizP/YvwBv+f6wWn9SC
	wZKUxD4A5nTs8RLgzPvf0Ko+7I19xrMVBZtWETqidm02p74L7P2E6MMrGOOKJhXrRF3dyhGQN/1
	jPOvW5ry4/IFKJ60s5eyXs4u4u9/oh+ZVz7Gvm8wbz95LluQd+INImxoxVvBrtHle/1XMpQPf/m
	9a6iKuYK6Q4ISQY7ObEttLVY821S4FMUONN7YacaedkuyA351bf/xzS0GA8ppi16hW8SLIGh/lk
	bbuSU4YpkjDp0Hj5MbDlCbx43Vcsjte/EYhJ1D1MhFiIO20vuTcW0oFITMr8VK58wfGjR+hBh7S
	4h2K8/WX8IAtJ4pFPfA39e6C8RXa/ETGIpJzgW1/hGCUO2SDNoH1Rw
X-Received: by 2002:a05:6000:601:b0:435:9d70:f2a6 with SMTP id ffacd0b85a97d-435f3abc64cmr4554670f8f.63.1769785891782;
        Fri, 30 Jan 2026 07:11:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm21939238f8f.17.2026.01.30.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:11:31 -0800 (PST)
Date: Fri, 30 Jan 2026 15:11:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260130151130.6026999b@pumpkin>
In-Reply-To: <20260130132951.2714396-3-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Jan 2026 14:28:25 +0100
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
> This refactoring appears to help the compiler improve (or fix) code
> generation.
> 
> With a defconfig + LTO + debug options builds, we observe different
> codegen for the following functions:
> 
> 	btrfs_reclaim_sweep (708 -> 1032 bytes)
> 	btrfs_sinfo_bg_reclaim_threshold_store (200 -> 204 bytes)
> 	check_mem_access (3652 -> 3692 bytes) [inlined bpf_map_is_rdonly]
> 	console_flush_all (1268 -> 1264 bytes)
> 	console_lock_spinning_disable_and_check (180 -> 176 bytes)
> 	igb_add_filter (640 -> 636 bytes)
> 	igb_config_tx_modes (2404 -> 2400 bytes)
> 	kvm_vcpu_on_spin (480 -> 476 bytes)
> 	map_freeze (376 -> 380 bytes)
> 	netlink_bind (1664 -> 1656 bytes)
> 	nmi_cpu_backtrace (404 -> 400 bytes)
> 	set_rps_cpu (516 -> 520 bytes)
> 	swap_cluster_readahead (944 -> 932 bytes)
> 	tcp_accecn_third_ack (328 -> 336 bytes)
> 	tcp_create_openreq_child (1764 -> 1772 bytes)
> 	tcp_data_queue (5784 -> 5892 bytes)
> 	tcp_ecn_rcv_synack (620 -> 628 bytes)
> 	xen_manage_runstate_time (944 -> 896 bytes)
> 	xen_steal_clock (340 -> 296 bytes)
> 
> Increase of some functions are due to more aggressive inlining due to
> better codegen (in this build, e.g. bpf_map_is_rdonly is no longer
> present due to being inlined completely).
> 
> Signed-off-by: Marco Elver <elver@google.com>

Having most of the comment in the commit message and a short one in the
code look good.

I think it will also fix a 'bleat' from min() about a signed v unsigned compare.
The ?: causes 'u8' to be promoted to 'int' with the expected outcome.

Reviewed-by: David Laight <david.laight.linux>@gmail.com

> ---
> v3:
> * Comment.
> 
> v2:
> * Add __rwonce_typeof_unqual() as fallback for old compilers.
> ---
>  arch/arm64/include/asm/rwonce.h | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..42c9e8429274 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,20 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers (Clang < 19).
> + *
> + * Uses the fact that, for all supported Clang versions, 'auto' correctly drops
> + * qualifiers. Unlike typeof_unqual(), the type must be completely defined, i.e.
> + * no forward-declared struct pointer dereferences.  The array-to-pointer decay
> + * case does not matter for usage in READ_ONCE() either.
> + */
> +#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +46,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +69,9 @@
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

