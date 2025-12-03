Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA41B425C
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764722458; cv=none; b=AifHAQIxBBi5L+uc9leC/RCCDXtS60nv/K59fLn2V/Sz/pdJGN/cYk0aAwGJ646CbhyesB1qjZoDF2x5XAMi6sXRmF5521FW1prvawonReHdnrTgE0q0sck4eJbM2r8oxoVavAeU1ONQFNCWC0FPvLlRDDtM6oPicE8wNupZ5eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764722458; c=relaxed/simple;
	bh=4xuGbXmfnTCUVhOk6EdhyGfR4JrGxiM26jMTw4JpWf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr7VYRNH089A0Byi4sFfMggA8XQSIS0KgtqPgM9k6h+oDw8fjAFD273AATWPPINbHv6xvlAmssoIln6ezaOPv0JhO48yMBpMNE4xzzmk0876KOlnxcpPb7g4cL3+SIwFwadgiFY3wIzKTKlHt1v2c8sAq8/IO7yVpWq49Vz6PBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IiDl8c4L; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IiDl8c4L"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso4749a12.0
        for <llvm@lists.linux.dev>; Tue, 02 Dec 2025 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764722454; x=1765327254; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
        b=IiDl8c4LuiKY5F9+AP/o/DF6BC6DcOKTcxSLBtlehg22uFSEGHWqbM6JAR/Av4s+f4
         KxFP5YHqQTfVpF9CGgCfRPqIT+DxriAq/PUGF7rtMkhQKC+QHf0fYPm4HRmmTxLOg4Fp
         eGTK9BIn/xwFRowfMukExjXQPGZBo47a/Q+OcP1CLT5/VeaNFiK5hsH2F8ku5IdhdR4p
         ugEUX0wxsrbREnOD6S5Hoj5JoLd7zyUEZiQIIDqKCMbAo1aCncyc9e0V33SIH8rRveYi
         KWbgcglWNeMPwBDfHAzNUmDQfo11gKdoxHFZQ1G4t/80tLZfg4s1fwvHHzW1pxZ/BaA2
         jqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764722454; x=1765327254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
        b=U1HjUBNzb2ISZgT8KH/K56imwP4D8JfU4kNm5hsgx/HkAl4gU7ro7rJcl8SYI5GQzy
         aQuFIbJPLH/zA/XjxTrlFxFawepb+sW/2LbkKuCloEWBkm4XCaQAcdzaOLxLGv990iJr
         j7w/ZCyZMnyKScGF7qqWNIPkxEmyj4Z9jErcgJ4dFBWVOOmN8HHTR58so5AD1AzkpkM7
         NdOzQzKGEAS6zegouWZQL52hVJG1YiMViEkhtC9huDsTzU6AiJZ15VGDNWYaZjH0CmU4
         dWbxZhLt0qA/0Eql9H/hoUNBjmbvz1VPLkqpNzI4FV79oqZKdk2SxiktShe/eDgQDrBQ
         dG2A==
X-Forwarded-Encrypted: i=1; AJvYcCWJYjezLSeG5yIKtvRCVh5aKQC4kIasuQjz+c1aWaMsL863I049l9NqefJUyIuqCjz3N8DO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+g9yIGYISDXpIGVLDPXa/KImY/PR0HWAwFNnHH/hHgsVg+dkE
	sIJpCIxT0gnuxnnwsn6R7xassqdg+7YxNmed/mio3/vuiFRBUKzBJPwRq3ywEZwryeeJ3TQVKHC
	F9/Vt2Lx0fvuBS19Rxl2d1FbA5DZRxEHxSUJLXsha
X-Gm-Gg: ASbGncuHSpQ/cp0HXQkEJU/iydT3q/PtAJBi4rVSe+u9Od93C8Zu2oikDVNhpfpn11Y
	HQz6GuaKpSlbPYIUE2Wm2BAQjvb7lo91ObLCGB/9UrPdVAznXeAxYTOyP9ev8VGMiqzwz6HGb3B
	l7jKdmHwOheQB+6jabZvu07dDxiE1TzMlgOkf0BgH5xqBchUQOM42dIF1oZds7F6cVUaLERqsAs
	SbKbppRKkBgUorC1uxIPrg/j2E6guKCa2EACLliHSNAntq93b6kE4LTlnQ9M0jSAhrLA59c91Tl
	NzJgz0Pwz1Zqa/B4qxBpLvFMf+5YheJ/w4iyvXs=
