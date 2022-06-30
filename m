Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31136D19
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 16:19:54 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id r3so34668459ybr.6
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siGKi/dIfvfe8+iskQhGtDTJS7NXa0bDAndCilNFqRU=;
        b=PY172wygPNzbXx/MtlL0kVYhRqHP/PMSgMPKfMe5d3bzaiPOFgDA24BfmJk1n+zPMX
         fc/bD2b+O9jTkZx6hTCu9mc5JivMe1meY8jOCRsG//k9b88HjGzDX8h8Y69vjuHcXDCy
         xOoQL6P5l7QZgCNx+04KtnwvzbIl2DoRn3J24x5aHkRHyB1J6Dz3f/03FXjJ2oV40NI3
         h+LLWTCGpXw7DUWpa9ZIxtFe99Y48TMHMZfWnjuIh7rvMkm1AdEkL4gjOPQE4a0SFeZd
         i5/7o/AYKlRkjlV+w7+lMcU1gD2PdeXYLEPIxdLD1dPp9eAwQRuekkzRPpPNu8Pt+g4m
         Fj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siGKi/dIfvfe8+iskQhGtDTJS7NXa0bDAndCilNFqRU=;
        b=zJKzl1H+QJ1GAY0HZHO1olaoXj63Dh2I9ppgCQBN0jiHYN3It3LOkiz0lrUqbMoJZC
         ph5odZG9Hqcbv/+WZM9Dx5PmoqpRewUwRkXGpUn66y2RQInBViPafkx8xIPtKp3gLKeS
         CQH/3yeaDJHT0TMk2DU2kydsddER2XsZstbLLY8mTsymaAhV2kr1iIaCz4mP26bp7ZrF
         HjuUnBVa86JhUKzdcSu14bQ0ixMNjlnHU8ZaMADP/Ku2t6fn4nxGYZnvX80jOpzd/CeZ
         x81iNNc9hBxpKQS+znF8MqI6jMRqmEoqMwYHU4e3qJxJplNnkSy4xh6HNsBz9lZFUsQs
         X8kA==
X-Gm-Message-State: AJIora8M6Hn0sZdAND2oz7Y8zGpM3jXnZembG93/b6KWFONOPaJxNcJG
	nS7jv0p/4ay+d+kXnwz83TzsjujZNTabQM5GYv229Q==
X-Google-Smtp-Source: AGRyM1u8XSsovv5uNzas0O9wEpepGNCy07fQqznwcLEuYGbRz6VCy/lpNKM9Tcq6oR2CJ4QgsTgK4lCOy2Z0yZIqcoU=
X-Received: by 2002:a25:c646:0:b0:669:b341:a595 with SMTP id
 k67-20020a25c646000000b00669b341a595mr10978550ybf.304.1656605993493; Thu, 30
 Jun 2022 09:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630094646.91837-1-haibo.li@mediatek.com> <20220630094646.91837-2-haibo.li@mediatek.com>
In-Reply-To: <20220630094646.91837-2-haibo.li@mediatek.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 30 Jun 2022 09:19:17 -0700
Message-ID: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ANDROID: cfi: enable sanitize for cfi.c
To: Haibo Li <haibo.li@mediatek.com>
Cc: xiaoming.yu@mediatek.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:
>
> currenly,cfi.c is excluded from cfi sanitize because of cfi handler.
> The side effect is that we can not transfer function pointer to
> other files which enable cfi sanitize.
>
> Enable cfi sanitize for cfi.c and bypass cfi check for __cfi_slowpath_diag
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  kernel/Makefile | 3 ---
>  kernel/cfi.c    | 8 +++++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/Makefile b/kernel/Makefile
> index a7e1f49ab2b3..a997bef1a200 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -40,9 +40,6 @@ KCSAN_SANITIZE_kcov.o := n
>  UBSAN_SANITIZE_kcov.o := n
>  CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
>
> -# Don't instrument error handlers
> -CFLAGS_REMOVE_cfi.o := $(CC_FLAGS_CFI)
> -
>  obj-y += sched/
>  obj-y += locking/
>  obj-y += power/
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 08102d19ec15..456771c8e454 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -311,7 +311,7 @@ static inline cfi_check_fn find_check_fn(unsigned long ptr)
>         return fn;
>  }
>
> -void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
> +static inline void __nocfi _run_cfi_check(u64 id, void *ptr, void *diag)
>  {
>         cfi_check_fn fn = find_check_fn((unsigned long)ptr);
>
> @@ -320,6 +320,12 @@ void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
>         else /* Don't allow unchecked modules */
>                 handle_cfi_failure(ptr);
>  }
> +
> +void __cfi_slowpath_diag(u64 id, void *ptr, void *diag)
> +{
> +       /*run cfi check without cfi sanitize to avoid calling cfi handler recursively*/
> +       _run_cfi_check(id, ptr, diag);
> +}
>  EXPORT_SYMBOL(__cfi_slowpath_diag);

You can just add __nocfi to __cfi_slowpath_diag, right? There's no
need for the separate function.

Sami
