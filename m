Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3015A5
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 14:46:43 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id r1so4435579ybo.7
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 07:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnmGA8ainxG/8m3UcH5gpShY1r3ysYYHWnV4t7QF74M=;
        b=RYahpov9g1MJ2alKojGudwt7ihgBG6QAG0p4JVW6ytu4s4/NPHsamYLDGfPDNRzTqc
         c8811VOTfcEOXZ4MmqDKftStVe6ihaiIHMwWEug0EdaBdvz2UUEvqJfo/6C29rc4+4qG
         YiwY4UHEQIdXMuQWjTofDLzJKia46+tssPQfJNWmAU/6tlpPXRyhnwhBlJ6IHfn02iWo
         JI9dWSiLz1IWR7A+eLnA3dXWQNGsO8IkgnkRwQ2s2ircCobLyYKCncGxXLUCyz6q4Fth
         mSShxZ4D5WnYTjrCeAiwCmTtREjoV42navLGrt1ubcSHsIvXrRb/XmkGh/MaBT4AZTOq
         3Cyw==
X-Gm-Message-State: AOAM533XVxe2nP/bQaIDcYUvRZp6eJjOxkBt3SQMaxmzuvY7UWwLK5Fx
	DipKgZl/IirC4DAA2qKlUOQRzeUSCFsCCY/cS1M=
X-Google-Smtp-Source: ABdhPJz133qXMWdxupMygY4BBcGRdChR+/DiYHApj1IKMWU/Q7kPKoCoY6f0TWiUlZt4lRx62X+4i0YPk2Pcj5ZyDFg=
X-Received: by 2002:a25:cb4b:0:b0:645:d702:eb15 with SMTP id
 b72-20020a25cb4b000000b00645d702eb15mr22111070ybg.500.1652280402426; Wed, 11
 May 2022 07:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr>
 <CAKwvOdnShyGvW9cuDuqQS+uvY7DHSmh8-55R1Bx_dxej8YQRHg@mail.gmail.com> <CAMZ6RqKD9O8OHVUGCOYK1BXm7SCOkWbxCsSb=6jjfzgKn61JEw@mail.gmail.com>
In-Reply-To: <CAMZ6RqKD9O8OHVUGCOYK1BXm7SCOkWbxCsSb=6jjfzgKn61JEw@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 11 May 2022 23:46:31 +0900
Message-ID: <CAMZ6RqJ5wO5RZ1bjKeeq8VOuYWM4ihBcCqf9y03GWrg_eovX-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed. 11 mai 2022 at 08:24, Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Wed. 11 May 2022 at 07:14, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > On Tue, May 10, 2022 at 7:26 AM Vincent Mailhol
> > <mailhol.vincent@wanadoo.fr> wrote:
> > >
> > > The compilers provides some builtin expression equivalent to the
> > > ffs(), __ffs() and ffz() function of the kernel. The kernel uses
> > > optimized assembly which produces better code than the builtin
> > > functions. However, such assembly code can not be optimized when used
> > > on constant expression.
> > >
> > > This series relies on __builtin_constant_p to select the optimal solution:
> > >
> > >   * use kernel assembly for non constant expressions
> > >
> > >   * use compiler's __builtin function for constant expressions.
> > >
> > > I also think that the fls() and fls64() can be optimized in a similar
> > > way, using __builtin_ctz() and __builtin_ctzll() but it is a bit less
> > > trivial so I want to focus on this series first. If it get accepted, I
> > > will then work on those two additionnal function.
> > >
> > >
> > > ** Statistics **
> > >
> > > On a allyesconfig, before applying this series, I get:
> > >
> > > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > > | 1081
> > >
> > > After applying this series:
> > >
> > > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > > | 792
> > >
> > > So, roughly 26.7% of the call to either ffs() or __ffs() were using
> > > constant expression and can be optimized (I did not produce the
> > > figures for ffz()).
> >
> > These stats are interesting; consider putting them on patch 1/2 commit
> > message though (in addition to the cover letter). (Sending thoughts on
> > 1/2 next).
>
> The fact is that patch 1/2 changes ffs() and patch 2/2 changes
> __ffs(). For v2, I will run the stats on each patch separately in
> order not to mix the results.
>
> > >
> > > (tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)
> >
> > Here's the same measure of x86_64 allyesconfig (./scripts/config -d
> > CONFIG_HINIC) at 9be9ed2612b5aedb52a2c240edb1630b6b743cb6 with ToT
> > LLVM (~clang-15):
> >
> > Before:
> > $ objdump -d vmlinux.o | grep bsf | wc -l
> > 1454
> >
> > After:
> > $ objdump -d vmlinux.o | grep bsf | wc -l
> > 1070
> >
> > -26.4% :)
>
> Roughly same ratio. I am just surprise that the absolute number
> are different:
>
>   * GCC before: 1081, after 792
>   * clang before 1454, after 1070
>
> I wonder why clang produces more bsf instructions than GCC?

Did not find the answer yet, but while looking at this, I found
another interesting thing: on x86_64 the bsf instruction produces
tzcnt when used with the ret prefix. So ffs() produces bsf assembly
instructions but __ffs() and ffz() produces tzcnt. c.f.

http://lkml.kernel.org/r/5058741E020000780009C014@nat28.tlf.novell.com

I will update the figures in v2 and benchmark both bsf and tzcnt.

> Also, on a side note, I am not the first one to realize that
> __builtin_ffs() is able to optimize the constant variable. Some
> people already used it to locally:
>
> | $ git grep __builtin_ffs | wc -l
> | 80
