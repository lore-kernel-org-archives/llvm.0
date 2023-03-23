Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658EDC959
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 20:01:27 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id cu12so8772927pfb.13
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=IPZIkew3dFtjmZdaViTjyD0HscLUwPXqPripmrMsr3WTFFmpjru7uOEiW5MdR0VV95
         3AkjKWS+SSGR66Z2HcB5pk7YSGalu08/hGwoMnkFnDkE2qoAQbU1GvgUd6upSXxx5s2P
         WgA85mghqIhhEYMtWiZMDw6eVS30vmwumoj8UFiy4jXPgOQpsvTsmsWOaQLIrepOjNLG
         23PQbOvHd/lWhmQ57R9lQXqXoeGABGhKFPHzTLsKICBt+2gzhqsz8P/8SexMqUTFcc6H
         UOF5X9dx/gsFR66RqsvJo3OswMwtQs/bMnp7PF1XkJIv33y55T3bQzLy+NDa36XNhCpS
         +QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=YhVqEEJD4IeYp57AJiVJdLX5Tu3htajKqBi1TQ0O8mq/F1k6kIlk9dqXgM1a9gjyqx
         6mzNw1EbZTEhIHW0eG6mExdiMiakq7b/na1UAgOuxTQRsv82B9SqP0cInbnSsrsqMbQV
         OLYz64nR3tHEi+A3ez29A6QE797bzUcIOWpoZsdY8VoFeRCy2jlugvd0W/pGLOdOAZO8
         t/W9fY89JHk5lyJei7+X1XLAWZAu8KSWJ9Zd7JOIToGrjsS2K/STJTOUjfmF3zo2QXOD
         tRGjuw5xlGzcGava6mTFkC2wLQ5j+kO6tRAFZQU7gGeA4mgzhGoY/RIX7VhDp02B8QHx
         z9MA==
X-Gm-Message-State: AO0yUKWNXWeO3lsNcrVHnl9MCHwD/9pQ7uuNu3q1unGnSbvLT9JcgTk1
	a2ElM5v+ilKaIekYMqCI9EGAJ6IkzOAy/skbnm8ErA==
X-Google-Smtp-Source: AK7set+ozY4YViDqnsSitk2Wr074yCOGB0DUpWwEKn9HjfwuqHnY07bD2pSglnB1LUnHagdMFzX9OQx8JdW2HNZ3kOw=
X-Received: by 2002:a65:484d:0:b0:503:354c:41ad with SMTP id
 i13-20020a65484d000000b00503354c41admr2238413pgs.11.1679601686525; Thu, 23
 Mar 2023 13:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us> <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Thu, 23 Mar 2023 13:01:15 -0700
Message-ID: <CAFP8O3+UO0x9aETSnOkL7=473mX0wrt+ueuB9UgOJaf+N0p7gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 11:26=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Feb 24, 2023 at 7:58=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:
> >
> > Alexandre Ghiti <alex@ghiti.fr> writes:
> >
> > > +cc linux-kbuild, llvm, Nathan, Nick
> > >
> > > On 2/15/23 15:36, Alexandre Ghiti wrote:
> > >> From: Alexandre Ghiti <alex@ghiti.fr>
> > >>
> > > I tried a lot of things, but I struggle to understand, does anyone ha=
ve
> > > any idea? FYI, the same problem happens with LLVM.
>
> Off the top of my head, no idea.
>
> (Maybe as a follow up to this series, I wonder if pursuing
> ARCH_HAS_RELR for ARCH=3Driscv is worthwhile?)

(I had thought about this for my own fun, but the currently only
implementation arch/arm64/kernel/head.S uses assembly.
Every port needs to write some assembly for the same task, which is a pity.
In FreeBSD rtld, glibc, and musl, DT_RELR code is target-independent.)


> >
> > Don't ask me *why*, but adding --emit-relocs to your linker flags solve=
s
> > "the NULL .rela.dyn" both for GCC and LLVM.
> >
> > The downside is that you end up with a bunch of .rela cruft in your
> > vmlinux.
>
> There was a patch just this week to use $(OBJCOPY) to strip these from
> vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
> https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/
> --
> Thanks,
> ~Nick Desaulniers
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
