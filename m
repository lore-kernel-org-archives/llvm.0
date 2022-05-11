Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063993218
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 23:24:10 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id r1so6759221ybo.7
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oy3Pm5sCLuohvb8vkD/fkUbAx0+U5niUi5E5iwOTC80=;
        b=JRxSBCm0nXXJHaBWqxbiMHeKZAexYeIo9T9MW7BYFLF5Fm7zGTTU8ugcnXSrY0OXlG
         TxkADkurVdAVqqsfJIZjzvHGuM6nX5PV53Z1h5dGekkDBYYx1fgSz4aiq/++cZHDjARR
         CmAO4Zl6/oVSCzGUdkuMG+it+NnwB76hAw82A39h/6KaZBNJNAoG0aEXt2M0+Ju3R2nn
         aoOkYZCDZYmxAxtTvK1R6fhAVAE1OhuCsai2VkbwsR/96v/8nNj0sjhdcwQ5hX92wK0X
         4FsR6Xg7+MKNc9pLn7tByODyq2pzyZR5dkCBW55ooV9dvHBv05TPFzYD4rwu1h6Xd1/w
         WD/g==
X-Gm-Message-State: AOAM530FEX2104cyXM8tJ32XhGThVSQpUFP1vA8Av7jFgFSS328msU8o
	ZTXG+9Vj9tYAFT0Nf3GjFdN+26TQxSZeRnx4g/A=
X-Google-Smtp-Source: ABdhPJyVDRbFRlLmXJHpnwBSAwDxCMiSkisNBqSmSTztcJmphl3CHpb5Ya+K6Txjjw+vGr104VZX3qvLzgIdCyttuZ4=
X-Received: by 2002:a25:cb4b:0:b0:645:d702:eb15 with SMTP id
 b72-20020a25cb4b000000b00645d702eb15mr24152368ybg.500.1652311449899; Wed, 11
 May 2022 16:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220511160319.1045812-3-mailhol.vincent@wanadoo.fr> <CAKwvOdmDL3CiL11TCXQDJ2tKDbLC+72-TxXOvyO9kA6KKiruKQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmDL3CiL11TCXQDJ2tKDbLC+72-TxXOvyO9kA6KKiruKQ@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 May 2022 08:23:58 +0900
Message-ID: <CAMZ6RqJjYEpSL3bR59G4h74F_xGhns2cv_mHiG_yeLSgqrhjuQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to
 evaluate constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu. 12 May 2022 at 07:20, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Wed, May 11, 2022 at 9:04 AM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
> >
> > __ffs(x) is equivalent to (unsigned long)__builtin_ctzl(x) and ffz(x)
> > is equivalent to (unsigned long)__builtin_ctzl(~x). Because
> > __builting_ctzl() returns an int, a cast to (unsigned long) is
> > necessary to avoid potential warnings on implicit casts.
> >
> > For x86_64, the current __ffs() and ffz() implementations do not
> > produce optimized code when called with a constant expression. On the
> > contrary, the __builtin_ctzl() gets simplified into a single
> > instruction.
> >
> > However, for non constant expressions, the __ffs() and ffz() asm
> > versions of the kernel remains slightly better than the code produced
> > by GCC (it produces a useless instruction to clear eax).
> >
> > This patch uses the __builtin_constant_p() to select between the
> > kernel's __ffs()/ffz() and the __builtin_ctzl() depending on whether
> > the argument is constant or not.
> >
> > ** Statistics **
> >
> > On a allyesconfig, before applying this patch...:
> >
> > | $ objdump -d vmlinux.o | grep tzcnt | wc -l
> > | 3607
> >
> > ...and after:
> >
> > | $ objdump -d vmlinux.o | grep tzcnt | wc -l
> > | 2600
> >
> > So, roughly 27.9% of the call to either __ffs() or ffz() were using
> > constant expression and were optimized out.
> >
> > (tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)
> >
> > Note: on x86_64, the asm bsf instruction produces tzcnt when used with
> > the ret prefix (which is why we grep tzcnt instead of bsf in above
> > benchmark). c.f. [1]
> >
> > [1] commit e26a44a2d618 ("x86: Use REP BSF unconditionally")
> > http://lkml.kernel.org/r/5058741E020000780009C014@nat28.tlf.novell.com
> >
> > CC: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>
> Patch LGTM, though I find the location of the double unscores in the
> names slightly against my taste.
>
> > ---
> >  arch/x86/include/asm/bitops.h | 38 ++++++++++++++++++++++-------------
> >  1 file changed, 24 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
> > index 6ed979547086..7cf5374ce403 100644
> > --- a/arch/x86/include/asm/bitops.h
> > +++ b/arch/x86/include/asm/bitops.h
> > @@ -224,13 +224,7 @@ static __always_inline bool variable_test_bit(long nr, volatile const unsigned l
> >          ? constant_test_bit((nr), (addr))      \
> >          : variable_test_bit((nr), (addr)))
> >
> > -/**
> > - * __ffs - find first set bit in word
> > - * @word: The word to search
> > - *
> > - * Undefined if no bit exists, so code should check against 0 first.
> > - */
> > -static __always_inline unsigned long __ffs(unsigned long word)
> > +static __always_inline unsigned long __variable_ffs(unsigned long word)
>
> How about `variable___ffs`? Patch 1/2 used `variable_ffs` for `ffs`?

On a first glance, having the triple underscores in the middle of the
name seemed odd. On second thought, it is more consistent with the
rest, and I finally like the idea. Will be adopted in v3.

> >  {
> >         asm("rep; bsf %1,%0"
> >                 : "=r" (word)
> > @@ -238,13 +232,18 @@ static __always_inline unsigned long __ffs(unsigned long word)
> >         return word;
> >  }
> >
> > -/**
> > - * ffz - find first zero bit in word
> > - * @word: The word to search
> > - *
> > - * Undefined if no zero exists, so code should check against ~0UL first.
> > - */
> > -static __always_inline unsigned long ffz(unsigned long word)
> > +/**
> > + * __ffs - find first set bit in word
> > + * @word: The word to search
> > + *
> > + * Undefined if no bit exists, so code should check against 0 first.
> > + */
> > +#define __ffs(word)                            \
> > +       (__builtin_constant_p(word) ?           \
> > +        (unsigned long)__builtin_ctzl(word) :  \
> > +        __variable_ffs(word))
> > +
> > +static __always_inline unsigned long __variable_ffz(unsigned long word)
>
> `ffz` had no underscore. Regardless of `__ffs`, this should definitely
> be `variable_ffz` IMO.

ACK.

> >  {
> >         asm("rep; bsf %1,%0"
> >                 : "=r" (word)
> > @@ -252,6 +251,17 @@ static __always_inline unsigned long ffz(unsigned long word)
> >         return word;
> >  }
> >
> > +/**
> > + * ffz - find first zero bit in word
> > + * @word: The word to search
> > + *
> > + * Undefined if no zero exists, so code should check against ~0UL first.
> > + */
> > +#define ffz(word)                              \
> > +       (__builtin_constant_p(word) ?           \
> > +        (unsigned long)__builtin_ctzl(~word) : \
> > +        __variable_ffz(word))
> > +
> >  /*
> >   * __fls: find last set bit in word
> >   * @word: The word to search
> > --
> > 2.35.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
