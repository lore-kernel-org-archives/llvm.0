Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74036A93B
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 19:16:39 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-440a495d73dso350686137.0
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 12:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687547798; x=1690139798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2OV0HZ7lds/NcEpAufvexd01rNFbNdtfLFGpTpqJh4=;
        b=mOuqRoloYWXqdXttJ4SiENhK9j3odCSfkF2rSqcDLxcb4xJYeffEYYqXPjbYBPwXlT
         tpF4Su3vdFBellLTQ1mCtn/5IqSWyBdl435TTU9I/lbvQ9xxV8CACCovJVWlWbFdtg+a
         2fnYcd+gpccPpe3D/7Lv+FVsfocP3SYUIqTfh6KAe8yexOyXCNHZ0GYOf3v+1F4JgsCJ
         36hmgHPy6jIoQN4y9lpA1jowTd9oy0dogMNRVuDjcX9wOVNosroEhpVZCIggDgs5H3a4
         P9Day28OQ96qJ7m2P7qoCl/Iwy+Tmm7DrafLBZkCoYe3Qy82+x1/rHeRGNLuGm+hsJve
         q87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687547798; x=1690139798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2OV0HZ7lds/NcEpAufvexd01rNFbNdtfLFGpTpqJh4=;
        b=ltNRTnhMHFYKa3/k0PYSXsQnLC0eCchj1KO2h1ydVHCAGBu04eg4FygjRWqkEQfOku
         5Tx/G3ZTBg+2QhdEKv2K7N4AQ9Oqnf+WQyEf+FQ1W2c/VpNbOrgqDMGzF+GKJaqwN/wM
         mWtsKUJaFWQDM7I/WDaO1oM4PXGCyk62T/hRmcmItExJeYefH1AtUEa2H0o2oqxa66fw
         UK6GUvsiv+/Hsf/pQ8t2PeJFDODVqmV3PB940mgA6mKeYvDJ6Ro1Q0RJ3suV+CdHWBhk
         DUWFZ2lHAipZ0+DVgFyigUUo5PwR6ywoxdISRygz1+Ue3j/K7jmCeoBvSVKdz6mMOyy3
         j2ZQ==
X-Gm-Message-State: AC+VfDzWFE63Ce5FcWmXTA0rUbzGYqNs91hMe6xdxWeuji1rGFLwLZo2
	A+PEGlLhNYX7s3B/5r67jk+fNLe5LVWMgEJdPqHUkA==
X-Google-Smtp-Source: ACHHUZ7dLdc6iZ0lclvwVLMg0VK4abWzcVY6CYBkgmGUKH3avprHyqDEQY0npO39Tzem12TMy9CbtCNfqZp6RKBzVrI=
X-Received: by 2002:a67:f60e:0:b0:43f:5ad3:1905 with SMTP id
 k14-20020a67f60e000000b0043f5ad31905mr7176733vso.29.1687547797847; Fri, 23
 Jun 2023 12:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9twNnV4zMCvrPkw3H-ajZOH-01JVh_kDrxdPYQErz8ZTdA@mail.gmail.com>
 <CAHk-=wi=eDN4Ub0qSN27ztBAvHSXCyiY2stu3_XbTpYpQX4x7w@mail.gmail.com> <CAHk-=wg9p+oJtzC0582vke8whcWPNSC9eq0Z6kdnSqWMEpah7g@mail.gmail.com>
In-Reply-To: <CAHk-=wg9p+oJtzC0582vke8whcWPNSC9eq0Z6kdnSqWMEpah7g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 12:16:26 -0700
Message-ID: <CAKwvOd=dUWWSzQEWdguhe3SjYTw7a76skx370DbU2Y+5o=M8BA@mail.gmail.com>
Subject: Re: arm32 build warnings in workqueue.c
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 11:52=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Adding clang people. See this for background:
>
>     https://lore.kernel.org/all/CAHk-=3Dwi=3DeDN4Ub0qSN27ztBAvHSXCyiY2stu=
3_XbTpYpQX4x7w@mail.gmail.com/
>
>   where that patch not only cleans things up, but seems to make a
> difference to clang ]
>
> On Fri, 23 Jun 2023 at 11:24, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So I really think that code needs fixing, and the gcc warning was very =
valid.
> >
> > Maybe something like the attached. Does this fix the gcc warning?
> > Tejun, comments?
>
> Whee. Inexplicably, that patch also improves code generation with
> clang, with things like this:
>
> -       movabsq $137438953440, %rcx             # imm =3D 0x1FFFFFFFE0
> -       andq    %rax, %rcx
> -       movabsq $68719476704, %rdx              # imm =3D 0xFFFFFFFE0
> -       cmpq    %rdx, %rcx
> +       shrq    $5, %rax
> +       cmpl    $2147483647, %eax               # imm =3D 0x7FFFFFFF
>
> in several places.

Sorry, are those equivalent?  Before looks to me like:

if (0xFFFFFFFE0 - (0x1FFFFFFFE0 & rax))

and after

if (0x7FFFFFFF - (rax >> 5))

>
> Or, even more amusingly, this:
>
> -       movabsq $68719476704, %rax              # imm =3D 0xFFFFFFFE0
> -       orq     $1, %rax
> +       movabsq $68719476705, %rax              # imm =3D 0xFFFFFFFE1
>
> where the old code was some truly crazy stuff.

Yeah, that's stupid. Which symbol's disassembly are you looking at? I
couldn't repro with a quick test: https://godbolt.org/z/dz1fEY9Wx.

>
> I have *no* idea what drugs clang is on, but clearly clang does some
> really really bad things with large enums, and doesn't simplify things
> correctly.
>
> That "I can't even do a constant 'or' at compile time when it involves
> an enum" is all kinds of odd.
>
> Does this matter in the big picture? No. But I think the take-away
> here should be that you really shouldn't use enums for random things.
> Compilers know enums are used as small enumerated constants, and get
> pissy and confused when you use them as some kind of generic storage
> pool for values.
>
> My guess is that clang keeps an enum as an enum as long as possible -
> including past some (really) simple simplification phases of the
> optimizer.

I don't think so.
https://godbolt.org/z/M8746c49z
That's LLVM IR as soon as it leaves the front end. Notice the use of
`i32` types. AFAIK, the IR does not contain the notion of enums. Clang
lowers enums to integral values of a specific width in LLVM IR.

>
> With gcc, code generation didn't change from that patch with my
> defconfig on x86-64 (apart from line numbers changing).
>
> Now, clang improving code generation with that patch is obviously a
> good thing for the patch, but it does mean that clang really messed up
> before.
>
>                Linus



--=20
Thanks,
~Nick Desaulniers
