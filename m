Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF62C80
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 23:19:03 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id s21so1966578ejx.12
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 15:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUmxDI5gH962mcf35zRHyi1vHGoo0+FBECSduCqHJtU=;
        b=mxfWHtMl7cXEGtgGJKRHvUKUFcTVd8kAqKacHbU8yN2dIBYcwIkI+PhC6SZuYlzKN+
         NIt4QxpAkYGAfYDHAjZ/8uf6pbNQKQWB0xhkwQN+AqE0k9dUwbhD294ElHbOitKdnm2w
         JxCjkqEeMEG+SJqu8B2sgzNubuatscgFicOCuWqK6u1KcYOOcWwVs0vG+OXWiBKwUADG
         i0XHxUxAizbxZExazKBsp9X3BU7ozTT3BILvLNEpnsIJaS63vbkJlhOodXfnuVedLWoR
         OaxsDtvA/gPuSLeERKAtgOAqCMWzleIt6nhsYp8wlDlTGh7RsdnRnNoU50+CooKaeVbI
         rgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUmxDI5gH962mcf35zRHyi1vHGoo0+FBECSduCqHJtU=;
        b=b7CeeXVR2TSJUrCVlNJ90P+kTwmPd1M9l3LuRZIYHolokyzzz5A8ilB3Niyq3f14+1
         WVoUZDvyMZB8CrigP9FZLAosatYtmhz5SyLaWIVHnXs2Tc5KeBMwADVDscr0yS8kalbA
         FH1vtmoWwZifeh09QGPoIeQR1QppeDF2oqi7yfu8tJZsWA59sHEZLZ0aV/+iemiGVgGN
         jeLMfzBDPHPaeOKJ1RDgtjchWIPJGBHqPMEAuqWTL+6pEqPR3FqkKj+okQgGav9gCJCb
         GTmIFUs9E9gURjsQiLv3YRcG/jcv1+kRcWyMCZ1JjcuI5ZQ/nSqb8P3+noP2148PBWNq
         DmrQ==
X-Gm-Message-State: AOAM532ovRMD58o7fcKl4oHxn22qiL8gPehMZJdloo0OySjJH+cMRzu2
	JB/u91ldWcE6CVZjyvawYLjvs5qov8gnSgkoEXdD
X-Google-Smtp-Source: ABdhPJwubjTwWdJPO0enXlQGSyUnmVIcBvpEjKC/oSOsAWpfjcWAoAfDZbBSva5esvXhaxMkokZFdgqbALVd7W3xVA4=
X-Received: by 2002:a17:907:7b9b:: with SMTP id ne27mr5603709ejc.486.1644362341362;
 Tue, 08 Feb 2022 15:19:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211229021258.176670-1-morbo@google.com> <20220204005742.1222997-1-morbo@google.com>
 <CAKwvOdk=VdDo1fhWJVa4eO0UjuQwtV9kC-cJd0J9-6guU2vafA@mail.gmail.com> <0d93ea4d847b42ca9c5603cb97cbda8a@AcuMS.aculab.com>
In-Reply-To: <0d93ea4d847b42ca9c5603cb97cbda8a@AcuMS.aculab.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 8 Feb 2022 15:18:50 -0800
Message-ID: <CAGG=3QW09mBaLNgu4+3oBw-NfYx+0xn86Cd5APYxGdSNgXzg0Q@mail.gmail.com>
Subject: Re: [PATCH v3] x86: use builtins to read eflags
To: David Laight <David.Laight@aculab.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 1:14 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Nick Desaulniers
> > Sent: 07 February 2022 22:12
> >
> > On Thu, Feb 3, 2022 at 4:57 PM Bill Wendling <morbo@google.com> wrote:
> > >
> > > GCC and Clang both have builtins to read and write the EFLAGS register.
> > > This allows the compiler to determine the best way to generate this
> > > code, which can improve code generation.
> > >
> > > This issue arose due to Clang's issue with the "=rm" constraint.  Clang
> > > chooses to be conservative in these situations, and so uses memory
> > > instead of registers. This is a known issue, which is currently being
> > > addressed.
>
> How much performance would be lost by just using "=r"?
>
> You get two instructions if the actual target is memory.
> This might be a marginal code size increase - but not much,
> It might also slow things down if the execution is limited
> by the instruction decoder.
>
> But on Intel cpu 'pop memory' is 2 uops, exactly the same
> as 'pop register' 'store register' (and I think amd is similar).
> So the actual execution time is exactly the same for both.
>
> Also it looks like clang's builtin is effectively "=r".
> Compiling:
> long fl;
> void native_save_fl(void) {
>        fl = __builtin_ia32_readeflags_u64();
> }
> Not only generates a stack frame, it also generates:
> pushf; pop %rax; mov mem, %rax.
>
It used to be "=r" (see f1f029c7bfbf4e), but was changed back to "=rm"
in ab94fcf528d127. This pinging back and forth is another reason to
use the builtins and be done with it.

-bw
