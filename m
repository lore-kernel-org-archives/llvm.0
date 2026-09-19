Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FB281530;
	Sat, 19 Sep 2026 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815439; cv=none; b=M25y6rSKYbe4vmPNBcqE6xq0u4fV6vG/19YxRbz8M+yDaRX/+4nfeKrfvXNNGRnnYoeGdUBIEBnhN0LkVK4e/oqxktPamwZsYP9wD/YoYdfohHg9psQt/14hsscxuI7cysfpVWYX5sqoiCic7Sq3InwPDp7k38+LMxFbsUjgHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815439; c=relaxed/simple;
	bh=bRZS8VVOIAgNCMmUGjnejTDRbIq35KOik+rRaWtZXyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfFXwV/0Qr/1/Cl2dXrHUXO1tv6ht3ukeddEXpz4iQAbl5eG4Tp+A02YNNlfRbeIAjh+0WKWb9oPa1Krs6yS9oDv+Zsuo2fuA/jcXePowfZAPQX6gHwQR0l+2TP8hkknEFMRztc1dDlEnp7l5qiw3F4L3cf3D9xuF2hnnbFyQbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=GLuMP5rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GLuMP5rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D08F1F000FF;
	Sat, 19 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GLuMP5rw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789815435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z08u4QvsVEfgamcbLluYRkgXUsFblRlw/2gG817i0ps=;
	b=GLuMP5rwLf2OR2Pbdx5AExta5wqsRo51b05zCZrbfUWTs5rcvDZJsr/m6nbkTUNqx3bV9V
	442SKXGmGVPB+zbee4m+17AqWJM0u6i9e+XDJ7j6KL6NoOb5Nua7fP5aK/L+aHxHzwzS16
	X1iUhR6m7wNWC2h+5Y8VlZR+LdOlc5w=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id d5e2173a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 19 Sep 2026 10:57:14 +0000 (UTC)
Date: Sat, 19 Sep 2026 12:57:10 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <aq5qhgPT63dY2xg4@zx2c4.com>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com>
 <20260917173920.GB356152@ax162>
 <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
 <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
 <aq01ud_zTYN-3Zby@zx2c4.com>
 <aq2OpBZIMVhMZhWW@zx2c4.com>
 <20260918210744.GA235304@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918210744.GA235304@ax162>

