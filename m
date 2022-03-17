Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23063686
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 20:36:40 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id w27so10976518lfa.5
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvCBQhvuhOwtfCqiEm+hthJDaVDRziXPjtYnTX7Px84=;
        b=Pb7vw1v8KqV7vMdCXksuJhYR/Z0TATOJk8MxAWV0eo+m1M/QQOaITAqAhXgsEaNHAn
         OVdl7RDl9aHsjXGHFD1lfodi4HhuuO7ryga88W9mXDwu5HKSYy+CK2HiGm/nVFQxpDaZ
         tIovYJ38do4gLiUn0qYtQGldgNe/vrnYRv+dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvCBQhvuhOwtfCqiEm+hthJDaVDRziXPjtYnTX7Px84=;
        b=uq+D105DV17UbVOqa/d+VLqn4ls6g16M2rsSHTDQaZwZ55m0n2Wu8piOgO4DU0hn5b
         aeQAKWqPQOF4QdR73Mk00v5VG+QImykQr3xDe01QLrjIuX1xGD6pKqlq1BYbp697VXOV
         7unsNkr9d8yiOsU9tXPAC3YfA5WV8Iw/RtEq9lExVRUkVUydTZtp+DVSPjUb+UP4reF1
         eiTsq2q3D3XNc2llm4ba0Quxx54CoHZmnVpF50BUCAanS/CC1mo2P0sKE9dh0OTO9IH3
         Q+/wVMnXCDwH1fJLK2kO8mX3vUAdYiyiaWgNuHrS/F7lEpddURdDQ44tNdHYeyGqPK9a
         QgmQ==
X-Gm-Message-State: AOAM530V79WZVzmnroM7kB5yyd6ofmj9fZWp3mJkLNsvdaAR2dBXrY+d
	tqGdZuNI2m3I5va5GybvGjL3dhvCVtPKrXplDbE=
X-Google-Smtp-Source: ABdhPJzpDv+08EYbfI8Zrs/nYLQppIoe7ZbvX/iVVhuIRC3ngai4NX6gk8OKUFLRWid49sbsSNC8Qg==
X-Received: by 2002:ac2:5fc1:0:b0:448:2915:3306 with SMTP id q1-20020ac25fc1000000b0044829153306mr3884707lfg.109.1647549398570;
        Thu, 17 Mar 2022 13:36:38 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id k5-20020a2e2405000000b0024801a68041sm518920ljk.128.2022.03.17.13.36.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 13:36:37 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id o6so8822889ljp.3
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 13:36:36 -0700 (PDT)
X-Received: by 2002:a2e:a78f:0:b0:249:21ce:6d53 with SMTP id
 c15-20020a2ea78f000000b0024921ce6d53mr4013908ljf.164.1647549396155; Thu, 17
 Mar 2022 13:36:36 -0700 (PDT)
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
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com> <878rt8gwxa.fsf@oldenburg.str.redhat.com>
In-Reply-To: <878rt8gwxa.fsf@oldenburg.str.redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 13:36:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZtg-E5s1CEZgaSE=e38vFoP3y2aV-4R82jqmcUoD0Aw@mail.gmail.com>
Message-ID: <CAHk-=wiZtg-E5s1CEZgaSE=e38vFoP3y2aV-4R82jqmcUoD0Aw@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Florian Weimer <fweimer@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 1:13 PM Florian Weimer <fweimer@redhat.com> wrote:
>
> * Linus Torvalds:
>
> > You can actually operate on EFLAGS at multiple granularities.
> >
> >  - normal pushf/popf. Don't do it unless you are doing system software.
>
> There's one exception: PUSHF/twiddle/POPF/PUSHF/compare is the
> recommended sequence to detect CPUID support on i386 (in userspace and
> elsewhere).

Yeah.

I do think that hand-crafted sequences using pushf/popf work. But I
think they should be in one single inline asm statement.

Obviously the kernel use of

        asm volatile("# __raw_save_flags\n\t"
                     "pushf ; pop %0"
                     : "=rm" (flags)
                     : /* no input */
                     : "memory");

is exactly that (and yes, I can well believe that we should make "=rm"
be "=r"), or at least show that the "m" case is much more expensive
some way).

Is it optimal that we put the push/pop right next to each other? No.
But it avoids a *lot* of problems.

And is that "memory" clobber because it modifies the memory location
just below the current stack pointer?

No, not really - outside the kernel that might be an issue, but we
already have to build the kernel with -mno-red-zone, so if the
compiler uses that memory location, that would be a *HUGE* compiler
bug already.

So the "memory" clobber has absolutely nothing to do with the fact
that 'pushf' updates the stack pointer, writes to that location, and
the popf then undoes it.

It's literally because we don't want the compiler to move non-spill
memory accesses around it (or other asm statements wiht memory
clobbers), regardless of the fact that the sequence doesn't really
read or write memory in any way that is relevant to the compiler.

> >  - you can use lahf/sahc to load/store only the arithmetic flags
> > into/from AH. Deprecated, and going away, but historically supported.
>
> And these instructions were missing from the original long mode, but
> they were added back.

They're also actively being deprecated, so the "adding back" ends up
being (maybe) temporary.

> GCC doesn't have barriers in the built-ins (if we are talking about
> __builtin_ia32_readeflags_u64 and __builtin_ia32_writeeflags_u64).  I
> expect they are actually pretty useless, and were merely added for
> completeness of the intrinsics headers.

Yeah, without any kinds of ordering guarantees, I think those builtins
are basically only so in name. They might as well return a random
value - they're not *useful*, because they don't have any defined
behavior.

I mean, we *could* certainly use "read eflags" in the kernel, and yes,
in theory it would be lovely if we didn't have to encode it as a
"pushf/pop" sequence, and the compiler tracked the stack pointer for
us, and perhaps combined it with other stack pointer changes to the
point where the "popf" would never happen, it would just undo the %rsp
change at function exit time.

So yes, a builtin can improve code generation.

But if there is no documented barrier guarantees, how do we know that
the read of the eflags the compiler does doesn't migrate around the
code that sets IF or whatever?

So then we'd need compiler intrinsics for 'sti' and 'cli' too. And
then we'd need to have a way to describe the ordering requirements for
*those* wrt all the other things we do (ie locks or whatever other
code that need to be protected from interrupts).

None of which exists.

And even if it ends up existing in newer compiler versions, we'd have
to wait for the better part of a decade (or more) for that to have
percolated everywhere.

And even _then_, the builtin syntax is often easily clumsier and less
flexible than what we get with inline asm (I'm thinking of the
fundamentally mis-designed memory ordering intrinsics).

                    Linus
