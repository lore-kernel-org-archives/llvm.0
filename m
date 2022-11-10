Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA011A629
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 19:20:34 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so5704026pjs.4
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LYUlAFrEbyfFRH8XQ1Az8G9RGqh1QwMuiz/dtiN8PUg=;
        b=MvSKq5bWzN6iI6UuSuvm3YAvtXT6zn4H/yiJ0PhNblomXhHUUyQldLaOMl2hmiAtht
         4vTn1j1nCgmB/NkMlukrZlBS3ZB/lfBNG3BlcSF60mBiwodPbcZpMjcgGHuVY4mPlFT2
         TyuDzxEYUER8BlVVv3iTIuVsfQT1NI8YxRMHfEY2R5US3B8GkY/Pr799VJ8WMdYFW6Zu
         HJnL15REFVmPMtRTs//d7N8ohJElai+hUgNkU/n1y+J6SEDN08H14BoV1KjPjjp9ckxD
         cQBy5KnSlVKwyIVqM0aS6eDnWSz3aHezbDv7CTDMrGtthSf1y0WSLptxj48xn9Gekhsn
         S+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYUlAFrEbyfFRH8XQ1Az8G9RGqh1QwMuiz/dtiN8PUg=;
        b=jzmoumQzNZ2dUR0kpDWC2y+cAmIJc3gZa31JdRqqu3UI/sbvp/kGM16VtDZDd2TAHa
         AV+5x3inb1J7vSEVrZGpnioFZ0ofSwFro9sF/AxwAi+K9v/Pn9LFkSTvhDsBbv9bZmlh
         yw8JaQqPDHSVM576Y4asRCvL24fP7L+0M3+Rt3HbNw1/42/edxui5qErx1KckTrIFxNm
         bPHXfZ3fOMXNJXbXoX1piumUslfKa4eJjxgczpnz+CSTHKLvzj3MHvSfcsiOEtQuPqgC
         NVFiY7C8z/0wT/gRYATr97Q3/BOtAEO2MjnD4TVfX4bZHI5CaRFfdCBPiIrpjQcIYThj
         q4ew==
X-Gm-Message-State: ACrzQf3lfQkHCTMbk4s8cJLwoEesvTiC7AXxh7jRrYGlPqU86U8cHjbr
	wJnkERXJ8v6o9lQT8OahO2Xq8zDPRCwQ3OeGayfurw==
X-Google-Smtp-Source: AMsMyM5hSSiWzErPvPA3UO7DgFkaf9f2Sepd2Zbsy5SC5dhC3RtgvlDO+Mh+fydAA//KMHRn8zV04d2f8ftKVmlnZsE=
X-Received: by 2002:a17:902:7b98:b0:186:8558:ded2 with SMTP id
 w24-20020a1709027b9800b001868558ded2mr1798574pll.95.1668108033739; Thu, 10
 Nov 2022 11:20:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-2-mailhol.vincent@wanadoo.fr> <Y2jSMz4GtXGJk6rS@hirez.programming.kicks-ass.net>
In-Reply-To: <Y2jSMz4GtXGJk6rS@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Nov 2022 11:20:21 -0800
Message-ID: <CAKwvOdnDi9GmLL8iRDe1-LEnpbFWFPAsPqB5PWpnpGK8+0rYAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] x86/asm/bitops: Replace __fls() by its generic
 builtin implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev, 
	Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 7, 2022 at 1:39 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Nov 06, 2022 at 06:51:05PM +0900, Vincent Mailhol wrote:
> > The builtin implementation is better for two reasons:
> >
> >   1/ it saves two instructions on clang (a push and a stack pointer
> >      decrement) because of a useless tentative to save rax.
>
> I'm thinking this is the same old clang-sucks-at-"rm" constraints and
> *really* should not be a reason to change things. Clang should get fixed
> already.

Well messing up constant folding for all compilers absolutely should
be a reason!

I did get a chance to speak with some colleagues more about this at
the LLVM developer meeting during the past 2 days.  We have some ideas
on approaches that might work.  There's some higher priority features
we're working on first, but I suspect we'll be able to visit that
issue soon.  It's a pretty tricky dance between instruction selection
and register allocation.

>
> >   2/ when used on constant expressions, the compiler is only able to
> >      fold the builtin version (c.f. [2]).
> >
> > For those two reasons, replace the assembly implementation by its
> > builtin counterpart.
> >
> > [1] https://elixir.bootlin.com/linux/v6.0/source/include/asm-generic/bitops/builtin-__fls.h
> >
> > [2] commit 146034fed6ee ("x86/asm/bitops: Use __builtin_ffs() to evaluate constant expressions")
>
> I would much prefer consistently with 146034fed6ee.

The bottom of this file arch/x86/include/asm/bitops.h is full of
#include <asm-generic/bitops/*.h>

-- 
Thanks,
~Nick Desaulniers
