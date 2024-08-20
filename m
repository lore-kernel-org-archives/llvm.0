Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A591163A97
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183857; cv=none; b=UZM14c1+mbNALz6vWy5ofpIaNipju0TAWsRpzb3/yo5HDKHWfgXaLvNd3DO++s3BBfh02F2I9dZ9gA+2P9z9K1MuqPPXYme5JswcmeD5tdSxkzpvqoUl74Rz2LBYigCfdEVtYVcJvEVvHbia1RWCyx19ubY4qrbu8EEVReZVXiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183857; c=relaxed/simple;
	bh=Fjjw2CgEsurcrKo3JNn8c7eUsm3n3ohfbBDcr3XIKWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7uxiwPe49BH9opjtnJ8bea+u0kHOs50r+dNRRadaM90ve40U6+DYtEi4y+anVv9lJNtv/msFQohUAbQcH5n+zReIi21+L0AzXASMjyrR4wpWvnP2vY0xTWt+PhS/dxvZPLIkBfR/uUhSQT2Hw2eFzmIyBwtGM/IngwnYwdHALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFy1hyqp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFy1hyqp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so41734425e9.2
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724183854; x=1724788654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KPBbBX5wpC6PVE5IR8WFqGQpyvLg+k2OvzqLlHMens=;
        b=KFy1hyqphswlbH8l3RAWJp0xm1RycIi353Uqrs0LWsD1F+eaXdR0aUBRm4HqIrKMsL
         YEokqaEQEiodZB/LY2BSy6lczyc4bEWlNcoV6I3Q5p1BRSJiYNWo8260/kulPQQ6uIAL
         Rhqs9ZDzlDMOjNUaAMYbNNPB6zImCFY6ZAa5+bMCBDYdPYXNXogvt/xttS13M3BhUHVq
         nq0rso6Z24jOFdtQXT2CUCGnzdu8TKMH/DraU2+1UoYp1R4+z8OjPqBPbPuKU/AmBzdX
         LK/7CxoObX1skEmMU+NVBMbqQuJwNMSeWHSvpjZLDVdGcVIS9i9fykH2T/lJU5ebj9aP
         5syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183854; x=1724788654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KPBbBX5wpC6PVE5IR8WFqGQpyvLg+k2OvzqLlHMens=;
        b=sDf8LERaH8XRvo9WDQfRz60w4ZzzJuMTMti5T9MBc4BWBzR4ewmhaceF8yJa/dYRyJ
         smjJi/nWfkqHx45lJnBcgZRY2LPsti6HJUHZB3sxukQPdUcxGA7W29Uty+Y3BJ5R3jYA
         kWT0yVqYCLNXNGPxn180Wvd6h823FgUP1TilcZKuyjNc78cvF1jdi1rmmEi07mJuhWFn
         2n+NOuiW1OiZXmwNXN6vA7HqUbZ9ezAnubnZK+frPILt6WpTI/unuls6DCgHEJYaPMSa
         teX3V3l91TTsm4AooX3tnBKU/qk6HhGZmdgCBqaipCSTi+J+n/OrYsCsi3VmWT6xhZKq
         uSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnNt0bHO92xG2ZNXpm4GFPs2XLYZ/L4QpJ4xce7tjh9ZON0Pi2UF993O483Fbb7bsfsSWZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyHcLQywnlRmZPEbo124Clqts63deZBei4Khx6RnCWs64WEHooo
	Ff+Mpn6wXsdI/0PUAEbcarbChJmThgyRm8YV28Ofs4NVR6SKVeUzi1adeVPrNCbttfiOUSHCRE6
	lL/IghxOiL5qUdkdeGO6nFAbYgX0=
X-Google-Smtp-Source: AGHT+IEmI/5xREA0tOZZ0ojHWyI/EcTZ0nmrmzoxXvgsOqpOoMTrvfJTZWqSFTXL3ayPxhTH3zkbifWhhrYtUHcQ8Oo=
X-Received: by 2002:a5d:408f:0:b0:367:958e:9821 with SMTP id
 ffacd0b85a97d-372fd5b8d37mr64604f8f.29.1724183853281; Tue, 20 Aug 2024
 12:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <20240820194910.187826-4-mmaurer@google.com>
In-Reply-To: <20240820194910.187826-4-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 21:57:22 +0200
Message-ID: <CA+fCnZeQ1d3chWWCxYwPY=WPfPs12kXTBDgbfE9c1t=HADGYRw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: ojeda@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, 
	aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 9:49=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/Makefile.kasan          | 57 ++++++++++++++++++++++++---------
