Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67492C8F
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 17:50:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id t9so137060lfd.1
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=DxXrG20AfYyTWbuMUYzNfwR4ma6dWiFGO0KjGKjLqVUYkWc3DGlA7gExcJhltON98Q
         iCOl7ShLDxT6gW3S/iaxj1F4KrUBb9e17xdURrxubqYpnaDf5fqI+klbo/6SpeMVbaxj
         bVO5N1ypo4BJgVzIhZmV7S+lvG+ppRftQ74TP0w7xkCYNdCPabymX9EBoVJgU+AiJdnX
         73rfLrfIuuMZZa7dbpcIoqZmbjgOPkSZh/tq0Pqn9LQQD0c50F18mXQtmzKwXTaIrbI4
         VLerFWmUTLJfn1+7KKosGH7U2IvcsnC2m3gcHYqoEbu8bW+mpmpUd0FUhndHkvD2mYx+
         E4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=ogUX1w/2obGv8MbvWrPSDD08vmG7LwqXzqb7DfFgN4taaTCbj5SsPd2iYmZ5sTgurV
         hjqIG82OPZDABzWPcDikkigUTS5DnZvgYnzm5Bl4fIadYjxEPozmuee9I1gHBnX2boRB
         k7e2BawPmd1/2fsQX2IiKlw1ifS3TBlTHBQlQ9RijENebzhsa3fRWsiFRZ4q+K4bi+tN
         Yc0PbaZ93SLGwNUA2SuwI3nJPbuhPamt74F9f/fT+Mmb7zdrZoLKiRg4K7+SxMN61GuH
         uuJysaAAJyEG87KkveIl3ljNA/s6htAZPjVy/mRVjKgog3pWyqJOFG9fnxAsNXfSNOXd
         omcg==
X-Gm-Message-State: AOAM5337S0wWC2Pn1R7WCDxNwiXw0/0sKjRCvk1GGQ3yl1msEvlL6cBC
	mI/yDGDMTCAcYKy+zP7cBZV5kQpcklhUDEQZswNkfA==
X-Google-Smtp-Source: ABdhPJwPFGMtZow5DrrM1QQEhKH4UgBAhO+q3OhbDbIA+NCFfvXVoE6xurM+6DQNbeaHKSEmyE1T/I8F3ayNnhS04hg=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr643276lfu.489.1634752240690;
 Wed, 20 Oct 2021 10:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Oct 2021 10:50:29 -0700
Message-ID: <CAKwvOdnH4JG1Qt3scCVYGMT+iyfYKna4wyuODXZqURVfe+DZVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To: Kees Cook <keescook@chromium.org>
Cc: Dan Li <ashimida@linux.alibaba.com>, ardb@kernel.org, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 10:35 AM Kees Cook <keescook@chromium.org> wrote:
>
> Hi,
>
> GCC plugins should only exist when some compiler feature needs to be
> proven but does not exist in either GCC nor Clang. For example, if a
> desired feature is already in Clang, it should be added to GCC upstream.
> Document this explicitly.
>
> I'll put this in -next unless there are objections. :)

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Thanks!
>
> -Kees
>
>
> Kees Cook (2):
>   gcc-plugins: Explicitly document purpose and deprecation schedule
>   gcc-plugins: Remove cyc_complexity
>
>  Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
>  scripts/Makefile.gcc-plugins                |  2 -
>  scripts/gcc-plugins/Kconfig                 | 20 +-----
>  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
>  security/Kconfig.hardening                  |  9 ++-
>  5 files changed, 34 insertions(+), 94 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
>
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