X-Google-Smtp-Source: AGHT+IGUpO0L+WhI58F9++W1H/peDm2X2DnX35lpzSJlaDsXJA8kDOMd11eAqj6cUIz2+cVg+h2Z9la6R9E/O0WsxH0=
X-Received: by 2002:a05:6402:2183:10b0:640:914c:ab91 with SMTP id
 4fb4d7f45d1cf-6479b43672fmr9260a12.3.1764722454227; Tue, 02 Dec 2025 16:40:54
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com> <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 2 Dec 2025 16:40:41 -0800
X-Gm-Features: AWmQ_blBVdIJYux_tf6OFeNJfOnc6oPyFKVIBlfORGWG1BYJoNUf8x7Y_xiutHA
Message-ID: <CAGSQo01=7YDfYzbjipNtsK8AzXciSpY+v53kAhh+oZ_QisAh4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 12:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Gary Guo <gary@garyguo.net>
>
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.

I've filed a PR with LLVM [1] to clarify that this is the intended
operation of the tool.

[1]: https://github.com/llvm/llvm-project/pull/170397

>
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.
>
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we suppress the warning.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 15 +++++++++++++++
>  rust/Makefile          | 26 ++++++++++++++++++++++----
>  rust/exports.c         |  5 ++++-
>  scripts/Makefile.build |  5 ++++-
>  5 files changed, 48 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328d=
ccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS                =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP :=3D 1
>  export CLIPPY_CONF_DIR :=3D $(srctree)
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COM=
PILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX=
 YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd=
12dfd99d59f5080 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    depends on EXPERT
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files di=
rectly,
> +        rustc is asked to produce LLVM IR, which is then linked together=
 with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index d7d19c21b671dea10242b1772a8bcf0bf5dcc1cd..2344e2662ce29280582215954=
132c09f63cd8c9d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,15 +6,19 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rus=
t/rustdoc
>  obj-$(CONFIG_RUST) +=3D core.o compiler_builtins.o ffi.o
>  always-$(CONFIG_RUST) +=3D exports_core_generated.h
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +always-$(CONFIG_RUST) +=3D helpers/helpers.bc
> +else
> +obj-$(CONFIG_RUST) +=3D helpers/helpers.o
> +always-$(CONFIG_RUST) +=3D exports_helpers_generated.h
> +endif
>  # Missing prototypes are expected in the helpers since these are exporte=
d
>  # for Rust only, thus there is no header nor prototypes.
> -obj-$(CONFIG_RUST) +=3D helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-decla=
rations
>
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D bindings.o pin_init.o kernel.o
> -always-$(CONFIG_RUST) +=3D exports_helpers_generated.h \
> -    exports_bindings_generated.h exports_kernel_generated.h
> +always-$(CONFIG_RUST) +=3D exports_bindings_generated.h exports_kernel_g=
enerated.h
>
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> @@ -468,6 +472,13 @@ $(obj)/bindings/bindings_helpers_generated.rs: priva=
te bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)
> +
>  rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
>
>  quiet_cmd_exports =3D EXPORTS $@
> @@ -547,11 +558,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET)) L
>         OBJTREE=3D$(abspath $(objtree)) \
>         $(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>                 $(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_=
flags) \
> -               --emit=3Ddep-info=3D$(depfile) --emit=3Dobj=3D$@ \
> +               --emit=3Ddep-info=3D$(depfile) --emit=3D$(if $(link_helpe=
r),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) \
>                 --emit=3Dmetadata=3D$(dir $@)$(patsubst %.o,lib%.rmeta,$(=
notdir $@)) \
>                 --crate-type rlib -L$(objtree)/$(obj) \
>                 --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>                 --sysroot=3D/dev/null \
> +       $(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnin=
gs $(patsubst %.o,%.bc,$@) $(obj)/helpers/helpers.bc -o $(patsubst %.o,%.m.=
bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>         $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
>         $(cmd_objtool)
>
> @@ -678,4 +691,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_as=
m.rs $(obj)/kernel/generate
>  endif
>  endif
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb=
9b7e054a28c3c21 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -16,10 +16,13 @@
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sy=
m)
>
>  #include "exports_core_generated.h"
> -#include "exports_helpers_generated.h"
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
>
> +#ifndef CONFIG_RUST_INLINE_HELPERS
> +#include "exports_helpers_generated.h"
> +#endif
> +
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d0ee33a487be95f8ba9a5c964ebecfbebc6c4bf8..04eaf2b4fbca2245f904a6dc7=
875cb3275aa7df6 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -343,7 +343,10 @@ rust_common_cmd =3D \
>  # would not match each other.
>
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3Dobj=3D$@ $< $(cmd_o=
bjtool)
> +      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3D$(if $(CONFIG_RUST_=
INLINE_HELPERS),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) $< \
> +       $(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --=
suppress-warnings $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers/helpers.b=
c -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
> +       $(cmd_objtool)
>
>  define rule_rustc_o_rs
>         $(call cmd_and_fixdep,rustc_o_rs)
>
> --
> 2.52.0.158.g65b55ccf14-goog
>
