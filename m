Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29DB3FC0
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:08:30 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id i28so2098912lfl.2
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8QrabiuUOL5RpIB2bUJcrd5bYgE/GbNoTnPnvGmMIGY=;
        b=pLFAvdXocaGKnG+CfhM8QZSjEylRHuAJ/wcaiGOKcdmAWl3I0FLe8qo3HS+7htgfYv
         LlOeJ2rkbeRn07sqbP6eLa58NOAmAHWKlZYJR7tAbDTWfmPnpU10CnGT0owsSCYzjgdV
         BLmINhIp2eqcvvxT4f8OSzmt0U/pJ20nhQ6juJLDK0inGbJT8pd1876hvRhhuusqOv0q
         IHLv5fScRhF/d6gt4q0+9M+qlyrejDDevvNkFP1wbYei96ZsrC6Gnfkm3bDRQrvY5VWr
         BEj25dAD9RDL334c8gA2RO5Sg59GqGKqxDa2pTn+U8Je6VwInaBUJJZyhk2B2bjpH7h+
         ZJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8QrabiuUOL5RpIB2bUJcrd5bYgE/GbNoTnPnvGmMIGY=;
        b=TKHnaenPaLnvRrqOyS0Pp1z+B4LITrUAAARBrusx3JwMg5ZfsBmc+NtI828UTN+uxt
         QXpd/NoN0ZmAOW7eft1iBAoujZHMYFwtBbmZhbB87N1QJPapZIaExlirEVPeWB+7U8YP
         url8w+5q2bX+j0tXpJz/UxyHUgNpulKJh2cCkO4EunI1xkUke9iVGcbaOYQ4y/xzIU80
         KYHF4rDVAM92UM0v5O/OABUT0n+fzMF8imGhJv/oQYMLtlPZT2s3pfbqCHE1gOvKyrnU
         DZ9bVg/XoZbRhNVOPRZmHP39c0hn9SLI084zD+XH8CZkc8tLuH2ZV1tKK1XK/JwU1LP5
         iCMw==
X-Gm-Message-State: AOAM5339xeJHaQzzzuk5XRvneDwSSh2x2GluYMJgf834o3pksww3Lj0n
	wVQHKBFR51S5G9Wf4BCHtzz+UgoAUXbJmKpNWAmbig==
X-Google-Smtp-Source: ABdhPJzkDhuzFozlwVe+wwa3G0o4eRmWm94JJUo0qfChZJ4MBNgoDxcylGBnRz0GykDHDpVeeGPBWeyS89G60wPCLSk=
X-Received: by 2002:a05:6512:3a84:: with SMTP id q4mr205725lfu.543.1629929308804;
 Wed, 25 Aug 2021 15:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210825211823.6406-1-nathan@kernel.org>
In-Reply-To: <20210825211823.6406-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Aug 2021 15:08:17 -0700
Message-ID: <CAKwvOdn_3T+sz-5u1Eb8gXDvC3VNyx1vu=1_dxdk30Ucgzqmsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Update ClangBuiltLinux mailing list
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 2:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> We are now at llvm@lists.linux.dev.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6b8a720c0bc..8e36f55430de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4504,7 +4504,7 @@ F:        .clang-format
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
>  M:     Nick Desaulniers <ndesaulniers@google.com>
> -L:     clang-built-linux@googlegroups.com
> +L:     llvm@lists.linux.dev
>  S:     Supported
>  W:     https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
> @@ -4519,7 +4519,7 @@ M:        Sami Tolvanen <samitolvanen@google.com>
>  M:     Kees Cook <keescook@chromium.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
>  R:     Nick Desaulniers <ndesaulniers@google.com>
> -L:     clang-built-linux@googlegroups.com
> +L:     llvm@lists.linux.dev
>  S:     Supported
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/features
>
> base-commit: e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
