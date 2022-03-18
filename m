Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514965115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:41:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id h11so12411645ljb.2
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T68So5s+Mvf8Yxsi6hpGLQhvBaydZiJJcf2u3DNH8AQ=;
        b=ZmBvasPMchpBJ8mkRKb7R3RhkkeHi7XstG7ccVRfInSia4wxmHPc+1XSCMLTTbtwoD
         iBBZhG8pLYhyN+/NcRaXQ6YvBWpZBO0b6qFsSWL8b/QpLIBN/MEi/ZFczp9fnO89TfiE
         WjskrGL3deHU2C25PjWZUp+gAg6DG/SMTBWTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T68So5s+Mvf8Yxsi6hpGLQhvBaydZiJJcf2u3DNH8AQ=;
        b=E8i4SuHmZJF8hIq1dqzBlkI4hs+lEi03Wt/Et/WDGUzIc+cL3HjDpN/NzxrKZVdLLH
         O3c242FZnkHF20mR9oYU6X6t4KOYhajc3wGwP6eGTtJwpdDyrihEF5kaXgtQscaXXQcr
         A1r2ke4v2RqtGv+EbriXyyhNWT1sgWUECLzbuoN6Kv8IH7IQ5XU5+hPeFhM4ulZaPS3Z
         Va0HxQ2a2aNK7ldEBekLMYoEBXCCGmseJMxCjN9D/KOEtHPyBPyoQEoa3a6CnkLUT6Mf
         e3mGA2ykYYcHNKL8JUmSMEQfypk8mcOUkC31PWGg2KU6VFKP+Rht1J+fXOGJpCEw3Lxn
         7hDA==
X-Gm-Message-State: AOAM533KekGkanwUyt3zbJR3uZttOwf5SqgxjZTNCb6yIdMgMjkdGqMG
	6SBi2elDasvInsXylWXLP61dR99BoLsrr4ryrWM=
X-Google-Smtp-Source: ABdhPJxXkPwI8Oo/VjqfG/umVlhaAd+GTZFCCS55g6WLBXouLNY/H8iIolGsXgOJnJvep+Xdk+HmuQ==
X-Received: by 2002:a2e:804d:0:b0:246:1aba:af59 with SMTP id p13-20020a2e804d000000b002461abaaf59mr6808005ljg.508.1647628865982;
        Fri, 18 Mar 2022 11:41:05 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id f8-20020a056512092800b00445ba1264cbsm964911lft.89.2022.03.18.11.41.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:41:03 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id q5so12352476ljb.11
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:41:03 -0700 (PDT)
X-Received: by 2002:a2e:804b:0:b0:247:e81f:87e9 with SMTP id
 p11-20020a2e804b000000b00247e81f87e9mr7192968ljg.176.1647628863338; Fri, 18
 Mar 2022 11:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com> <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
In-Reply-To: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Mar 2022 11:40:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
Message-ID: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nathan Chancellor <nathan@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Should we add a note diagnostic to clang suggesting the explicit cast
> as one method of silencing the warning?

On the compiler side, I would love to see warnings about the ambiguity
of the sign of 'char' in the general case.

That said, I tried to add that to 'sparse' long long ago, and couldn't
make it work sanely. All the approaches I tried all get _way_ too many
false positives.

I tried to come up with some way of figuring out "this code acts
differently depending on whether 'char' is signed or not" and warning
about it, and never could.

And I suspect the same is true even for the much moire limited case of
only format warnings.

Because it's a *bad* idea to use '%d' (or almost any other format
specifier) together with a 'char' argument, but only if you don't know
the range of the char argument.

But the other side of the argument is that quite often, people *do*
know the range of the 'char' argument. If your 'char' type thing comes
from some array or string that you control, and you used 'char' simply
because you know you have small values (typical example: use it for an
array of booleans etc), then it would be very annoying if the compiler
warned you about using '%d'.

There is no reason to use '%hhd' when you know your data range is [0,1].

So honestly, I don't think you can come up with a sane warning that
doesn't cause *way* too many false positives and just annoys people.

I'd love to be proven wrong. In fact, I'd _really_ love to be proven
wrong for that generic case. The "sometimes 'char' is signed,
sometimes it is unsigned, and it depends on the architecture and the
compiler flags" can be a real problem.

                Linus
