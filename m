Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1164A84
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 19:00:45 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id dr20so12379346ejc.6
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SWE7ZJ9hpebJWcE2cZFbACGv2btEDEVbeAE9VoY9EiI=;
        b=CZfJIPwgLVlnZ/hWoJNx1l13U+oWobomaEsiXFNSc3E9eB53oh+jwCoQRkojtujA1b
         ktLaaOnQ8y1nP8beK9ieQ2wFmdLtKQa0yIPe/u6fYJgi6W2gs7AI0IbdWZpJKUE4/Fry
         hlRz2iZhPfT3IxS9LxKkes0PVNWKqbbL9G08w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWE7ZJ9hpebJWcE2cZFbACGv2btEDEVbeAE9VoY9EiI=;
        b=cub1knRQa6ge0t0u38BJHYJUWYxEW0h++1vNnU2ETX71ZhzMFIOjzK2km9DF6myZC8
         Mgi3VEf0j1YIDlzIWPzBBpKzBOcAZBvSwB9DKCVgAHySdJ7hp7XCHFWZp4HmTEcX/rXe
         zjno+kzEHbix/IjQRwJ4rMe1NXzgN4xt0SaMWeKd1WYbFcDHBHjosGbcdW9sQ8N5HJQ+
         /wLvGhCvErLodUtMdHkSdRmZtGGe3+iz/8h6S22C5yg1EXIg3/gjcH6uzi7ivXYQV5HO
         19E0Bcr1AoW+wHZxsN7b20P2puvfjZ1sZbe9HkKlCiAWFSa+bo+j38+pcGxkhkzN+hkB
         LoRQ==
X-Gm-Message-State: AOAM532XDEt7jeK2kiyy8+pQyA9E+eFQW9Sqn0kxoV1/6Gb8D6mR5tVF
	32rIZj/dTzcV5ujDfOjPTQ2bpW0X37gcbOZlVzc=
X-Google-Smtp-Source: ABdhPJwfQCw8K/gsxahgN1rNj/aD2odnI10vDkfcIQ1vEUZ9x2Jjook4f9337xrRbVF/hdTxzTi9Dw==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id o6-20020a170906774600b006cea12e489fmr5657890ejn.551.1647543643678;
        Thu, 17 Mar 2022 12:00:43 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id qk30-20020a1709077f9e00b006dfae33d969sm425019ejc.216.2022.03.17.12.00.43
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 12:00:43 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id m12so7688805edc.12
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 12:00:43 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr3728431lfh.687.1647543162903; Thu, 17
 Mar 2022 11:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210223134.233757-1-morbo@google.com> <20220301201903.4113977-1-morbo@google.com>
 <CAGG=3QWh90r5C3gmTj9zxiJb-mwD=PGqGwZZTjAfyi1NCb1_9w@mail.gmail.com>
 <AC3D873E-A28B-41F1-8BF4-2F6F37BCEEB4@zytor.com> <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
In-Reply-To: <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 11:52:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
Message-ID: <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[ I got cc'd in the middle of the discussion, so I might be missing
some context or pointing something out that was already discussed ]

On Thu, Mar 17, 2022 at 11:00 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> > >One change you may see due to this patch is the compiler moving the
> > >"pop %..." instruction away from the "pushf" instruction. This could
> > >happen if the compiler determines that it could produce better code by
> > >doing so---e.g. to reduce register pressure. The "gcc -O2" example
> > >below shows this code movement.

Honestly, that part worries me a _lot_.

Why?

Because clang in particular has already messed up eflags handling
once, by spilling condition codes (in the form of eflags) onto the
stack, and then loading them later with a "popf".

And it did so across a function call THAT MODIFIED 'IF'. This was a
major bug in clang back in 2015 or so, and made it unusable for the
kernel.

See for example

    https://lore.kernel.org/all/CA+icZUU7y5ATSLV_0TGzi5m5deWADLmAMBkAT32FKGyUWNSJSA@mail.gmail.com/

for some kernel discussion, and separately

    https://lists.llvm.org/pipermail/llvm-dev/2015-July/088774.html

for just llvm discussions.

It is perhaps telling that the LLVM discussion I found seems to talk
more about the performance impact, not about the fact that THE
GENERATED CODE WAS WRONG.

That compiler bug would basically enable or disable interrupts in
random places - because clang developers thought that 'eflags' is only
about the condition codes.

> EFLAGS is defined as the lower 16 bits of FLAGS register, yeah?

