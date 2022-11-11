Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB2620
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 01:57:29 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso6510806pjg.5
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 17:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxqNahmA7zR1BB5f8m8SleanQkS8j2v98m1g/ifNOXk=;
        b=djDr308IAdw3hZAXznbhfQJvDn8Q8WuBbee76I4WyXxTwy13qLS6HTOtdt00o2xrvy
         isLLco/SBTe2bLvp5ibuFcHxj/+MxhQsk8tp9XNxSSQsVCvO0szX+bfaSe1gtKBDhDpl
         FEsXskuC6NTwfU4YbS7HUyFnl8lEjM8Jy/dF1KcT+1hXolGhzG9urVS3+DIfTXlxQ2gf
         MoymewkjJRw6OIMIa3OC6y5Eeplvqyotf7GuDrkQuvJp5gfbhlgFJ406cHtsCc92ngMi
         R4ZszxxjNjAwn4z6GJW7yEcOY1vUppfGcbZAyJXsx8b1So/GhuNf25gVxSWALV83IrZH
         4XUA==
X-Gm-Message-State: ANoB5pn3+Xag9jKXtDzbLxpWJyPTzgWaUucvJPrLFT29dsAp6XaEe5YX
	AAYQytYCFIY5jUsE1Py+YXKM2s8e8TYa3RilopM=
X-Google-Smtp-Source: AA0mqf45/kd3A5ewb+eF/k00Mbe8V6JrPwSPcq8n3eHyKTYEs7Tk2nWNSVpsWyvRtf2Tb3gYLxAF2fSx22xuhICrxmA=
X-Received: by 2002:a17:902:f34c:b0:17f:6fee:3334 with SMTP id
 q12-20020a170902f34c00b0017f6fee3334mr445676ple.10.1668131849126; Thu, 10 Nov
 2022 17:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-3-mailhol.vincent@wanadoo.fr> <CAKwvOdmN2==9tG0fxRO8K-eAJudeemaKUuhJEAuGHc=P8GpGwA@mail.gmail.com>
In-Reply-To: <CAKwvOdmN2==9tG0fxRO8K-eAJudeemaKUuhJEAuGHc=P8GpGwA@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 11 Nov 2022 10:57:17 +0900
Message-ID: <CAMZ6RqKRP3cp=FhpA6DkKNKjgRV2ak18k=Ad-mnBPkT++gARCA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev, Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Fri. 11 Nov. 2022 at 04:01, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Sun, Nov 6, 2022 at 1:51 AM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
> >
> >  #ifdef CONFIG_X86_64
> > -static __always_inline int fls64(__u64 x)
> > +static __always_inline int constant_fls64(u64 x)
> > +{
> > +       BUILD_BUG_ON(sizeof(unsigned long long) != sizeof(x));
>
> Thanks for the patches! They LGTM; but why do we need this BUILD_BUG_ON here?

There is no absolute need for sure.

Call this a paranoiac check and you will be correct. My reasoning for still
using it is that:

  1/ It is a compile time check, so no runtime penalty.
  2/ Strictly speaking, the C standard doesn't guarantee 'u64' and
     'unsigned long long int' to be the same (and you can argue that in clang
     and gcc long long is always 64 bits on all platforms and one more time
     you will be correct).
  3/ It serves as a documentation to say: "hey I am using the clz long long
     version on a u64 and I know what I am doing."

If you want me to remove it, OK for me. Let me know.

> > +
> > +       if (!x)
> > +               return 0;
> > +
> > +       return BITS_PER_TYPE(x) - __builtin_clzll(x);
> > +}
