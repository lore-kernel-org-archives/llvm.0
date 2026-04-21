Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834AF3AE6F7
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765334; cv=none; b=Ug58W/tPZNVxQY1uPeDwb+28mUefvI8V+1gSDlUrLdLi9QkTa7esO7t2EwAl3QuKDoJ4RsVTcNcYBpHJpejV9ra3QGIio/T5jB449+dmDxPL6r0E+aEza3RmbF0TDGmgHd2cFly7TyIPfbbYmSDYJDDCwGZ7hIuXvtJQuRl66gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765334; c=relaxed/simple;
	bh=ZKghPed/ju+IgFPje1TEIcg9zBtySgV/NUxS1EBIrhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDisWtI1k7ZaIRmvhtiRiPxAev0waO7FIZY99s/O017cvFjovCiIJ3j4yZqIx3UMytHuHcXayS20aSNpuiZy5x1aypTE53ccvr3S5OfRcsBuMV0LU6I3IS+NZkI0kZnWTzFWCDWUWgnMMAZILELanlVuWdSjAxu9eJh3J+80Oyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egqueBNm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egqueBNm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824c9da9928so1946886b3a.3
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776765333; x=1777370133; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91kn5n9C2wXrcDyzWkVlinW43jw3yYJYj+1FYPmqgkc=;
        b=egqueBNmmq1w0HX5yfzsBmoerNxxZ92ntyqr918Y3SphsO2qLUB7OkhYVkwna4HkQ1
         iAHI4RVNZvc3DHkTwi51kyXQck90y1E/gHe8UjOBLf5WJtGbcjWEttX72noyaZ1DCLqb
         gue7dZNhWlSvBr+tJN0OK2tQnSDYbxkusHiVPD3+sa73hnGHdGpU4OpxwnDnxPO6qPXR
         WQkoTP9jbT9ot2rtzt5/vUoe5ZbBxrV/rkuTmk0pQv3k4EIgetw1RIhVcgA/HDprA6j9
         rg2NUIhRfpKhzVrenHGc8MSxF509zl/ieupS2ns1U9MmziV2JecOmJhOxYNZXSsy6ooh
         P8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765333; x=1777370133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91kn5n9C2wXrcDyzWkVlinW43jw3yYJYj+1FYPmqgkc=;
        b=lvCzTLbeX6pgU1QMeYCwFvS7lZUFhSESOO27ByK3yOZtM8OBTDxHQRB/zemKNOU2KI
         xvmTk1uTqtq7/siPq7YJr1P+r0mtqFWVvVwsJffb1r5C1h501OnD7bs+od6q2NfFlEfa
         y2/4u2zdGGqr9myJFyq9vhnobSKL3vnbgpcEYKT0QOXfA934vyPfPWJbANgsFZNP5MVM
         p3TgI3DKmdQHU8J0LC1kuxHN1c8nIyAiV/3c6GA+Gx4C1WaqiWCzWCOpjP1Am4fOiBi7
         ZUuTdLzAAkeQ/rKcEfw3TuOiCuMfZw+yrvhKS6HGWapiY1aBtdEHE8wbAgjEnN+ErLw1
         LpWw==
X-Forwarded-Encrypted: i=1; AFNElJ92HOVCwZyk/p+TXsEbfR/HBz8wRYsG+OolbpowIScstJzILwxOmWzNxImtuLXfEbJUwTMb@lists.linux.dev
X-Gm-Message-State: AOJu0YzUyVsG7vZx1tXxb/NYm6GxRyvuQfTJvLAfX/JQ5LBj3PyKiDIo
	gQuub36WaOYlC/qt40NVQmfM8X9pF3PdtXZ5GmcRrB4Vp5m+jkLRNCsI