On Fri, Sep 18, 2026 at 02:07:44PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 18, 2026 at 09:19:00PM +0200, Jason A. Donenfeld wrote:
> > Untested, but putting this all together I suppose looks like this, if
> > you want to play around and see:
> 
> Thanks!
> 
> > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > index 2851afa9154f..713e95dfdedc 100644
> > --- a/lib/vdso/getrandom.c
> > +++ b/lib/vdso/getrandom.c
> > @@ -29,6 +29,12 @@
> >  	}									\
> >  } while (0)
> > 
> > +#if __has_builtin(__builtin_memset_inline)
> > +#define memset(dst, value, size) __builtin_memset_inline(dst, value, size)
> > +#else
> > +#define memset(dst, value, size) __builtin_memset(dst, value, size)
> > +#endif
> > +
> >  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
> >  {
> >  	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > @@ -83,8 +89,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
> >  		params->size_of_opaque_state = sizeof(*state);
> >  		params->mmap_prot = PROT_READ | PROT_WRITE;
> >  		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> > -		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
> > -			params->reserved[i] = 0;
> > +		memset(params->reserved, 0, sizeof(params->reserved));
> >  		return 0;
> >  	}
> 
> This will regress GCC < 14 because '-finline-stringops=memset' does not
> exist yet, meaning __builtin_memset() may still generated a call to
> memset(). Testing GCC 13 with ARCH=riscv defconfig, I get the same error
> as originally reported up thread. I am not sure we can get rid of the
> loop for that reason. I tested the following diff that keeps
> 
>   clang (__builtin_memset_inline)
>   GCC 14+ (-finline-stringops=memset + __builtin_memset)
>   GCC <14 (simple loop)
> 
> happy (and moves the checks into Kconfig, which is being discussed at a
> wider level [1]) but it is admittedly slightly uglier... That said, it
> certainly seems more robust.
> 
> [1]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-11-9ecf4163ff36@kernel.org
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b7..f6619e1cb2ce 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
>  			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
>  			-Wmissing-prototypes -Wmissing-declarations
>  
> -CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> +CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(CONFIG_CC_OPT_INLINE_MEMSET)
>  
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 9c9181bb4071..0b84892d084b 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -16,6 +16,7 @@ ccflags-vdso := \
>  	$(filter -m64,$(KBUILD_CFLAGS)) \
>  	$(filter -march=%,$(KBUILD_CFLAGS)) \
>  	$(filter -m%-float,$(KBUILD_CFLAGS)) \
> +	$(CONFIG_CC_OPT_INLINE_MEMSET) \
>  	$(CLANG_FLAGS) \
>  	-D__VDSO__
>  
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 8dbf2532a573..c023046a3fd7 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -36,6 +36,7 @@ endif
>  ccflags-y := -fno-stack-protector
>  ccflags-y += -DDISABLE_BRANCH_PROFILING
>  ccflags-y += -fno-builtin
> +ccflags-y += $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ccflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
>  ccflags-y += $(CFI_FULL)
>  asflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
> diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makefile
> index 35c834b895ec..54bcf2984ca1 100644
> --- a/arch/s390/kernel/vdso/Makefile
> +++ b/arch/s390/kernel/vdso/Makefile
> @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO := $(filter-out -munaligned-symbols,$(KBUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO := $(filter-out -fno-asynchronous-unwind-tables,$(KBUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO += -fPIC -fno-common -fno-builtin -fasynchronous-unwind-tables
>  KBUILD_CFLAGS_VDSO += -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> +KBUILD_CFLAGS_VDSO += $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ldflags-y := -shared -soname=linux-vdso.so.1 \
>  	     --hash-style=both --build-id=sha1 \
>  	     $(call ld-option, --eh-frame-hdr) -T
> diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/vdso64/Makefile
> index 7c0790065b5e..c2353a065279 100644
> --- a/arch/x86/entry/vdso/vdso64/Makefile
> +++ b/arch/x86/entry/vdso/vdso64/Makefile
> @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)			+= vsgx.o
>  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)	+= vfutex.o
>  
>  # Compilation flags
> -flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small
> +flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small $(CONFIG_CC_OPT_INLINE_MEMSET)
>  
>  # The location of this include matters!
>  include $(src)/../common/Makefile.include
> diff --git a/init/Kconfig b/init/Kconfig
> index 6e82b4957a5d..09251b5f79d4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>  	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>  
> +config CC_HAS_OPT_INLINE_MEMSET
> +	def_bool $(cc-option,-finline-stringops=memset)
> +
> +config CC_OPT_INLINE_MEMSET
> +	string
> +	default "-finline-stringops=memset" if CC_HAS_OPT_INLINE_MEMSET
> +
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>  	# ld.lld prior to 21.0.0 did not support KEEP within an overlay description
>  	# https://github.com/llvm/llvm-project/pull/130661
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..83831dab08b2 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -29,6 +29,12 @@
>  	}									\
>  } while (0)
>  
> +#if __has_builtin(__builtin_memset_inline)
> +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> +#endif
> +
>  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
>  {
>  	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> @@ -83,8 +89,12 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
>  		params->size_of_opaque_state = sizeof(*state);
>  		params->mmap_prot = PROT_READ | PROT_WRITE;
>  		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> +#ifdef memset_inline
> +		memset_inline(params->reserved, 0, sizeof(params->reserved));
> +#else
>  		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
>  			params->reserved[i] = 0;
> +#endif
>  		return 0;
>  	}

I wonder if it makes more sense to have an "#else static inline void memset(...) { for (...) .. = 0; }"
in the ifdef defines for memset, rather than cluttering the function
with an ifdef like that.

Also, I might have left ppc out of my initial commit.

Nick, do you have feelings about this approach?
