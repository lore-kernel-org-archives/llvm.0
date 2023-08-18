Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2018AF0
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 15:18:59 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-58419517920so10250377b3.0
        for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1692371939; x=1692976739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgbLHehGpwVrKSLju1qpBYPuFYa1Zpgs9RdgH+2tDII=;
        b=FlXZgkz4zWKb7PKsS5rps111kwpFX3lkqmSTro6wQNWST+yPW1EqI+qf8wxAJuL7tS
         Iwh/XKweMR+vDi65xYrWK0TorlRzT7zUByL6Z3MWTBAnaQNMEfjv8SPs/Z33X0DGA+IQ
         zVMplgFvd7IdCfj5TjSFEpfu0VxZieWlFnCykEdIxzbqBh8JmZMhJXkxAiUjfq5eDy1A
         J9OGIJKC5p9rauMoPjLnrb/4b4FQACUyYhTGEbS5lFiQDFmk3nhU3JzGIXB8OOYzzjMJ
         fJjGfUmu6eY9TjitLgOOb9fm+tsnXVco5Qd4dNuUdqs871ZYj7WQYopZkEY4tn/O9UQm
         ZvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692371939; x=1692976739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgbLHehGpwVrKSLju1qpBYPuFYa1Zpgs9RdgH+2tDII=;
        b=J7ULieKQXgGXYlzNXBHi9jSNb/t9w5ePjknHAHnyqeC6EtSz070EqodjakLLZ8yvfm
         21UZSrXdd9vK/OwibcPDC8NobBKyrxs3fdULEz4mzYgB2FVRhFbj6DoqjcMa72cbthC9
         KJhL7Nwx0uHu9rKz1RIGhEsoRz5DcD4E/1MOjeWOg1LlcAFdBFL9ZnZUb1puJZzr9kEc
         Bpw1anck0hWEHW7hmzInMkGMCrfqyoafuOeecZFFjU8aE58x2ANBjBmpv4hdwomijxbT
         8ic6BHiRkEelmXgvspVdZSXNcfff8gXRI+oQE5nGI/p5tPS8e2VYzuD81xk2INLz88lk
         DxEw==
X-Gm-Message-State: AOJu0Yy1twt4b8XSV0HL/VRs5wEcQSnr3dW+SnqJL0a3ei5pr3p/Z91n
	MT6G7g9uJFz2PbHgR+57a1xmm6gRy7uJ9UBgW7yY
X-Google-Smtp-Source: AGHT+IH/VrHw4mYIGTcJdOBgtqJqiIVp3ULtA4k5KI3iTcBlMWJ/JvZbsEmH3Cr9BShSwCZI+lDHYCr+dkWLtvSdbXQ=
X-Received: by 2002:a0d:d6d2:0:b0:573:527b:747b with SMTP id
 y201-20020a0dd6d2000000b00573527b747bmr3094498ywd.36.1692371938879; Fri, 18
 Aug 2023 08:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230817203501.never.279-kees@kernel.org>
In-Reply-To: <20230817203501.never.279-kees@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Aug 2023 11:18:48 -0400
Message-ID: <CAHC9VhRmy=8iWkKcQQmninxNRYqWrR3tTSj4XDvJhZZO0PsA3w@mail.gmail.com>
Subject: Re: [PATCH] audit: Annotate struct audit_chunk with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 4:35=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct audit_chunk.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Eric Paris <eparis@redhat.com>
> Cc: audit@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  kernel/audit_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This looks good to me, but considering we are currently at -rc6 I'd
prefer to hold off until after the upcoming merge window.  I'll send
another note once it's been merged into audit/next.

Thanks.

> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index e867c17d3f84..85a5b306733b 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -34,7 +34,7 @@ struct audit_chunk {
>                 struct list_head list;
>                 struct audit_tree *owner;
>                 unsigned index;         /* index; upper bit indicates 'wi=
ll prune' */
> -       } owners[];
> +       } owners[] __counted_by(count);
>  };
>
>  struct audit_tree_mark {
> --
> 2.34.1

--=20
paul-moore.com
