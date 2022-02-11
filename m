Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561897F
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 23:34:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z13so420320edc.12
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 15:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rteO8hmsqvWS5TzaahvTaNw6Vcr2tYr2Ng0DScuG/u4=;
        b=D5CJ80Ys6vjr4MzEeX0n32e5+AF9VgVmFwxGHen7st7grLT9jReFAEo+Ny8NMiGFR/
         gGpfJlh2TiuVucej1bJwXvXwRBMBnjd0N5i3SA97iaBBWp2MW2nOLZhUBvFupfB2Cq/9
         hICuGdCJkV8z7IwIp1bEjqjCPDOiy0ulD1Qt0oQc2fPecW6N7iPLNumHgxgdu088wvlz
         rjarJqG2HgbQdexVQoUQy0xOT0PWcV/HiBhbe88vYSZJGTyS3OiriAd7vCcFNApexQYB
         9ZTPn5mu4rMbDrxi9MeSmKav9v1IL92nOAn3ljYzE+rvck42YMWXBMClBLrJ7IXDd7eC
         h7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rteO8hmsqvWS5TzaahvTaNw6Vcr2tYr2Ng0DScuG/u4=;
        b=oNpOxXFVMuYC2szZ9eaFVPnidrr5KzDDHxKJ31fRvd+Hd+qzWmIRfQmRB4A0d6ab8U
         PWt6rQ9kYUKwOh9ZPi+M5uL/Vbe2Hrw0Tz2ru1hiSRWrZIvQnHeYvcodQKFJGmGUN90F
         ymtnQuZRYLAzpGtkS/t658QQdPUYGw0XC0H965sXubR5J3umBYEEbXT2WmXp11wPiZ26
         qx3IiNxp7FKAOEuXm5/qAgsUi4DJ9sgzxhWhh32okRZxiKc7eyyu0WGkv4KyPE/i21jH
         Hd16aElwtWAktAM2sp6f+0IJpV7jVtgWoMIBdEzNzYPqVkQMbguN/74CfMjaWAd6rPPA
         m2Iw==
X-Gm-Message-State: AOAM531pcn/iJHpFaARXWZ5/mWaa3WUceo8ZddJBdQd3Jsxm0eRHraU7
	YaQjIeNRdHDVHSsek0jwIxwenR4bWh/mc0te0FdP
X-Google-Smtp-Source: ABdhPJy6uJNCk5UYrKhEXTYpMQGPUr/ePYBIQV7ya4gcQZ5mRq/9auBnjQPthgA9Z4UGA/NOugGQdAD5AOBIJHy+hcw=
X-Received: by 2002:a05:6402:7ce:: with SMTP id u14mr4353715edy.35.1644622444358;
 Fri, 11 Feb 2022 15:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com> <20220210223134.233757-1-morbo@google.com>
 <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com> <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
 <6b83fa302b974f749c60fc6c456e055f@AcuMS.aculab.com>
In-Reply-To: <6b83fa302b974f749c60fc6c456e055f@AcuMS.aculab.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 11 Feb 2022 15:33:53 -0800
Message-ID: <CAGG=3QVUHv-R61cHLEO1JgF=q_qY9sO53tmRYWLfZve0SYi7iw@mail.gmail.com>
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

On Fri, Feb 11, 2022 at 2:10 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Bill Wendling > Sent: 11 February 2022 19:26
> >
> > On Fri, Feb 11, 2022 at 8:40 AM David Laight <David.Laight@aculab.com> wrote:
> > > From: Bill Wendling
> > > > Sent: 10 February 2022 22:32
> > > >
> > > > GCC and Clang both have builtins to read and write the EFLAGS register.
> > > > This allows the compiler to determine the best way to generate this
> > > > code, which can improve code generation.
> > > >
> > > > This issue arose due to Clang's issue with the "=rm" constraint.  Clang
> > > > chooses to be conservative in these situations, and so uses memory
> > > > instead of registers. This is a known issue, which is currently being
> > > > addressed.
> > > >
> > > > However, using builtins is beneficial in general, because it removes the
> > > > burden of determining what's the way to read the flags register from the
> > > > programmer and places it on to the compiler, which has the information
> > > > needed to make that decision.
> > >
> > > Except that neither gcc nor clang attempt to make that decision.
> > > They always do pushf; pop ax;
> > >
> > It looks like both GCC and Clang pop into virtual registers. The
> > register allocator is then able to determine if it can allocate a
> > physical register or if a stack slot is required.
>
> Doing:
>         int fl;
>         void f(void) { fl = __builtin_ia32_readeflags_u64(); }
> Seems to use register.
> If it pops to a virtual register it will probably never pop
> into a real target location.
>
> See https://godbolt.org/z/8aY8o8rhe
>
Yes, it does produce the appropriate code. What I meant was that,
internal to the compiler, the code that's generated before register
allocation contains "virtual" registers. I.e., registers that would
exist if the machine had an infinite number of registers to use. It's
the job of the register allocator to replace those virtual registers
with physical ones, or with spills to memory if no registers are
available. My (completely made up) example was to show that in an
extreme case where no registers are available, and no amount of code
motion can alleviate the register pressure, then both clang and gcc
will produce the appropriate spills to memory.

> But performance wise the pop+mov is just one byte longer.
> Instruction decode time might be higher for two instruction, but since
> 'pop mem' generates 2 uops (intel) it may be constrained to the first
> decoder (I can't rememberthe exact details), but the separate pop+mov
> can be decoded in parallel - so could end up faster.
>
It's the spill to memory that I'm trying to avoid here. I'm not
concerned about a "pop ; mov" combination (though even that is one
instruction too many except in the most extreme cases).

> Actual execution time (if that makes any sense) is really the same.
> Two operations, one pop and one memory write.
>
> I bet you'd be hard pressed to find a piece of code where it even made
> a consistent difference.
>
> > > ...
> > > > v4: - Clang now no longer generates stack frames when using these builtins.
> > > >     - Corrected misspellings.
> > >
> > > While clang 'head' has been fixed, it seems a bit premature to say
> > > it is 'fixed' enough for all clang builds to use the builtin.
> > >
> > True, but it's been cherry-picked into the clang 14.0.0 branch, which
> > is scheduled for release in March.
> >
> > > Seems better to change it (back) to "=r" and comment that this
> > > is currently as good as __builtin_ia32_readeflags_u64() and that
> > > clang makes a 'pigs breakfast' of "=rm" - which has only marginal
> > > benefit.
> > >
> > That would be okay as far as code generation is concerned, but it does
> > place the burden of correctness back on the programmer. Also, it was
> > that at some point, but was changed to "=rm" here. :-)
>
> As I said, a comment should stop the bounce.
>
The constraints on this piece of code went from "=g" to "=r" to "=rm".
Which is the correct one and why? The last will apparently work in all
situations, because the compiler's left to determine the output
destination: register or memory. The "=r" constraint may fail if a
register cannot be allocated for some reason.

> ...
> > I was able to come up with an example where GCC generates "pushf ; pop mem":
> >
> >   https://godbolt.org/z/9rocjdoaK
> >
> > (Clang generates a variation of "pop mem," and is horrible code, but
> > it's meant for demonstration purposes only.) One interesting thing
> > about the use of the builtins is that if at all possible, the "pop"
> > instruction may be moved away from the "pushf" if it's safe and would
> > reduce register pressure.
>
> I wouldn't trust the compiler to get stack pointer relative accesses
> right if it does move them apart.
> Definitely scope for horrid bugs ;-)
>
Compilers are pretty good at knowing such things and doing it correctly.

-bw
