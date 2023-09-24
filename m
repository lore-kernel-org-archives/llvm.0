Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE87F
	for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 00:15:41 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f4bc88f9fso22481817b3.2
        for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 17:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695514540; x=1696119340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqouo1KR3QIB4VuW2gBPYmlnqE6R3OEfgs5LOzPDfWs=;
        b=qL02Fe0A6285nF6oD6/WkmE4rqE8s460vogTvfZhP8oN2PpALLSXU0cfWKnyqKA1uE
         mpBSj3pWjQEWLe/G+NDufsS9AMrsIQK1svK2riBEWqNBdTzGhBqU/9pUwHDf2/Nh6UKH
         BcotyaXU3iKKNaEBLw1SXrcmAzRZGOVJlQ3yh0d13M0tRXsfh6/HUf+apFbeQZ8Z3Mh/
         OLP9tz3jY/0jsLM5NmIqMORkga1BeRWw9jLCcXcd5pH6KjCrFsWtFilqMuu3VZVNj45E
         qAZ7bVOfcukaf9MsC/N4Lux1ISv9xYi9H8sttDwF+Kf0yKPG/YjsYFV6MvEXS1YQZlBU
         ypEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695514540; x=1696119340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqouo1KR3QIB4VuW2gBPYmlnqE6R3OEfgs5LOzPDfWs=;
        b=JJR/oFHo3MVb00i9psnsVljei0JZUOupsgabcpOCffSdd1Y7zOrYsqypOTJiScLtoL
         yaBAVaLFPbkGMsqfZ6Qh4ApF67HezI4MItjNfta1iwL3uaUNoKJ4dKgm+jtKQyvp414m
         /kPwLI1X1LP2v/v1VYrzKgdVcRvvXUv74u+sRQAntKkU2zo4GBOA96Gc46oZ4mFovXBP
         0VebkdPo0I/66zJWgj0qYBI0H1aDCD2ls9GK3oq/w1d05FAAtZTOpngLH0TXe5l3diep
         WKZYoKiiwRxrfj+DBzTy8bgN1+5qhK93iFFQ8J1aaUJKDwtSbTbpVPRMFhvAwm9gaKjD
         gddg==
X-Gm-Message-State: AOJu0Yw8nEyl3+pZF4B8hKdP5rU1kUyc0fkgzZzFUvQxC3Jcw5PzcyoG
	PHZDyPJZ7M03JEGifUNPAqEx0vr4dDv4zBjb6bi/NA==
X-Google-Smtp-Source: AGHT+IE0yIl91sQxa6F04fOPUUt9KIrlU3jmLMSMa5t82nSQSRS4kczVVRajmxsJYtg/58/7D49oidaAiDfHyQJwICU=
X-Received: by 2002:a81:5b05:0:b0:599:b570:2db7 with SMTP id
 p5-20020a815b05000000b00599b5702db7mr2470522ywb.30.1695514540275; Sat, 23 Sep
 2023 17:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175203.work.760-kees@kernel.org>
In-Reply-To: <20230922175203.work.760-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 24 Sep 2023 02:15:29 +0200
Message-ID: <CACRpkdbHOa=59DnQzZRV0BrDx0yxm97JjaR0GaeG3jywW0bRBg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: Annotate struct linereq with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 7:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:

> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct linereq.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

That's neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
