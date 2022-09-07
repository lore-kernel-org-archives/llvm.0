Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6B7E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 07:04:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id az27so18845830wrb.6
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lB1tmo02fRBU5l99ERq/B48ipxrlpTBOmsY3GpHVDq0=;
        b=jpxnKj/tEOqK+taEe1NmXQq96RAJosDbqCL3MYiTan0yY9wRDEYP/c9UDDpwK3wqFe
         3Dk94gHbTndr8sH9LH1wRMAE7OvmiI8Kv4KKf7Qh7xWteJv72aYDkReV0FfVX2hDLIHt
         X8eIaBcG3xS0FPpWa3Q2u5awuNyRmr5qBo9yQShYvkUf/i+AYrOYrviOTZODAwAHr0+Q
         65uYP7r9+32R+wrFTso8y4jpgB319KqVUnekM3YvXqv27A6BuhNU2Od/lhv9TldDXBN3
         +5dlWoKjGF5CG7uoX+qiTaYcWIpaOiPskwkGvfNHu04UZ8wuB+hAxskBGugwsUPofBtJ
         zmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lB1tmo02fRBU5l99ERq/B48ipxrlpTBOmsY3GpHVDq0=;
        b=J+yncubY2cHbMb+GhikgUVP9DHYPAw2q5XiarS5g+HnM3bwQ4yoXzflrLEGPoLrppG
         al33Gp0+docYV+3HJT3h7kXg1CF69UtFATrQp9QU+C1D3MdHUdVDU2gxnpc2xTOWEP/g
         mPn24FgLj/u5BcOqx+dB+IMec4QPcA6ZCPBTKaagoBTl2u5xV6fz2ueybEgn5iTqjHcy
         lMOT7N6CjmpLIUnfcA9XBzP/gZwfCm5gJxtGqXoKrRbecMa4/XPuH+D2wxDoOGnf2olG
         nbQ55t9Dc97ZkN7oAueye5UBMLo698ohMyJDJmunBikh4mkZC+eg92wEU12kPnpQ07XF
         QK1w==
X-Gm-Message-State: ACgBeo3Qk6V+REmHwSqPRjtayikh4UXNgKyEVaKe2YKRrsxAivcYGZNY
	Ep1X5+lbWIm55TVE5YkrBsZ/+yKLcopeGHCH4nGRtg==
X-Google-Smtp-Source: AA6agR5pYRLCrtJ2SL9u5D4Xxh0DlWfT/umzHlIpkRTMxpdM3cDXNixeG9s5u5aZnnS7L3YgztNTexOd2o1mLhJMZrI=
X-Received: by 2002:a5d:47ac:0:b0:226:df12:412f with SMTP id
 12-20020a5d47ac000000b00226df12412fmr1129390wrb.675.1662534294077; Wed, 07
 Sep 2022 00:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220905003732.752-1-mailhol.vincent@wanadoo.fr> <CAKwvOdnr_F9-voPj4cp2HG8=U32a8Hp1aLpynSQiKOrwe4txpQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnr_F9-voPj4cp2HG8=U32a8Hp1aLpynSQiKOrwe4txpQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 7 Sep 2022 00:04:42 -0700
Message-ID: <CAKwvOd=PgVtCwjS=Z_iqqmWsQ=+HsnEnHX2LOjRPCYFoVhAZhA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 11:26 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Sep 4, 2022 at 5:38 PM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
> >
> > The compilers provide some builtin expression equivalent to the ffs(),
> > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > assembly which produces better code than the builtin
> > functions. However, such assembly code can not be folded when used
> > with constant expressions.
>
> Another tact which may help additional sources other than just the
> Linux kernel; it seems that compilers should be able to fold this.
>
> Vincent, if you're interested in making such an optimization in LLVM,
> we'd welcome the contribution, and I'd be happy to show you where to
> make such changes within LLVM; please let me know off thread.

Oh right, it already does.
https://github.com/llvm/llvm-project/blob/ea953b9d9a65c202985a79f1f95da115829baef6/llvm/lib/Transforms/Utils/SimplifyLibCalls.cpp#L2635
I see what's happening. Constant propagation sinks constants into a
specialized version of ffs when there's only 1 callsite in a given
translation unit (or multiple call sites with the same constant).
Then dead argument elimination removes the argument, so libcall
optimization thinks this isn't the ffs(int) you're looking for, and
skips it.  Nice.
https://github.com/llvm/llvm-project/issues/57599
I guess ffs() is usually forward declared in strings.h, so we don't
have such a static inline definition available to constant
prop/specialize in normal C code.
-- 
Thanks,
~Nick Desaulniers
