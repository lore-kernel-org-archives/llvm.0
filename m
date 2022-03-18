Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09466444
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 23:11:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id g24so11867539lja.7
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w17JTccyG7Hu5QzrK8YkGK5ZNCS3sFkaT90voeSdkM8=;
        b=cLQTEpkdWC2iejrFcbaeZaTYVZtnf6ppDlPoWHG3WLuvfgvVuinp5NMg79PXPpdFvH
         gZtv89SFNJBweBpXijc5Z7vKFrmBIaNpI7tR2i6bK9UlWPOJDDmdW0uGNlVgllDgowTV
         p3FHr8IyH/D68PKslFErhgQipgSB//BagoF2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w17JTccyG7Hu5QzrK8YkGK5ZNCS3sFkaT90voeSdkM8=;
        b=mmz/wJWu72Uedpzi34KY33JOHZu8hOJWfFIFP5cJK4CWxuzJM8TjHEss1ym2JCjWUd
         KjqKeeLmvGRSe15SPPlx6F6wLQ704oZklt59g6B8MVrsZU+0yabFsnsCsnGSBNCFPaL1
         jYRFf+vBJD7slJcOrX2re2JkhF5ORQSshk5yh5JmDWO5XtbqgOHam94oYiy46+PoIkqy
         tlmR9M2TSuryq0k301BME+0l1Fm/y+Yt4/Y5Ro5wYEPer+nAj1HxFXHTOW+UfGz53J15
         g9Zs0cGIf6VsuYa4TrNdhJ+L2tz/ODX0CKW9ejTVtoJe7Bvzs8qtAUhdu8kOa719tnsT
         ZxuQ==
X-Gm-Message-State: AOAM530dybUOsjZr1+PwUW1ofnNg59aLDxcSv5T/5vmB9FKo1iP6M+pw
	kcQ6wBnfaxO2i+Qa5BWIF+Jm+w4Xfj+rXL/qdNY=
X-Google-Smtp-Source: ABdhPJxAqHO6YSOUrKWTENXczYhz8dzyjQ0PstvcstZDPLvFjY1fYFCZuadRMye35n6pJjwNBWEpwA==
X-Received: by 2002:a2e:b8c9:0:b0:249:28df:e98e with SMTP id s9-20020a2eb8c9000000b0024928dfe98emr7662618ljp.304.1647645074560;
        Fri, 18 Mar 2022 16:11:14 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id a10-20020ac2504a000000b00448bcec87e9sm939405lfm.121.2022.03.18.16.11.12
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 16:11:12 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id r21so5874996ljp.8
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 16:11:12 -0700 (PDT)
X-Received: by 2002:a2e:804b:0:b0:247:e81f:87e9 with SMTP id
 p11-20020a2e804b000000b00247e81f87e9mr7817380ljg.176.1647645071884; Fri, 18
 Mar 2022 16:11:11 -0700 (PDT)
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
 <83b33afc-8502-0065-60bc-3a91528632d8@kernel.org> <CAHk-=wj1Z_zzY7ADxaarorK5sh2xkwbcHxJTzW=bsYChWJGBGg@mail.gmail.com>
 <9a97330b-e5ee-7b7e-4c7a-cfdf15032094@citrix.com>
In-Reply-To: <9a97330b-e5ee-7b7e-4c7a-cfdf15032094@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Mar 2022 16:10:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKBme-SdbkSxbQ4+c6tZdvY2fe1wP1TgJeuDAf+AgwMg@mail.gmail.com>
Message-ID: <CAHk-=wgKBme-SdbkSxbQ4+c6tZdvY2fe1wP1TgJeuDAf+AgwMg@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Andy Lutomirski <luto@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 2:48 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> As such, I'm not sure how current_stack_pointer can work as intended in
> all cases...

So as mentioned, the kernel doesn't really care, since for the kernel
that inline asm use is more of a "get proper backtraces" thing. The
compiler thinks the function is a leaf function, doesn't set up a
frame for a call that  happens inside the inline asm.

The code *works* without it, but the frame annotations aren't right.

And obviously we don't actually *(change* the stack pointer. Or
rather, a call will do exactly as with pushf/pop: rsp gets updated
there but gets put right back.

See commit 317c2ce77d8a ("x86/alternatives: Add stack frame dependency
to alternative_call_2()") for some details.

And yes, that trick then caused problems with clang, and we did
f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")
that created the current situation.

It would be lovely to have some explicit model for "I want the frame
to have been set up for backtraces", but here we are. Marking '%rsp
used makes the compiler understand it's not a leaf function.

And while we have other uses for it that then use the actual value,
those don't care about the exact value of the stack pointer register,
they just want "give me a pointer that is contained within the current
stack", because we control the stack allocation and do funky things
there. So "any random stack pointer value in this function" is
perfectly fine and expected.

But for user mode, it would probably be a great idea to also have a "I
cannot use a redzone in this function" thing. The kernel can't use it
because we have nested exceptions, but maybe some day even the kernel
could make use of (controlled) red-zoning.

            Linus
