Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77062BE7D1
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273968; cv=none; b=sv06h4ig1yl4hOwuY6E0rI0hIcgXNTUJ0BdIdSV77RGWid3tAb2wkT0UVzlhmJ4ZgJG/8Q+Evn2/T9UA1Wiqv1mtLCTA819hg6ksbAZsMLi2D7+gcz0g1mGfg5IL7Xgs/2NQsdor7DavpRQ3B4/58yLDsFSe+Q7K4aI/OorrPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273968; c=relaxed/simple;
	bh=X10KzPTd/dJ+QIu7Mozup+5OSV//lITEP1bCk4B6bNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6N3ezMmDiwG6hgX2bnTlNMPdOTQpKAFqaq+fQ0wA1vcyb+G5/RiOrYBB0w9hG6JIYTP5QxejMlzgtJ3l+xKlynK4rfavPbwcFgx69W3f5+VgMDNtZm9abQpSO4lICpdfWhC/l1aZUzu66/0CFmVashgdObzJy7NL4ID9nLokVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK4vGZaw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK4vGZaw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab39b111b9so10260865ad.1
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775273965; x=1775878765; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/mS68jPp5o6fDVjVxwaQqVlnV+4rvaGWH9gRtfYcJE=;
        b=cK4vGZawd1WHE0jAh5ueESsGzYHdj4ZC18ZHzArm3kYi17StZmrM1w6Eh9lLwR3G3U
         ZNfMTZicxwKH4Sfa11SSOrO+c6OsxQYrmHGBLlpuK0MIiCG/qihsiS26bbTAA+C5KFaZ
         LcT8JzHO7TbadcdsLNURjtEV0Q/8oy9Dmc96pQyQA0r2VoPau1ZSkzggKnijy8bNMIQT
         Fq4HogrCjwk6BJAJLNw8SfW8ePmjcWug6+mj5ESvtl0f5PRxf+5y4nsRCh4pEscg5JGr
         fmTmPGn7xRCLh+056rc1skrqAGUawVtyyFoAYJ506SlR4i0CkN5kN/AyDC1/dGe5fFJy
         CrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273965; x=1775878765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/mS68jPp5o6fDVjVxwaQqVlnV+4rvaGWH9gRtfYcJE=;
        b=ga3WA9m8gSFFqFAVpEM/LdDaz+GMMqAGK9i3LkpC9Bz1ZHr6saKsQDdxxATKPtOPi7
         e8lpZUa2PWqKN/1HLlOB1Cd97cjDFEL6WkLaxjTeeky//gZodBtFW7dU8uuCqjhzDGg4
         S4SY1D1kCVMRxzCzzWyvheDa336fA0T2aJFgayerfO7BckWT0sxwU2oiMfCdy2zs0af3
         xRVTGd9If/ZDs/sOk32izhrrGeZhLsDEY3mhW70l63XLBwatnlYV1Uipiyj42nT1rfGr
         zS08heUbEVur97YBWX0sZqteRVbi30ylfwK/C2a7YUPzWs6C1b9LwRd+7mHaDIDH706G
         Attw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5YvJbMRKNfnaeSL8blS6gDQjLf/XiqFOUFmZSaerqSkTLLQzNlrg6pTM16Hg4vNCU7Sw@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb9c+aZq9Xn6tcJ1a8MXMCPyhdx0by66hevd9+Xox6PsMkAauN
	P2FvbdWYA2FInfdAW+tCVQTGYMhB26ONaMHO4CRxJAdTfkvEMw9zyBO4
X-Gm-Gg: AeBDieuEgtpTgnBFDg3uKi1JJAG8A2Aem1m1E9ExkiLmvnzR4kG6cOQeltt8qRcZ+bF
	5+dPOPdt8ypmjuc6q4Zh4/a5uTpfWA3p20Gb+T64lt/xdnZlNNQwvvUHrU04W5S9/XdH353HVXT
	wVQ6WntIQ4LpCFi2EDeWkZmt3s3KWdU5JnUK73li+UPzzlbKi3V7FbAxtm3iuLpmx/OrEQRxyHG
	+7pPjiyGJlsYpTpBrYKZVtaOF8wpAyoH0XsD+S1XvT7JE0MLBSX9FSYfsTOHQhxlne120eIUB5Q
	e69My1T8Yd/gING3I2qw6ragghfWGo/70dlLVjGlyK98oeocJLuxFL25rekYxbCSbqrns1EkPWa
	d23C9X4sYUOt75KtRd/+WXh4b1m0FxZgdGOHWnysnQ2BYtFb932RsQIGeePDUCBKdQQX442LZfc
	j1NoYxwpBsv9LLz5sj1kIc/0V5sGZKlAKZsvq7FC574ozGcC7ZTntpre5a/mvwbmTr6d5NhA==
