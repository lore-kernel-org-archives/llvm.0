Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDA7A
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 08:49:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1McIYO-1oJMAG3AUu-00chh7 for <llvm@lists.linux.dev>; Mon, 25 Apr 2022
 10:49:52 +0200
Received: by mail-wm1-f51.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so12029451wml.2
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 01:49:52 -0700 (PDT)
X-Gm-Message-State: AOAM532uYaCsCdCryKGaoCv1xvUD8Svb52Mf7wClC1EtJPgNgQBLYmWM
	Kw5DgveBCgrb/3BQJjR5bDt2uTYOOQxmeAM7NPQ=
X-Google-Smtp-Source: ABdhPJznBo55D1o0+WIRuh7wr97I06MCGT/Bj0IN0lqL0hSs0OuVvnsKvU+rzU5QmLcLYLe1/6Wmmx7p2/jDZLH/xxI=
X-Received: by 2002:a05:600c:25c5:b0:38f:f0b9:4c8c with SMTP id
 5-20020a05600c25c500b0038ff0b94c8cmr16117479wml.20.1650876592353; Mon, 25 Apr
 2022 01:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
 <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X> <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
 <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com> <CAMZ6RqL8G4uVn--Y5pBC+_c9Ex3Sjf8OJuVRwkVFFPwWd_ezLQ@mail.gmail.com>
In-Reply-To: <CAMZ6RqL8G4uVn--Y5pBC+_c9Ex3Sjf8OJuVRwkVFFPwWd_ezLQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Apr 2022 10:49:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1_XoyjOPQ0ghku_QUjUL5V6BK9kSNUXoQj2RYaA=JxFg@mail.gmail.com>
Message-ID: <CAK8P3a1_XoyjOPQ0ghku_QUjUL5V6BK9kSNUXoQj2RYaA=JxFg@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yxTvZ/99/RZX4b0Wi7TIWiv6OjD04lkBtYKoXSdWGqNEJKU0D//
 LCq90gPng5yCsjdyXnPjVHtEdjbA5Aa2xjHnj0NyLlmP75NuIoAhcFAptdi+/B8JgXGRpXj
 +i7CBIrGRDertMhtGMEYdFTFmr5dwFw2RIb2qsML7h4xw6gqW8CJSXjoIifxSPx8VHcQH2F
 gOSG5LWRu/ceH5Zf5gR2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JLeoHkG2KKg=:5+w1HjPKRbLrUTOEv4f9f9
 jrnJN1WnPlbk6Tgife9smpwUlIoMTrKyIjxthxnL7iLMLX6e7sMKaPRljo5OL1LCqAW4I6GJ+
 2MBSHZqmgq0KcY2kc6XFrokV1CallcJWvFbw77mZRqV1w9O+2BfLKNWFBpxhs2Fy95IrDuP20
 rhMjI83ZVT5FA0ZgVWZlYHjxufBgSuDSjkMQGxQFCyUFure9A+bgvNS5qjDOnFm5nkJY4Kz/w
 V9GFEV7WQ74JefsG/rLQOruXDXdU39gfKv+0HXjsEAdNqsRa0cg1cAR4Z5wFP+tqm32op2G8f
 sCkx+y6W5vH2/1FCgGxNPfBqOKQ2E/gjEiLr8QBlmZsX+IAebQStyRr/Yc5ohDCMZrs14q+1f
 uyVOI5o1NOW0RVjpYLtEen0cGsc1FJrRhXqv0XZcOf4o+/vgSg9XAHj7nX7Yh1kDLcGBcgXD9
 5VMX4O+alKuCYZE65HthX3c/4ps08Q1VX2VFvdBlPiVgx36bhutH9HIU8VkUgzIs4U9K33YY9
 BSVjZoYmZd9GznQae9M0i1ErrN0BG5RBQ5cNkerdom4oOrblIBAhkUbnac0SqEIADERy0ebNl
 yjb4OFF7SbXnYmrWmBqegRL+v+QOO2NrdVbo7WVepTBYndYX/Q87t4dJ+M3IDCM8jKOPJidRU
 7RDQiXVtRVGn6ndoKpaV7+yPXFHEEXb3hxb/QVVdACAVHy8XUsxT+0Mkr/ouB8qzEJURQ6iR9
 JNy3qZqVaZWMjeacGDFWfUTC0PSXImUmTRHyxF4jCR3nI068v34qEVCLP5eMoxvJTjHCG6wT7
 6jkix55yskiHkOE/aMdCMudbOEZyPmLBnplnHJv2+4hRSiu+kA=

On Mon, Apr 25, 2022 at 9:42 AM Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Mon. 25 Apr 2022 at 15:50, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Apr 25, 2022 at 8:17 AM Vincent MAILHOL> <mailhol.vincent@wanad=
oo.fr> wrote:
> > > When I run W=3D2, I want to only see the warnings of the file I am
> > > working on. So I find it useful to fix the W=3D2 warnings which
> > > show up when building other files to not get spammed by
> > > irrelevant issues and to simplify the triage.
> > >
> > > My initial message lacked the rationale. I will add additional
> > > explanations in the v2 of this patch.
> >
> > I agree this is worth fixing if we want to make W=3D2 have any meaning =
at all.
> >
> > Your approach is probably fine. We could try to improve this by compari=
ng
> > against the list from include/uapi/asm-generic/unistd.h instead of the =
i386
> > list. I suppose that would involve rewriting the script into a simpler =
one,
> > but I'm not sure if anyone has an interest in working on this.
>
> If someone wants to do it, great, but I do not have the
> confidence to do it myself so I hope you will forgive me for
> taking a pass here.

Sure, no worries.

> Another alternative I considered was to only call
> checksyscalls.sh when doing a 'make all'. This way, we keep the
> warning but people won=E2=80=99t be spammed when building sub projects
> because the script would not be executed.

Right, I like that as well, one less thing to be done for every
iterative make as well. The syscall table really doesn't change
all that much that this needs to be run by most developers.

      Arnd
