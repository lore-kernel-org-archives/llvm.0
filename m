Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8195275A3;
	Fri, 18 Sep 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765671; cv=none; b=t43/Go25Gpbi+j+E15iB1NRR1t+XOcwFrW7KY7ZJc4+4artDtEQMNRNxMO5XZE7gd7yWaQTWX6C4gIKv0A70416oCsSniS57LJzpeoLVS5JwSs2FK82TIDL3KnPfchBOwCBlMeMnSe6srsg99+QBERJwbKFKb6Snu7SSB19WChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765671; c=relaxed/simple;
	bh=wuKgIkiS2FHxRxJ4IEELHzmMQy5AtbOWto6qESGTv5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCllADcBZB+ecVvZaVrRbUCMYcbFXNvzRo92a7soCyXPy8NDGdCvtxSGcSgLOIK2H4e7Mo9YQaWd+p7KRp5/4xkfgPA5/EumqZXHU9g29gJ25vC++YGc9LaH6tQzM3CDvQtE8LCJon9ojAWCbq/9AALEIhQLyFyanQpVvsB2yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNNUYQ80; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNNUYQ80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0ED1F000FF;
	Fri, 18 Sep 2026 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765669;
	bh=zMyHIW5JmXrfN6pCRrMHPR90GnGJt4p1gcDtib6I5ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNNUYQ80TMa9xylhzSJAqvCbr81AxV4IcdIDUX6qTECYlv3LT9Bvcn9bmVI/8B/29
	 lFAaY3L09NlcjNEX+E9TTBdKQDfT5lXxbF4bxh0foXJ5XY4k+Mt5LanZAyMNOsZY5p
	 FlYj5TcoOyJuE0ww0tbwW/jzUY8Sit4pdzGIsVptJgWhpOsZpYxHK7ReXz7yTGA5NF
	 L8x05AC/wjRjEWHBGwDcHa8CZS5jRp0lnNEH7k5mN1sqX7iaGsyWxqjlt0wCyJyS8E
	 9MuMLU2cAerd+4RkRYFcH0f7uvrHD/USH5StwWaEh/X22vGdQKdB23rTiTzy66jntV
	 T2v4SwaXT+/xw==
Date: Fri, 18 Sep 2026 14:07:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260918210744.GA235304@ax162>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com>
 <20260917173920.GB356152@ax162>
 <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
 <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
 <aq01ud_zTYN-3Zby@zx2c4.com>
 <aq2OpBZIMVhMZhWW@zx2c4.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq2OpBZIMVhMZhWW@zx2c4.com>

On Fri, Sep 18, 2026 at 09:19:00PM +0200, Jason A. Donenfeld wrote:
> Untested, but putting this all together I suppose looks like this, if
> you want to play around and see:

Thanks!

> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..713e95dfdedc 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -29,6 +29,12 @@
>  	}									\
>  } while (0)
> 
> +#if __has_builtin(__builtin_memset_inline)
> +#define memset(dst, value, size) __builtin_memset_inline(dst, value, size)
> +#else
> +#define memset(dst, value, size) __builtin_memset(dst, value, size)
> +#endif
> +
>  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
>  {
>  	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> @@ -83,8 +89,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
>  		params->size_of_opaque_state = sizeof(*state);
>  		params->mmap_prot = PROT_READ | PROT_WRITE;
>  		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> -		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
> -			params->reserved[i] = 0;
> +		memset(params->reserved, 0, sizeof(params->reserved));
>  		return 0;
>  	}

This will regress GCC < 14 because '-finline-stringops=memset' does not
exist yet, meaning __builtin_memset() may still generated a call to
memset(). Testing GCC 13 with ARCH=riscv defconfig, I get the same error
as originally reported up thread. I am not sure we can get rid of the
loop for that reason. I tested the following diff that keeps

  clang (__builtin_memset_inline)
  GCC 14+ (-finline-stringops=memset + __builtin_memset)
  GCC <14 (simple loop)

