Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7D378D94
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 06:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023184; cv=none; b=uYluKLLNUZoarH/fOBd3jBvnyTc/qgVWUNwxr9hLNp4EYw+cNdlb0DuEnvj77jNBOp31s2PrM0yWU4gQqgVKquiBmEX/EMTogBKVYOMg8tUJIEPLSDSdrGGRMpow/Oz7HUVJV6moPlv0lkI3jbSA/SBxGxX257Cv5ZnXJA6OaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023184; c=relaxed/simple;
	bh=OG8nqpVIiVaUDqsBzlwBd7F+WF7t4IRbr3zHcFb5WRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgaaNlYLKRg0IfogFcE7ntbjtj345NjYyDrUlslZOZxBptay62ymqenkTsU6A0aZ8dgC8lyXFctvvspvMIV4+CKBBARVyHqE6itSD4aq75M+diPZF1Myvw7S+avzeYniVcw9zhjupzvg+ilCio21iFxVjF/hjKd4/k1tyb+DhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1OCniq6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1OCniq6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso5218794a91.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 23:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789023178; x=1789627978; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNeh3lUekONIP+bceTcz/qzQUFIH9IGvapVm9Sqamho=;
        b=K1OCniq67Uax8U5wu7GVvRbf41hnvbsyeOguIapPO06/0Q8QgKEXbm7dhpd3DcaZGw
         cnZy3/b/rKNCU5dOiNHh9fLqUmvHDd4HyIkZ54lYETXUar3DWOL2c+ZrooQqHdMrcktm
         N5nXc3X1pJYTAX9RV1E2zQb6dhE6cZcgGxduB+zipZ3ofIZfrsRhNfy7NjQpN+XY3ZvA
         R2WhXOqeVHMQe7QR3P/auquiSoTj8LE6C44Kwl3xGi5IrgW5etdCtb4mxTWs2SkIu+gX
         UvqZxYT2FNQN3a8BLZ2DcmjsB6mtPfHRXRLmljBNm3YczQtDi1D716XfjZKDT9rxciFg
         wAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023178; x=1789627978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNeh3lUekONIP+bceTcz/qzQUFIH9IGvapVm9Sqamho=;
        b=TCBzQZYpq8bx09JFiKa8EJn2Fd778kChXQl94K2apMDs9bUIU9dooC3ugFhJh/ww6v
         Ao11J92pYEK776tdpwr3qLUPg9hGW8WKnHCLelf0jF6m3QR7Yo+pPElIzRfbiflWXpeb
         pHNJ7pvE6RaS7TCgcfXs331JfdBDQyGvshYD+xgMbIYKxHtpAAwZY+/cqqQAAom6lUQI
         uoxlKTPnj9Z3pnV8j5cXQXRsBKrxWiMUcSFP9cKnjFTqZyXmyXS7x4XCRww7N/gJDCWy
         Q5xicL7rxj65F6BaqhAAjrVaczBjvgWPYxwJZjVuFzg1I0zhWY1J/HDkSDPm5eDCVV+Q
         Jrlg==
X-Forwarded-Encrypted: i=1; AKwUvBwzix8Z1TK1ml/HZuqtt5dG/BSgqAYzTUaunToyVnE2bDcGMYAfrh1lsR22/Nzo/fQGdR+Q@lists.linux.dev
X-Gm-Message-State: AFuF++mQJnHE/SHhQlzIXq3GkmR5muja1XYT++WG1q2H6ncsxQQA0uc5
	D/h688Vo2+TQMdEdce5G9oYSkI/drlj8j+3Se0h5K/Do79evzoMI1oWA
X-Gm-Gg: AYBFou1hntADRhx5ufelQA3wJLNhQAZ2w1qB/mkVc6l4z4lUvSCaVD7GRj8AfDf4Kn3
	0pRSXjR+G9zMh11Hd6JIjbWPg4baJ1KuuIpuwO3Ruirh12GnC4t3l1glOxeI73n9cfJs5OJvGdS
	A0+0dx7Enn4MXgEascQ9eM7r0/BXJobo1ct1Lwkxis9d15xAxsZo29ZofUFxZku2/f7zhFaEmHA
	ZeqXWxutANC7XvDz1AnFE3RW098VNtG1FyaDRTjG2tJszehDMoauz+pTUb+IRMwmKTc3lwkaNfp
	lMvFFlAXlF4s02zuSsnF185L/u4jGtqgr+6YQDIPd8WSsppOy5MgSwSaKL1YYTEg1/Ybk13S+bJ
	2A4kX3bHTh5SM+1ebseQDpqja4KI+s6TqyxZ6VBiJ4eq/BXrrMJNAkyUKk6Wcrl9wCh9u/jPfG7
	GAW9XROoLPoWeoFkf38vy1U5fEqXKEiiCiBPiell41XT7gqjbGKqsc7k3cIg5TkJIJOvA1pmjAj
	c2OfFhCgrGErQVIFr4FnzNxC2E4gvhCAVGDd9oVVPU=
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr61606265a91.2.1789023178292;
        Wed, 09 Sep 2026 23:52:58 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77498csm2694423a91.3.2026.09.09.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:52:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:22:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
Message-ID: <aqJS61DbuUI3xoY3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>

On Tue, Sep 08, 2026 at 08:33:46AM +0200, Thomas Weiﬂschuh wrote:
> All vDSO code needs to be completely position independent. Symbol
> references are marked as hidden so the compiler emits PC-relative
> relocations. However there are cases where the compiler may still
> emit absolute relocations, as they are valid in regular PIC DSO code.
> These would be resolved by the linker and will break at runtime.
> This has been observed on arm64, see commit 0c314cda9325 ("arm64: vdso:
> Work around invalid absolute relocations from GCC")
> 
> Introduce a tool to check for absolute relocations during the build,
> as the current inline-shell logic is not expressive enough.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file, perform the validation in vdso_check.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile                    |  19 ++
>  lib/vdso/Kconfig            |   5 +
>  lib/vdso/Makefile           |   2 +
>  lib/vdso/Makefile.include   |  14 ++
>  lib/vdso/check/.gitignore   |   3 +
>  lib/vdso/check/Makefile     |  34 +++
>  lib/vdso/check/elf.rs       | 498 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/vdso/check/vdsocheck.rs | 154 ++++++++++++++
>  8 files changed, 729 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 4ad67b737af7..e6e0dd7818ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1559,6 +1559,25 @@ vdso_install: export INSTALL_FILES = $(vdso-install-y)
>  vdso_install:
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vdsoinst
>  
> +# ---------------------------------------------------------------------------
> +# vDSO check
> +
> +ifdef CONFIG_RUST_IS_AVAILABLE
> +ifdef CONFIG_VDSO_CHECK
> +
> +# Build the checker early.
> +prepare: vdsocheck
> +
> +# If the architecture builds the vDSO early, make sure to be earlier.
> +PHONY += vdso_prepare
> +vdso_prepare: vdsocheck
> +
> +PHONY += vdsocheck
> +vdsocheck:
> +	$(Q)$(MAKE) $(build)=lib/vdso/check $@
> +endif
> +endif
> +
>  # ---------------------------------------------------------------------------
>  # Tools
>  
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index 597f5f0f9681..112b42a5aeb1 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -23,3 +23,8 @@ config VDSO_GETRANDOM
>  	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> +
> +config VDSO_CHECK
> +	bool
> +	help
> +	  Selected for architectures that are supported by the 'vdsocheck' progam.
	s/progam/program

Regards,
Mukesh
