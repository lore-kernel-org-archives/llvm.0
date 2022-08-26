Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766A54C94
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 21:32:17 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-32a09b909f6so68053747b3.0
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 14:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=i0/vsp+gUvOYuI/yixtkpRQ65mmMRu/3we2IfkmdpkY=;
        b=EtjtNKf6QM2y1/VV7k3OdJaHuqHnqiieZbnlVotBdPlcsEduLgbzqaEOnLnjXOMsAn
         TOEKZyLpcMTQwuIZBODfvPTzQY21FuT0YhHjjzX3fIue/RJPsc1q16nBdyxLisXtqfzv
         b53BxG+AsJNTXKNaJBJckew80+0RkttkD4wPThHAgzUsknsbjkE88y74HiI6+4aGiilF
         M2X5/e4nmjg71lZfEB4Nzr5v5tLsYJcuZdmUzev4eTFhFx8O4gzb6YoICBqzRU53uz9E
         Yt7Rg6Pe0MIKQh+CUZ6HSPTnW040NmCj5HDaChQ8mMYzljfmoSqs09yOGYqd0Wm+3PlX
         XyIA==
X-Gm-Message-State: ACgBeo3FU7bKRC+Oxe78z/iHrlczwkFeGvGT6Ypo1wus/rMQ7NMrDlr0
	u0k5xRBsxbh8mmuDBu0hhWqjmEES4M0H6RE5dy0=
X-Google-Smtp-Source: AA6agR7z2ZI0yKXDqlXkzQUMM3F1fkkF+7niigHfsen99l3nmmzXb9zSmu1ko+Iq+1f7BGMHCGhE2RqaigRfBhn3R/k=
X-Received: by 2002:a25:becd:0:b0:690:a05c:8103 with SMTP id
 k13-20020a25becd000000b00690a05c8103mr1471661ybm.381.1661549536354; Fri, 26
 Aug 2022 14:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220812114438.1574-1-mailhol.vincent@wanadoo.fr> <20220812114438.1574-3-mailhol.vincent@wanadoo.fr>
 <YwT+5GGCOKoTjfQZ@zn.tnic> <CAKwvOdnc-Js8x4sv0j23crtYP73sRkNexom5ydm=r=8rYgc_5Q@mail.gmail.com>
 <YwUR35I7+5JbLvMM@zn.tnic> <CAMZ6Rq+-Ld41cXt+Qy3a7nkQrDp3RK-BJYW0j=HCyKH-x9S3tw@mail.gmail.com>
 <YwXkuW3rSYY7ZJT+@zn.tnic> <CAMZ6RqLugOnskOpyUS6OjdcdnwoXz-E8Bsw2qNaabDPYJ=139A@mail.gmail.com>
 <YwYmpK40ju5WUlVZ@zn.tnic>
In-Reply-To: <YwYmpK40ju5WUlVZ@zn.tnic>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sat, 27 Aug 2022 06:32:05 +0900
Message-ID: <CAMZ6RqJSdbbpFw7iZBqmADY0cAhjzFkpqs+VWCfFM_P0P-wH6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to
 evaluate constant expressions
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed. 24 Aug. 2022 at 22:24, Borislav Petkov <bp@alien8.de> wrote:
> On Wed, Aug 24, 2022 at 09:10:59PM +0900, Vincent MAILHOL wrote:
> > Not exactly, this is TZCNT for x86_64 but for x86, it will be BSF=E2=80=
=A6
>
> Not x86 - some old models which do not understand TZCNT, I'm being told.

ACK.

> And I'm being also told, "Intel and AMD disagree on what BSF does when
> passed 0". So this is more mess.

ACK.

> > It means that __ffs() is not a x86_64 specific function. Each
>
> No, not that. The comment "Undefined if no bit exists".
>
> On my machine, __ffs(0) - the way it is implemented:
>
>         rep; bsf %1,%0
>
> is well-defined:
>
> "If the input operand is zero, CF is set to 1 and the size (in bits) of
> the input operand is written to the destination register. Otherwise, CF
> is cleared."

It is well defined on *your* machine.

On some other machines, it might be undefined:
"If the content of the source operand is 0, the content of the
destination operand is undefined."
https://www.felixcloutier.com/x86/bsf

> Leading to
>
> __ffs(0): 0x40
>
> i.e., input operand of 64 bits.
>
> So on this particular x86 implementation, TZCNT(0) is well defined.

It is here where I do not follow you. OK that on most of the recent
machines, the compiler will emit a TZCNT and that this instruction is
well defined for zero. But on some older machines, it will emit BSF,
and on a subset of those machines, BSF(0) might be undefined.

> So I'd like for that "undefined" thing to be expanded upon and
> explained. Something along the lines of "the libc/compiler primitives'
> *ffs(0) is undefined. Our inline asm helpers adhere to that behavior
> even if the result they return for input operand of 0 is very well
> defined."
>
> Now, if there are some machines which do not adhere to the current hw
> behavior, then they should be ALTERNATIVEd.
>
> Better?
>
> > > Back to your patch: I think the text should be fixed to say that both
> > > ffs() and __ffs()'s kernel implementation doesn't have undefined resu=
lts
> >
> > NACK. __ffs(0) is an undefined behaviour (c.f. TZCNT instruction for
>
> NACK, SCHMACK. Read my mail again: "I think the text should be fixed".
> The *text* - not __ffs(0) itself. The *text* should be fixed to explain
> what undefined means. See above too.
>
> IOW, to start explaining this humongous mess I've scratched the surface
> of.

Agree that this is only the surface. But, my patch series is about
constant folding, not about the text of *ffs(). Here, I just *move*
the existing text, I did not modify anything.
Can we agree that this is a separate topic? I do not think I am the
good person to fix that mess (and in all honesty, I am not a domain
expert in this domain and I am afraid I would just make you lose your
time if I had to work on this).


Yours sincerely,
Vincent Mailhol
