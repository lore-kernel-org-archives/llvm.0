Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B6358D04
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769654516; cv=none; b=W6adDZEJlmJg5ve6rkobEGGW1TkHp9jR2Dz7KF3AoXR8MomiLwX1xmPpwvi1INvnrvkK0iq2CNgMU7imPnozhinsr1ri2uu33BOKNV28B9GAM1h9qpK0Isvl7r61iwia61EzfM2+ulcPFg0/hgaBrSXl5Ix6At7x/LEiF0qnvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769654516; c=relaxed/simple;
	bh=8LV7VFDtactd+c8QZMKoqsAIH9gGNtFQbyfO31x6Sw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwWxewMzUF5GBxxtFT0k+cMrbhtgO14MAPANqt4K0opSeDA+a6eJkuUMMZ4EqVHcl7io9Ma4+fQz0hLMl99sxjP+IUngZh4YuuYRjGZLGsc4zPR45o0sjWnbFtzHeyOpv623NxoJb2i2faoQ80nJJVnQalgLj+EMBdHHrUF43FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quJtTOTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quJtTOTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2800AC4AF09;
	Thu, 29 Jan 2026 02:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654515;
	bh=8LV7VFDtactd+c8QZMKoqsAIH9gGNtFQbyfO31x6Sw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quJtTOTNqMWbCBWl5B6qeBKij+ouFf8WcKkToo3ZR8bqtEzfpJSRk9eu+qh+KLD5h
	 mFrd4OgAopG/d4ob5XwZlyOLVIt/0+edSy2O5F9lmZmNIS5YDw61ks2I0oCfXsF6oQ
	 yhMXOSdgzVBsmq20nZyQsLa6uHsM7DeLFroF6V/kr2EeF9wk7ItayQiukhfP9Z9Yy1
	 vpNTxc0aevOjOZlYXf8wanYU8/DSBKBFg5kvXh+DoU0lcgZXf0h/rOlNHsr6MN7eS3
	 iJMZnRZRJGlbDy54csPRyV/whl607Hzvk1r4sQzh7qm9az9tJ/xEe6XUsjnrnsiek2
	 +8cx617euPVcg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29457F40068;
	Wed, 28 Jan 2026 21:41:54 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 21:41:54 -0500
X-ME-Sender: <xms:8sh6adSFVeAyREqr2tJp_J1HN17cnp-AsZbFXm5RMV1fsgayPZlBEQ>
    <xme:8sh6aWOXfa0jhwK_B0Yqte1c9eGMIv_4MgqwsfOMH9SI69pjGwkHTJKYIyHDlcrbn
    3SiqGnpgsceO8-GSgqFNuKYoUgPiMqls3tsLacCwyR3MqQcfJ-s>
X-ME-Received: <xmr:8sh6aT5s67FsvgC1_wnaNToQD7qdwtLL_AqzdPU_xVrPIHAD34qeF6TGTsJsHsyn2yZXbAlMsgWBN1jPWb-dRkreVH5tmuES>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegvlhhvvghrsehgohhoghhlvgdrtghomhdprh
    gtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthht
    ohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhonhhgmh
    grnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghvrghnrghsshgthhgvsegrtghm
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:8sh6aZU9TwU-YIWryRyOaXozpuYufj88NX4BNfjiCiZsWWwk4YDW-Q>
    <xmx:8sh6aaOGUNBmpXxD6YtYwqxuOJLUiQ6sr1KwwbdM7MRNcXfT3NyO8Q>
    <xmx:8sh6aQiVFdpVTAsgaI5F54QdQ9FHaOHLSCmFmIjGIK6NVkvBe6H91w>
    <xmx:8sh6aQ6vIK0f7KM5uDguBKZo3_Ql9Iq5cgSbV7mPkenY5-MNv89WtQ>
    <xmx:8sh6aXd8zEwdVGGqIM8w9cLozg2oPqHQv__0KEG5jZRxqKOsN8k5J-Ka>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 21:41:53 -0500 (EST)
Date: Wed, 28 Jan 2026 18:41:52 -0800
From: Boqun Feng <boqun@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aXrI8FQgH9P_Ors6@tardis.local>
References: <20260129005645.747680-1-elver@google.com>
 <20260129005645.747680-4-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129005645.747680-4-elver@google.com>

On Thu, Jan 29, 2026 at 01:52:34AM +0100, Marco Elver wrote:
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
> 'atomic ? __u.__val : q->lock_ptr', and considers this the identity of
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
> 

Seems reasonable to me, but I don't have the compiler knowledge to do a
full review, so:

Tested-by: Boqun Feng <boqun@kernel.org>

We also have similar issues for asm-based smp_load_acquire(), to trigger
that, you can just replace `READ_ONCE(q->lock_ptr)` with
`smp_load_acquire(&q->lock_ptr)`.

Regards,
Boqun

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
> -- 
> 2.53.0.rc1.217.geba53bf80e-goog
> 
