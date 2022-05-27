Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28947F
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 17:33:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id l13so7807438lfp.11
        for <llvm@lists.linux.dev>; Fri, 27 May 2022 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bj4qyw34YxTvRCJ4T4CzfYuGvBv7f0gh9GISKHTlOYY=;
        b=SKy17ZMe4xDQzYC7q3+GNm5c5xF1hjIYTQ4puIJ3zzSAcV+Y95jaehz+fj4+GuYZKY
         uqstDwu/NMw3ISzHC+z5V+hCrCadYuaVQdFTtnBP8Q8u7pIi5sM9tfTFGJ5vBxT4e/vX
         06o5PPz2i9Lno4XFomQUCKm8wFTMtlQPYpkexnlSFOV4XIsM0W1NRjhzaDH/Et0ksimG
         8gVuiS6YpZIKXbeANzTrWc6Ay5T6Rv8KwcqMDdYHJIaE8h8hho95NJJ4R3+4lH1wytdb
         yJyGvtMAfZRZnMr8B/rXDhKZK06APDuvGJb52EsNS62kqaaQvNEemJnHq1qtVlQjaN7O
         IUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bj4qyw34YxTvRCJ4T4CzfYuGvBv7f0gh9GISKHTlOYY=;
        b=IrXoVwLggwWhXlQCuKatLMyic/mVm8GcF/DJGX/abu6h43Q+/Jxzs0A+66HyckxogD
         7D0NCyvnjywJzim7wgbjk4Z4s1vASXRR34KYTUFz5z26m6op+9a45HQsAvI1FuD5bFtS
         FH4SbmMjo72tVOuIVv847sEU/Hp7tfWvjFZgJ8Tz1TwskyYyev9gkRyIwxQlh2f+lSnQ
         y3tx4+Yy5hX8YwBBAEuvHxiPyUgvmznpOKoDYuXJY8/Cy1RovV7uEMIOh7vy3XX8MxHV
         C1WBpp5tUTaV1OYyhr+IGWpZDGRP230JzCcfrHQlfntj7WVxsu/n8AWh6KqriUqhMgQJ
         Z4TA==
X-Gm-Message-State: AOAM531a2NrKzOf8psvSzpi2MO9OP/yDGTuZcKDZEjqYLkuyK4+glFmp
	nQW5L0aNULJm7G5DgLCYd4odRVd+vHzWu1zPz5QXdQ==
X-Google-Smtp-Source: ABdhPJzr0zh7RqK3oufVwRmxE56PvSyrvSdp3z1Zx8heuuJjzgu04wiRGDT9v/yTHIeA6z7GEd9gFjjqg5ITn/M97gw=
X-Received: by 2002:a05:6512:48e:b0:477:c024:1a1c with SMTP id
 v14-20020a056512048e00b00477c0241a1cmr31618834lfq.100.1653672786348; Fri, 27
 May 2022 10:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220527100155.1996314-1-masahiroy@kernel.org> <20220527100155.1996314-2-masahiroy@kernel.org>
In-Reply-To: <20220527100155.1996314-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 May 2022 10:32:54 -0700
Message-ID: <CAKwvOd=sMwYPJyUcKVAu9V3bWszuUJ2NUMC8BMT5AdN5i=ra2A@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] kbuild: replace $(linked-object) with CONFIG options
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 27, 2022 at 3:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> *.prelink.o is created when CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT
> is enabled.
>
> Replace $(linked-object) with $(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)
> so you will get better idea when the --link option is passed.
>
> No functional change is intended.

It triggered my PTSD to see this ^ expression; many commits to LLVM
are labeled "NFCI."
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v7:
>   - New patch
>
>  scripts/Makefile.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 06400504150b..f80196eef03a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -219,7 +219,7 @@ objtool_args =                                                              \
>         $(if $(CONFIG_STACK_VALIDATION), --stackval)                    \
>         $(if $(CONFIG_HAVE_STATIC_CALL_INLINE), --static-call)          \
>         --uaccess                                                       \
> -       $(if $(linked-object), --link)                                  \
> +       $(if $($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)), --link)    \
>         $(if $(part-of-module), --module)                               \
>         $(if $(CONFIG_GCOV_KERNEL), --no-unreachable)
>
> @@ -284,7 +284,6 @@ quiet_cmd_cc_prelink_modules = LD [M]  $@
>  # modules into native code
>  $(obj)/%.prelink.o: objtool-enabled = y
>  $(obj)/%.prelink.o: part-of-module := y
> -$(obj)/%.prelink.o: linked-object := y
>
>  $(obj)/%.prelink.o: $(obj)/%.o FORCE
>         $(call if_changed,cc_prelink_modules)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
