Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6FB4A9F
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 21:46:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p15so485550lfk.8
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPG2uGymrQaAjdz0Rd104PLEPknS8uFaRtBuaevCxHA=;
        b=UTEyURlny0M3Sp02wOFqvyBlNYSNglScLLJjYWs3wxSUqoupmURo3mj/gHB5Z5k5pX
         HPh7nIvN1DWQ+l9DF+cwJKe+pvcdckJZl8UzsZy52K+blalTvbo7u0/7Tl3LRt1+aGoJ
         f+zhtUKsWIWSZtd2Flxj/uhYm1p/LwCawziUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPG2uGymrQaAjdz0Rd104PLEPknS8uFaRtBuaevCxHA=;
        b=EE7CJB7k+V1RXD4GjijToZMjGtTBomY8jZ3yzUn9EDFCTo/IOpxajN15LozsyZHq1K
         /sN/C8oJRX2ZRLwh5OFQwGWQ9QB1ttVVAvzzFAzhp4i9ZU+zoP9RWkdttOTQKpm7Qo4y
         EFZFWu+m1O2RidA9V1bjrKFn7BLZzx+uN8k97i6j3PE+lzozBpxz3PrZoKYy69r3Lkv/
         sLoXNPheRbXJ8qSwdGylk322fzBQRiJJEb7VCNdmUISKdsthTUTrjvEkvKmz+89Td3kZ
         PfoIYC/7rtodY04ArbeX0knkk3wW3FpPY7wx4P1qULevQL8ao0DN6QHFxheiZBwdHLKg
         6VnQ==
X-Gm-Message-State: AOAM533NdzU6UbW5ktPbRrMy3hoQ4lzeW6zQ/CLRswtJ4HVoLl/VwgB8
	Y71ZOH0kiGPgKDxBV1pU5ovi07szQzos+PQ3Yww=
X-Google-Smtp-Source: ABdhPJwRqBBHHUqH530vGNQcOT773Bw0Yfajqu/4vHuRrxMVN/lFBA3nowNgupP9FbjEr+oLjxEDbw==
X-Received: by 2002:a05:6512:3984:b0:447:6097:fb8f with SMTP id j4-20020a056512398400b004476097fb8fmr4237751lfu.166.1647553578728;
        Thu, 17 Mar 2022 14:46:18 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e3517000000b00247ebea6422sm555459ljz.13.2022.03.17.14.46.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 14:46:18 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 17so9039364lji.1
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:46:18 -0700 (PDT)
X-Received: by 2002:a2e:a78f:0:b0:249:21ce:6d53 with SMTP id
 c15-20020a2ea78f000000b0024921ce6d53mr4157427ljf.164.1647553190688; Thu, 17
 Mar 2022 14:39:50 -0700 (PDT)
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
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com> <fd89333f-e470-a295-baf6-a736c55caeb5@citrix.com>
In-Reply-To: <fd89333f-e470-a295-baf6-a736c55caeb5@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 14:39:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj47CG0Y9GOFmGg4AYFvXhRFDX9x7E2Uxo9k-UX2wgR4g@mail.gmail.com>
Message-ID: <CAHk-=wj47CG0Y9GOFmGg4AYFvXhRFDX9x7E2Uxo9k-UX2wgR4g@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 2:06 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> I was idly playing with this builtin in response to the thread, and
> found that GCC has a far more serious bug than Clang had.

Heh. Yeah, that's bad.

But it kind of fits my argument: compiler intrinsics aren't
necessarily such a wonderful thing. They hardly get any testing at all
unless they are some very very core thing.

I will personally *always* prefer some generic "escape clause" over a
compiler that thinks it knows better.

I think compiler people should see inline asm as a really *good*
thing, because it allows people to have that "I'm going to do
something that nobody normal does, look away now" kind of escape
clause, letting the compiler concentrate on the things it does best.

Yes, I realize inline asm isn't something compiler people love. And
yes, I realize that it might not give optimal code.

But think of it a bit like casts - it adds complexity to the language,
and it might make some optimizations harder or even impossible - but
it makes the language much more powerful and allows you to do things
that you simply couldn't do without it.

There's a reason people use C instead of Pascal or FORTRAN. Those
casts, and that pointer arithmetic - the bane of many optimizations -
are really really good things.

Intrinsics should generally be shunned, not seen as a "this is an
alternative to inline asm". They should only exist for situations
where you can show "look, I can do so much better", and have a
test-suite for it and a real-life case where it gives you a clear and
undeniable uplift on a meaningful load.

(And here I separate 'intrinsic' and generic compiler builtins. I love
the builtins that allow me to tell the compiler something, or the
compiler to tell me something about the code: __builtin_unreachable()
and __builtin_constant_p() are both wonderful examples of those kinds
of things)

But an intrinsic for some odd target-specific thing that can't even be
portably generalized? Give me inline asm any day.

We can do things with inline asms that the compiler can't even _dream_
of, like the whole instruction rewriting thing we use.

I'd much rather have a powerful generic concept (eg "asm goto" is
lovely) than a specialized intrinsic that does only one thing, and
doesn't even do it well because it's untested and badly defined.

               Linus
