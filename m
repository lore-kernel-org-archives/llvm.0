Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C868C7C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 06:50:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mj8a5-1oLnoU2u3B-00fEgf for <llvm@lists.linux.dev>; Mon, 25 Apr 2022
 08:50:43 +0200
Received: by mail-wr1-f47.google.com with SMTP id b19so19330754wrh.11
        for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 23:50:43 -0700 (PDT)
X-Gm-Message-State: AOAM532v88o3LBfBN8pHdUftAEKi9wdVHg5a/40eE1xM7yHXZESoAXVe
	hAGvLwAywSH9u5kZeiKYQ1R5wpOHSrnrRxwCX1U=
X-Google-Smtp-Source: ABdhPJxPmwV5WfcLnmUcvdXXaS8GyG1IsSnRTeCouUj2lCvJavpxFpqEWw5tHbS8gyEonBI8l0BcoD/6n15ffRVK4JY=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr8897626wrs.12.1650869443104; Sun, 24
 Apr 2022 23:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
 <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X> <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Apr 2022 08:50:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com>
Message-ID: <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ICLasX7u6wfQuJ/kazOhbTFyNkoqpI51q9URgbcRBOaZwfnGxD/
 3Tc8ZtNRpZaa5kSjJyAO5ka/2RFI2E+QOOo8e/5eGzCujHDJu8sfZfcV4OmuGjAEpUbCbWT
 X0khy6G/ysTBHhO4gnEE2YeZeOfQna2mJUdFw0znt7h4Fpc2riVKI9Y/ZjVERlhEa3xcVbN
 wNKunSEZdooqQj+JufhmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ueQjto8gh18=:7iGkRVxOJ9iXXyhKJXImae
 +0AyG8ZmWou0XxX2JfwDn0cQLWhgcMlu406z+a+53sancFUo4rltyMDQUm2EyxPt1IaoM9qih
 PAWRDVW9pjBntDeDnUgVGowLqDqIDYOWoVNyTv1tlPbkrcmvHptvjjcUl1Rk5EtN6/yiEU4Sh
 6rDunNO6Hvg2JxkkqQb2Jrh9gp2RkbPuVvZFKRFBVy5nwTnX60MK12WBeAV5PzL1lNZJ2t/DI
 ZVGNhn3w24W8wa2ayLN/VN+wVMzVQK78m+ShLlPT1+QhfPYU++MuUKiYfnXnhcCyRUG2aw5kp
 j/8opjjwhhqQ73pKZa57Ny2RrGmWWmEhnpZ66JRxsdwWspKmelJTsWQuEclcJWX9zNG1mAfnd
 DXvXOZAd4AlB2KUCLkD09Plob4L6yffn+anEG/pEAAQjHB7eVlPHhkEuiUHkkL+CMYqLLteW9
 jg71PU0YQBYfFluHWpamLm6iyAdeMP1jzUxwuK4YAW/3Lziivexpc/T2+r8gBeZArg62YtuP5
 VgiT8GnHF3ghigEAsdI0/dhwvNwsapEWtvvlagnxKq2JTUovTw2RClYq6fvXm7khWGO0Ew2N3
 2BhDiAXIo3mPrR94FY+MX5ERQYl6djObpD8BBn0e4wVkeKJG1fFl40hwBGF3zVsV2sgt5BTHW
 GjEb4C9yB1tPPnMZlNmhixDYYSUByLgJBc5ouY1PCvLCIWQugMswqqcMACzLTeRfDcZA=

On Mon, Apr 25, 2022 at 8:17 AM Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Mon. 25 Apr 2022 at 07:17, Nathan Chancellor <nathan@kernel.org> wrote:
> > Hi Vincent,
> >
> > On Sat, Apr 23, 2022 at 12:17:25AM +0900, Vincent Mailhol wrote:
> > > The macros defined in this file are for testing only and are purposely
> > > not used. When compiled with W=2, both gcc and clang yield some
> > > -Wunused-macros warnings. Ignore them.
> > >
> > > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > The change itself looks fine but a couple of comments:
> >
> > 1. Nick and I do not pick up patches, we rely on others to do so.
> >    Additionally, this is not really something within our domain, despite
> >    what get_maintainer.pl might say. This change should be sent to
> >    either
> >
> >    Masahiro Yamada <masahiroy@kernel.org>
> >    linux-kbuild@vger.kernel.org
> >
> >    or
> >
> >    Andrew Morton <akpm@linux-foundation.org>
> >
> >    so that it can be applied by one of them.
>
> Ack. As you pointed out, I indeed just followed get_maintainer.pl.
> I will resend a v2 to the people you pointed out (and exclude you).
>
> > 2. I am not sure that silencing warnings from W=2 is that useful, as
> >    they are unlikely to be real issues. Not to discourage you by any
> >    means but it might be more useful to focus on cleaning up warnings
> >    from W=1 and getting those promoted to regular build warnings.
>
> Normally I agree, but there is one reason to fix this W=2: this
> warning appears when building other files.
>
> Example:
> | $ make W=2 drivers/net/dummy.o
> |   CALL    scripts/checksyscalls.sh
> | <stdin>:21: warning: macro "__IGNORE_stat64" is not used [-Wunused-macros]
> | <stdin>:22: warning: macro "__IGNORE_lstat64" is not used [-Wunused-macros]
> | <stdin>:75: warning: macro "__IGNORE_llseek" is not used [-Wunused-macros]
> | <stdin>:159: warning: macro "__IGNORE_madvise1" is not used [-Wunused-macros]
> (rest of the output redacted).
>
> When I run W=2, I want to only see the warnings of the file I am
> working on. So I find it useful to fix the W=2 warnings which
> show up when building other files to not get spammed by
> irrelevant issues and to simplify the triage.
>
> My initial message lacked the rationale. I will add additional
> explanations in the v2 of this patch.

I agree this is worth fixing if we want to make W=2 have any meaning at all.

Your approach is probably fine. We could try to improve this by comparing
against the list from include/uapi/asm-generic/unistd.h instead of the i386
list. I suppose that would involve rewriting the script into a simpler one,
but I'm not sure if anyone has an interest in working on this.

       Arnd
