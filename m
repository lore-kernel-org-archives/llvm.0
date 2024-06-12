Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DC839FD
	for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718227736; cv=none; b=KfVL+yY7+TIrt3ZFKQMtWiy3PgX+NfWf4XCEPTicNIOxUUMLVXP5kblePCdu29K9qRQUcSuM1fW6ZsWLWsuURyQG6sIYtcJiuM4DYHQ6Pidy5BQJBX7IssLgk5KlSV/10VMXHTSgoet6yFwv71ATpTb70il3SntWNKmOb/b4wO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718227736; c=relaxed/simple;
	bh=znNn8FFLkKjz4pF51useI6yJeK2t3fPxERcqxi3+5zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4Kb/Ijnjo7qaWe5ireNp93ooNStcQsgDOBro/OeEY+xu85/B+lQkO6Ax3DPh5NgYkp9mNJE12f4lQforFVpKWlV6pu448l1wz0eVrxqqCeIJ8Q7E0bRLFNh8M+ydI9vvr/VV9RCURjz5+G3gJcVyrR7tT/4ZrFAvIpQQy5s4Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmfykE56; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmfykE56"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f971cb3c9cso163306a34.1
        for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718227734; x=1718832534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/LiUVrOSh1qk2OL4B+ympIMZiV3sPMaaoOJZVMjpss=;
        b=FmfykE561d4T4AFD0hnX9pJXv4b3JnpNfuxOdJuqRTpt++7Dfdhx1HMZ8siLI0vQOn
         DaXTcMyW0fc7H5B/JapefQJ//TQl/GmR4n6e3zJ1aTBY+iL9fZ+cbSEnjtVBve/rnOK1
         bNsiTkMVnbE6cGOMubk62VEa95kN/LKHFD3hFi40eocxkr5IpIPknLrZiP3/imIG0dv1
         wknxudhuC68OZ2hPE2RAQ984f7jQm5DkusyE9lGsG6kKQwjmQNs3xnGpcvfe3ZNbdklA
         x42mAcLg32ZCG6aIqK3JB7DxS19tv/kGlV2MZIYAcd9ksQcIsGNLNhtVkDkktyK70NTU
         R71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718227734; x=1718832534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/LiUVrOSh1qk2OL4B+ympIMZiV3sPMaaoOJZVMjpss=;
        b=gGPV+5118QWKDEk/JD9w1QkLULJfSXZRhOGipwuOFwAyLDz3gDUm3OiNifFbrfNA2t
         8yT/lFlwO1489UIWXd1YwBwmBVxvFE5QcGV/5ny2tVgxl3hydVrWzhbxbFeqtvRbSqA8
         P+22YeqdlfcBo93VNIsvES2MEHJHqJCiuZpi1j9lGhT58ryYc9+6Nto4r4O+fTE2csjN
         yNxtwDBGMhPPocwk250WqB/X1ptN3Opdd52laayqEwTh/BEPcdeJxK0gs7NnnKS+zHFX
         ucRlCJ3N2Rhx/YpaVmz+kJJAsqJPnIFxucZSEb3iJGtk/4eGQQHiLvvVmtzFAIdzbToE
         joQA==
X-Forwarded-Encrypted: i=1; AJvYcCWMu1luKOEVMZm/iau+WodiDXsFySLsweRQCOcxdV27eRELZaYPLNuWrY3dISdj/lFEVOz2vFUmoPIrIWEEtTMszP8H9w==
X-Gm-Message-State: AOJu0YxUJhDeOM8P6SWsRhjLchvG2nTjKLUhc90oPQkClRfrYs0vf/w6
	3Um0R/8M51rty2DFTAfgk1Zec9Xbhm1ST5B1rsP10K06jpMxkjSI
X-Google-Smtp-Source: AGHT+IHgfy++8B1+QoKz5RUZk7S+hSnXgmAO0CmHWpGF56LEkgMgR0X3dl9BU04gXBdJPCiR2dF02A==
X-Received: by 2002:a05:6830:3446:b0:6f9:61a1:aa73 with SMTP id 46e09a7af769-6fa1bf59799mr2936246a34.9.1718227734100;
        Wed, 12 Jun 2024 14:28:54 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7955ff369dasm347650185a.34.2024.06.12.14.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:28:53 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 08C861200043;
	Wed, 12 Jun 2024 17:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 17:28:53 -0400
