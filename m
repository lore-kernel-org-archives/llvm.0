Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D8492E54;
	Fri, 18 Sep 2026 19:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759152; cv=none; b=UPdr1hqiKPHBJr8mhrYsiz/uhRN86bkYQMjBfrODALuhEmbiY8fUNHPN/nFFaCy8n86YYRPdu6JX1PUAI7GNVFxCeWti+kffR21M6H3ZwkIvu57qU6ryAHM3851jTtQL5c//mB6RrLpL0F9Ib6FVW1wveIQIUAytf/d4Dtp5WxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759152; c=relaxed/simple;
	bh=WqFgs23DKJd3JWYlDTf9n3272/7j/7VLSNlK0S+1jGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F85kn1ct1ELr8tmntLk9Zim0bYKbduuTG8k7HJXj3SVxnGZXK5crn+q81NpMrhk9INeI9/g7pOo1xcFjyCqRlTzyWF8Kmxlgv+x/+1p3XcChwZgaAyLLYxwTQTuZhki05Wxhf6wCt5+LrOLMCUEMlXfkLfr+bIqZ7hIjYhs9a64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=G91S9azG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="G91S9azG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60CB1F000FF;
	Fri, 18 Sep 2026 19:19:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=G91S9azG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789759143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RBFia57WNvrXDdvLYcILx6qy8OTo+Na4EmZjhZXk/Q=;
	b=G91S9azG7hTGwaZ6AuCDCHuq+CYkUPVTCFtm+CgfYp8Qa+2nuFOe4DNgFR6+BAvI5/ScZA
	BVd50poERrfXTgarzLDQl6dvSJqMMnN7mOUJ3H/bbJH42d9v0Ee0Wa+fV+8nL0gxYJhdde
	cxSlbApP2ndhbiYM3ZhBmBOL1aOIKVE=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 159f269a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 18 Sep 2026 19:19:03 +0000 (UTC)
Date: Fri, 18 Sep 2026 21:19:00 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <aq2OpBZIMVhMZhWW@zx2c4.com>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com>
 <20260917173920.GB356152@ax162>
 <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
 <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
 <aq01ud_zTYN-3Zby@zx2c4.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq01ud_zTYN-3Zby@zx2c4.com>

On Fri, Sep 18, 2026 at 02:59:37PM +0200, Jason A. Donenfeld wrote:
> On Fri, Sep 18, 2026 at 10:20:45AM +0200, Jason A. Donenfeld wrote:
> > On Thu, Sep 17, 2026 at 6:49 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Thu, Sep 17, 2026 at 10:39 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> > > > > I don't suspect this is the right change. On x86_64, this changes to
> > > > > code from:
> > > > >
> > > > >     rep stosq
> > > > >
> > > > > into:
> > > > >
> > > > >     loc_2D9:
> > > > >     mov     dword ptr [rbx+rax*4+0Ch], 0
> > > > >     add     rax, 1
> > > > >     cmp     rax, 0Ch
> > > > >     jbe     short loc_2D9
> > >
> > > /me nods
> > >
> > > > >
> > > > > Which is a lot less compact. It seems like the actual solution is for
> > > > > gcc&clang to emit this inline memset mnemonic when the platform has a
> > > > > good one, and otherwise not. But disabling optimizations for all
> > > > > platforms, because it's broken on one, seems bad.
> > >
> > > Ideally, yeah.
> > > Pragmatically:
> > > the compiler doesn't know what you will link against or not; so it
> > > just emits relocations that the linker will (hopefully) resolve.  I've
> > > definitely looked at how llvm decides when to emit libcalls to
> > > compiler-rt/libgcc ("the compiler runtime") and thought "I wonder how
> > > this works with compiler runtime version N-1?"
> > >
> > > There's also the requirement gcc and clang have about memcpy, memmove,
> > > memset, memcmp always being available (-ffreestanding or not) noted
> > > below.
> > >
> > > > > In this case, the compiler is being smart: it identifies a loop and
> > > > > rightly turns it into memset. But if this isn't a compilation
> > > > > environment that has an outline function, it should do something else.
> > > >
> > > > As I mentioned in the commit message, compilers require all environments
> > > > (hosted or not) to provide memset(), so the "doing something else" is
> > > > nothing :)
> > > >
> > > >   GCC requires the freestanding environment provide memcpy, memmove,
> > > >   memset and memcmp.
> > >
> > > +1
> > >
> > > >
> > > > I guess another option is to just include a basic memset() like the one
> > > > in lib/string.c so that it is only used if the compiler makes this sort
> > > > of transformation, while leaving all other architectures alone.
> > >
> > > It's also possible to get GCC to emit the libcall, even in the
> > > presence of -ffreestanding: https://godbolt.org/z/6hTrYq9z8
> > >
> > > And it's not the first time this code in particular has had this issue;
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b7bad082e113640fc81200ff869e5c2d7a9c29a2
> > >
> > > (is this patch a Fixes: for that?)
> > >
> > > Clang has __builtin_memset_inline to avoid explicit libcalls; AFAICT
> > > GCC does not.  So we could use that here to provide such a guarantee
> > > with clang; the code would remain brittle and likely break again with
> > > GCC.
> > 
> > It sounds like this is broken currently only on clang on riscv, right?
> > So maybe we can use __builtin_memset_inline, and get something similar
> > into gcc, before a future gcc version also breaks? That way it doesn't
> > break in the future.
> 
> There's -finline-stringops=memset for gcc (>=14), which should keep
> things sane there. So, we can use that on gcc, and alias memset to
> __builtin_memset_inline on clang. And then we should be good?

