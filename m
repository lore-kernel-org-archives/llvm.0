Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2B8F6D
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 10:06:43 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id v1so1316941ilq.1
        for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MQqRh07oJjG1uYoKSq/7+nFPqaB+kxM6u9sDxOCB0M0=;
        b=QCoQK9qSnmfljjIlBVXk3a5MpdhI98B0+Q73E21yMZk2xI5+58F2j1ye6RFpBl3kyY
         JtjIvZ5YYI7EdHFPoHyYJv3Ld4fMQHA7LdgiKW5+hK/BQswN+AIrDumwBxCX58oD+BYy
         n3Dso88TV738qeE0LgzxR2c7AVfJkMyR4QH6I9zhyeYgbeJ+HhA1pd6mHvgcCahyWUrT
         gPpXRA/wNGf45LXsgC6phWYVIxoR1L9H6VhmHQcHUaVYxKKMC+eZeQmgH6A+Fy3D/D3e
         vXpZLkgSuhyj0GSTRXjO5y7L6qJgisHtMPteGvOjMXPvLb5rGJJmS2wGvdI5yx2FSvl5
         t4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MQqRh07oJjG1uYoKSq/7+nFPqaB+kxM6u9sDxOCB0M0=;
        b=A2BBlTiRYZu5MftBUsfPYocES0VZ0bME7ffv8fHU+k0HIoTvQxmMt1lLdsbVdnZA20
         ET+CspP2Qa16Fgun9RMYtfnuVZkxiCw9pDJeKbBOLn7CUlexh+5MeyJvwdJNkZ2PXJIZ
         Qixs8J8FijHaRO14O7T4cuN1M51ZBekNAxgmk/0LLzgXbWbedJbIWRqcjdCQx9nocgRo
         QdJ/antnPgXo3CDjlUwGSSAMQ3jD9VcUKrG5zxv4Ayi9ytCsmsw3NMT1NJXYP8LC6zav
         a6qiRFfiNJ51cbnhHFMdt+cFpGyeK8SpIV3z/XIwX19pCL18NG/6zP5gPs53cXZCXHPt
         HAig==
X-Gm-Message-State: ACrzQf0BqtWDHirQ+hlc/p28HqsNg7go0oWtwlEv+NlRcgFqHrfT0skf
	fKtZ8o0dl74dKgrwEmsOBTXVallybgEG6lYlQYE=
X-Google-Smtp-Source: AMsMyM7d8SPImL1plbQiUKnpTlSqFfa+5snuO0TI09jCSn4kOs4Ig3uLXOuQAA8tgLitR7Rt00k/WlwRl3obyU3TRNY=
X-Received: by 2002:a05:6e02:188f:b0:2f8:993:e7ba with SMTP id
 o15-20020a056e02188f00b002f80993e7bamr1421387ilu.321.1664014003032; Sat, 24
 Sep 2022 03:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220923235424.3303486-1-keescook@chromium.org>
In-Reply-To: <20220923235424.3303486-1-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Sep 2022 12:06:31 +0200
Message-ID: <CANiq72n6zK=sXn2j71bAEUUYwRse2dT9f8kLrYzncnPjN1XTow@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Introduce __access_*() function attribute
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Siddhesh Poyarekar <siddhesh@gotplt.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 24, 2022 at 1:54 AM Kees Cook <keescook@chromium.org> wrote:
>
> are specified. While it is legal to provide only the pointer argument
> position and access type, design the kernel macros to require also the
> bounds (element count) argument position: if a function has no bounds
> argument, refactor the code to include one.

Should this bit be included in the comment of the attribute? (since it
is specific to the kernel)

> These can be used multiple times. For example:
>
> __access_wo(2, 3) __access_ro(4, 5)
> int copy_something(struct context *ctx, u32 *dst, size_t dst_count,
>                    u8 *src, int src_len);
>
> (And if "dst" will also be read, it could use __access_rw(2, 3) instead.)

Also maybe the example could be nice there too, since it uses the
syntax for the kernel and you took the time to write it :)

By the way, shouldn't `src` typically be `const u8 *`? Given it is an
example, I would qualify it.

> +#if __has_attribute(__access__)
> +#define __access_rw(ptr, count)        __attribute__((__access__(read_write, ptr, count)))
> +#define __access_ro(ptr, count)        __attribute__((__access__(read_only,  ptr, count)))
> +#define __access_wo(ptr, count)        __attribute__((__access__(write_only, ptr, count)))
> +#else
> +#define __access_rw(ptr, count)
> +#define __access_ro(ptr, count)
> +#define __access_wo(ptr, count)
> +#endif

If you do a v2 for the above, please take the chance to indent with a
single space after the `#` (like `# define`) for consistency.

Thanks!

Cheers,
Miguel