X-Gm-Gg: AeBDietdr0DbbRpBgEfNTpdz0lTpyLLDRkm9FqnZ/GJejwqTS4lgBLX49TK1ddyREBA
	5Q9mpQeQSPS8Y0s5nRbxk91prhO/8iMBgNyH7RLr9eEanp05irTX5V6njaK/S6F5+ADQ74Ttla6
	a2rO1h+/baY3MqAqG+QGB8GIAfEOWgdHMQd8Z0eZCQ1J0TsuPJ6/m7JvvZY1g+CNiKJbH4HNioH
	FhsmpZj2KVOPFZQZSRh3AFxYYk7hB/PDGYVaXxaL0uNhn9ZBDZ3hDAAdzluHkYtD9r0SUBuwpty
	QnEMWhjSKAkAaLJuVC0Ppf4ixlcCLakzNofeUn7mL7FeqPXgmKnoVqrNISJyQEI0yAfRFTdzFxi
	ONxGZL8R6EJ6yNjIVzLiPYEl/lz5c9wpwSFvIdr/il59GjPSciunBzMFL6W/IpfPaWcuQXI3nBU
	3eiQeUBrwPIjQFt2udj3YEPxj1IRVFM/GrQhZKohwxVW7qhrRs97lRDH1e6aXaTILKCDwDWY7RU
	KdJgbamlK/+II29
X-Received: by 2002:a05:6a00:2288:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82f8c3f2b00mr17779962b3a.0.1776765332666;
        Tue, 21 Apr 2026 02:55:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea09914sm13092315b3a.26.2026.04.21.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:55:32 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:25:22 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedFgEicDW6LAcuq@luna>

On Tue, Apr 21, 2026 at 11:38:08AM +0200, Link Mauve wrote:
> Hi Mukesh,
> 
> This patch doesn’t apply on top of mainline, which tree did you base it
> off?
> 
It was on mainline v7.0 tag.
On latest there is a confilict. I'll send out a rebased version.

> On Fri, Apr 17, 2026 at 08:52:50PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building Rust code for powerpc64le with LLVM=1 and -j1, rustc
> > encounters an error: "multiple candidates for `rmeta` dependency `core`
> > found", with two candidates:
> > 1. The host's standard library from the rustup toolchain
> > 2. The kernel's custom libcore.rmeta in the rust/ directory
> > 
> > This occurs because the build system uses `-L$(objtree)/rust` for host
> > library builds (proc_macro2, quote, syn), which causes rustc to search
> > the rust/ directory. During this search, rustc finds both the kernel's
> > custom libcore.rmeta and gains access to the host's standard library,
> > creating a conflict.
> > 
> > The solution is to separate host libraries into a dedicated rust/host/
> > subdirectory and use `-L$(objtree)/rust/host` for host builds instead
> > of `-L$(objtree)/rust`. This ensures that:
> > 
> > 1. Host library builds (proc_macro2, quote, syn) only search rust/host/
> >    and never encounter the kernel's libcore.rmeta
> > 2. Proc macro builds use `-L$(objtree)/rust/host` to find their
> >    dependencies
> > 
> > Special handling is added for rustdoc-pin_init, which is a host build
> > (to access the alloc crate) but depends on proc macros from the main
> > rust/ directory. It uses explicit `--extern` paths to reference the
> > proc macros without adding `-L$(objtree)/rust`, which would reintroduce
> > the conflict.
> > 
> > The rust/host/ directory is added to clean-files to ensure it's removed
> > during `make clean`.
> > 
> > Link: https://github.com/Rust-for-Linux/linux/issues/105
> > Link: https://github.com/linuxppc/issues/issues/451
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile | 38 +++++++++++++++++++++-----------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> > 
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 9801af2e1e02..e234b8a39358 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -3,6 +3,9 @@
> >  # Where to place rustdoc generated documentation
> >  rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
> >  
> > +# Clean generated host directory
> > +clean-files := host/
> > +
> >  obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
> >  always-$(CONFIG_RUST) += exports_core_generated.h
> >  
> > @@ -27,7 +30,7 @@ endif
> >  
> >  obj-$(CONFIG_RUST) += exports.o
> >  
> > -always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
> > +always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
> >  
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
> > @@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
> >  	OBJTREE=$(abspath $(objtree)) \
> >  	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
> >  			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
> 
> The issue is here ↑, --remap-path-prefix=% got removed and the two
> previous lines got merged into one.
> 
Yeah will fix this.
> > -		$(rustc_target_flags) -L$(objtree)/$(obj) \
> > +		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
> >  		-Zunstable-options --generate-link-to-definition \
> >  		--output $(rustdoc_output) \
> >  		--crate-name $(subst rustdoc-,,$@) \
> […]
> 
> Thanks anyway for iterating on this series!  I’ve started writing a DRM
> driver based off a previous version. :)
> 
That's cool. Thanks.

Regards,
Mukesh
> -- 
> Link Mauve
> 