No. EFLAGS is a 32-bit register.

A lot of the high bits end up being reserved, but not all of them. AC,
VIF/VIP are all in the upper 16 bits.

Also:

> So I don't understand your point; the finest grain resolution
> the compiler has to work with is the whole EFLAGS register, not
> individual bits like IF, DF, or AC.  (I triple checked this with the
> maintainer of LLVM's x86 backend)

You can actually operate on EFLAGS at multiple granularities.

 - normal pushf/popf. Don't do it unless you are doing system software.

 - You *can* (but you really *really* should not) operate on only the
lower 16 bits, with "popfw". Don't do it - it doesn't help, requires
an operand size override, and is just bad.

 - you can use lahf/sahc to load/store only the arithmetic flags
into/from AH. Deprecated, and going away, but historically supported.

 - you can obviously use arithmetic and setcc to modify/read the
arithmetic flags properly.

A compiler should NEVER think that it can access eflags natively with
pushf/popf. Clang thought it could do so, and clang was WRONG.

The absolutely only case that a compiler should ever worry about and
do is that last case above: arithmetic instructions that set the
flags, and 'jcc', 'setcc', 'cmov', 'adc' etc that test it./

Yes, yes, that complete mental breakdown with pushf/popf did get
fixed, but it really makes me very wary of thinking that we should
ever use a built-in that compiler writers really fundamentally got so
wrong before.

What would make me think that you'd get it right now? In user space,
you'll basically never actually see the whole system flags issues, so
your test-cases would never work or be very contrieved. You'd have to
really work at it to see the problems.

> > The memory barrier is needed for IF changes, for example.
>
> Shouldn't native_irq_disable/native_irq_enable be declaring that they
> clobber "cc" then?
> https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers

No. Once again: compilers don't understand system flags in eflags.

In fact, gcc pretty much documents that "cc" clobbers doesn't do
anything on x86, and isn't needed. It just assumes that the arithmetic
flags always get clobbered, because on x86 that's pretty much the
case. They have sometimes been added for documentation purposes in the
kernel, but that's all they are.

So you can find that "cc" clobber in a few places in the kernel, but
it's pointless.

The reason pushf/popf need to have a memory clobber is so that the
compiler will not move it around other things that have memory
clobbers.

Because memory clobbers are things that compilers *UNDERSTAND*.

Put another way: when you see that "memory" clobber in an inline asm,
don't think that it means "this modifies or uses memory".

That may be the documentation, and that may be how compiler people
think about them, but that's just wrong.

What *kernel* people think is "this makes the compiler not do stupid things".

Because compilers really don't understand things like system registers
and system flags, and the subtle issues they have, and the ordering
requirements they have. Never have, and never will.

And compilers really don't understand - or care about - things like
"cc", because compiler people think it's about arithmetic flags, and
would do things like "oh, I'll just save and restore the flags over
this since the asm modifies it".

Note that "eflags" is just the tip of the iceberg here. This is true
for a lot of other cases.

Yes, when you have something like a "disable interrupts", the compiler
really must not move memory accesses around it, because the interrupt
flag may in fact be protecting that memory access from becoming a
deadlock.

But the whole "you can't move _other_ things that you don't even
understand around this either" is equally important. A "disable
interrupts" could easily be protecting a "read and modify a CPU MSR
value" too - no real "memory" access necessarily involved, but
"memory" is the only way we can tell you "don't move this".

Particularly since both the clang people and gcc people have actively
been trying to weaken the "volatile" semantics (which would have
generally been the logically consistent model - thinking if inline asm
to be visible in the machine model, and not being able to move them
around for those reasons).

> > This feels like "let's fix LLVM by hacking the kernel in dangerous ways" once again!
>
> Even if the behavior of llvm was changed, you'd _still_ get better
> codegen for _both_ compilers by using the intrinsics.

No.

"moving instructions around a bit" is not better code generation when
the end result DOES NOT WORK.

And honestly, we have absolutely zero reason to believe that it would work.

If it turns out that "pop to memory" is a big deal for performance,
let's just change the "=rm" to "=r" and be done with it. Problem
solved. We already used to do that on the "pushf" side, but these days
we avoid "popfl" entirely and do a conditional jump over a "sti"
instead.

Because maybe moving that "pop" by a few inbstructions helps a bit,
but if you move the "pushf" noticeably, you've just created a big big
problem.

A bug you've had once already.

                 Linus
