Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937A173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:38:23 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id k23so29956803lje.1
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gwYi1rI+bxocddJOBVbjpZJA3AmdQnqRzO2lYmmrsgY=;
        b=Div/HhmH4RCtHWkZ1859MpQC3yiLB6TOGrzKMFds+7TNExXlYJFtR2gBv1YXbg3/D4
         4aJkSskJJm6xN9padbU03O8cy3+Q18EwG6FRBF4/zdxit9uWzLL03+lRyp1zy6R0W06g
         EDciv0skjjV2G8NFxRNEMQ3vKFUBPkWPWsHpbqKTOyANfde4s4NEVTJDh9En+nWD6WN4
         KM5TLIlFji/603qwwoHSCNYhSz7NtwJwg/l3kNSgQTnztTkMiRnc3Lz+2JqmcZJdYGx7
         QY+PjYijtP7JJ1fWJxAsgFMOgRZKdFfMQmLpnEdkms52rbp5WFJuqw2CLNA0sGN/CI8D
         WY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gwYi1rI+bxocddJOBVbjpZJA3AmdQnqRzO2lYmmrsgY=;
        b=1yKpm70CcFMbbLW2o6Sc2qFYbQQVpQKzh6TGbE1YaLbf6RpSuxnks310lDjgsW/IkV
         a2Lby+JaokzZnGutXeS9CODyN0aO7GhCJ7EB5sl0PnOuGBFUYXRuwOZ/NuWjVbYV7D2+
         QdGjONQJgfRDXvFcPyv1jiMP6WKS1dIm0CVaAlPNluX1NDR2C2fRDN3rE5V0Kbg5R+mt
         neW/mGFH3IgFwaHniE+CHDgP/z5VkFAZ1I3q/QpIph15Lkz4IbTI6HLoxSz7a2qNOyW9
         Trb/BX7j/E7f44sFl+Lwd6x4Q0N6LQtXd/Ac8pLxaYL+R/nfE1MC1SFYs7HWPtYVl9nX
         WLlg==
X-Gm-Message-State: AOAM5332wqvnsxJ252A85TjxeF/4iF2WYIl3iLRe7siez682IBBK36E3
	/o9nmhWoAcPlO23CIjO7vn213F/a6uGMBrhPI8jVxQ==
X-Google-Smtp-Source: ABdhPJx8om+XMz0h3Ay4OHau2F75Mq0XqEqyMUiAsL9iDos45N8zLgtgM/5e6sfcZWF/kfntoET6gm4rrIMTjQR8+rQ=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr6663712ljo.128.1639510701231;
 Tue, 14 Dec 2021 11:38:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213224914.1501303-1-paul@crapouillou.net>
 <20211213224914.1501303-2-paul@crapouillou.net> <YbjdQfrC+EjeJjRV@archlinux-ax161>
 <67D44R.5C6XHAZPCYVU3@crapouillou.net>
In-Reply-To: <67D44R.5C6XHAZPCYVU3@crapouillou.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Dec 2021 11:38:10 -0800
Message-ID: <CAKwvOdnC_LyvcVGE3PGZ=B+2EWweXRhsZOXsnBjU0aSXY26Frg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: boot/compressed: Disable abicalls
To: Paul Cercueil <paul@crapouillou.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, list@opendingux.net, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 11:09 AM Paul Cercueil <paul@crapouillou.net> wrote=
:
>
> Hi Nathan,
>
> Le mar., d=C3=A9c. 14 2021 at 11:06:57 -0700, Nathan Chancellor
> <nathan@kernel.org> a =C3=A9crit :
> > On Mon, Dec 13, 2021 at 10:49:12PM +0000, Paul Cercueil wrote:
> >>  Avoid complaints from Clang/LLVM by building the decompress program
> >> with
> >>  -mno-abicalls.
> >
> > What is the message?
>
> ld.lld: warning: lto.tmp: linking abicalls code with non-abicalls code
> arch/mips/kernel/head.o

That might be good to put in the commit message, as well as a link to
the corresponding issue in our issue tracker.

Though, I'm unfamiliar with that flag; removing it may allow us to
link, but it may cause problems at runtime.  It sounds like clang
supports the flag, so I have a sinking feeling this is a flag that LTO
is dropping by accident, which we've seen in the past.  Please file a
bug in the issue tracker and let's follow up there?

>
> Cheers,
> -Paul
>
> >
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>   arch/mips/boot/compressed/Makefile | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>  diff --git a/arch/mips/boot/compressed/Makefile
> >> b/arch/mips/boot/compressed/Makefile
> >>  index f27cf31b4140..4c9ecfbb0ef4 100644
> >>  --- a/arch/mips/boot/compressed/Makefile
> >>  +++ b/arch/mips/boot/compressed/Makefile
> >>  @@ -27,10 +27,10 @@ ifdef CONFIG_CPU_LOONGSON64
> >>   KBUILD_CFLAGS :=3D $(filter-out -march=3Dloongson3a, $(KBUILD_CFLAGS=
))
> >> -march=3Dmips64r2
> >>   endif
> >>
> >>  -KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS
> >> \
> >>  +KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__
> >> -D__DISABLE_EXPORTS \
> >>      -DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE)
> >> -D"VMLINUX_LOAD_ADDRESS_ULL=3D$(VMLINUX_LOAD_ADDRESS)ull"
> >>
> >>  -KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
> >>  +KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -mno-abicalls -D__ASSEMBLY__ \
> >>      -DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE) \
> >>      -DKERNEL_ENTRY=3D$(VMLINUX_ENTRY_ADDRESS)
> >>
> >>  --
> >>  2.33.0
> >>
> >>
>
>


--=20
Thanks,
~Nick Desaulniers
