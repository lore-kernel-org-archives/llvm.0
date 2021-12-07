Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466572CA6
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 13:00:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJmCV-1n9cvo0DP7-00K9MU for <llvm@lists.linux.dev>; Tue, 07 Dec 2021
 14:00:57 +0100
Received: by mail-wr1-f50.google.com with SMTP id d9so29325980wrw.4
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 05:00:56 -0800 (PST)
X-Gm-Message-State: AOAM530fFvsVJY+iszT6n/4lR03tiiKWXJt4oaGINcfPWd/SYEuPNMdA
	oXJFWoO8ASUWP6odofvfQRTuU1+L2j57tEHZE5g=
X-Google-Smtp-Source: ABdhPJxPTZb1NEgHTgiRZ5k7TV56wTLpaTAV0tigTfyAj6yjgVEdlWqbHmbxec81GQE5rsfdo8Evow6Ud4USOVQhzcM=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr50868012wrp.209.1638882056495;
 Tue, 07 Dec 2021 05:00:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207110228.698956-1-anders.roxell@linaro.org>
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Dec 2021 14:00:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2xJJutbwujzh57QqEAgOUwBz5aT78ZFsSam7TfZuQ_Dg@mail.gmail.com>
Message-ID: <CAK8P3a2xJJutbwujzh57QqEAgOUwBz5aT78ZFsSam7TfZuQ_Dg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang -Wimplicit-fallthrough
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zxfBt54wGeli7+VFvbphP0bz002ieVxkjTYOJoPuKotCJeUd+YM
 CmTD4fbx/TcS9cw3Pcq9EOoHPy1SKZc3uXExnFPKw+Z4huae47X8HgaIIJdo9wv3oB9DSYF
 z21641370vbjt74lp4s1fE5lxg7+peutgR2vJ1aHaQIYUDiOvv2Fk0bCtfyn9RLAr3g1AbS
 Of/nduQW6w2jU9kKRWCVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IRJWMDMO3G0=:bRL2aqAQhAnYJjUq+tvk2v
 AieYMGGUOmVzHRL0zVbHWck+zrJ4wJSm1ulZVeGFPAOmfsNjVPQ4o6Q9oLwD3KlEVT/FYOalr
 zi0OOcyiqwKB9Xhd8WDUSA3ORGCjx29e6HlBAMu1nq2pMvbt+YeLVv8y60aMeog7HbLUJOvBO
 Jr4oCtCduhH/iPPpRGC5FHeoW3Yb3IEtEm52NaJa8gUpj0H0v8Y3R0IPfKHTdoxQzXYymcUMV
 KwC+DS/BHilZ7OwoQ4iubSVq7Pb+U9pa1LFcxPpllD4Au9rBVZDW9dSpJhOnU+v98y1KWkJxi
 0OPgsdRu9VA1cqK7Tvm4widceLrP8t2XNgyX1ebAmWE0EEnNs14arbh02uBItWwdsCYkSuIgf
 ZqxyAzxN5JP3680vU30/h+3KewzpFyWVVYr6zZliRXcJ1FgSY8ZTiEiYmU1+gK7H+tgVbncqI
 4RU14qtwB6gguJB86QX59/ddHmokNoGlN+Z4GMpAA0rA4vTxTS/N1ZvWd8cLqeMwMQ2DLFIQt
 qUWzNzaLq1TYmMfmIVJmM/RJ2hbHPhIiGDYbQ6rh891C5/dr10wC/7q+MgdshotEPF/zohXid
 w7vaAzyKyzKQWnWmmPFaWS7GX0dqqzP9zrXH0aa4BdocBlSxhMCHz1rMoRKXhusKWnxLBr1l/
 YwisqzUBldwKfT4rd9VFTbVAqyCDA4ZdjWca+R3ZcW+cDY6zj3HPh30YSF3YdScerDVXw8Mag
 WhOFT3Vln4Q4k64BPJ9cW76UbDSn16m7XK/gSJbU5fr82UwunEFvBKDoPsfIo0Ga8vBJF5Arn
 VxOGSposkZE1qgOPEA0W80qXjHh5seTUpGL3QjkzQrc47+7ntU=

On Tue, Dec 7, 2021 at 12:02 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Clang warns:
>
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
>
> Clang is more pedantic than GCC, which does not warn when failing
> through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst.
> Add athe missing break to silence the warning.
>
> Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the fix!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
