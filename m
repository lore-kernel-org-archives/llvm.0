Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8FED0
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 00:34:02 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id e5so4020329lfr.9
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFruwUIxpJyCAJe6BUEe5KI8KczW9wuSS9rT9U6kwk8=;
        b=pNkfZ896aqQt7dxFAL3iK96SFQ7NoXtb2Ceidw3enkYzd0BLbOWPp60JGJUW+qHpzP
         vha9n63h1RLvgzCbw3+jQYFWQaCzLQ8wumhFW1a9hER8FUDMo215I+ch3kf3QAL6E5le
         wfg+eWhQzKrURlsaORbokfcPD25ZrXZngEdKY8/wbtkEmsPhlHRQGKCU8+37fX7AlUNN
         gPxty3ifxG7Ps7xfxpJu+jdhDgHNM8RFfh2TCd3LMjiZINYDyDkRhodU0PCMXA9Xdmx3
         k1WO3HjmEjFYIwtTRi+Xapadzjmqc1y4DsUChFQjxHNF/kUwVYPM8/WaKLi3lTASQLbd
         rFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFruwUIxpJyCAJe6BUEe5KI8KczW9wuSS9rT9U6kwk8=;
        b=mzGTCpjMNDq5E4LSPLXQE9RF1EbBR4HroPEFksOUygj0D7/lpAqApZX1Ref9J3wfL+
         EPYdan/kpTnWcjO0kaHeMQFZodb0DNDZBakzEGRR63yr2ZYzSlA2G3lBfwcezrRVqjbG
         UtkwGnnKzR5yWnPQzXs650tgbTbV6zd7qg+v9NsLTFYIBYOjfthxpuSoFALcXF7R3DSw
         6p88VR5DNBAjwHGkEnSzuoxQlD2OudqBePXQ1HiOP04OboAMn/dsCcdyLjHSUWGqr6GO
         ca3u0rwa/IIHUp9jdZZ/m8VkZuJhjdk5hUz+Ime0eYfRA+Zg6+vlRc3DGlgWII5GG6ab
         TcTw==
X-Gm-Message-State: AOAM532rsc2Gys8lSLooJdrigj5FZCoyyjsacdn5F//iciVmGj8QcoXC
	//pj8SVD/FV20uhOsiN1r+MXjLkDuPhEf5oPUU3qGw==
X-Google-Smtp-Source: ABdhPJx7Rb7z1GPvI6D+qTr0nkylaeunlTRJq2MplQYHe5RLznwDlYot8RNG7SMgUqUeiXfZAdP4E+Zw5G60wNR8oyI=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr1229400lfr.444.1644885240322;
 Mon, 14 Feb 2022 16:34:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com> <20220210223134.233757-1-morbo@google.com>
 <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com> <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
 <CAKwvOdmqQ4M1pcz1BW+MTtRdwP3itOLcV83X+1nJQkf9BNJ7Fw@mail.gmail.com> <CAGG=3QWmp_nXH0nkREMwRcqAcBOmGFuDifsE5t=wNjDGkLMcgg@mail.gmail.com>
In-Reply-To: <CAGG=3QWmp_nXH0nkREMwRcqAcBOmGFuDifsE5t=wNjDGkLMcgg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Feb 2022 16:33:48 -0800
Message-ID: <CAKwvOdms4Zcfn1fUTjQ4cHbVa2vSUj+YvCgR24xYGNf1tz4rOQ@mail.gmail.com>
Subject: Re: [PATCH v4] x86: use builtins to read eflags
To: Bill Wendling <morbo@google.com>
Cc: David Laight <David.Laight@aculab.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 12, 2022 at 1:23 AM Bill Wendling <morbo@google.com> wrote:
>
> On Fri, Feb 11, 2022 at 4:24 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > I would like to discuss this further off list with you Bill before you
> > resend this patch again.
>
> That won't be necessary.

Bill,
I'm sorry; I could have worded that better+differently.

In code review, I tend to use phrases like "consider doing X" for
suggestions that are merely suggestions; things I don't care about.

I should have been more explicit that my concern regarding released
versions of clang and CONFIG_UNWINDER_ORC=y was not one of those
cases.

I like the intent of the patch; with the following fixups, I would
gladly sign off on it and encourage the x86 maintainers to consider it
further.
1. handle the case of released versions of clang and
CONFIG_UNWINDER_ORC=y. Something with a grep'able comment for clang-14
so we can clean that up when the minimally supported version of clang
is bumped.
2. update the commit message to refer to previous commits that
modified these flags, as per Thomas in response to v1.
3. Note no change in generated code from GCC, as per Thomas in
response to v2. Perhaps test a few more configs, since I only checked
kmem_cache_free yet native_save_fl and local_irq_save have MANY more
call sites.
4. Add `Link: https://github.com/llvm/llvm-project/issues/46875` to
commit message.

Optionally:
5. Add notes to commit message about the intent of this patch
improving profiles for kmem_cache_free for CONFIG_SLAB=y. Feel free to
use numbers I cited from our internal bug and
https://lore.kernel.org/lkml/CAKwvOdmXxmYgqEOT4vSbN60smSkQRcc3B5duQAhaaYoaDo=Riw@mail.gmail.com/.
6. Add note to commit message about memory operands from Agner Fog's
instruction tables in the above lore link.
7. Add note to commit that compilers can schedule the generated
instructions from the builtins among instructions from surrounding C
statements, which they cannot do for inline asm, as demonstrated by
https://godbolt.org/z/EsP1KTjxa.

Actually 7 is probably more precise than 3. Since there's no change
generally in terms of operands chosen AFAICT, but GCC (and clang)
could now better schedule instructions.

It's still a good patch; please stick with it!  Let me know how I can help.
-- 
Thanks,
~Nick Desaulniers
