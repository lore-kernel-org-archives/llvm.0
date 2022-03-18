Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13613510E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:19:48 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id r21so5124109ljp.8
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M78EIw6ekAf0vvCqp87n4OrzGuoczE5GJbQpZ5Qld+Y=;
        b=a43MN3lVdbCSoJCJ5SmBk9a6su+AMSWcor3FNmrD7eGH/VrwkCaEgLfY5TSO7taha0
         Nyn5uFudsyLT8lo7UmV2FShc9gCj9EcOw4ROgFuOg+Ey2SBtO1HcsBoe/UzGtfe4cp88
         O6/FuGjLEzXuKavL2vAGjDq1bcAEC8qSvTK2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M78EIw6ekAf0vvCqp87n4OrzGuoczE5GJbQpZ5Qld+Y=;
        b=atYx9kg1HMCucvq5yWBTzsIny/pwgKlZJ6O3u/gl6nFyPNdvnjBQBbPzclqbnUsOtX
         LmXpDpLt0DZ3DWhT55stcHM/9gu0hcu+EkL3OcI912Hfg798VQq8Ug17fT2YJ4CfcqHK
         6XCHTb1gap0SzaeBCdxuykgzmgPLGCFY480eEDPXxchiIYSB22wX96Qx610b7MTq6/CU
         KJbhEKjBWae1n4UtTOxQiHXqO7XDTWIZinow7sSXIZw+kq5lh1l0Cy8xPt1AWcqsLtfx
         XcNYEi1CNU0UOALC3z5PQoDHHesXDkxUlGiRk7jzCfpo7nHIyV9vJh8bCdnHKYzqFPd3
         7OhQ==
X-Gm-Message-State: AOAM530MIUNMsXIma1xA8w6CG6sMzZGn2uixb+ZhE9m5+bFu2I5V4JbA
	A9usD71aUoBaXdP/4x3OrruHqlrjTzUuh3l2I9k=
X-Google-Smtp-Source: ABdhPJzIW/SPmkHiD7P+1pnEPVt5ZzjRGw9dLCOG8h3hKtbctsX6oV9QmayRaBI6tCL3p2vAv9bazg==
X-Received: by 2002:a05:651c:207:b0:244:c87a:1763 with SMTP id y7-20020a05651c020700b00244c87a1763mr6650096ljn.421.1647627586843;
        Fri, 18 Mar 2022 11:19:46 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id u16-20020a196a10000000b0044662feaa4esm953474lfu.53.2022.03.18.11.19.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:19:45 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id r21so5124015ljp.8
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:19:45 -0700 (PDT)
X-Received: by 2002:a2e:804b:0:b0:247:e81f:87e9 with SMTP id
 p11-20020a2e804b000000b00247e81f87e9mr7139883ljg.176.1647627585277; Fri, 18
 Mar 2022 11:19:45 -0700 (PDT)
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
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <fd89333f-e470-a295-baf6-a736c55caeb5@citrix.com> <CAHk-=wj47CG0Y9GOFmGg4AYFvXhRFDX9x7E2Uxo9k-UX2wgR4g@mail.gmail.com>
 <83b33afc-8502-0065-60bc-3a91528632d8@kernel.org>
In-Reply-To: <83b33afc-8502-0065-60bc-3a91528632d8@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Mar 2022 11:19:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1Z_zzY7ADxaarorK5sh2xkwbcHxJTzW=bsYChWJGBGg@mail.gmail.com>
Message-ID: <CAHk-=wj1Z_zzY7ADxaarorK5sh2xkwbcHxJTzW=bsYChWJGBGg@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Andy Lutomirski <luto@kernel.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 10:59 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> I generally agree.  In this particular case, though, I will keep using
> the builtin in tools/testing/selftests/x86/helpers.h unless we actually
> hit breakage.  This is because this is *user* code, it is compiled with
> the redzone enabled, and the asm code to do the right thing when the
> redzone is enabled is too hairy for me to want to deal with it.

Yeah, redzoning is a problem for "pushf".

Or rather, it's not the redzoning itself, but the fact that the
compiler might use the word under the stack for random other things,
and the pushf will then corrupt some local variable storage.

I think it would be lovely to solve that in inline asm itself some way
- by marking the stack pointer clobbered or something.

Because you have the same issue if an inline asm might need to do a
function call - think magic calling conventions etc, but also possibly
slow-path cases.

As mentioned, it's not an issue for the kernel proper due to
-mno-red-zone which we need for entirely unrelated reasons.

Side note and kind of related: we do have this in the kernel:

  register unsigned long current_stack_pointer asm(_ASM_SP);
  #define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)

which *might* also solve the redzoning issue.

In the kernel we need it not because of redzoned stack use, but
because we need the stack frame to be set up properly or objtool
complains.

             Linus
