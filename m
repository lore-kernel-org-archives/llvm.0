Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE02EA4
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 16:33:54 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id f23so11419724plr.6
        for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+K+VkJ5rF2bPWIuGGL1An2TDI1B6FPu0okQWTiFSFU=;
        b=dsyZlivveNQVAe1j5QfNUOZIGk20O2luReGls++tVaAj8fZ5uh1yeCb1fIOBCD8wJE
         xxhON/33ij5fIaKtr7QjqMbHMoNanvSy5gkaHzohavLSfYEpkvhGNdeZbX443uQK52az
         YSpS6/WAqPpz+U6P6DyNIBwdQ50imLhOzvwfPrWg4GxFzpq2gOgM2KOCm2bdt98MjkOu
         VQgN/xLhoPQsn98hAcdPgEdxFkSQ9DGlf0LfOrd1+lJVMD+xTibiVE+XY98uYKruH5T1
         KCSGVQ6aQa95VV8liCtXh9KVFSGc7zzF19BG1+qOhBORHzN+Y8ImHiq5VT1aXHk6C8BZ
         9pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+K+VkJ5rF2bPWIuGGL1An2TDI1B6FPu0okQWTiFSFU=;
        b=cAkT8iF9FmUr9hvh3pK3UUlxLsE3AlsxqIpUL8EMhx3XwL3kcQfH4bn0vPvuwO16eW
         gdbNGThmDUzjn46nzp+19yoWoy5jzI92ppFqw/9RcP52cbbcJwlpc4kZBuwAgRo1iIvg
         IPoV9bo5BKtKqvGeadiHzPFcyybPQGTyZJtHERo30bYlk9AJOTuihnHB/e1gP2LmdzsK
         g2Pfl9jXaAw2j/alfYxH7y5DwnqQcVTIb3gBy/dJOSvR3T1h82BklnmTgh4xypd+d7Ec
         yr1pGhz0n29pj8yTNrPdYvrdDxEHvFjeeiPE5qgXYaHZWPXAa2VCsFeoa7SSbudUNUXX
         3dkA==
X-Gm-Message-State: ACrzQf2KIjeha/5k9rx767frnTPEzRjwwsoZfLL4C4pLMEjvn0E7ZyYR
	1uGefbuPl3fkoqHQNiWDntvjme7wOH/XXFKmaFY/gg==
X-Google-Smtp-Source: AMsMyM5PvDezoPVvWMiVxEXgTMcGPdWgPtRwNZzEj9dBODXIhNtJpUQjkPAVZ7oEegqxDc4BrgbyXQZr74AAcZKWbNk=
X-Received: by 2002:a17:90a:c24a:b0:213:13aa:3e2a with SMTP id
 d10-20020a17090ac24a00b0021313aa3e2amr12267189pjx.107.1666715633777; Tue, 25
 Oct 2022 09:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvGe+fHXw8RMeZuXB-rGVDjs81m9_RwDq73R+pnVpYjEw@mail.gmail.com>
In-Reply-To: <CA+G9fYvGe+fHXw8RMeZuXB-rGVDjs81m9_RwDq73R+pnVpYjEw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Oct 2022 09:33:42 -0700
Message-ID: <CAKwvOd=kPA=FV9UQXLe1eyRwqDOYrRkB+_d+E+JdY4BpRUUaRA@mail.gmail.com>
Subject: Re: Clang Build warning detected - include/linux/memremap.h:258:9:
 error: expression which evaluates to zero treated as a null pointer constant
 of type 'struct folio *' [-Werror,-Wnon-literal-null-conversion]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ammar Faizi <ammarfaizi2@gnuweeb.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 9:19 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following build warning / errors noticed while building x86_64 with clang
> on Linux next-20221025 tag.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Hi Naresh,
Thanks for the report. It looks like AKPM is already aware.
https://lore.kernel.org/llvm/20221022163356.f5e08eeefe66fc71845be861@linux-foundation.org/

Naresh, for future reports, can you use our newer mailing list
<llvm@lists.linux.dev> rather than our older one
(<clang-built-linux@googlegroups.com>).  I haven't actually closed the
old one, but the new one is syndicated on lore.
https://lore.kernel.org/llvm/

>
> ## Build
> * kernel: 6.1.0-rc1
> * git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> * git branch: master
> * git commit: 76cf65d1377f733af1e2a55233e3353ffa577f54
> * git describe: next-20221024
> * test details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221024
>
> ## Test Regressions (compared to next-20221021)
> * i386, build
>   - clang-12-lkftconfig
>   - clang-13-lkftconfig
>   - clang-14-lkftconfig
>   - clang-nightly-lkftconfig
>
> * x86_64, build
>   - clang-12-lkftconfig
>   - clang-13-lkftconfig
>   - clang-14-lkftconfig
>   - clang-nightly-lkftconfig
>
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
> ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- HOSTCC=clang CC=clang
> In file included from arch/x86/kernel/asm-offsets.c:13:
> In file included from include/linux/suspend.h:5:
> In file included from include/linux/swap.h:9:
> In file included from include/linux/memcontrol.h:20:
> In file included from include/linux/mm.h:31:
> include/linux/memremap.h:258:9: error: expression which evaluates to
> zero treated as a null pointer constant of type 'struct folio *'
> [-Werror,-Wnon-literal-null-conversion]
>         return false;
>                ^~~~~
> 1 error generated.
> make[2]: *** [scripts/Makefile.build:118: arch/x86/kernel/asm-offsets.s] Error 1
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CA%2BG9fYvGe%2BfHXw8RMeZuXB-rGVDjs81m9_RwDq73R%2BpnVpYjEw%40mail.gmail.com.



-- 
Thanks,
~Nick Desaulniers
