Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBC2F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 21:05:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id bu18so1614127lfb.5
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztwY6ZBrZWpUqw+CT19celenou/iYkz97B3fc17u3eY=;
        b=JVtD8pcgXI9UkJjqKAVeuKawKZbY8m7XmN54kAhK4DD9UcjWcriaZ5t7TZgBO9jjGX
         83IChvWtzGejLjTZpiIhzpUUZmxd+DsMpT4WpjqHG84T9s0mHy3rWlvneH5jFclfnwn8
         yvSzw29bXQI/WiKTNDHYe563YzUHcmyX/aFOrtvVAw7GA2s9NuIffS23BqB5CLTxD+HV
         j0EsNPLSD1i3wOhPhLdkvXWGsKWYb1eG6xxzxpT1UZ0Yny8axatlh/W3sOhvLdwJ1hmf
         E23I+AhsZxLIl71IoHjra9YVhKemDmzTggXEB5rTNYRyDg4lLersUW+PQN2ksPK9Xvwu
         y97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztwY6ZBrZWpUqw+CT19celenou/iYkz97B3fc17u3eY=;
        b=e7szsLylC28vAdgAmpz9HeJtKgj0rQFdvGDtuaqANUwxQ1bbhYG0n7TPNDGyMgwB84
         8pBn6c1PQ4MQ4+FXa6aOMNCRy1d8KI5dkDrLxF0bMZLc1cRH386Np+veTuriXfmkac8n
         E1RcqrgOCv7g2Yp5dQhitbxWbURSy4FfFMuOzTvL+3ydf+cIj/4j0jSizVJ7orKpfTBp
         QGQnYOlFQbKdndhO30pWSncrXUGn0Bb7V6CMNNQJ5Y+TDD0R/Ff1IaIQzP1JSCR3pQGC
         Pp9k4Zr4iLkazU7QSkocjcl7CfTG0zQrCyb8vBjhmrnGRnWbYxb/BYk2EkhtL//kengh
         +lbA==
X-Gm-Message-State: AOAM532gBaTo3LByTP1JWSrbTmM+YMJUdN3HXYS01T07eBXEL/iXPniy
	hEyoxts8wG80QIQw88IIQA9ftSkB59xn5QWe3aDLQg==
X-Google-Smtp-Source: ABdhPJyvqsHNkbdeLA89mOkNNuBDEKYQeYaofCnX76uReVYdPyIgqNbJ4k9f43F7nHdEn7zpvUFKBrgV9AJZwIyxlAY=
X-Received: by 2002:ac2:5510:: with SMTP id j16mr23982724lfk.240.1643835905209;
 Wed, 02 Feb 2022 13:05:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Feb 2022 13:04:52 -0800
Message-ID: <CAKwvOd=h7NLaqtRwA3FTsq_T-=_0XKL0GRA49CRg5F19m=7xPg@mail.gmail.com>
Subject: Re: [PATCH] include: drop pointless __compiler_offsetof indirection
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 2:21 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> (1) compiler_types.h is unconditionally included via an -include
> flag (see scripts/Makefile.lib), and it defines __compiler_offsetof
> unconditionally. So testing for definedness of __compiler_offsetof is
> mostly pointless.
>
> (2) Every relevant compiler provides __builtin_offsetof (even sparse
> has had that for 14 years), and if for whatever reason one would end
> up picking up the poor man's fallback definition (C file compiler with
> completely custom CFLAGS?), newer clang versions won't treat the
> result as an Integer Constant Expression, so if used in place where
> such is required (static initializer or static_assert), one would
> get errors like
>
> t.c:11:16: error: static_assert expression is not an integral constant expression
> t.c:11:16: note: cast that performs the conversions of a reinterpret_cast is not allowed in a constant expression
> t.c:4:33: note: expanded from macro 'offsetof'
> #define offsetof(TYPE, MEMBER)  ((size_t)&((TYPE *)0)->MEMBER)
>
> So just define offsetof unconditionally and directly in terms of
> __builtin_offsetof.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  include/linux/compiler_types.h | 2 --
>  include/linux/stddef.h         | 6 +-----
>  2 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 3c1795fdb568..83ee7f7ada5d 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -137,8 +137,6 @@ struct ftrace_likely_data {
>   */
>  #define __naked                        __attribute__((__naked__)) notrace
>
> -#define __compiler_offsetof(a, b)      __builtin_offsetof(a, b)
> -
>  /*
>   * Prefer gnu_inline, so that extern inline functions do not emit an
>   * externally visible function. This makes extern inline behave as per gnu89
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index ca507bd5f808..929d67710cc5 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -13,11 +13,7 @@ enum {
>  };
>
>  #undef offsetof
> -#ifdef __compiler_offsetof
> -#define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
> -#else
> -#define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

RIP `((size_t)&((TYPE *)0)->MEMBER)`; you were beautiful in a way only
a mother could love.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> -#endif
> +#define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
>
>  /**
>   * sizeof_field() - Report the size of a struct field in bytes
> --
> 2.31.1
>


-- 
Thanks,
~Nick Desaulniers
