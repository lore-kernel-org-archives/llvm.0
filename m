Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB555652
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 07:02:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o7so3723495pjj.1
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 23:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOUPI2HSi+pvD6Q+zBNwercPei7ZAzC0wrzHEy7HnN8=;
        b=EDT1lqYZM+7Alg4LuZdDBeMDJuE5ND0y4fnYVJyXonjVuqSNlK+cbY/n5QF+bTmfxM
         0zBP6GJpt/qUXFZucNS1O2IbL4kvtSBS3HaeMjoLihAeavBJG02as1TC4CKPFdyPZTje
         hEJe0QJ7Rh/25xfbxlCOoWafCXtw+L/5voZldDL+tvgQA9RhzerhmX1ofKAHxTlm3CNs
         ijQHyXwf8LtoaVh0b3lAfu44iXImaxEFcbnAqLBWLveWlfTHOv76ewEYHzuIuFx/dXGT
         almUmRHDbPHYQA45vn8QYXotGakH8sctQ/grqsdu3LtGJNL+utKD+8HuU3G32TggwXeB
         vbmg==
X-Gm-Message-State: ANoB5pm2Vyj7YNHj4TPMQV74fm2ugvA/iFPdl4ng/bEv3da4k5t3YNKL
	FIGc8Vr/TrUdorJE/pfpnDbmr22JNds+m5PICF4=
X-Google-Smtp-Source: AA0mqf44hY4oy4yK+oBHgzJpJaRLRF7tiuLNug/OgdxFe5ZpSsyu8v23Ye5hX4Sd3WmRiwNRal6WtKvNr0JAVNuhQzM=
X-Received: by 2002:a17:902:b609:b0:186:ac81:2aa9 with SMTP id
 b9-20020a170902b60900b00186ac812aa9mr1335007pls.95.1668150151316; Thu, 10 Nov
 2022 23:02:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-3-mailhol.vincent@wanadoo.fr> <CAKwvOdmN2==9tG0fxRO8K-eAJudeemaKUuhJEAuGHc=P8GpGwA@mail.gmail.com>
 <CAMZ6RqKRP3cp=FhpA6DkKNKjgRV2ak18k=Ad-mnBPkT++gARCA@mail.gmail.com> <Y23DIRG60iaei7Ft@yury-laptop>
In-Reply-To: <Y23DIRG60iaei7Ft@yury-laptop>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 11 Nov 2022 16:02:20 +0900
Message-ID: <CAMZ6Rq+qm=hVdWw=MSgBJ2qLbkCxG10v5yUH7hpGDOvq2QBOuA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate
 constant expressions
To: Yury Norov <yury.norov@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri. 11 nov. 2022 =C3=A0 12:36, Yury Norov <yury.norov@gmail.com> a =C3=
=A9crit :
> On Fri, Nov 11, 2022 at 10:57:17AM +0900, Vincent MAILHOL wrote:
> > On Fri. 11 Nov. 2022 at 04:01, Nick Desaulniers <ndesaulniers@google.co=
m> wrote:
> > > On Sun, Nov 6, 2022 at 1:51 AM Vincent Mailhol
> > > <mailhol.vincent@wanadoo.fr> wrote:
> > > >
> > > >  #ifdef CONFIG_X86_64
> > > > -static __always_inline int fls64(__u64 x)
> > > > +static __always_inline int constant_fls64(u64 x)
> > > > +{
> > > > +       BUILD_BUG_ON(sizeof(unsigned long long) !=3D sizeof(x));
> > >
> > > Thanks for the patches! They LGTM; but why do we need this BUILD_BUG_=
ON here?
> >
> > There is no absolute need for sure.
> >
> > Call this a paranoiac check and you will be correct. My reasoning for s=
till
> > using it is that:
> >
> >   1/ It is a compile time check, so no runtime penalty.
> >   2/ Strictly speaking, the C standard doesn't guarantee 'u64' and
> >      'unsigned long long int' to be the same (and you can argue that in=
 clang
> >      and gcc long long is always 64 bits on all platforms and one more =
time
> >      you will be correct).
> >   3/ It serves as a documentation to say: "hey I am using the clz long =
long
> >      version on a u64 and I know what I am doing."
> >
> > If you want me to remove it, OK for me. Let me know.
>
> In fact, compiler's typecheck would be more strict than your BUG().
> For example, your check allows pointers, but compiler will complain.

Here, x is a scalar, so in that specific case, it is equivalent. But
the compiler type check is more explicit and more natural because it
would work if ported to other contexts as you pointed. So it is a good
idea.

The check would become:
        static_assert(__builtin_types_compatible_p(typeof(x),
                                                   unsigned long long int))=
;

Alternatively, we could use the assert_arg_type() macro from
https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/irq_sta=
ck.h#L126
which does exactly the same thing.

But in such a case, it would be better to first move assert_arg_type()
to a more appropriate header (maybe linux/build_bug.h ?)


Yours sincerely,
Vincent Mailhol