X-ME-Sender: <xms:FBNqZkhphvJzzZt-KjuHgCcQzPzeU8i1NuO0E6PAnxboHnzWnD5lNA>
    <xme:FBNqZtCfJ8yTUkAq1UGghkNzL57w7OrsP6t6g9uv0LszXA4O1spVSfQH4G5pJkosd
    jJrMbHiBYWoP-Gs8A>
X-ME-Received: <xmr:FBNqZsFDlDH7n8NFHaT89kLB-P7JWoaVNA3NwmLpJfDK5yk4KZS60CXDNrDvWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FBNqZlSrz2l5LFZhfM0_i1xFOxFXodwbOUfdd6JM_jDYpHX3ESAssw>
    <xmx:FBNqZhwvDaflNlsvQYNmOFXVoe_JqHeggj4wa2ocJRFnJxelY5RbMA>
    <xmx:FBNqZj7Tpi_6F4iUYyW7J9Hmzu3suAMS8_4egvWhFZGHy9kRGwIw3w>
    <xmx:FBNqZuw2lx9O1kin1_vKRQGhYHl5txGMtz7QWP8Vv5l6A0-M-jswWQ>
    <xmx:FRNqZlg3-6AqebltSlzGU8hMpKZK5Lx6MWcj4PQZyZxu17Y5bBoQjjet>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 17:28:52 -0400 (EDT)
Date: Wed, 12 Jun 2024 14:28:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
Message-ID: <ZmoS-cB20k1_u7Wv@boqun-archlinux>
References: <20240529202817.3641974-1-gary@garyguo.net>
 <20240529202817.3641974-3-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529202817.3641974-3-gary@garyguo.net>

On Wed, May 29, 2024 at 09:28:15PM +0100, Gary Guo wrote:
[...]
> +$(obj)/helpers.bc: $(obj)/helpers.c FORCE
> +	+$(call if_changed_dep,rust_helper)
> +
>  quiet_cmd_exports = EXPORTS $@
>        cmd_exports = \
>  	$(NM) -p --defined-only $< \
> @@ -396,11 +413,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
>  	OBJTREE=$(abspath $(objtree)) \
>  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>  		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
> -		--emit=dep-info=$(depfile) --emit=obj=$@ \
> +		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
>  		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
>  		--crate-type rlib -L$(objtree)/$(obj) \
>  		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>  		--sysroot=/dev/null \
> +	$(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \

I hit some errors when I tried to cross-compile arm64 on x86. Adding
$(CLANG_FLAGS) here resolves my issue, it's really because the target
selection for clang is done in $(CLANG_FLAGS) and carried into
$(KBUILD_CPPFLAGS), but seems you cannot use $(KBUILD_CPPFLAGS) here
because you only use clang as a linker. Without either, clang will just
use the target of host.

diff --git a/rust/Makefile b/rust/Makefile
index ad0797467102..84d698c09c65 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -419,7 +419,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
                --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
                --sysroot=/dev/null \
        $(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
-               $(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
+               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
        $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)

 rust-analyzer:

>  	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
>  
>  rust-analyzer:
> @@ -463,4 +482,11 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
>      $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>  	+$(call if_changed_dep,rustc_library)
>  
> +ifdef CONFIG_RUST_LTO_HELPERS
> +
> +$(obj)/kernel.o: private link_helper = 1
> +$(obj)/kernel.o: $(obj)/helpers.bc
> +
> +endif
> +
>  endif # CONFIG_RUST
[...]
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index efacca63c897..201e7dc5ae5d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -288,7 +288,10 @@ rust_common_cmd = \
>  # would not match each other.
>  
>  quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
> +      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_LTO_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
> +	$(if $(CONFIG_RUST_LTO_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@)
> +
>  

Ditto.

Regards,
Boqun

>  $(obj)/%.o: $(obj)/%.rs FORCE
>  	+$(call if_changed_dep,rustc_o_rs)
> -- 
> 2.42.0
> 
