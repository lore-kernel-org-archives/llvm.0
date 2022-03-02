Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8D6136
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 22:14:47 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id f2so2581963ilq.1
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=9ub8TndGmTDnXv5II0vAs1rwRRkggXTkQUEfUiR0zUM=;
        b=O+XP97fQEzccgNOmdZKRo9ExVQ6aP9qNniiLwYD8WAvJPbeMRPKx6qhcYfeOpm0jG7
         2kfV6H5Avz5r9Z+Iou+NSRVgPwPyPX0cX1Yh74n49X9gYvVvK66tIN+4U3E4EnQJ7Ix5
         jWPLTXBBZ1pMEyhmLG+OdDJy0s4gHZNgvKCPey2ibIH/50zY0fZTcgWDcXiT/E4pH84j
         iknTD0iNaiGnirSwb0OoN8BZ8zcRCWoy9dxo2ZqVN6lTbZAPMXrIjBLpM0CvkhUeOKTI
         eTrWkYr2nJjuReRc1dWQ2pdcjso9mx/Gr3a8IU2YoBpTYfhgTJJT9fYYzl2YzeKBpMzH
         llaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=9ub8TndGmTDnXv5II0vAs1rwRRkggXTkQUEfUiR0zUM=;
        b=bQgxyRF9KsZyFUk/95LZK8hDq4uiaDN6wxt7E2ddWG0xmFTHl+dD0rpKPkPNxugbga
         5hyNm7O8t09DB6BSGkd1GHMYWj+BH2QHYlXJV3u7Wmjxe71+KrXHrii7l4L1vUCgYLUv
         EPIcSJSkQd1rVEdsGObF1D3nsrxdq9HQmUUkAaRLw4WVE89CK4aKZmeQ/6gg5qWwfrXc
         aKXXGO1V5EE538flVGxxw0wGD3g2OCriioCDXttT6RByLlATKrcBqTMKPahVnldGQQGv
         rqqlgzz6rczo1gEaS8BLMCOwdb9ojk0Te66nbvFALBgC+stG4zBlasvIfnp5RBdw3StD
         DJBg==
X-Gm-Message-State: AOAM531dyRtNTE4Dc7NN5DyVifrUdIf3ar5vjVIBLWOl/xCzLbSI8Okq
	Ken6KnicOcjGdg6S/LgLZMzQs/2th64bZx6MLDE=
X-Google-Smtp-Source: ABdhPJzli2sDxakapKJWnAyE4Ias/tvbMiWhQHQ+dnKForLGnwLdQ++qGFoPyE7z1ZhQJ/yaEqdh8N2Jt0Lib+cjkjw=
X-Received: by 2002:a05:6e02:1c04:b0:2be:4c61:20f4 with SMTP id
 l4-20020a056e021c0400b002be4c6120f4mr29224878ilh.245.1646259286229; Wed, 02
 Mar 2022 14:14:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
In-Reply-To: <20220301145233.3689119-3-arnd@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 2 Mar 2022 23:14:10 +0100
Message-ID: <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 10:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> As we change the C language standard for the kernel from gnu89 to
> gnu11, it makes sense to also update the version for user space
> compilation.
>

Overdue.

Can you point me to a lore link where I can easily fetch the full 3/3
v3 patchset?

I would like to give this a try on x86-64 with my latest kernel-config
(based on the latest kernel-config v5.17-rc5 from Debian/unstable).

What Linux source base do I need?
Is Linux v5.17-rc6 good enough (patchset applicable) for testing?

Thanks, Arnd.

Regards,
- Sedat -

> Some users have older native compilers than what they use for
> kernel builds, so I considered using gnu99 as the default version
> for wider compatibility with gcc-4.6 and earlier.
>
> However, testing with older compilers showed that we already require
> HOSTCC version 5.1 as well because a lot of host tools include
> linux/compiler.h that uses __has_attribute():
>
>   CC      tools/objtool/exec-cmd.o
> In file included from tools/include/linux/compiler_types.h:36:0,
>                  from tools/include/linux/compiler.h:5,
>                  from exec-cmd.c:2:
> tools/include/linux/compiler-gcc.h:19:5: error: "__has_attribute" is not defined [-Werror=undef]
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 37ef6a555dcd..7c9be7f1ccd4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,7 @@ HOSTCXX     = g++
>  endif
>
>  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> -                           -O2 -fomit-frame-pointer -std=gnu89 \
> +                           -O2 -fomit-frame-pointer -std=gnu11 \
>                             -Wdeclaration-after-statement
>  export KBUILD_USERLDFLAGS :=
>
> --
> 2.29.2
>