X-Received: by 2002:a17:902:f603:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b281769197mr58132275ad.32.1775273965093;
        Fri, 03 Apr 2026 20:39:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm96269225ad.28.2026.04.03.20.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 20:39:24 -0700 (PDT)
Date: Sat, 4 Apr 2026 09:09:13 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V8 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <adCHe9rU_azp8svx@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
 <20260403145308.1042622-2-mkchauras@gmail.com>
 <DHJM52JEY7D3.MGKXTZB319ZL@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHJM52JEY7D3.MGKXTZB319ZL@garyguo.net>

On Fri, Apr 03, 2026 at 04:09:04PM +0100, Gary Guo wrote:
> On Fri Apr 3, 2026 at 3:53 PM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building Rust code with LLVM=1 with -j1, rustc was encountering
> > an error:
> > "multiple candidates for `rmeta` dependency `core` found", with two
> > candidates:
> > 1. The host's standard library from the rustup toolchain
> > 2. The kernel's custom libcore.rmeta in the rust/ directory
> >
> > This occurred because the build system was using `-L$(objtree)/rust`
> > for host library builds (proc_macro2, quote, syn), which caused rustc
> > to search the rust/ directory. During this search, rustc would find
> > both the kernel's custom libcore.rmeta and gain access to the host's
> > standard library, creating a conflict.
> >
> > The solution is to separate host libraries into a dedicated rust/host/
> > subdirectory and use `-L$(objtree)/rust/host` for host builds instead
> > of `-L$(objtree)/rust`. This ensures that:
> >
> > 1. Host library builds (proc_macro2, quote, syn) only search rust/host/
> >    and never encounter the kernel's libcore.rmeta
> > 2. Proc macro builds use `-L$(objtree)/rust/host` to find their
> >    dependencies
> > 3. Test builds use `-L$(objtree)/rust/test` for their dependencies
> > 4. Target builds continue to use `-L$(objtree)/rust` as before
> >
> > Special handling is added for rustdoc-pin_init, which is a host build
> > (to access the alloc crate) but depends on proc macros from the main
> > rust/ directory. It uses explicit `--extern` paths with absolute paths
> > to reference the proc macros without adding `-L$(objtree)/rust`, which
> > would reintroduce the conflict.
> >
> > The rust/host/ directory is added to clean-files to ensure it's removed
> > during `make clean`.
> >
> > Changes:
> > - Add clean-files := host/ to clean the generated directory
> > - Change host library targets from lib*.rlib to host/lib*.rlib
> > - Update cmd_rustc_procmacrolibrary to create host/ directory
> > - Update cmd_rustc_procmacro to use -L$(objtree)/rust/host
> > - Update cmd_rustdoc to use -L$(objtree)/rust/host for host builds
> > - Update cmd_rustc_test_library to use -L$(objtree)/rust/test
> > - Update rustdoc-pin_init to use explicit --extern paths for proc macros
> 
> This should go after the tags and ---, so it's not part of the commit message.
> 
Hey Gary,

I was intending that to be a part of commit message. May be specifying
that as changes is confusing. I'll put it there as a summary.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/105
> > Link: https://github.com/linuxppc/issues/issues/451
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile | 63 ++++++++++++++++++++++++++++++++-------------------
> >  1 file changed, 40 insertions(+), 23 deletions(-)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 9801af2e1e02..762bddc868e4 100644
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
> > -		$(rustc_target_flags) -L$(objtree)/$(obj) \
> > +		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
> >  		-Zunstable-options --generate-link-to-definition \
> >  		--output $(rustdoc_output) \
> >  		--crate-name $(subst rustdoc-,,$@) \
> > @@ -193,13 +196,16 @@ rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
> >  	+$(call if_changed,rustdoc)
> >  
> >  rustdoc-quote: private rustdoc_host = yes
> > -rustdoc-quote: private rustc_target_flags = $(quote-flags)
> > +rustdoc-quote: private rustc_target_flags = $(quote-flags) \
> > +    --extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib)
> 
> Why not just add `-L$(objtree)/$(obj)/host`? If we go with the host directory
> approach we shouldn't need to explicitly specify the path?
> 
> Best,
> Gary
> 
Yeah makes sense. Will send out new revision.

