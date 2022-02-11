Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FD7E
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 19:25:48 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id fy20so24777381ejc.0
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 11:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GD2hJleO+BGH7uHOhMKE9GqyrPE46e0JW2MnbUpSxGM=;
        b=drfDVDdeD8zFrAGVCcIkHw8cHfErxBrAfhUyN91kJxJKe7SFJCF1p34U300RUKCKXs
         IsYGGcezgrgOoB2pMWJkGVYIZH1t3Nf9qUroRrLaUJP2QZxM6apgtBrpZC2+QmcgpLLH
         BD8DCL8/XZztvmMGrPeUUFBlGgIPvar6eCDf/qW0jcwBavP4r176sqNGpI3+zJ8HJf6b
         YcnRoVVXqfafFaxH9MB2a3CJ9kQdcIWYkfLxOdjlip+Ux+iD13NsD/2y86Jyw+KhmLjX
         A6Gq5jqdYkVmxjgRrMeXlf4v46aWr5kSthyjIVdiJBf0Z6drQa+3kt33IEpNGLCsuKSI
         RAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GD2hJleO+BGH7uHOhMKE9GqyrPE46e0JW2MnbUpSxGM=;
        b=e360jN5eixrnUTrO9/C+uJkhrGw9eOQXB7AdDCXzRETGMtKHlLLJiDmwDyTncjItLU
         PZcEigk2XcMBYQdXMkhgOwQmZZ94oAY1Jlfgoqv4dCKNj3OZeUiRYWdOzI6MgpENJl7S
         eHZO+7ifYNziK79vS0TtKMqZ4QbVmcLljXFmAM9wDvqc/B6Y1vSosc4MFs0QrOTRO3He
         VT3eHLnRy/zfu+L9xi9S3p710OPkwXKCxOnjiS5ua2dd0O0dbt2g8NO8S/zRiSCUIq1D
         A3Pb5pbDOxX1sNUxH0z8WKfRKsZSCigWW2DC+yhxt/Jg6IzpkPkf6pL9Eb+WPfAF5hAi
         ooJA==
X-Gm-Message-State: AOAM533eGfkhPvIY6ReJHiOZ3JH0BqvVnWS72i2z5x+VNwoSMzNnym1v
	A/u7TlDlFDlD9RgcxSLcJ4yjYuXzMrX7nfVi2xjA
X-Google-Smtp-Source: ABdhPJypX/j9HQ9UKdN5Q/EButffbsswHumKPBUPD8F3DELLeUuIF/73MuElgNl5Ate/M9VWPJk6xBwOmP/PC1qeyu4=
X-Received: by 2002:a17:906:2811:: with SMTP id r17mr2621343ejc.31.1644607546332;
 Fri, 11 Feb 2022 11:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com> <20220210223134.233757-1-morbo@google.com>
 <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com>
In-Reply-To: <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 11 Feb 2022 11:25:34 -0800
Message-ID: <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
Subject: Re: [PATCH v4] x86: use builtins to read eflags
To: David Laight <David.Laight@aculab.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 8:40 AM David Laight <David.Laight@aculab.com> wrote:
> From: Bill Wendling
> > Sent: 10 February 2022 22:32
> >
> > GCC and Clang both have builtins to read and write the EFLAGS register.
> > This allows the compiler to determine the best way to generate this
> > code, which can improve code generation.
> >
> > This issue arose due to Clang's issue with the "=rm" constraint.  Clang
> > chooses to be conservative in these situations, and so uses memory
> > instead of registers. This is a known issue, which is currently being
> > addressed.
> >
> > However, using builtins is beneficial in general, because it removes the
> > burden of determining what's the way to read the flags register from the
> > programmer and places it on to the compiler, which has the information
> > needed to make that decision.
>
> Except that neither gcc nor clang attempt to make that decision.
> They always do pushf; pop ax;
>
It looks like both GCC and Clang pop into virtual registers. The
register allocator is then able to determine if it can allocate a
physical register or if a stack slot is required.

> ...
> > v4: - Clang now no longer generates stack frames when using these builtins.
> >     - Corrected misspellings.
>
> While clang 'head' has been fixed, it seems a bit premature to say
> it is 'fixed' enough for all clang builds to use the builtin.
>
True, but it's been cherry-picked into the clang 14.0.0 branch, which
is scheduled for release in March.

> Seems better to change it (back) to "=r" and comment that this
> is currently as good as __builtin_ia32_readeflags_u64() and that
> clang makes a 'pigs breakfast' of "=rm" - which has only marginal
> benefit.
>
That would be okay as far as code generation is concerned, but it does
place the burden of correctness back on the programmer. Also, it was
that at some point, but was changed to "=rm" here. :-)

commit ab94fcf528d127fcb490175512a8910f37e5b346
Author: H. Peter Anvin <hpa@zytor.com>
Date:   Tue Aug 25 16:47:16 2009 -0700

    x86: allow "=rm" in native_save_fl()

    This is a partial revert of f1f029c7bfbf4ee1918b90a431ab823bed812504.

    "=rm" is allowed in this context, because "pop" is explicitly defined
    to adjust the stack pointer *before* it evaluates its effective
    address, if it has one.  Thus, we do end up writing to the correct
    address even if we use an on-stack memory argument.

    The original reporter for f1f029c7bfbf4ee1918b90a431ab823bed812504 was
    apparently using a broken x86 simulator.

    [ Impact: performance ]

    Signed-off-by: H. Peter Anvin <hpa@zytor.com>
    Cc: Gabe Black <spamforgabe@umich.edu>


> Changing to __builtin_ia32_readeflags_u64() may be worth while
> if/when the compilers will generate pushf; pop mem; for it.
>
I was able to come up with an example where GCC generates "pushf ; pop mem":

  https://godbolt.org/z/9rocjdoaK

(Clang generates a variation of "pop mem," and is horrible code, but
it's meant for demonstration purposes only.) One interesting thing
about the use of the builtins is that if at all possible, the "pop"
instruction may be moved away from the "pushf" if it's safe and would
reduce register pressure.

-bw