Untested, but putting this all together I suppose looks like this, if
you want to play around and see:

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b7..3b98058f95ea 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
 			-Wmissing-prototypes -Wmissing-declarations

-CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
+CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(call cc-option,-finline-stringops=memset)

 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 9c9181bb4071..4c6b597a7665 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -16,6 +16,7 @@ ccflags-vdso := \
 	$(filter -m64,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
+	$(call cc-option,-finline-stringops=memset) \
 	$(CLANG_FLAGS) \
 	-D__VDSO__

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 8dbf2532a573..720f95cd24f8 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -36,6 +36,7 @@ endif
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 ccflags-y += -fno-builtin
+ccflags-y += $(call cc-option,-finline-stringops=memset)
 ccflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
 ccflags-y += $(CFI_FULL)
 asflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makefile
index 35c834b895ec..9d0ae1f38388 100644
--- a/arch/s390/kernel/vdso/Makefile
+++ b/arch/s390/kernel/vdso/Makefile
@@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO := $(filter-out -munaligned-symbols,$(KBUILD_CFLAGS_VDSO))
 KBUILD_CFLAGS_VDSO := $(filter-out -fno-asynchronous-unwind-tables,$(KBUILD_CFLAGS_VDSO))
 KBUILD_CFLAGS_VDSO += -fPIC -fno-common -fno-builtin -fasynchronous-unwind-tables
 KBUILD_CFLAGS_VDSO += -fno-stack-protector $(DISABLE_KSTACK_ERASE)
+KBUILD_CFLAGS_VDSO += $(call cc-option,-finline-stringops=memset)
 ldflags-y := -shared -soname=linux-vdso.so.1 \
 	     --hash-style=both --build-id=sha1 \
 	     $(call ld-option, --eh-frame-hdr) -T
diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/vdso64/Makefile
index 7c0790065b5e..751cb6f99b65 100644
--- a/arch/x86/entry/vdso/vdso64/Makefile
+++ b/arch/x86/entry/vdso/vdso64/Makefile
@@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)			+= vsgx.o
 vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)	+= vfutex.o

 # Compilation flags
-flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small
+flags-y				:= -DBUILD_VDSO64 -m64 -mcmodel=small $(call cc-option,-finline-stringops=memset)

 # The location of this include matters!
 include $(src)/../common/Makefile.include
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa9154f..713e95dfdedc 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -29,6 +29,12 @@
 	}									\
 } while (0)

+#if __has_builtin(__builtin_memset_inline)
+#define memset(dst, value, size) __builtin_memset_inline(dst, value, size)
+#else
+#define memset(dst, value, size) __builtin_memset(dst, value, size)
+#endif
+
 static void memcpy_and_zero_src(void *dst, void *src, size_t len)
 {
 	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
@@ -83,8 +89,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 		params->size_of_opaque_state = sizeof(*state);
 		params->mmap_prot = PROT_READ | PROT_WRITE;
 		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
-		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
-			params->reserved[i] = 0;
+		memset(params->reserved, 0, sizeof(params->reserved));
 		return 0;
 	}


