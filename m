Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B064C2F2
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680949501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b+B9to8j2Lzj7TcvjD6Ev0dSy316NI/IHJxCACF6SvY=;
	b=b47PjyrH/BX5SVDVu3JsKpFMhC9K+sWzglnMiQxNNQcEu/ADr5bUVXoADZ0FTibjG9jFhI
	T9Qos1f0sLWKiY5iYPVE/SlH1MFN/VJ5gmf5pyem8kiJPJyhkqG+8Ib8OrX0GPzOdHqu5c
	Fpg7QWXypqUs+yT/JYiRkyPgX35io/Y=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-3FcwE5RwPRytbwIsiCUHbg-1; Sat, 08 Apr 2023 06:24:57 -0400
X-MC-Unique: 3FcwE5RwPRytbwIsiCUHbg-1
Received: by mail-vs1-f71.google.com with SMTP id z30-20020a67d29e000000b0042a1076b5e6so5686471vsi.7
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680949497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+B9to8j2Lzj7TcvjD6Ev0dSy316NI/IHJxCACF6SvY=;
        b=XMzgLTj0Gg9TLt+2TGfywOALW2S4qb0o8uFkZ89jyouEuS9z6t9jL5c9c4LeIEzL7E
         oZp/HwnrljD8UAexNwWbtylqps7PL78xa6IabURvs28G9jibFpHevGpSobZUICBviQTx
         dKg17Q/7w2dbC9aAvySRpjuVlyjczBDKvpD6m6eeCP4AXuH9eI8d/aOS4hW1z3ucfAG1
         V2olH0C/Ip9tQ1gtbiKU4MBkx8JD+pfhhrsVIoM7QI6/5yzNKFS6DxMmW48wiomYY3+h
         HKQs0rWUn4NFRil/E6rKxix5ZUdeEvR1/tVhi6yM+j2QFzsCdZ/Kwgwgwmeu0Zxo3ezr
         3sSQ==
X-Gm-Message-State: AAQBX9ekh7+5e8KJawYkCoiGQiIhyUzdh1KUMMUyrKaSP4L2XNbI9LXH
	VKlVJPvTTOt03svMNGoRf41690Xwj5zbFayRG121tqYVqYUa2KWmPFSRAPChR4SUOCu6m8YfHj7
	LshfGd5JPBZibgl5PZCKtSocBYZNwwA==
X-Received: by 2002:a1f:2a4b:0:b0:43c:2acb:9a60 with SMTP id q72-20020a1f2a4b000000b0043c2acb9a60mr2566270vkq.3.1680949497395;
        Sat, 08 Apr 2023 03:24:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350bcRbIrqbYLXQvhgU1yB25jrUYi60umTA4Aj4dtEtmHkg2stdHgIeAeLt4yqtCa6AkG6OTgIuIzrtdJ+KnT83g=
X-Received: by 2002:a1f:2a4b:0:b0:43c:2acb:9a60 with SMTP id
 q72-20020a1f2a4b000000b0043c2acb9a60mr2566263vkq.3.1680949497089; Sat, 08 Apr
 2023 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407070517.204676-1-andrea.righi@canonical.com>
In-Reply-To: <20230407070517.204676-1-andrea.righi@canonical.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 8 Apr 2023 11:24:41 +0100
Message-ID: <CAOgh=FxE_Y3Chr3wCG5QkoPZW5-BjrVCM9moEZGy=xMkv2fKOA@mail.gmail.com>
Subject: Re: [PATCH] scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Neal Gompa <neal@gompa.dev>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Apr 2023 at 08:05, Andrea Righi <andrea.righi@canonical.com> wrote:
>
> Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
> to enable RUST.
>
> With this constraint we don't need is_rust_module.sh anymore, because
> 'pahole --lang_exclude=rust' already has the capability to exclude Rust
> CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
> then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
> isn't used as well.
>
> In any case is_rust_module.sh is obsolete and we can just drop it.
>
> Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390/
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

Ran this in an Asahi Fedora build to be sure.

Tested-by: Eric Curtin <ecurtin@redhat.com>
Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

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
> @@ -179,7 +179,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>              /// Used by the printing macros, e.g. [`info!`].
>              const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
>
> -            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
> +            /// The \"Rust loadable module\" mark.
>              //
>              // This may be best done another way later on, e.g. as a new modinfo
>              // key or a new section. For the moment, keep it simple.
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 4703f652c009..e6f8fa3c9b8d 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -41,8 +41,6 @@ quiet_cmd_btf_ko = BTF [M] $@
>        cmd_btf_ko =                                                     \
>         if [ ! -f vmlinux ]; then                                       \
>                 printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
> -       elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module.sh $@; then           \
> -               printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
>         else                                                            \
>                 LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
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
> -${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
> --
> 2.39.2
>

