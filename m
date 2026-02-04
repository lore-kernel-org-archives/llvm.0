Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B766347BD1
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232893; cv=none; b=YycM1qki5Tid9UhWimI1Po/L4S9i3yE16CA6tSRdefjn9qPS5fSyGWm4VTPxVPLb29KUmiXCqA2NEc2TA6pQ344BLObIsn1Auj6fVa95U50FHgPHBDOYIZ/IwH3s2M++PcpJSoOGVi2BGOfINKndxmzIKv/lsV3zjVbgmjxQgL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232893; c=relaxed/simple;
	bh=9vSWloqcRXaxL3gvmit7soCRVhcCNrs5LQ17VXzVgV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4WD81itEMLSmz9hMt73ywsV/BFs6V3+U5NqFqE/8U034jpAtF2WWLeYFv2iGGqeW1IGjLBVbv8XOyWyyvioitN5bnoUDuxRgzMPDEClFP8raZEPMleWsGyauELIuKnEFh+olNvH3M8lXofz6PmdErVfBKM3Pumcgs3UR6uy9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcNE8bhE; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcNE8bhE"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89476eaaf16so506086d6.1
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 11:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770232892; x=1770837692; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=hcNE8bhElDrZW7zmegxoa0M6lw2WtsyhkA4XxntFxAePML4c0IvGaxWMmEPNl9pbFQ
         FhsfV9zUZshJXV3U4NXW/xHbRVzZy+62jTVZ3XFlSQnH57/h0z0aGISDVFnZwC621SiM
         r3R23QBpCsu33zmYlis1f+k/B3aH4VsKMy8bjygA7xs33rccC31hx2RZygeHgpCwvjD0
         CT6Zo6OCo7TMjMhWeeLSW7qIi1ZFd7whgTb6Xio6Wlw7ndZd5rOJexZj5BsPc0V/s66i
         +5+0oITTkdE+mXYAfApXjikRCR6i1jOIWz1tzElcRJqukQSyup7aQ7ODlA1iyLdjGOhk
         aRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770232892; x=1770837692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=pwQfZH5crIBvnLt4pnAz3Ve8sLQcFgdvUlLWCshQwHT5zC6z4Jhyl0ukMdFvqDRnIi
         26FYeZjC7LiejwWUrTjbOEqLrgPFZ59R/0wPN6zM+3/1Y3e+DOQRtJMowcF/lsKr6Np+
         pU6XALaZXMjGRDEBZibL0IBcjYdbaAlIuDEQVOYSgumBUxSIh9sjLacL9BVUaoD/2yJ1
         Gf2Th65oTv530c7NP2+Sw6MZGBgdPhz6CD0d+FUSv5vpJWu8wG7ZWY6I56TxBjQIS4Ba
         5iiLm0RsgN6Xdk9abJtrHBxGrr/93gc6Gl0JMeLGuKrsVxS2p5QV64RjnXp3mEGYN96e
         yfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaavrXSJvLis5UXstf03ue36ebL/0RN4y/NKH6s46/0YF3B4PBCDMDLiTe9lKtjMahnWW5@lists.linux.dev
X-Gm-Message-State: AOJu0YwY4xd2xFKRiR6wE4cEUqyDSAy4bLaf4nxxPqSNu3cwmPOA0/AN
	DOFHD60jzKj08QgRoQrclBb6vey0NiCINZVSx2m8dTCq1PVbfSgRs7aR89Yclg==
X-Gm-Gg: AZuq6aJ0BDcjWzXns/9AlmgprWa32RMytA1sXTIoRvDB8R8970wH/uE9HMCG5MDiV0d
	gDrEWq3tieRYj3dkJY92Tq6XncYOa6/Qgz3pZ1MTkrZ3KzYRTHeExdgBTLnXp/3/CeSy2QFAstZ
	oupqP7H6ehvBD+MhFY091rw/hUXxrnVD3BAM1lVFUSs5+fd1oylbw/rTFXn3lXRIXSo5SPuoiQq
	LyVKGACsoa/MwFFbgU27ejZAlVm9ZrLdzslNFE9oPDMgUcLKX1PAhLON/z4VUL7KNzWArkeZwFO
	h3uKeFcpwqwRb4B68sko+3TaqayjF2g6b/x+Sc0D3+95HxZW1HcB49XConoJrtqt2LcxRAOfp/h
	0LtbnivieYF9DmEKRJok0FSjtLT2z7ISfpbhccpiFK3qgP0a9i4kbiinKHkm3nYaA+orNE02iY3
	puwsy7hSKS4ZmlTSelAetPzyv9umzRnQHExU+hb36HHfeX3gqR1ibRIjUsuf0KenAZIYQukw==
X-Received: by 2002:a17:903:3d46:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a933cdd064mr26781485ad.1.1770226421229;
        Wed, 04 Feb 2026 09:33:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933884954sm26879545ad.28.2026.02.04.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:33:40 -0800 (PST)
Date: Wed, 4 Feb 2026 23:03:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>, 
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204030507.8203-1-linkmauve@linkmauve.fr>

On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> These changes aren’t the only ones required to get the kernel to compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
> 
Hey Link,
I sent a patch with ppc64le support. 
https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com/

Can i take this patch and put ppc64le support over it and send it out?

Regards,
Mukesh
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  Documentation/rust/arch-support.rst   |  1 +
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/Makefile                 |  2 ++
>  arch/powerpc/include/asm/jump_label.h | 16 ++++++++++------
>  rust/Makefile                         |  4 +++-
>  scripts/generate_rust_target.rs       | 10 ++++++++++
>  6 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6e6a515d0899..70b9e192a7a0 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> +``powerpc``    Maintained        32-bit Big Endian only.
>  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..17db23b82e91 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,6 +283,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..238f0f625a36 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,18 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
>  
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
>  
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83454..377e6fd68524 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 38b3416bb979..0054880ba0ea 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -188,6 +188,16 @@ fn main() {
>          panic!("arm uses the builtin rustc target");
>      } else if cfg.has("ARM64") {
>          panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("PPC32") {
> +        ts.push("arch", "powerpc");
> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
> +        ts.push("features", "+soft-float");
> +        ts.push("llvm-target", "powerpc-unknown-eabi");
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 32);
> +        } else {
> +            ts.push("target-pointer-width", "32");
> +        }
>      } else if cfg.has("RISCV") {
>          if cfg.has("64BIT") {
>              panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
> -- 
> 2.52.0
> 
