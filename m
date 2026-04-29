Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E62C11F1
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439869; cv=none; b=sRMMhIUBGzBFU3oEQyTnuIcBm3k63ly6wwTxP8U9nA/AxCSd6l88suYaYC3kmCNhIWES2cOLjnvq3t9t/7K+Tsn3uT+7EqbCNixvWqE3BIHoZesgYgv846w6nuPqJhF2Qub2b1IZ2CcPrPdwgodaSK4FviJptc/YiBxh6QVhMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439869; c=relaxed/simple;
	bh=FSDC1xpzUwbzrWJ3BDtRdZtaUHEOWL9baH4jyAZLIiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awPfluIIKXuC/BizC7xneJ1XBmCof0berqidDBnJi74js3MT9RewFjcdHC86MSlGtDb2WuZyhaBZ4Z8M9yJZkrnCZF+lhd9J5vTloKM+EQaaxeENz0YYcUZh9A+BG+2IKsRtXRFD96i2LlAAsd/o4zsdG0aHTtmClgNP14v8KMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg/AGt0Q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg/AGt0Q"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso7166447a91.0
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 22:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777439867; x=1778044667; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nFH9tpK7B+S7aXPOWaeNme/auM7m2Z9UCGcNKdzQWvs=;
        b=Bg/AGt0Qe+Gz8GHT2MHHFy0/Ycx2ireH1X9m5HM3BmN4SBeiSewS9xUU66k84osigv
         GaKuNc4Tt0H5Q715M9ROK6BjsCD0T69S/J+AyCABUiEEEmUFTVfFuRTAKUaGQBBSIBZ7
         ammZnEO8aKmRao2fyh5yeV01Sz8TxE3WmLNvjb+OOcN51BcMoQzulVbBFu6g2UlNc6Sq
         CHdaIxGn8/pjulfADR9qThxvjswOna0+sQWyVguOaRKNjA/BtIRiuAq0UBWnzjfO4d+e
         M3OqsXPe6rgxD2irDPoOui/EVyHAbS3JcAcs8JRKGwJgxsJYUcFakHwbZ5D9HtfLGrse
         ywxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439867; x=1778044667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFH9tpK7B+S7aXPOWaeNme/auM7m2Z9UCGcNKdzQWvs=;
        b=bPeBM6ayxjz7X7nVQpJIjb5dVqGSgRTy3xTc3mz87pR9g+yTEr51/Zx13sBcydt8F6
         72p3KbHaG8s9I+Dx/B5vSfEg9eCf5lVEtJG2ufFDm+Jc4AKh1iF15fgbjT4hb7bjl5K8
         VVwp9ocff3FRdzANAEFqK8wq9Y8IFF2q+LD/glbCtco8ORSfxuzXrzDxoU0AfVIP9teS
         k7bEHMSw2uygGZiZ9azC8ZXdwk7Flzca528tqein8Yqoh8rfBws5TFN9OgpdWkegUDQL
         7P4DyqBEvcOGpF5H3At8SinP8fnUZq1EZTtEtNMyNH86XaRI9FuRWtsNG7M/9FdeFAF0
         DcZw==
X-Forwarded-Encrypted: i=1; AFNElJ/zkMXDG3lJJSyNVFfv6Kr9DSKm0kFJMyBXmxIOjBblpHpelbr0daLvHzfjb5G/JZZI9+RJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwUyoJMFKReoRvNYe69T0xFcFXnJ43Bfswd4PGHQgAdII2mb/N4
	y8E38P7mBFjmy4aciXaciIehpHE0p7pRuRTJ6pK6Ox9cldNsCIFioCTH
X-Gm-Gg: AeBDiesVnG6mRbmMIG9WXPws8n/GovIqrERcJT8uARpTbUghvyyaj7uTeEJ7PqbEVqI
	q0Y/fO1b5DP7d52MJfpOE2+k7+Pagg9AhXbuoeby3LQ/grEn/evSbRVgEMov/6Pn2jhLmW9cL4R
	efv8AReS8W/6hex4Mv1i4mtkjE+Qn9MTjHpdI8SZIKum8zZZB8pbjyMKT5fcLwOoBUqOJJO+oEG
	w1nGrwS/9uNpFd9X84yvw/nWc81QupP+h9qSUwpn7Et72lN4kBZh5c5y0Oq4/+PsnN7r8edzM08
	Uy90FiT4Liive71g/aW3yIV0Z8iblnCHgcgofGHDTJz5D7h8VnFH6TwjTEgtozKjEPr/3+XFlsM
	8Qk3bLrghth9DF7m5d5yVzw4kmT0J02Z+GM8R43j2PPtjj7v6TcnPvxBUOXkt9zE0O5MsnvLDz7
	UdmHBnSSY7LA6tTtRsS64nZe1RZviRMyBE9TDuuKL3/zgw5i/lL/L9dd/H4hBDSBH6ZS5YsEBXs
	7nuPmMsa7I=
