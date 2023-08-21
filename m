Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6118C17
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 18:10:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c4dd644cf8so2414133fac.0
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692641427; x=1693246227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF6rxD+ZkHyNq/ltHpWvUanV1plOfqlbq7nLdiifj/c=;
        b=UsZjS99KVCX6avIBGy32ovoxhZYlwbMG6sxkQdHFe5+1fGSl0JDE8OHZwLKzH2Aa+z
         /kvZrnHUH76NceJsqbQmIpVRr3srALaBS9Eq5iAfAVV+6ZH9YQh75qYv26lK1du8dxbs
         uwSJNn6HftiHIDfv/m/PBVZm+d7Y/RPhxN+JMkJvyhEZKryFT5YjOJLFAaThMgi7nZJb
         /EbBBENjwJ+xg5dLS28lVmTlDHSgLcrnn66PqQ+y3Z0XcmXB7kTOvdq4GP8kHoVL0Xa9
         AC87EMaUilGmyDKUJ1r7MZBdrYd3PlUDh+GMpTGgiPsjgY4ReWqfZIhtXA3acBGhIwf3
         PITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692641427; x=1693246227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF6rxD+ZkHyNq/ltHpWvUanV1plOfqlbq7nLdiifj/c=;
        b=bcnKR8QnxY3ObPL+cHmST3pi/7lNLTkqwMZ9MrYLPUwimvsd9/M1S7Id83wC0n9AY6
         LlwtYh/u3RLT87/PG4mULwp+Gqkfd1awT6m8+eaKI2CZhFYJvFmS/bdPJtu4Uk0QvDBK
         tKScfhbZQVarOFS9IRVRKvVGagT189LebXXgHWWRytGGe2xshrIbY65TT45y5SJmGb5u
         Ra3xO28ygKQMj05lCAy+ltrSh1p03jXb4bAPXyrUd503Ln9sKR5y7Sv4h78rLOSCCBc5
         Dut8QGrsuxWHShlLiRaKY0jBrAhD+hM73Xx2TnEVOWkF1W8TVUdskZkfw9TDQghDtxOA
         1epw==
X-Gm-Message-State: AOJu0Yxe/xG3t3R0EXKuw7fs13JL7IXySJXcdcOhsJ7xvot/MmXn3Fo4
	HfuLGSbst1+MxzdyqTmhU5xUt4pi22LZp5b9tS420A==
X-Google-Smtp-Source: AGHT+IEkF8SKAy0eWsCodQOtnaef5xNdxImXVaiIDx8VyX01r+4IxF35/Fqn16U/grcbCUgCEWldlnHFINGB53bX7M0=
X-Received: by 2002:a05:6870:b30a:b0:1b0:653a:af92 with SMTP id
 a10-20020a056870b30a00b001b0653aaf92mr10954978oao.8.1692641427159; Mon, 21
 Aug 2023 11:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvFD-kE0+EGWkwcnR1DXRxh7p7OwQThJ6KWxYWVROJ4+A@mail.gmail.com>
 <CAKwvOd=h4aFisiY0w0awKkxk+i-aJM5+QbExYnboqzojLigx1Q@mail.gmail.com>
 <CA+G9fYtRMde7Ksswa8pY8sFgnWVN-snRHfz4YRM04HSQ4LFBZQ@mail.gmail.com> <CA+G9fYuRy_yJ0Fa1hxt4iPZvgw+qvdvXmqWtFV-rDME+pCdXiA@mail.gmail.com>
In-Reply-To: <CA+G9fYuRy_yJ0Fa1hxt4iPZvgw+qvdvXmqWtFV-rDME+pCdXiA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Aug 2023 11:10:16 -0700
Message-ID: <CAKwvOd=B3na1Dsg7ATqRa7rwD030SVd6tR6G555Y6Q7t-8yLaw@mail.gmail.com>
Subject: Re: landlock: fs_test: fs_test.c:4524:9: error: initializer element
 is not a compile-time constant
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Shuah Khan <shuah@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 7:20=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Fri, 18 Aug 2023 at 10:48, Naresh Kamboju <naresh.kamboju@linaro.org> =
wrote:
> >
> > On Thu, 17 Aug 2023 at 21:24, Nick Desaulniers <ndesaulniers@google.com=
> wrote:
> > >
> > > On Thu, Aug 17, 2023 at 3:51=E2=80=AFAM Naresh Kamboju
> > > <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > While building selftests landlock following warnings / errors notic=
ed on the
> > > > Linux next with clang-17.
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > Build errors:
> > > > ------------
> > > > landlock/fs_test
> > > > fs_test.c:4524:9: error: initializer element is not a compile-time =
constant
> > >
> > > Hi Naresh,
> > > Can you tell me more about your specific version of clang-17?
> >
> >     compiler:
> >         name: clang,
> >         version: 17.0.0,
> >         version_full: Debian clang version 17.0.0
> > (++20230725053429+d0b54bb50e51-1~exp1~20230725173444.1)

Ok, decoding that we have 2023-07-25...

> >
> > >
> > > I believe a fix of mine to clang should address this. It landed in
> > > clang-18, and was backported to clang-17 recently.
> > > https://github.com/llvm/llvm-project-release-prs/commit/0b2d5b967d983=
75793897295d651f58f6fbd3034

And the backport (that sha above) landed 2023-08-03 so that checks
out.  So yes, the initial report was missing the fix that landed more
recently.

> > >
> > > I suspect your clang-17 might need a rebuild.  Thanks for the report.
> >
> > I will rebuild / re-test and confirm soon.
>
> LKFT team re-built containers and I have re-tested the builds
> and reported build issues has been fixed.
>
> Thank you !

Awesome, thanks for the report and retesting to confirm.

>
> Best regards
> Naresh Kamboju



--=20
Thanks,
~Nick Desaulniers
