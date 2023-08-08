Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B7100B9
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 15:30:42 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63d0d38ff97so26112176d6.1
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691508641; x=1692113441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxRMXJiuQK91+yRpddjAZKkzZLy1vbif8oXNnv4g/Ag=;
        b=tYFGdNGHYqgo6K2VUU1Lgnk2kwQYyBUGZFALgJeJzPxX62F05fGgHBFNlrhcDDBZOK
         in2PiYokDXKqbkU6f2pk2jJsMtLhdHu9bM2q3VtvfLtTukCWj+g+5bTP2rabNUEqsEyz
         YS7U6XHVFZ/MKZqxl+Gdnnsvcc7i5j1ohsZvHe1KiTtHI8KcmY6pxsbfrp0oMfitsPkZ
         Ih3KxbZy4WTofKMjtTAdOYcu6xWXkAlfYyQoLNLMoNzjBPlOHeNBu1bYKfqPC8vDq8sz
         w7JQsfd/2NRjVRzKCgh3WFUEeKpNUHiC0ow1KBxiPM5GFWqyyqw2wqOnnLXnohrhfagT
         0Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691508641; x=1692113441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxRMXJiuQK91+yRpddjAZKkzZLy1vbif8oXNnv4g/Ag=;
        b=A5sOPt0t4JvZnZ7IhR5OaZbHJSeOoQhsmHo3YRR4linYeObS7wHqj8iEvF5bO9t9b9
         6YNe7gVLQ1xtYn3uHV9wfiV0xWnLUi0vPkYrjvXVPAAQU7aSgrCw64YOkiYpGKZ4ButE
         aw35ccNU0forBRs53aldtQDDv18CPYH0FKQhFkCfbV6hNXT0fQIfI+BCSno+dQUfPJQG
         MOKLfQLkBr55GqADtgZoG6uyoLQnNd4ahkaRxQt/wGZcyvm2idWcHhgr+orBvPjNmU9P
         RBVv6FC3Vq0TmsYvOLZE4422T2xihIyDjYrCf2SyaPEfH6rjMUS9sgbLB7P+Q69Fb6m3
         MGwg==
X-Gm-Message-State: AOJu0YxR8Sq+qAM/wOXAavCUOM2ZftCasoAA9i9IsTtGmYGrFyoPcTU7
	RCAFLUKLkUhA2qZaMa+5j3G8lUZb+iXprMM9whOe9g==
X-Google-Smtp-Source: AGHT+IGzx0RFgswgLrJMymfJnb2FD9jwg77jDF19tcueBiV97W9Lx+X3sLD3o5vXHt2lMPaogA6T3mfELdxFD7EAdOI=
X-Received: by 2002:a0c:b20c:0:b0:625:aa49:ea0d with SMTP id
 x12-20020a0cb20c000000b00625aa49ea0dmr192621qvd.32.1691508641145; Tue, 08 Aug
 2023 08:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvPn4N6yPEQauHLXw22AWihQFxyA=twQMDCEwDjXZyYAg@mail.gmail.com>
 <ZNIdrd+SQ0KjYWKA@e120937-lin>
In-Reply-To: <ZNIdrd+SQ0KjYWKA@e120937-lin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 08:30:30 -0700
Message-ID: <CAKwvOdmoPUJXT3-+nwYdOBOpcp30zvxapDmvYAt+_wUQj98O8A@mail.gmail.com>
Subject: Re: stable-rc 5.15: clang-17: drivers/firmware/arm_scmi/smc.c:39:6:
 error: duplicate member 'irq'
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Sasha Levin <sashal@kernel.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Sudeep Holla <sudeep.holla@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 3:49=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Tue, Aug 08, 2023 at 11:59:22AM +0530, Naresh Kamboju wrote:
> > LKFT build plans upgraded to clang-17 and found this failure,
> >
> > While building stable-rc 5.15 arm with clang-17 failed with below
> > warnings and errors.
> >
> > Build log:
> > ----------
> >
> > drivers/firmware/arm_scmi/smc.c:39:6: error: duplicate member 'irq'
> >    39 |         int irq;
> >       |             ^
> > drivers/firmware/arm_scmi/smc.c:34:6: note: previous declaration is her=
e
> >    34 |         int irq;
> >       |             ^
> > drivers/firmware/arm_scmi/smc.c:118:20: error: use of undeclared
> > identifier 'irq'
> >   118 |                 scmi_info->irq =3D irq;
> >       |                                  ^
> > 2 errors generated.
> >
> >   Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Links:
> >  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/buil=
d/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftco=
nfig/log
> >  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/buil=
d/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftco=
nfig/details/
> >
>
> Hi Naresh and Sasha,
>
> so this fix (unluckily) applies cleanly to v5.15 but fails to build since=
 the
> logic and code around it was different in v5.15.
>
> While looking at backporting it properly, though, I realized that the fix=
 is
> NOT needed really in v5.15 due to the different context and logic, so I a=
sk you
> to DROP this fix in v5.15.

What's the SHA of the patch that you are referring to (in
linux-5.15.y) that you're suggesting the stable maintainers revert?

>
> I suppose the patch has been automatically applied because the Fixes refe=
rred
> a commit that was on v5.15 too since some of those lines were indeed impa=
cted
> and were present also in later versions, but the logic around it has
> changed afterwards, so the original code (up to v5.17) was not really aff=
ected
> by the bug addressed by this fix...only later versions from v5.18 (includ=
ed)
> onwards needs it.
>
> Moreover note that the whole SMC ISR logic was introduced in v5.12 (and w=
as
> good up to v5.17 as said) so v5.15 is really the only stable release that=
 needs
> to drop this fix.
>
> Thanks and sorry for the noise,
> Cristian
>
> >
> > Steps to reproduce:
> >  tuxmake --runtime podman --target-arch arm --toolchain clang-17
> > --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TeTE3=
iE8aq4t1kv169LcMmd9jo/config
> > LLVM=3D1 LLVM_IAS=3D1
> >
> >   Links:
> >     - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TeTE3iE8a=
q4t1kv169LcMmd9jo/tuxmake_reproducer.sh
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
>


--=20
Thanks,
~Nick Desaulniers
