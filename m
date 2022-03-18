Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF35115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:46:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id h2so10216386pfh.6
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ERP/ri7fUthNe53EHX7luWZC9TGqfyrEEYYImd67W/Y=;
        b=BggTcfmtj/2qASx5jrYS2HTIDX8wZ0k8AmkaH4EK71HQS+Hr2S2Os83J0Ff6DUxdAm
         XdEW3psIax6tYFh663lnLA3erJoYb3Sm8e1aRv2sDp/FrATacY8st5ZwnQilndH+PGAH
         FWOBxc3v+HnN2XQQkObD9jEyhkY2ccr7UA6fH4ZyCS8HVnRCTL0hGzXqiYjAleeFugQ6
         s1tVAPpDjDha5Us2u/hB/Bb6LIKjCudqkEbvw3af3Bw+blHuhhiq4vF5rN6+JsWsor05
         9jo6J2Ko9bWMEHThamBW9AEzWLr2ePYij+IKusfmpqQJ9okpFAtdXYQdwYqkPI+/ts/g
         7JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ERP/ri7fUthNe53EHX7luWZC9TGqfyrEEYYImd67W/Y=;
        b=Ibf8ObyAZDNTOX8Ky/Ur/NFQfhyRU25J4ajEdb3Jidh/2grVfId0A5jx2W1pVgrQV9
         AZ1Rs8Z/NhOIKIVuGcCcFCR6ZaSHagu0/SwCoKxwkDYoKOIwcd4YeSUsIA8b2mX3OP22
         br8alL/ejyFTpK8Fu8e1tjiv5uIsboozAE8YvVKbVnpgyyrQJUxZlq2D1R5DQbMLlQF4
         v0iTRk1MAqZbjZoVo4uIBiV9hOErRB5+7DPjkiFIsY45VdvOnMaI+oBKVj9axbkz1Z+2
         bhJp47BwHdR32hW/r3ifoneFoFn5+ENGv3FLP68LTv/OJ6yZK9hkkkpfWCIOhi6PkY5W
         LrZA==
X-Gm-Message-State: AOAM530YU3BibIRzvASJLkbKS4wSPCWw7MXk/Kx7BPyGpgQ/JloS2YK8
	7JcrPN7x006U/jZttJllNV8QqAYJeM3C0qMrWBZd
X-Google-Smtp-Source: ABdhPJwpy67/FIlq8v1DlPQLIhiY4drN+Tpj/CZWirFrnRxutS5B/WWPHUgXMdz21Q64ZITqi+WwU0OH9D47AvsBvko=
X-Received: by 2002:a63:1613:0:b0:382:2a7f:5ca1 with SMTP id
 w19-20020a631613000000b003822a7f5ca1mr3871359pgl.151.1647629186010; Fri, 18
 Mar 2022 11:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
 <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com> <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
In-Reply-To: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 18 Mar 2022 11:46:14 -0700
Message-ID: <CAGG=3QV9+kakiTYSe+Oh1RTnSW1PLZNNO-KJaiQtincheQK+VQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nathan Chancellor <nathan@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 11:41 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Should we add a note diagnostic to clang suggesting the explicit cast
> > as one method of silencing the warning?
>
> On the compiler side, I would love to see warnings about the ambiguity
> of the sign of 'char' in the general case.
>
> That said, I tried to add that to 'sparse' long long ago, and couldn't
> make it work sanely. All the approaches I tried all get _way_ too many
> false positives.
>
> I tried to come up with some way of figuring out "this code acts
> differently depending on whether 'char' is signed or not" and warning
> about it, and never could.
>
> And I suspect the same is true even for the much moire limited case of
> only format warnings.
>
> Because it's a *bad* idea to use '%d' (or almost any other format
> specifier) together with a 'char' argument, but only if you don't know
> the range of the char argument.
>
> But the other side of the argument is that quite often, people *do*
> know the range of the 'char' argument. If your 'char' type thing comes
> from some array or string that you control, and you used 'char' simply
> because you know you have small values (typical example: use it for an
> array of booleans etc), then it would be very annoying if the compiler
> warned you about using '%d'.
>
> There is no reason to use '%hhd' when you know your data range is [0,1].
>
> So honestly, I don't think you can come up with a sane warning that
> doesn't cause *way* too many false positives and just annoys people.
>
> I'd love to be proven wrong. In fact, I'd _really_ love to be proven
> wrong for that generic case. The "sometimes 'char' is signed,
> sometimes it is unsigned, and it depends on the architecture and the
> compiler flags" can be a real problem.
>
My first thought is that this might be better suited for a static
analyzer, like clang-tidy, that can do deeper analysis on code. It
might still be difficult to weed out all of the false positives, but
could be useful for specific offenders.

-bw