X-Received: by 2002:a17:90b:2fcf:b0:35f:9ab2:a5a6 with SMTP id 98e67ed59e1d1-36491fbf619mr6492591a91.2.1777439867022;
        Tue, 28 Apr 2026 22:17:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([223.187.127.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c604fsm1322332a91.12.2026.04.28.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:17:46 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:47:30 +0530
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
Cc: Link Mauve <linkmauve@linkmauve.fr>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V15 7/7] powerpc: Enable Rust for ppc64le
Message-ID: <afGT_RB1-PZVKzE3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
 <20260426105932.2270364-8-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426105932.2270364-8-mkchauras@gmail.com>

On Sun, Apr 26, 2026 at 04:29:32PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> Enabling rust support for ppc64le.
> 
> Tested on pseries Power11:
> ╰─❯ dmesg | grep rust
> [    0.225728] Initialise system trusted keyrings
> [    0.270961] rust_minimal: Rust minimal sample (init)
> [    0.270968] rust_minimal: Am I built-in? true
> [    0.270974] rust_minimal: test_parameter: 1
> [    0.270983] rust_misc_device: Initialising Rust Misc Device Sample
> [    0.271012] rust_print: Rust printing macros sample (init)
> [    0.271019] rust_print: Emergency message (level 0) without args
> [    0.271023] rust_print: Alert message (level 1) without args
> [    0.271026] rust_print: Critical message (level 2) without args
> [    0.271030] rust_print: Error message (level 3) without args
> [    0.271033] rust_print: Warning message (level 4) without args
> [    0.271037] rust_print: Notice message (level 5) without args
> [    0.271040] rust_print: Info message (level 6) without args
> [    0.271043] rust_print: A line that is continued without args
> [    0.271054] rust_print: Emergency message (level 0) with args
> [    0.271064] rust_print: Alert message (level 1) with args
> [    0.271072] rust_print: Critical message (level 2) with args
> [    0.271077] rust_print: Error message (level 3) with args
> [    0.271083] rust_print: Warning message (level 4) with args
> [    0.271091] rust_print: Notice message (level 5) with args
> [    0.271097] rust_print: Info message (level 6) with args
> [    0.271102] rust_print: A line that is continued with args
> [    0.271110] rust_print: 1
> [    0.271113] rust_print: "hello, world"
> [    0.271121] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
> [    0.271129] rust_print: Arc<dyn Display> says 42
> [    0.271130] rust_print: Arc<dyn Display> says hello, world
> [    0.271136] rust_print: "hello, world"
> [    0.271198] usbcore: registered new interface driver rust_driver_usb
> [    0.271207] rust_faux_driver: Initialising Rust Faux Device Sample
> [    0.271227] faux_driver rust-faux-sample-device: Hello from faux device!
> [    0.271297] rust_configfs: Rust configfs sample (init)
> 
> Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/105
> Link: https://github.com/linuxppc/issues/issues/451
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
Upstream issue for powerpc64 and powerpc64le target.
Link: https://github.com/rust-lang/compiler-team/issues/987
Link: https://github.com/rust-lang/compiler-team/issues/988

Regards,
Mukesh
>  arch/powerpc/Kconfig  | 1 +
>  arch/powerpc/Makefile | 7 ++++++-
>  rust/Makefile         | 6 ++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 4ac897b650d4..2e3065bce9cd 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -286,6 +286,7 @@ config PPC
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
>  	select HAVE_RUST			if PPC32
> +	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 589613eaa5dc..9385db478c59 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,7 +61,12 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> -KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
> +ifdef CONFIG_PPC64
> +KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
> +KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> +else
> +KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
> +endif
>  
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
> diff --git a/rust/Makefile b/rust/Makefile
> index 54096ce8a675..068b6fc3e0aa 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -408,7 +408,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +
> +ifdef CONFIG_PPC64
> +BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
> +else
>  BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
> +endif
> +
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> -- 
> 2.53.0
> 