Regards,
Mukesh
> >  rustdoc-quote: private skip_flags = $(quote-skip_flags)
> >  rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
> >  	+$(call if_changed,rustdoc)
> >  
> >  rustdoc-syn: private rustdoc_host = yes
> > -rustdoc-syn: private rustc_target_flags = $(syn-flags)
> > +rustdoc-syn: private rustc_target_flags = $(syn-flags) \
> > +    --extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib) \
> > +    --extern quote=$(abspath $(objtree)/$(obj)/host/libquote.rlib)
> >  rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
> >  	+$(call if_changed,rustdoc)
> >  
> > @@ -236,7 +242,10 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> >  	+$(call if_changed,rustdoc)
> >  
> >  rustdoc-pin_init: private rustdoc_host = yes
> > -rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
> > +rustdoc-pin_init: private rustc_target_flags = \
> > +    --extern pin_init_internal=$(abspath $(objtree)/$(obj)/$(libpin_init_internal_name)) \
> > +    --extern macros=$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
> > +    $(call cfgs-to-flags,$(pin_init-cfgs)) \
> >      --extern alloc --cfg feature=\"alloc\"
> >  rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
> >      rustdoc-macros FORCE
> > @@ -369,7 +378,9 @@ rusttest: rusttest-macros
> >  
> >  rusttest-macros: private rustc_target_flags = --extern proc_macro \
> >      --extern macros --extern kernel --extern pin_init \
> > -    --extern proc_macro2 --extern quote --extern syn
> > +    --extern proc_macro2=$(abspath $(objtree)/$(obj)/test/libproc_macro2.rlib) \
> > +    --extern quote=$(abspath $(objtree)/$(obj)/test/libquote.rlib) \
> > +    --extern syn=$(abspath $(objtree)/$(obj)/test/libsyn.rlib)
> >  rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
> >  rusttest-macros: $(src)/macros/lib.rs \
> >      rusttestlib-macros rusttestlib-kernel rusttestlib-pin_init FORCE
> > @@ -525,48 +536,54 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
> >  
> >  quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
> >        cmd_rustc_procmacrolibrary = \
> > +	mkdir -p $(dir $@); \
> >  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
> >  		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
> >  		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
> > -		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
> >  		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<
> >  
> > -$(obj)/libproc_macro2.rlib: private skip_clippy = 1
> > -$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
> > -$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
> > +$(obj)/host/libproc_macro2.rlib: private skip_clippy = 1
> > +$(obj)/host/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
> > +$(obj)/host/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
> >  	+$(call if_changed_dep,rustc_procmacrolibrary)
> >  
> > -$(obj)/libquote.rlib: private skip_clippy = 1
> > -$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
> > -$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
> > -$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
> > +$(obj)/host/libquote.rlib: private skip_clippy = 1
> > +$(obj)/host/libquote.rlib: private skip_flags = $(quote-skip_flags)
> > +$(obj)/host/libquote.rlib: private rustc_target_flags = $(quote-flags) \
> > +	--extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib)
> > +$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
> >  	+$(call if_changed_dep,rustc_procmacrolibrary)
> >  
> > -$(obj)/libsyn.rlib: private skip_clippy = 1
> > -$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
> > -$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
> > +$(obj)/host/libsyn.rlib: private skip_clippy = 1
> > +$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags) \
> > +	--extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib) \
> > +	--extern quote=$(abspath $(objtree)/$(obj)/host/libquote.rlib)
> > +$(obj)/host/libsyn.rlib: $(src)/syn/lib.rs $(obj)/host/libquote.rlib FORCE
> >  	+$(call if_changed_dep,rustc_procmacrolibrary)
> >  
> >  quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
> >        cmd_rustc_procmacro = \
> > -	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> > +	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> >  		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
> >  		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
> >  		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
> > -		--crate-type proc-macro -L$(objtree)/$(obj) \
> > +		--crate-type proc-macro \
> > +		-L$(objtree)/$(obj)/host \
> >  		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
> > -		@$(objtree)/include/generated/rustc_cfg $<
> > +		@$(objtree)/include/generated/rustc_cfg \
> > +		$(rustc_target_flags) \
> > +		$<
> >  
> >  # Procedural macros can only be used with the `rustc` that compiled it.
> >  $(obj)/$(libmacros_name): private rustc_target_flags = \
> >      --extern proc_macro2 --extern quote --extern syn
> > -$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
> > -    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
> > +$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/host/libproc_macro2.rlib \
> > +    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
> >  	+$(call if_changed_dep,rustc_procmacro)
> >  
> >  $(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
> >  $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
> > -    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
> > +    $(obj)/host/libproc_macro2.rlib $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
> >  	+$(call if_changed_dep,rustc_procmacro)
> >  
> >  # `rustc` requires `-Zunstable-options` to use custom target specifications
> 
