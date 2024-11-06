Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22F2071F9
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911188; cv=none; b=EkPAxOynHfsmpbAeW6eYDaNMFjLU6qEdc/+XG2MgtLz9VTZXLyu0VYlHjKWZNI1UMgl6j084BzlWe66yom9Uc7pyw98x7XXkxXHUgjciFZolrJ6wOyaaTA1kv4Z6sIKY23ssIanwVAYI70HRJBTFySBgf6W93cX7t0Mft+7DXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911188; c=relaxed/simple;
	bh=rOw1cNxmV5yTPdcWqbOutZVPQ5MsIKIqjCjabDSKhXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaTsq2AHRuLRiBOsn5HEIiDimlhaq73MTnYP8dR0kBAi3RVEqN7m8mmjJOJwdgacZNNKKYt9Wfw8iUlS7aGCUA1ZFDLyx3WIV/pbzUAXcRms09xiqz1SrK3O9DwPkNss7kDD5Wo4AepkjbD1hf44u8n6fGbOaAbtJruOv8+7Ejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOJE2JWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOJE2JWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F59C4AF0C
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730911187;
	bh=rOw1cNxmV5yTPdcWqbOutZVPQ5MsIKIqjCjabDSKhXE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dOJE2JWNU00uzXhi+LB+wCrqGUdVxslMiwlG0aSDLSQsdlhwI/QNcG33OSShSKNZh
	 y9W6eZBqwPk9Pu95Seh+V/0AaAJpxiCBjWOLYiGz+HM3aFxSy0zdK9nKHlxAqmmbTz
	 S0+9asjMtN+6oyDS23wFv9G8SFwCPQwGYS7v0ci/kwFY+HwKqYRp/HqKrZyQz87sh7
	 qEMIZeOV+QYpWjz08xJQ0PXCCs7Ar9PX9KuLXgEGMuVFLE6OB84r8sd4JMG88Ihujg
	 G5L/pyWQ3RYV4mvtaBT5j2rAldXL45X5beA8fFDPn41pzTJinMRxsGMLggXCKaosl9
	 EGjezBzVP2cjQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb518014b9so60059521fa.3
        for <llvm@lists.linux.dev>; Wed, 06 Nov 2024 08:39:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdcoKGHZhJNMa1pe26s+/HT7xr6FM/vL4ADYlmfJ9+f1fd3fZrREtSwIIOQf0uZWwBsAfY@lists.linux.dev
X-Gm-Message-State: AOJu0YyCtDLDHYtSTYMyLPFjcuBhv2rWB/Y3f86O7tb47QCg+lImY3/Q
	8BzN4wzGOEcBGlsQvFzG4AzGTmgBhYTnmF6b96JE61JuCIxzSslzZnHsFXpz9trNDPItPAHHk46
	RffmYxxnyxTnSZkEBBAM7t6cJ8rE=
X-Google-Smtp-Source: AGHT+IHzF2jJ4wq8spwQz69HDRPf0ScsSSWGAuM4RFIdZYEHToQmNs2IgK6UCutHxy6jUQXVXP2UuZmv6s+hozl6jR4=
X-Received: by 2002:a2e:a0cd:0:b0:2f7:4c9d:7a83 with SMTP id
 38308e7fff4ca-2fcbe078a64mr157857151fa.40.1730911185367; Wed, 06 Nov 2024
 08:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241106161445.189399-1-masahiroy@kernel.org> <20241106161445.189399-2-masahiroy@kernel.org>
In-Reply-To: <20241106161445.189399-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 Nov 2024 01:39:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKPGTbYdM5LxWD=_H6erPwxwb7XjTBBse3w28Yeb08vg@mail.gmail.com>
Message-ID: <CAK7LNARKPGTbYdM5LxWD=_H6erPwxwb7XjTBBse3w28Yeb08vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Rename .data.once to .data..once to fix resetting WARN*_ONCE
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Simon Horman <horms@kernel.org>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 1:15=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit b1fca27d384e ("kernel debug: support resetting WARN*_ONCE")
> added support for clearing the state of once warnings. However,
> it is not functional when CONFIG_LD_DEAD_CODE_DATA_ELIMINATION or
> CONFIG_LTO_CLANG is enabled, because .data.unlikely matches the

This is a copy-paste error.

  s/.data.unlikely/.data.once/


> .data.[0-9a-zA-Z_]* pattern in the DATA_MAIN macro.
>
> Commit cb87481ee89d ("kbuild: linker script do not match C names unless
> LD_DEAD_CODE_DATA_ELIMINATION is configured") was introduced to suppress
> the issue for the default CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dn case,
> providing a minimal fix for stable backporting. We were aware this did
> not address the issue for CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy. The
> plan was to apply correct fixes and then revert cb87481ee89d. [1]
>
> Seven years have passed since then, yet the #ifdef workaround remains in
> place. Meanwhile, commit b1fca27d384e introduced the .data.once section,
> and commit dc5723b02e52 ("kbuild: add support for Clang LTO") extended
> the #ifdef.
>
> Using a ".." separator in the section name fixes the issue for
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION and CONFIG_LTO_CLANG.
>
> [1]: https://lore.kernel.org/linux-kbuild/CAK7LNASck6BfdLnESxXUeECYL26yUD=
m0cwRZuM4gmaWUkxjL5g@mail.gmail.com/
>
> Fixes: b1fca27d384e ("kernel debug: support resetting WARN*_ONCE")
> Fixes: dc5723b02e52 ("kbuild: add support for Clang LTO")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  include/linux/mmdebug.h           | 6 +++---
>  include/linux/once.h              | 4 ++--
>  include/linux/once_lite.h         | 2 +-
>  include/net/net_debug.h           | 2 +-
>  mm/internal.h                     | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 3c9dc1fd094d..54504013c749 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -359,7 +359,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPE=
LLER_CLANG)
>         *(.data..shared_aligned) /* percpu related */                   \
>         *(.data..unlikely)                                              \
>         __start_once =3D .;                                              =
 \
