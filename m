Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3B2F25
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 01:12:03 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id i62so23561008ioa.1
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 17:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oX4QYPgKMF1ySmPW1A2Fc76TKnI8tmOOFZVE50sLVdM=;
        b=j8mI87ZCJd4p+JxPi60FStbr1RHpCNDYz2m9pyWQMeE3R9/N+Of1nH7RPHuTe2Oero
         /602Ui9weQPh/VzTQ7mxn0oBzIKu/sjx1WDoBj1m4G6CG5Cfssgwzk/tW1Wrrw6vge/Q
         lqO1JI4eXZpYtGlZEmwirj8E9RHD193NZSgQZpZdV8kiDvUIU6ZCuiJwCyyDl1Yp2wWj
         6oez0kvaP/gGVX/zJta6PSImaTi5Y+DQUIP8oND09zOSU/uex63Rbj0dNq2SUEV9v/kc
         Ol854b3oo1+JH1iG+4zsEC7ZqdyHbKv2GPit8aNHUhh1vhTzA2NoeZje2jJZW+QjShDv
         lZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oX4QYPgKMF1ySmPW1A2Fc76TKnI8tmOOFZVE50sLVdM=;
        b=TswVUpdKKny6KLrLwySepyxhCeDamuTkzcfEA0aVqugxOU68YO5XYx+e1bXijyQOqt
         bbKysE6hfAQ9R2jgDrAJBqFcZ/wWSSX4i//CaTdF4WvHAvEcJ4JrBfFH8nBKA2AsDIXo
         neO24XQQ5mTSNQgs6knU1w5X5kZ8N94iN3GKmpXGFoJ6r52TbGXl8D1Q2gEHA2vK1c3J
         ran6A6l1NYyJREEyTzzsnJwT1XVCk7XAYSBTlpWzoDLk88m7BCvEVwijmvXuGfBG8Ftq
         O3DEssSBSVGuAPIJtXcX7LHwxe4whUYJSBZHuvdTM24BPk2Koe+BV0eWYZtqnPYjx0yT
         hfNg==
X-Gm-Message-State: AOAM530tVJWmBrFfjTo4Bqee2JEOXxWjb9PrDuiUsSC0wX1hM1o+sB+O
	3GDNas1cEDqgsm89MpgqX8bVqSSPyguxgoxJY0Q=
X-Google-Smtp-Source: ABdhPJyXX1twyRR+678XjVBO0sCwrCTB7XrhMX4vpAv6YoNNYiWfVEFuuFnQBU0etSfQM/CuIRPWWJrM0781bf4k6NE=
X-Received: by 2002:a6b:ea08:: with SMTP id m8mr15173748ioc.172.1643764322472;
 Tue, 01 Feb 2022 17:12:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org> <20220202003033.704951-2-keescook@chromium.org>
In-Reply-To: <20220202003033.704951-2-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Feb 2022 02:11:51 +0100
Message-ID: <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] Compiler Attributes: Add Clang's __pass_object_size
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-hardening@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 1:30 AM Kees Cook <keescook@chromium.org> wrote:
>
> +/*
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-pass-dynamic-object-size

For attributes that are not supported under all compilers, we have the
"Optional" lines in the comment. From a quick look in Godbolt,
`__pass_object_size__` and `__overloadable__` are supported for all
Clang >= 11 but not GCC/ICC. Thus, could you please add to the
comment:

    * Optional: not supported by gcc.
    * Optional: not supported by icc.

to those two patches?

For `__diagnose_as_builtin__`, I only see it on Clang trunk, so I
assume >= 14, thus could you please add:

    * Optional: only supported since clang >= 14.

?

Thanks!

> + * The "type" argument should match the __builtin_object_size(p, type) usage.

This should go above on top of the comment (it is true there is one
case that does not follow it, but that one has to be cleaned up).

Also, this bit seems to be explained in the Clang documentation (i.e.
not kernel-specific). Do you think we need it here?

Cheers,
Miguel
