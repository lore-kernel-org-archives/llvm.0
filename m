Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC51E7C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 19:56:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id f37so28674334lfv.8
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 11:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMi6jfjPmOmbZli1oBeEnCLh26RC8er1sFN7ImcKi+o=;
        b=hquZMrM0xczMD9ZZ2fmNHpKRRvIiE7LGxeRQJjMZze98rNEK5Ra0HRlOcHxK1KVi4e
         FQBN2HtdkQyg3o4uLsn9EldD2THulu/j3z0J4c66DGvW7dy1eAyfhY+zPXLMelBK2NVs
         vFTKlgnUUtURZxAVCwYSSRSsE1DD1TOPa1gDQr3nPyXjuZyynXejfYtMrPNZv4qIlUpD
         asXGdBdEC/EqRmjLSKU9coJTyUmLsswdnWGR9v05EWG09syjtZNPsGSHcVR0+xDYzlUn
         xQ2tt273NyMVjhC6JJKYVK3HJjm31oXEOGz7C5tWg61kUtCoX5BnnE6UEYkhMFnA1EZr
         /tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMi6jfjPmOmbZli1oBeEnCLh26RC8er1sFN7ImcKi+o=;
        b=63LJhTr9ASylCtBJ8H7Qvcaf4GBHNFtKGNKP71fOyaEA+9JYqBuBPePy4P/ynGimRQ
         M0KOLdOPUt83WepCsBiLVrIZhI+VLrhQ2ShZ6+0yqDqq1jEDnT1VOFc5ZzClY8qiR140
         mAUekR8s2SIa/4pUqq92uxaTSbbUTJI8JwfhEBjFAGSH8X7ILqqI5GniEzuh8ylH6ZWK
         0umSjllXzw8svXP9SZIXUit+i+kRgLjlkppEIM3AwhSeo/p0yVOiAteS0GwNgX2N/fuT
         OMHNQQNNQubNzMJnIvSfdngKdAoMYDZKoJtQsew+L2eeuct/d9TdOwc0PGZSDD62tIXN
         Zl4g==
X-Gm-Message-State: AOAM531wHJk4LckQa8fNLXnizbrBVuKdyl4/vgd+hTXg2iSkqHDYHjz0
	8i/bCNkY2+n3DM2uazeEP8kjNmkSaGZJpd1W7zU48A==
X-Google-Smtp-Source: ABdhPJxHJ28ixWzc8Cw9z63iY2V3Qs825Z5wYOByAiHrKjX3T4RD+ppSjBBfmC8N5GLCMcFfzTk1/mPc6px+kJRbpbg=
X-Received: by 2002:a19:2d11:0:b0:445:65c7:5f1e with SMTP id
 k17-20020a192d11000000b0044565c75f1emr16420364lfj.184.1646164576477; Tue, 01
 Mar 2022 11:56:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
In-Reply-To: <20220301145233.3689119-3-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 11:56:05 -0800
Message-ID: <CAKwvOdnABhWN9-o0J0cN2epDJby=JX5BNGr6U_w4WiFZ7qbwig@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 6:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> As we change the C language standard for the kernel from gnu89 to
> gnu11, it makes sense to also update the version for user space
> compilation.
>
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

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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


-- 
Thanks,
~Nick Desaulniers