> -       *(.data.once)                                                   \
> +       *(.data..once)                                                  \
>         __end_once =3D .;                                                =
 \
>         STRUCT_ALIGN();                                                 \
>         *(__tracepoints)                                                \
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index 39a7714605a7..d7cb1e5ecbda 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -46,7 +46,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi)=
;
>                 }                                                       \
>         } while (0)
>  #define VM_WARN_ON_ONCE_PAGE(cond, page)       ({                      \
> -       static bool __section(".data.once") __warned;                   \
> +       static bool __section(".data..once") __warned;                  \
>         int __ret_warn_once =3D !!(cond);                                =
 \
>                                                                         \
>         if (unlikely(__ret_warn_once && !__warned)) {                   \
> @@ -66,7 +66,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi)=
;
>         unlikely(__ret_warn);                                           \
>  })
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)     ({                      \
> -       static bool __section(".data.once") __warned;                   \
> +       static bool __section(".data..once") __warned;                  \
>         int __ret_warn_once =3D !!(cond);                                =
 \
>                                                                         \
>         if (unlikely(__ret_warn_once && !__warned)) {                   \
> @@ -77,7 +77,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi)=
;
>         unlikely(__ret_warn_once);                                      \
>  })
>  #define VM_WARN_ON_ONCE_MM(cond, mm)           ({                      \
> -       static bool __section(".data.once") __warned;                   \
> +       static bool __section(".data..once") __warned;                  \
>         int __ret_warn_once =3D !!(cond);                                =
 \
>                                                                         \
>         if (unlikely(__ret_warn_once && !__warned)) {                   \
> diff --git a/include/linux/once.h b/include/linux/once.h
> index bc714d414448..30346fcdc799 100644
> --- a/include/linux/once.h
> +++ b/include/linux/once.h
> @@ -46,7 +46,7 @@ void __do_once_sleepable_done(bool *done, struct static=
_key_true *once_key,
>  #define DO_ONCE(func, ...)                                              =
    \
>         ({                                                               =
    \
>                 bool ___ret =3D false;                                   =
      \
> -               static bool __section(".data.once") ___done =3D false;   =
      \
> +               static bool __section(".data..once") ___done =3D false;  =
      \
>                 static DEFINE_STATIC_KEY_TRUE(___once_key);              =
    \
>                 if (static_branch_unlikely(&___once_key)) {              =
    \
>                         unsigned long ___flags;                          =
    \
> @@ -64,7 +64,7 @@ void __do_once_sleepable_done(bool *done, struct static=
_key_true *once_key,
>  #define DO_ONCE_SLEEPABLE(func, ...)                                    =
       \
>         ({                                                               =
       \
>                 bool ___ret =3D false;                                   =
         \
> -               static bool __section(".data.once") ___done =3D false;   =
         \
> +               static bool __section(".data..once") ___done =3D false;  =
         \
>                 static DEFINE_STATIC_KEY_TRUE(___once_key);              =
       \
>                 if (static_branch_unlikely(&___once_key)) {              =
       \
>                         ___ret =3D __do_once_sleepable_start(&___done);  =
         \
> diff --git a/include/linux/once_lite.h b/include/linux/once_lite.h
> index b7bce4983638..27de7bc32a06 100644
> --- a/include/linux/once_lite.h
> +++ b/include/linux/once_lite.h
> @@ -12,7 +12,7 @@
>
>  #define __ONCE_LITE_IF(condition)                                      \
>         ({                                                              \
> -               static bool __section(".data.once") __already_done;     \
> +               static bool __section(".data..once") __already_done;    \
>                 bool __ret_cond =3D !!(condition);                       =
 \
>                 bool __ret_once =3D false;                               =
 \
>                                                                         \
> diff --git a/include/net/net_debug.h b/include/net/net_debug.h
> index 1e74684cbbdb..4a79204c8d30 100644
> --- a/include/net/net_debug.h
> +++ b/include/net/net_debug.h
> @@ -27,7 +27,7 @@ void netdev_info(const struct net_device *dev, const ch=
ar *format, ...);
>
>  #define netdev_level_once(level, dev, fmt, ...)                        \
>  do {                                                           \
> -       static bool __section(".data.once") __print_once;       \
> +       static bool __section(".data..once") __print_once;      \
>                                                                 \
>         if (!__print_once) {                                    \
>                 __print_once =3D true;                            \
> diff --git a/mm/internal.h b/mm/internal.h
> index 93083bbeeefa..a23f7b11b760 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -48,7 +48,7 @@ struct folio_batch;
>   * when we specify __GFP_NOWARN.
>   */
>  #define WARN_ON_ONCE_GFP(cond, gfp)    ({                              \
> -       static bool __section(".data.once") __warned;                   \
> +       static bool __section(".data..once") __warned;                  \
>         int __ret_warn_once =3D !!(cond);                                =
 \
>                                                                         \
>         if (unlikely(!(gfp & __GFP_NOWARN) && __ret_warn_once && !__warne=
d)) { \
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada
