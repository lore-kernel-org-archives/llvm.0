Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7ED101E0
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 19:34:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51bea30ccbcso1045736a12.0
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687548856; x=1690140856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1ZT5uDPau+Z6seT0VZfhVr+ahIhi7iWdRJoe/etFv4=;
        b=Ga21f79gjb+9easZoKovji8g4g11xJgyPFQJzr6lhb20ePubndme/Xrkqp0rqw1sUL
         /RNDkj2GR7udd6C4bladNUy+lPjc+2pvY0OU9CIs5WRW+xZjBpLLMmPS+0jRDS6mq7qQ
         Fb5T4Gei1qLWwJVPI4lmHfw7Iww4a6N8GNRTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687548856; x=1690140856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1ZT5uDPau+Z6seT0VZfhVr+ahIhi7iWdRJoe/etFv4=;
        b=SL6jbQqGLuVzJ9vwO/JqsRPViGU7bVBvzePWr/Q5Q47ockNc2M4nbpjXOdtL3nn74h
         bCsuVIbQh6ZS3Olhq3zl3Fm49jkqEtSzmAA9kjKqMTSK9PNzLqaWFaz1qt2xR2y69R7x
         o2751QUEAo2qREDY89dN7dAcUzSUh9H52j0V9HA9bdveUpO69A43r7XistxD7u7Wxb7/
         7W/TwV8aJYlbtLAkSB0p7pNGOlxtMOdkfWZdK9aHfdRSeWpsfgt+rx++l6Qj8mK4lhiu
         QYqv1lFRv4chePsq12h6jDLoItd+DGH3U7X6P0TyqUe7Iqt0f/T/Uhx9hZYrlfxeC2i0
         a7vA==
X-Gm-Message-State: AC+VfDyEm1QNGFO7ZnuKt8m71u765UiTM0BaW/y6EtEzUhGBYCRKBJr2
	JE9Cbu3SOAwYydNtPwUCv5Gl5KjYVzPuJDK060zBdw==
X-Google-Smtp-Source: ACHHUZ5EPiw8xiBAdSti4yyVNPBhaLpUIHhGTlQ3R7frz2AjfJf3lARrQLbYVZNItlE2KRj094PCVA==
X-Received: by 2002:aa7:c60d:0:b0:51b:eb35:f8c9 with SMTP id h13-20020aa7c60d000000b0051beb35f8c9mr4164073edq.2.1687548856237;
        Fri, 23 Jun 2023 12:34:16 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id b17-20020a056402139100b0051bee1eadccsm1645086edv.31.2023.06.23.12.34.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 12:34:15 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51be527628fso1035936a12.3
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 12:34:15 -0700 (PDT)
X-Received: by 2002:aa7:d5c6:0:b0:51b:e803:83d4 with SMTP id
 d6-20020aa7d5c6000000b0051be80383d4mr4768055eds.21.1687548855130; Fri, 23 Jun
 2023 12:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9twNnV4zMCvrPkw3H-ajZOH-01JVh_kDrxdPYQErz8ZTdA@mail.gmail.com>
 <CAHk-=wi=eDN4Ub0qSN27ztBAvHSXCyiY2stu3_XbTpYpQX4x7w@mail.gmail.com>
 <CAHk-=wg9p+oJtzC0582vke8whcWPNSC9eq0Z6kdnSqWMEpah7g@mail.gmail.com> <CAKwvOd=dUWWSzQEWdguhe3SjYTw7a76skx370DbU2Y+5o=M8BA@mail.gmail.com>
In-Reply-To: <CAKwvOd=dUWWSzQEWdguhe3SjYTw7a76skx370DbU2Y+5o=M8BA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 12:33:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgsK5H=ejAfFaABzK5PCb3=wqarq+L5frcTjRJkON9S+Q@mail.gmail.com>
Message-ID: <CAHk-=wgsK5H=ejAfFaABzK5PCb3=wqarq+L5frcTjRJkON9S+Q@mail.gmail.com>
Subject: Re: arm32 build warnings in workqueue.c
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Dave Airlie <airlied@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 12:16, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> >
> > -       movabsq $137438953440, %rcx             # imm = 0x1FFFFFFFE0
> > -       andq    %rax, %rcx
> > -       movabsq $68719476704, %rdx              # imm = 0xFFFFFFFE0
> > -       cmpq    %rdx, %rcx
> > +       shrq    $5, %rax
> > +       cmpl    $2147483647, %eax               # imm = 0x7FFFFFFF
> >
> > in several places.
>
> Sorry, are those equivalent?  Before looks to me like:
>
> if (0xFFFFFFFE0 - (0x1FFFFFFFE0 & rax))
>
> and after
>
> if (0x7FFFFFFF - (rax >> 5))

I cut off some of the other changes, with the old (confused) code also doing

-       shrq    $5, %rax

later.

And yes, as far as I can tell, the comparisons are 100% equivalent.
Look at what happens when you shift that big mask down by 5..

> > My guess is that clang keeps an enum as an enum as long as possible -
> > including past some (really) simple simplification phases of the
> > optimizer.
>
> I don't think so.
> https://godbolt.org/z/M8746c49z
> That's LLVM IR as soon as it leaves the front end.

Hmm. I have

     clang version 15.0.7 (Fedora 15.0.7-2.fc37)

and you can probably check the code generation of the current kernel
with and without that patch.

It might depend on exact config file - I'll send you mine in a
separate email to not pollute the mailing list.

                Linus
