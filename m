Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DF1841
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 10:28:51 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id qb20so1632684ejc.6
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 03:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680949729; x=1683541729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5prd9jiPY6aPPA4NHCME6A4G1D5JLdJePd4hvf7GCtE=;
        b=zvhbUyJAiKycOvsOg/A6u2Ux/CvTxib8JCoAYzPG8C1VXvHzIkG+Dod0+EO/8qN6EN
         /ETC38O9GhDav+zXwtADWCLlP84FrgF1MEi65YYZ/d2t5BmEbe1p0Zk/GHZ5qzUo51+G
         rH7hc4AXltGE7pn5P/CFeXmCspZVsX/lA+Hyenkbd06Hg6M+0m1rs7fquaMu2eL8LEnH
         QsB7mI6WFiR27PNkDGU+oVRSayj0gflrprSIgZbJOHSTmy9yUtRo3ucZMZEj4O5Ah4ki
         rYGNDhhzuesh8eUmjpK0qxju3uJR2vxeyLpGrJLyYpI2HB/Is95H/r1yt9NU7WEZsjWL
         7LLg==
X-Gm-Message-State: AAQBX9eFZwQymTFoyZWlg3h/yaSMSLsOO1MyypRBK+GD7qjvJblY1Rlp
	iya43PP75tV+0qLvablnLAwNgCp+BpZH/ZnB
X-Google-Smtp-Source: AKy350a4JqDDkjRuEPSqzg9gHozgV3z4xpcEp4iI+4H2nQwlDXT+lrsa9tB/idYp+T76hlTeH5MQeg==
X-Received: by 2002:a17:906:4904:b0:92f:f655:cc78 with SMTP id b4-20020a170906490400b0092ff655cc78mr1844309ejq.53.1680949728944;
        Sat, 08 Apr 2023 03:28:48 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090617c100b00930b13f6abdsm3027148eje.98.2023.04.08.03.28.48
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 03:28:48 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-94a35b0ec77so20303866b.3
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 03:28:48 -0700 (PDT)
X-Received: by 2002:a50:d0d9:0:b0:4fb:f19:87f with SMTP id g25-20020a50d0d9000000b004fb0f19087fmr2476755edf.3.1680949727831;
 Sat, 08 Apr 2023 03:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407070517.204676-1-andrea.righi@canonical.com>
In-Reply-To: <20230407070517.204676-1-andrea.righi@canonical.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 8 Apr 2023 06:28:11 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8X4mCq7wCD5ASOafQR_Wap2uQsgTwAVGH221CGXfiT9w@mail.gmail.com>
Message-ID: <CAEg-Je8X4mCq7wCD5ASOafQR_Wap2uQsgTwAVGH221CGXfiT9w@mail.gmail.com>
Subject: Re: [PATCH] scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Eric Curtin <ecurtin@redhat.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 3:05=E2=80=AFAM Andrea Righi <andrea.righi@canonical=
.com> wrote:
>
> Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
> to enable RUST.
>
> With this constraint we don't need is_rust_module.sh anymore, because
> 'pahole --lang_exclude=3Drust' already has the capability to exclude Rust
> CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
> then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
> isn't used as well.
>
> In any case is_rust_module.sh is obsolete and we can just drop it.
>
> Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390=
/
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
>  rust/macros/module.rs     |  2 +-
>  scripts/Makefile.modfinal |  2 --
>  scripts/is_rust_module.sh | 16 ----------------
>  3 files changed, 1 insertion(+), 19 deletions(-)
>  delete mode 100755 scripts/is_rust_module.sh
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index a7e363c2b044..608406f33a70 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -179,7 +179,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream =
{
>              /// Used by the printing macros, e.g. [`info!`].
>              const __LOG_PREFIX: &[u8] =3D b\"{name}\\0\";
>
> -            /// The \"Rust loadable module\" mark, for `scripts/is_rust_=
module.sh`.
> +            /// The \"Rust loadable module\" mark.
>              //
>              // This may be best done another way later on, e.g. as a new=
 modinfo
>              // key or a new section. For the moment, keep it simple.
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 4703f652c009..e6f8fa3c9b8d 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -41,8 +41,6 @@ quiet_cmd_btf_ko =3D BTF [M] $@
>        cmd_btf_ko =3D                                                    =
 \
>         if [ ! -f vmlinux ]; then                                       \
>                 printf "Skipping BTF generation for %s due to unavailabil=
ity of vmlinux\n" $@ 1>&2; \
> -       elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module=
.sh $@; then           \
> -               printf "Skipping BTF generation for %s because it's a Rus=
t module\n" $@ 1>&2; \
>         else                                                            \
>                 LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) =
--btf_base vmlinux $@; \
>                 $(RESOLVE_BTFIDS) -b vmlinux $@;                        \
> diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
> deleted file mode 100755
> index 28b3831a7593..000000000000
> --- a/scripts/is_rust_module.sh
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# is_rust_module.sh module.ko
> -#
> -# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
> -
> -set -e
> -
> -# Using the `16_` prefix ensures other symbols with the same substring
> -# are not picked up (even if it would be unlikely). The last part is
> -# used just in case LLVM decides to use the `.` suffix.
> -#
> -# In the future, checking for the `.comment` section may be another
> -# option, see https://github.com/rust-lang/rust/pull/97550.
> -${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODUL=
E[^[:space:]]*$'
> --
> 2.39.2
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
