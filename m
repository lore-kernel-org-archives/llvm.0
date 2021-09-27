Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D83FCC
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 15:27:25 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id v10so24839273ybq.7
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smT979GOjWN0QuT4Bcu80SU2z7cVHs3jq1N6AUdkY3Q=;
        b=iSp90bUF+jZ2KUNc/9Sg1ELN5S1MhSa0HGrTgdjcft7IAabaxmsXbeJOmYAcYmKECy
         jUkq7mJjYki7QXT73FehiNftHygS1qxm85rkLEXOM1s9QO2HEX4QZexMMaEhxCIAU7up
         ESvd0BpYjPlb5KPQwm9pr4vS/NMQVCSQBUzBYoPPMJvb0CF9rA1Yf3EcraGbCArRQDJ9
         ShATS3ohHpLrTJFmJ2qO1Ky6BcdnZsQjFjq9QfNmsOt1dn1l7CPXgxwAG4TPJufXmh76
         ClmS3dWe1u7ySKYQWzDQftpKTsNoUIXlf4CNgfo/XAXN3znGGxKUh+ukWkc7O3upVfGu
         ukxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smT979GOjWN0QuT4Bcu80SU2z7cVHs3jq1N6AUdkY3Q=;
        b=QfLnEgC2++K1DpsZ9x4FDXVoCafKHgJRxk57OT6kSXQSGwbX0FnbJxiBMIQL8oGlxU
         e33dkz/+GdP7uUeid9lW5zvUU7ek1Y5PSGVruvoL5xUjC3itTaJUNzFhcirweRh3Ineu
         W0jNd3WuvTfca6uzBnGiosPh/fePLJiRGhOf+zlGTzNLo87V5kSG8+ivyilkj+khD+vR
         Bo0Did2caJ5slpgDoSeGVpFp3ysYmtnkytYdFhJ+QmZE9JppryTuHjaXJfMAXIiQiOrp
         wi3zqhO9jcZfkRTs/ahHcli1cCKd9We6ILZgZ+E43NM2mKLDsPO1ePqbfobSEyAuUfwk
         RGjw==
X-Gm-Message-State: AOAM532YDi8H0srbrxnvaOOi7ZT1lLfZ8bo5OmrAD4/sDAy/sqg4bcIz
	d1VHJ1tPERbLziTFvmZqG9n4nhajU7Ub5sf/3ME0NA==
X-Google-Smtp-Source: ABdhPJzDwdixMqUjQHo6CBP/yz/D/ubY6GzfsquRV+edDikFEkyhNiwBTOmkC0RtFMpbO26uIw/zJ1Z1FhJTwYw10MA=
X-Received: by 2002:a25:5b45:: with SMTP id p66mr426810ybb.273.1632756444397;
 Mon, 27 Sep 2021 08:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927121541.939745-1-arnd@kernel.org>
In-Reply-To: <20210927121541.939745-1-arnd@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 27 Sep 2021 08:27:16 -0700
Message-ID: <CABCJKucOoov6aWzP3bcTwewNHFRbQn=nFvtkcZQ34hSm+K8+iw@mail.gmail.com>
Subject: Re: [PATCH] module: fix clang CFI with MODULE_UNLOAD=n
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miroslav Benes <mbenes@suse.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <keescook@chromium.org>, Sergey Shtylyov <s.shtylyov@omprussia.ru>, 
	Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Sep 27, 2021 at 5:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_MODULE_UNLOAD is disabled, the module->exit member
> is not defined, causing a build failure:
>
> kernel/module.c:4493:8: error: no member named 'exit' in 'struct module'
>                 mod->exit = *exit;
>
> add an #ifdef block around this.
>
> Fixes: cf68fffb66d6 ("add support for Clang CFI")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/module.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/module.c b/kernel/module.c
> index 40ec9a030eec..5c26a76e800b 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -4489,8 +4489,10 @@ static void cfi_init(struct module *mod)
>         /* Fix init/exit functions to point to the CFI jump table */
>         if (init)
>                 mod->init = *init;
> +#ifdef CONFIG_MODULE_UNLOAD
>         if (exit)
>                 mod->exit = *exit;
> +#endif
>
>         cfi_module_add(mod, module_addr_min);
>  #endif

Thanks for the fix!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
