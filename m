Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBE2C11F1
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439950; cv=none; b=cbg6ZCF7h3ibylOWsSn7oXnkXJgZbftXuv+0RE/G4UKJzfjGL0sckwWuqEj5xzByFQZglAhgLRQ7eCh9+pZi9BDIPNtuw3aHJmtniiLGHHXTqOQe/g4h4Jhl4RgMwq1DFHGGn0i5KH80D5Kl15dY/GVSYr7ds+UnVjzCvuPipNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439950; c=relaxed/simple;
	bh=O7CMBLCs89G2UpnUOkHledwCOdF70JrpMXg5KrXvsYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTfnjiHtmRwOY39K+tZADb74EOeUeI1EWBqyByXKCDswA+g+r3RWSSdyWhVf725RzoknolIUMOiEPjuS64gDrArs2OFsLE42Fy9NkC2t+e+4+urhwFfp+Z7BwX5OAm8hqIocKWmdBRz8f6hgWyAW8hls8VUQBzlHlFhuhZqiOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1IleTLI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1IleTLI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso10757922a91.3
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 22:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777439948; x=1778044748; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wADOe/Ijbv0iSvyti5z+slPn7HaZRO67y/qPpz50QTE=;
        b=e1IleTLIk3yRublPgUpNtSqI7Iu5FVc39vHJ+MU+Lgzr01qASPhiRyPjesHKJyjt2r
         Y7es/eSk8XMnEGGWQCLN0B3zevGPIDryYotVne/oDpcRvQSyDthcRvjdcujNAPgiYJeI
         MwmBrIN24l9IgDGBmdZmeQOlagD7UxjwYg7iWbZQRa+NpOODWQuW6WBuah7TDf3u0HST
         z5ijC4OUvs8QhY/v7BD6c9u5gyHGpK/yscFrsT4+HrWNP8Ze2o7cjUTC2z46GrXxEEp0
         t24gni9zxDb3SkL1PLcFIZLXwSxpXuClId/L4B37ki/zrL65Q/DrQill1FEjnzjk2NIl
         k8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439948; x=1778044748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wADOe/Ijbv0iSvyti5z+slPn7HaZRO67y/qPpz50QTE=;
        b=QVD0FWfVMZ6bK8SdCK8SpGZFwHW1l2iGx9zvDDeJlufQSwLWnpR2X6KYn/l4C5fnz2
         vtY4G7oY11LeLAk1WbPkZt1J5sHyWMVz8bs3sGn7UWuKimvRiOpwSWNU+N3Y87+qkRm1
         2liW3G4rnDcnqHPhYlqcib8MFrDiZmZq7HpOZRzlo+PUFR3UOlIFweOB32RDbPF20JmK
         g4gau8U9FnrUeU6VsbT92lYqpQDOdV09uvACLT6wv3LBP5OB13t9M7I/aWYJKTsV5mDR
         mhwzkbsHP9DLXGIJXITjpiJ/i8YEf9Kqi/Bp3gCaVyYOd7D1rdynYTiarSjOQfhFt/UP
         cXIw==
X-Forwarded-Encrypted: i=1; AFNElJ8ahN5zWn2rQ5CB8CTFNbsFf0sISPYnSqm54U3jjrZkn8iwLxMQ+zZveiCXdm/nV6R1QuJX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2APIg9SDRcL0sgRFK3w8Sra9MxMfLhryXoe3iaCrB+0NNjAg5
	v3Pd6Ge2CJ239BIyb/zautBbceydG8yKoxxUR3w3PchPs8KbLN0fqoyN
X-Gm-Gg: AeBDiesTzGNnioust5GwKTMgrKnMyW0CnST5U/J0pBm6/yzkMBIKWSIaEpPVcQCCbDf
	tnvYTLoaj92/+jlfZ4CuXqLn1yh8d/iU7CpgBEjBzv5Cbqzrv9S/72KpkwrnE/oOIqWJNx5ftDa
	/T04LRE3pGoCKj/sB6X9gJhyzHfY/U4/rEEFEIAhHhgzIKn8Ia/MzWiPgsHhMkNA13tkvX2sBBk
	NzUkjIvConewftLydqUZky6ziytaetAbjGAEgtV8nAFbXXYhxCl0ReyDkFty8zXVKu1YUIsPzfY
	6cDLSHNvOt/83i7NDDGZbCuXrYbMAFo9wAsdR8eOHXTGyeVESAgzUovednoc7+IMqdgwcmSPJGT
	kbNzQPhtWKWAvOsYf/T++bbBdmb+1R2qGmg2lCofny+rqV8GsoeHHpmXr6AFuHEf8SafT/98ZAF
	WyLOI7s/tgB4ODyHph/i4xf9M7KDhyvMB8HlJKQ/mjx7Pw5Eu9+TtBY7DWMJibTo1+S3gLOO91H
	YPXDsRstMk=
X-Received: by 2002:a17:90b:4c4a:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3649201a3admr6483688a91.12.1777439947551;
        Tue, 28 Apr 2026 22:19:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([223.187.127.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a2a4b65dsm399601a91.14.2026.04.28.22.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:19:07 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:48:34 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, viresh.kumar@linaro.org, 
	prafulrai522@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de, tamird@kernel.org, 
	mark.rutland@arm.com, lyude@redhat.com, lina+kernel@asahilina.net, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V15 6/7] rust: Add PowerPC support
Message-ID: <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
 <20260426105932.2270364-7-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426105932.2270364-7-mkchauras@gmail.com>

On Sun, Apr 26, 2026 at 04:29:31PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> From: Link Mauve <linkmauve@linkmauve.fr>
> 
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
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Link: https://github.com/Rust-for-Linux/linux/issues/105
> Link: https://github.com/linuxppc/issues/issues/451
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Upstream Issue for powerpc target.
Link: https://github.com/rust-lang/compiler-team/issues/986

Regards,
Mukesh
> ---
>  arch/powerpc/Kconfig  | 1 +
>  arch/powerpc/Makefile | 2 ++
>  rust/Makefile         | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e93df95b79e7..4ac897b650d4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -285,6 +285,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..589613eaa5dc 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/rust/Makefile b/rust/Makefile
> index d70fb186cae9..54096ce8a675 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
>  	-fdiagnostics-show-context -fdiagnostics-show-context=% \
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
> -- 
> 2.53.0
> 