>  scripts/Makefile.lib            |  3 ++
>  scripts/generate_rust_target.rs |  1 +
>  3 files changed, 45 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index aab4154af00a..97570df40a98 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -12,6 +12,11 @@ endif
>  KASAN_SHADOW_OFFSET ?=3D $(CONFIG_KASAN_SHADOW_OFFSET)
>
>  cc-param =3D $(call cc-option, -mllvm -$(1), $(call cc-option, --param $=
(1)))
> +rustc-param =3D $(call rustc-option, -Cllvm-args=3D-$(1),)
> +
> +check-args =3D $(foreach arg,$(2),$(call $(1),$(arg)))
> +
> +kasan_params :=3D
>
>  ifdef CONFIG_KASAN_STACK
>         stack_enable :=3D 1
> @@ -41,39 +46,59 @@ CFLAGS_KASAN :=3D $(call cc-option, -fsanitize=3Dkern=
el-address \
>                 $(call cc-option, -fsanitize=3Dkernel-address \
>                 -mllvm -asan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)))
>
> -# Now, add other parameters enabled similarly in both GCC and Clang.
> -# As some of them are not supported by older compilers, use cc-param.
> -CFLAGS_KASAN +=3D $(call cc-param,asan-instrumentation-with-call-thresho=
ld=3D$(call_threshold)) \
> -               $(call cc-param,asan-stack=3D$(stack_enable)) \
> -               $(call cc-param,asan-instrument-allocas=3D1) \
> -               $(call cc-param,asan-globals=3D1)
> +# The minimum supported `rustc` version has a minimum supported LLVM
> +# version late enough that we can assume support for -asan-mapping-offse=
t.
> +RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-address \
> +                  -Zsanitizer-recover=3Dkernel-address \
> +                  -Cllvm-args=3D-asan-mapping-offset=3D$(KASAN_SHADOW_OF=
FSET)
> +
> +# Now, add other parameters enabled similarly in GCC, Clang, and rustc.
> +# As some of them are not supported by older compilers, these will be fi=
ltered
> +# through `cc-param` or `rust-param` as applicable.
> +kasan_params +=3D asan-instrumentation-with-call-threshold=3D$(call_thre=
shold) \
> +               asan-stack=3D$(stack_enable) \
> +               asan-instrument-allocas=3D1 \
> +               asan-globals=3D1
>
>  # Instrument memcpy/memset/memmove calls by using instrumented __asan_me=
m*()
>  # instead. With compilers that don't support this option, compiler-inser=
ted
>  # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures=
.
> -CFLAGS_KASAN +=3D $(call cc-param,asan-kernel-mem-intrinsic-prefix=3D1)
> +kasan_params +=3D asan-kernel-mem-intrinsic-prefix=3D1
>
>  endif # CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_SW_TAGS
>
> +CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
> +
> +# This sets flags that will enable KHWASAN once enabled in Rust. These w=
ill

Nit: the kernel doesn't use the term KHWASAN, it's SW_TAGS KASAN or
Software Tag-Based KASAN.


> +# not work today, and is guarded against in dependencies for CONFIG_RUST=
.
> +RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
> +                  -Zsanitizer-recover=3Dkernel-hwaddress
> +
>  ifdef CONFIG_KASAN_INLINE
> -       instrumentation_flags :=3D $(call cc-param,hwasan-mapping-offset=
=3D$(KASAN_SHADOW_OFFSET))
> +       kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
>  else
> -       instrumentation_flags :=3D $(call cc-param,hwasan-instrument-with=
-calls=3D1)
> +       kasan_params +=3D hwasan-instrument-with-calls=3D1
>  endif
>
> -CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress \
> -               $(call cc-param,hwasan-instrument-stack=3D$(stack_enable)=
) \
> -               $(call cc-param,hwasan-use-short-granules=3D0) \
> -               $(call cc-param,hwasan-inline-all-checks=3D0) \
> -               $(instrumentation_flags)
> +kasan_params +=3D hwasan-instrument-stack=3D$(stack_enable) \
> +               hwasan-use-short-granules=3D0 \
> +               hwasan-inline-all-checks=3D0
>
>  # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_=
mem*().
>  ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y=
)
> -       CFLAGS_KASAN +=3D $(call cc-param,hwasan-kernel-mem-intrinsic-pre=
fix=3D1)
> +       kasan_params +=3D hwasan-kernel-mem-intrinsic-prefix=3D1
>  endif
>
>  endif # CONFIG_KASAN_SW_TAGS
>
> -export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
> +# Add all as-supported KASAN LLVM parameters requested by the configurat=
ion.
> +CFLAGS_KASAN +=3D $(call check-args, cc-param, $(kasan_params))
> +
> +ifdef CONFIG_RUST
> +       # Avoid calling `rustc-param` unless Rust is enabled.
> +       RUSTFLAGS_KASAN +=3D $(call check-args, rustc-param, $(kasan_para=
ms))
> +endif # CONFIG_RUST
> +
> +export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE RUSTFLAGS_KASAN
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f06f6aaf7fc..4a58636705e0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -167,6 +167,9 @@ ifneq ($(CONFIG_KASAN_HW_TAGS),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>                 $(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-k=
ernel-object)), \
>                 $(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +               $(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-k=
ernel-object)), \
> +               $(RUSTFLAGS_KASAN))
>  endif
>  endif
>
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index ced405d35c5d..c24c2abd67db 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -192,6 +192,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> +        ts.push("supported-sanitizers", ["kernel-address"]);
>          ts.push("target-pointer-width", "64");
>      } else if cfg.has("LOONGARCH") {
>          panic!("loongarch uses the builtin rustc loongarch64-unknown-non=
e-softfloat target");
> --
> 2.46.0.184.g6999bdac58-goog
>
