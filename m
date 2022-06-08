Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64017C
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 00:53:18 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-04.nifty.com with ESMTP id 2580nZwC016616
	for <llvm@lists.linux.dev>; Wed, 8 Jun 2022 09:49:35 +0900
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 2580nRai003381
	for <llvm@lists.linux.dev>; Wed, 8 Jun 2022 09:49:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 2580nRai003381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654649368;
	bh=S/dDT9BasIRXgEc6RVl1cw8Lg+oN+87n3tvQW1y0y5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pq13qCUBav9taDdoORZZRTDKLMDvrfYbTVf3hheu/c7GIcZWOp3FSECkf/nMzqOtz
	 Nss58zZNp5V9eVt51avZZzKZo+LW3w/t4aEPM1k/Nro3WbOZBbfBcxrr1Z76tGP1da
	 5cdvJbxeeus1daNCFmDT2g4qXbO0Ek9MBtkbLIeqsD78Its7iAq13+kWW3T35n2jxN
	 e/jyVp3foB1lXZIJkew7eKvyH84x/u185Truwq+E076MhLm3TfdMiwxqi8GtMXfXb7
	 WG7r40QZal3l9XN2q6g0CYH5OADQwhn3liydeQ62kxz4c9bHHel9zA8YsLJRWLd/DQ
	 0ZUp2ZfKsK9uA==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id j7so17151787pjn.4
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 17:49:27 -0700 (PDT)
X-Gm-Message-State: AOAM531EFcFyNGqQBYgzq9nwrHzJV93L12NO4w361THWZ9oMFXOXMP/6
	WO2JRyqIQ9m8UuT2oGJf1wvJZJbUPhy6yM2/vrA=
X-Google-Smtp-Source: ABdhPJyvxrvxhpAQBt1oIWNmd41Y+hLLu9bqNzxLMKWVDzxCt4eJI55BWcV8rcD7rQENE/ud68TgbNZXHjIvxj0IsmI=
X-Received: by 2002:a17:90b:3a87:b0:1e8:789d:c60 with SMTP id
 om7-20020a17090b3a8700b001e8789d0c60mr15749985pjb.77.1654649367064; Tue, 07
 Jun 2022 17:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607164000.447941-1-masahiroy@kernel.org> <CAKwvOdk5ZrcSmQSPrFzreZ-z_Hpi4Lc-D-Y4NDuHPiUWpXdwzA@mail.gmail.com>
In-Reply-To: <CAKwvOdk5ZrcSmQSPrFzreZ-z_Hpi4Lc-D-Y4NDuHPiUWpXdwzA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 Jun 2022 09:48:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKts5EQ0A-7w6sgcFXn59rRBgK3CB1As-oopO2P4P-Nw@mail.gmail.com>
Message-ID: <CAK7LNAQKts5EQ0A-7w6sgcFXn59rRBgK3CB1As-oopO2P4P-Nw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/check-local-export: avoid 'wait $!' for
 process substitution
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Wang Yugui <wangyugui@e16-tech.com>, Jon Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 2:24 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Jun 7, 2022 at 9:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Bash>=4.4 supports 'wait $!' to check the exit status of a process
> > substitution, but some people using older bash versions reported an
> > error like this:
> >
> > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> > Reported-by: Wang Yugui <wangyugui@e16-tech.com>
> > Tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Some comments below.
>
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> > index 34415ae1af1b..19c286c23786 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -32,6 +32,7 @@ you probably needn't concern yourself with pcmciautils.
> >  GNU C                  5.1              gcc --version
> >  Clang/LLVM (optional)  11.0.0           clang --version
> >  GNU make               3.81             make --version
> > +bash                   4.2              bash --version
>
> /usr/bin/env bash
> and definitely /bin/bash
> both show up a lot in kernel sources. At this point, I think bash is a
> requirement at this point, so it's good to document it finally.
>
> > +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > +# hand-crafted error message here.
> > +#
> > +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > +# binutils to 2.37, llvm to 13.0.0.
>
> Might be nice to include `TODO:` in the comment block. Vim will
> highlight these in comments.


OK. will do.

Thanks.


-- 
Best Regards
Masahiro Yamada