happy (and moves the checks into Kconfig, which is being discussed at a
wider level [1]) but it is admittedly slightly uglier... That said, it
certainly seems more robust.

[1]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-11-9ecf4163ff36@kernel.org

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b7..f6619e1cb2ce 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
 			-Wmissing-prototypes -Wmissing-declarations
 
-CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
+CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(CONFIG_CC_OPT_INLINE_MEMSET)
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 9c9181bb4071..0b84892d084b 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -16,6 +16,7 @@ ccflags-vdso := \
 	$(filter -m64,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
+	$(CONFIG_CC_OPT_INLINE_MEMSET) \
 	$(CLANG_FLAGS) \
 	-D__VDSO__
 
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 8dbf2532a573..c023046a3fd7 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -36,6 +36,7 @@ endif
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 ccflags-y += -fno-builtin
+ccflags-y += $(CONFIG_CC_OPT_INLINE_MEMSET)
 ccflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
 ccflags-y += $(CFI_FULL)
 asflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makefile
index 35c834b895ec..54bcf2984ca1 100644
--- a/arch/s390/kernel/vdso/Makefile
+++ b/arch/s390/kernel/vdso/Makefile
@@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO := $(filter-out -munaligned-symbols,$(KBUILD_CFLAGS_VDSO))
 KBUILD_CFLAGS_VDSO := $(filter-out -fno-asynchronous-unwind-tables,$(KBUILD_CFLAGS_VDSO))
 KBUILD_CFLAGS_VDSO += -fPIC -fno-common -fno-builtin -fasynchronous-unwind-tables
 KBUILD_CFLAGS_VDSO += -fno-stack-protector $(DISABLE_KSTACK_ERASE)
+KBUILD_CFLAGS_VDSO += $(CONFIG_CC_OPT_INLINE_MEMSET)
 ldflags-y := -shared -soname=linux-vdso.so.1 \
 	     --hash-style=both --build-id=sha1 \
 	     $(call ld-option, --eh-frame-hdr) -T
diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/vdso64/Makefile
index 7c0790065b5e..c2353a065279 100644
--- a/arch/x86/entry/vdso/vdso64/Makefile
+++ b/arch/x86/entry/vdso/vdso64/Makefile
@@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)			+= vsgx.o
 vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)	+= vfutex.o
 
 # Compilation flags
-flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small
+flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small $(CONFIG_CC_OPT_INLINE_MEMSET)
 
 # The location of this include matters!
 include $(src)/../common/Makefile.include
diff --git a/init/Kconfig b/init/Kconfig
index 6e82b4957a5d..09251b5f79d4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 
+config CC_HAS_OPT_INLINE_MEMSET
+	def_bool $(cc-option,-finline-stringops=memset)
+
+config CC_OPT_INLINE_MEMSET
+	string
+	default "-finline-stringops=memset" if CC_HAS_OPT_INLINE_MEMSET
+
 config LD_CAN_USE_KEEP_IN_OVERLAY
 	# ld.lld prior to 21.0.0 did not support KEEP within an overlay description
 	# https://github.com/llvm/llvm-project/pull/130661
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa9154f..83831dab08b2 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -29,6 +29,12 @@
 	}									\
 } while (0)
 
+#if __has_builtin(__builtin_memset_inline)
+#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
+#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
+#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
+#endif
+
 static void memcpy_and_zero_src(void *dst, void *src, size_t len)
 {
 	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
@@ -83,8 +89,12 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 		params->size_of_opaque_state = sizeof(*state);
 		params->mmap_prot = PROT_READ | PROT_WRITE;
 		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
+#ifdef memset_inline
+		memset_inline(params->reserved, 0, sizeof(params->reserved));
+#else
 		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
 			params->reserved[i] = 0;
+#endif
 		return 0;
 	}
 
-- 
Cheers,
Nathan
