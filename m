Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD11917F0
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724175056; cv=none; b=YjNpQ/nkkJe2cvrPj/kC3Fh7DPZLF7L5GjiL+TT0pY78tNu14o9GeyoKSGNc+O9UTwl6MDc12BE+yS913tSMjflqTrzvwdvZerqlpluV29pzHr5ITOP1Zo+ggvV0FI6yPLrMK/mXyn8ndySq6oZaXkt65818yrI/8SMoKjz/bSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724175056; c=relaxed/simple;
	bh=fFqJ9FHhdqc5EiDj+/EgS54hgZ2Qvxvrhj0vFRrhVl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skWT4zwdmpy8YAZ9RY6Kmr33xhxrJe/hk5QDzH2tWgB/RmDTj2xZPfuHSR1Fa/++58fx+GIKo0W0a5X0buMa4rvp1uofZMAn3C8QWNFa60ZVlxHIjxh/OgU1Z+YLNR4N4pfvh17h5NxIASJZvEr7Zlwgd7ogePjuqvYqQe4qDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/RBTJ6Y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/RBTJ6Y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso49155245e9.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724175053; x=1724779853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wISXuCBhmhFmaFFKaHK4h6CHKUfKYQSgO+IzNbasqs=;
        b=R/RBTJ6YWwCOAWpnFFkLyFkjFNLU5/XDfgfPNTOfA0D3bX75Ddr1N7vyyEumGRtmZo
         ClvKf9tzps3UYg9ufRz7QuO8okEZtNcH7xgnhEH082dcwzcDhw6MLEWJEHv1HJ/CbXG2
         28l4qQlRLJwCEfP846vBSXQzB0bUl2Y+uQxajQhECe8kW7fjYAesGjpthnFSFKuRYVzX
         PX9pSf8oVRjIs3sicAu3wtymGGzy/mK6qv14fU0/k76nAj2knpeDIVzItYaJBR9zZuyH
         1b84EaHQ4tzuVJIrQwxyUYbYZxh/I4+JoOCmyikYdcEzJhRDaVAoLFA8gfJudzV93EbA
         hvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724175053; x=1724779853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wISXuCBhmhFmaFFKaHK4h6CHKUfKYQSgO+IzNbasqs=;
        b=koddVEiBfSIhP/qOb0SSBONCuK8knEAmqLD7Fg7WPMUnxurx+3Hc+QNnHoiyI4Op9u
         QyyQx2jbgiNZKw7HfnFTfA4jXVloUFJjyxC99qwYSnO0cLlCLeSLG2z+3rKZRfV3w+mb
         xjqXZuwKL+8JUX3V/njae7Nz8g8ATHe4CkfYlb0SlML9QV5tSt16Xng/o7fctL3czQN4
         OpfW2LhtXTOXzSD0jDblzHnfnbu0Wm+zLJAtr0d3KfJGYbtPH4hsyuTlXLJKJMBoGyKi
         dBLxay0S81nku3Ol/Exttl01rVRwgncGhh519i2Mk7D8qL0ZEAdo99SuXPqEEIcfwMNS
         tpiA==
X-Forwarded-Encrypted: i=1; AJvYcCWsHoM/UYS/7SyVRa0a+J0rx99T5xkh7d42ROus2kylriXpy5JNCbID/LRw4zkIkLVMJfkXbVQy6+OwvgYvdB+YHdJxcA==
X-Gm-Message-State: AOJu0YzlzsfzWvh/KfK6VebP7MgSs9CYVlL7HNi1EHI6mnHGwP0oSani
	FlhDNJnzzaw6vAJknX9cPp+Gm+WE/HygrDeQ/nuyjhaDfJFT96vIKsOxCeF887HCqC7Sbgd79Br
	FwDAqfwwZalxKbP7GHMkpVorOa5Y=
X-Google-Smtp-Source: AGHT+IEAtX244iYeZYPk7sy9TeAceSFJTN5yXWToK5PNGBrEPxv2PkC7QDXiz5Fnm4hlwP9R1e29NsFLdm/qMR+Mbbs=
X-Received: by 2002:a5d:4386:0:b0:362:b906:99c4 with SMTP id
 ffacd0b85a97d-371c6060c90mr1694765f8f.58.1724175052539; Tue, 20 Aug 2024
 10:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-3-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-3-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 19:30:41 +0200
Message-ID: <CA+fCnZeA_GOdqidEhP81TvwiSSgJNEoXa85ooqVpfPOk3v4S0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	Nicolas Schier <nicolas@fjasle.eu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Rust hasn't yet enabled software-tagged KWHASAN (only regular HWASAN),
> so explicitly prevent Rust from being selected when it is enabled.

This is done in the next patch, not in this one.

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/Makefile.kasan          | 54 +++++++++++++++++++++++----------
>  scripts/Makefile.lib            |  3 ++
>  scripts/generate_rust_target.rs |  1 +
>  3 files changed, 42 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index aab4154af00a..163640fdefa0 100644
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
> @@ -41,39 +46,56 @@ CFLAGS_KASAN :=3D $(call cc-option, -fsanitize=3Dkern=
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
t

Nit: dot at the end.

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

Let's put these kasan_params parts after CFLAGS_KASAN.

> +
> +CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
> +RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
> +                  -Zsanitizer-recover=3Dkernel-hwaddress

What's the intention of defining RUSTFLAGS_KASAN for SW_TAGS if it's
not supported by Rust? Should this be removed?

If this is just a foundation for potential future support of
Rust+SW_TAGS, please add a comment explaining this. And also please
put the patch that disallows Rust+SW_TAGS before this one, if you keep
RUSTFLAGS_KASAN.

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
ion

Nit: dot at the end.


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
