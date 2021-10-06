Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC032C83
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 21:58:50 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b20so16563517lfv.3
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gDe/CCgzbVL8cdlihpSKcZ9kkAIpNWk3w42F2ZBCbZg=;
        b=DpDarEaj1O5yO8x4BdIM2Z/QGnUEayQsIHKYbYRjnyzgH1esE022dwFqrhXwc6O5fb
         JOSG4NCOh4lBDQG6UOc7cvFWeA+sj0AzYTEr5cClzf3a4p3Y8LB8oqaZqBjiauJr5xg1
         8ESjgwjYcEbeS9PfhXdSQvk9oMdgLTik5/iZ4V2CY+r2yFgBbUSdTXI9yjXFPtgJEb7V
         HiCutC1fb4tudyIy8/s+qObuEJFapRCQJNeYJyQ1ywTjoFE7Q9b+HFci138yJTYwwokH
         z2w9tMdPXLiJSuSsAdZT7xIXmA9tEjdSrm4bRyzkEn2vaaR7N8RIYBh5M4vHHJi/EQaS
         cLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gDe/CCgzbVL8cdlihpSKcZ9kkAIpNWk3w42F2ZBCbZg=;
        b=MMj9DEpDNWScZaD8IJ7gvFaX3SZVq59Nqdji1P3Q0pzZnQq/FRlflxZFjglnqPNEmA
         CHk9jiR+0y3i4WzoBrBK4ejyKnGdBgvTzINHsalJUmz+mR4xeeBXJDNNJdszCkXkL5OS
         gV6XO55e7/gNrGnoG5eBaES0vuTaPewx/qNvLI0qHAjj0WrTvlSJZ+LQk7Co7neEvkXj
         vr0Bx+ZO2Q/5uteGPQaARIx1095l67bWtQYOlDw8cRZyx72Bq3ewWr164C8AxDkBV2ck
         sz7MxlPn7ZHMai58ZF0QpYijDXQ+1RB9+Sz5/00rnNXIyYK6EuEz+G8Xkwh5QN4bnUVX
         OesA==
X-Gm-Message-State: AOAM530WhrRsLqS+R9QlR5nM7u6nlTlxJrDVAsqlWK9Wv05PT965Y340
	pZTKWsOC2u9ns+38ln9P3VcqrjWJwTAVgV9hcAdnhg==
X-Google-Smtp-Source: ABdhPJw6/4P9YojbZ4+TF/BbAh9j+NIH0UVeOWkFJsuSEGRFBhFgpeb3nv6DA7bKovrjbGLFVHAi7Nh6gnC/VpLE9m8=
X-Received: by 2002:a05:651c:b20:: with SMTP id b32mr578167ljr.62.1633557528140;
 Wed, 06 Oct 2021 14:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211006082209.417-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20211006082209.417-1-lukas.bulwahn@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Oct 2021 14:58:36 -0700
Message-ID: <CAKwvOd=X-ZFPraS2EL24ps1aKdT3bWhtASA0vUjXdzo655XGiQ@mail.gmail.com>
Subject: Re: [PATCH] elfcore: correct reference to CONFIG_UML
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

+ Catalin who just sent a very similar patch after Lukas:
https://lore.kernel.org/lkml/20211006181119.2851441-1-catalin.marinas@arm.com/
EOM

On Wed, Oct 6, 2021 at 1:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6e7b64b9dd6d ("elfcore: fix building with clang") introduces
> special handling for two architectures, ia64 and User Mode Linux.
> However, the wrong name, i.e., CONFIG_UM, for the intended Kconfig symbol
> for User-Mode Linux was used.
>
> Although the directory for User Mode Linux is ./arch/um; the Kconfig
> symbol for this architecture is called CONFIG_UML.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> UM
> Referencing files: include/linux/elfcore.h
> Similar symbols: UML, NUMA
>
> Correct the name of the config to the intended one.
>
> Fixes: 6e7b64b9dd6d ("elfcore: fix building with clang")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20211005
>
> Arnd, please ack.
> Andrew, please pick this fix.
>
>  include/linux/elfcore.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
> index 2aaa15779d50..127716b58235 100644
> --- a/include/linux/elfcore.h
> +++ b/include/linux/elfcore.h
> @@ -109,7 +109,7 @@ static inline int elf_core_copy_task_fpregs(struct task_struct *t, struct pt_reg
>  #endif
>  }
>
> -#if defined(CONFIG_UM) || defined(CONFIG_IA64)
> +#if defined(CONFIG_UML) || defined(CONFIG_IA64)
>  /*
>   * These functions parameterize elf_core_dump in fs/binfmt_elf.c to write out
>   * extra segments containing the gate DSO contents.  Dumping its
> --
> 2.26.2
>


-- 
Thanks,
~Nick Desaulniers
