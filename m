Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32793D9F
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 23:24:46 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id w187so770082ybe.2
        for <llvm@lists.linux.dev>; Tue, 10 May 2022 16:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GokfEYQ6AnMfT1CyMpbI+Gftvn5q5QVicSRCEy9ThmQ=;
        b=KWCH6r0vimy26dO9c4bnpc0LXdNv431Duk31s6icPffCtCoy8KbOG5YQl+7L+RSsFy
         wtjF4q/SNZMeTeAPSDO/kstmwZg3DcdltRM74a7K8jTDNZhjuahnSR5X/PKw2tXM0Bi4
         f9Ob1xD8+arizyNmHuq7avi+v0GSaDQhfgFie11K9KuUmVVnwNACD6FCHpGm5wm/TU5f
         JCmwaBZOLzbwlxaTpdSb0otS0q0d6e6f4dd/GUTeeZHhBj5sEjypucdJQqG68UE0yfPA
         VgHZ7SI6yGo5MBlpQKwGdUSafkYZIEB239C02WqkiMx0sNeO47SuCOZawAJlb2oztSQI
         z2qg==
X-Gm-Message-State: AOAM533kX13W24U9mHw3ggTisTjsaoCKGzRDe3j8EIhsRxy9WHz9/lJr
	EVaep29Pur0x5h13LOSpnBo2IOQut3yHAytzJg4=
X-Google-Smtp-Source: ABdhPJwE8F5hcuKqkn4TMhkA3oM9+LLKYIdOYQg8ptuz+R9ZAxiIkoj9TzqpxOc5KyK8ccrijzGmHwh61Ye2VR+W/pc=
X-Received: by 2002:a25:76c6:0:b0:648:5616:ca50 with SMTP id
 r189-20020a2576c6000000b006485616ca50mr22374768ybc.423.1652225085812; Tue, 10
 May 2022 16:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr> <CAKwvOdnShyGvW9cuDuqQS+uvY7DHSmh8-55R1Bx_dxej8YQRHg@mail.gmail.com>
In-Reply-To: <CAKwvOdnShyGvW9cuDuqQS+uvY7DHSmh8-55R1Bx_dxej8YQRHg@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 11 May 2022 08:24:34 +0900
Message-ID: <CAMZ6RqKD9O8OHVUGCOYK1BXm7SCOkWbxCsSb=6jjfzgKn61JEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed. 11 May 2022 at 07:14, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Tue, May 10, 2022 at 7:26 AM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
> >
> > The compilers provides some builtin expression equivalent to the
> > ffs(), __ffs() and ffz() function of the kernel. The kernel uses
> > optimized assembly which produces better code than the builtin
> > functions. However, such assembly code can not be optimized when used
> > on constant expression.
> >
> > This series relies on __builtin_constant_p to select the optimal solution:
> >
> >   * use kernel assembly for non constant expressions
> >
> >   * use compiler's __builtin function for constant expressions.
> >
> > I also think that the fls() and fls64() can be optimized in a similar
> > way, using __builtin_ctz() and __builtin_ctzll() but it is a bit less
> > trivial so I want to focus on this series first. If it get accepted, I
> > will then work on those two additionnal function.
> >
> >
> > ** Statistics **
> >
> > On a allyesconfig, before applying this series, I get:
> >
> > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > | 1081
> >
> > After applying this series:
> >
> > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > | 792
> >
> > So, roughly 26.7% of the call to either ffs() or __ffs() were using
> > constant expression and can be optimized (I did not produce the
> > figures for ffz()).
>
> These stats are interesting; consider putting them on patch 1/2 commit
> message though (in addition to the cover letter). (Sending thoughts on
> 1/2 next).

The fact is that patch 1/2 changes ffs() and patch 2/2 changes
__ffs(). For v2, I will run the stats on each patch separately in
order not to mix the results.

> >
> > (tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)
>
> Here's the same measure of x86_64 allyesconfig (./scripts/config -d
> CONFIG_HINIC) at 9be9ed2612b5aedb52a2c240edb1630b6b743cb6 with ToT
> LLVM (~clang-15):
>
> Before:
> $ objdump -d vmlinux.o | grep bsf | wc -l
> 1454
>
> After:
> $ objdump -d vmlinux.o | grep bsf | wc -l
> 1070
>
> -26.4% :)

Roughly same ratio. I am just surprise that the absolute number
are different:

  * GCC before: 1081, after 792
  * clang before 1454, after 1070

I wonder why clang produces more bsf instructions than GCC?

Also, on a side note, I am not the first one to realize that
__builtin_ffs() is able to optimize the constant variable. Some
people already used it to locally:

| $ git grep __builtin_ffs | wc -l
| 80

> >
> >
> > Vincent Mailhol (2):
> >   x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
> >     expressions
> >   x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
> >     expressions
> >
> >  arch/x86/include/asm/bitops.h | 65 +++++++++++++++++++++--------------
> >  1 file changed, 40 insertions(+), 25 deletions(-)
> >
> > --
> > 2.35.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
