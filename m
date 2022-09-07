Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9A7E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 07:50:07 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 130so14774612ybz.9
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 00:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CBvemt91QSwjWpSOvmqvp3ctyqgTCTMhNhU8MmRcjWA=;
        b=aOVHUG5pWi04WuPxnC1ETfTd5A2UpiId7o5cXO5TsUuEoGgsLbvL5hPSBqp8ELOxtD
         ebzJZL6cpDlUJC+qAiElomx0gpt+EsE8lNtSUNCwhgYl/KGnmj1sSsJxGTq7vU3A2LuK
         heXH8M+WvpUaWE2CoY7MiokcqAsFoodyERr1XREtCdXVwd4weKFnC3bbmjPhjmDusfu8
         xLF3/NQhTFjQTBonUADfpjvJYADwrT+5sQWkpkDFPc5Ql3aoSOp0ZePheInaCdtmLn6n
         fzgGK0HeG4ivHoQYztw8qAEnrnwoLUKwG2yEOktwHnFQveouKlqGLE4yPsNqHECeYzOX
         vwBQ==
X-Gm-Message-State: ACgBeo3XPNZtNROwU8NvWjmq//ItecK1e5uPuaGmu3f0jw6+exWdcpoe
	AkL/grivDftkOxGJnckcR+BvrohKklbSVc/Z/Lk=
X-Google-Smtp-Source: AA6agR4aARSM5i/xWu7bbxL/mjmN7rxXVksnsFxFXvu8DW8Olq1Vwb1jbBuDUDtUM9KzGJmKuCwfwEomKrICNikDIVg=
X-Received: by 2002:a25:3b17:0:b0:6a9:1d5f:4573 with SMTP id
 i23-20020a253b17000000b006a91d5f4573mr1834315yba.423.1662537006417; Wed, 07
 Sep 2022 00:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220905003732.752-1-mailhol.vincent@wanadoo.fr> <CAKwvOdnr_F9-voPj4cp2HG8=U32a8Hp1aLpynSQiKOrwe4txpQ@mail.gmail.com>
 <CAKwvOd=PgVtCwjS=Z_iqqmWsQ=+HsnEnHX2LOjRPCYFoVhAZhA@mail.gmail.com>
In-Reply-To: <CAKwvOd=PgVtCwjS=Z_iqqmWsQ=+HsnEnHX2LOjRPCYFoVhAZhA@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 7 Sep 2022 16:49:55 +0900
Message-ID: <CAMZ6RqLH3MdcRdxDFFmy_gbepJ-tU-mqFxBg+jS8=niR4xu71A@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed. 7 Sep. 2022 at 16:04, Nick Desaulniers <ndesaulniers@google.com> wr=
ote:
> On Tue, Sep 6, 2022 at 11:26 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sun, Sep 4, 2022 at 5:38 PM Vincent Mailhol
> > <mailhol.vincent@wanadoo.fr> wrote:
> > >
> > > The compilers provide some builtin expression equivalent to the ffs()=
,
> > > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > > assembly which produces better code than the builtin
> > > functions. However, such assembly code can not be folded when used
> > > with constant expressions.
> >
> > Another tact which may help additional sources other than just the
> > Linux kernel; it seems that compilers should be able to fold this.

Initially, I thought that you were suggesting folding the asm code
(which doesn=E2=80=99t seem trivial at all).

> > Vincent, if you're interested in making such an optimization in LLVM,
> > we'd welcome the contribution, and I'd be happy to show you where to
> > make such changes within LLVM; please let me know off thread.
>
> Oh right, it already does.
> https://github.com/llvm/llvm-project/blob/ea953b9d9a65c202985a79f1f95da11=
5829baef6/llvm/lib/Transforms/Utils/SimplifyLibCalls.cpp#L2635
> I see what's happening. Constant propagation sinks constants into a
> specialized version of ffs when there's only 1 callsite in a given
> translation unit (or multiple call sites with the same constant).
> Then dead argument elimination removes the argument, so libcall
> optimization thinks this isn't the ffs(int) you're looking for, and
> skips it.

Isn=E2=80=99t it a wise decision to skip it? How should the optimization be
able to decide that the redefined ffs() is equivalent to
__builtin_ffs()?

More generally, if I write my own foo() which shadows a
__builtin_foo() function, the two functions might do something totally
different and I=E2=80=AFwould be pissed off if the compiler decided to
constant-fold my foo().

Dummy example:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
char *s;

/* ffs: fast forward string
 * @i: how many bytes to move forward
 *
 * Move forward the global s pointer by @i or strlen(s) (whoever is smaller=
).
 *
 * Return: how many bytes we move forward.
 */
int ffs(int i)
{
        int len =3D strlen(s);
        int forward =3D i < len ? i : len;

        s +=3D forward;
        return forward;
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

How would you instruct the compiler to constant-fold the kernel=E2=80=99s
ffs() but not fold above dummy ffs()?

> Nice.
> https://github.com/llvm/llvm-project/issues/57599
> I guess ffs() is usually forward declared in strings.h, so we don't
> have such a static inline definition available to constant
> prop/specialize in normal C code.
