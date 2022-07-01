Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A51C36
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 18:57:39 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id k15so5294344lfv.11
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 11:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0KdEbiynSy3UiWxTupG4zXX+ERXEfCNO0HgPeCNmcQ=;
        b=ajUY5R62oawU/SkqqkYkb2oyPNb5Rqyoaw0WEy6B57lexEox+Ca/1k23nyG8nSwGsj
         o/oC0s5/9d7PI71ONrUVHURSljx/ubpX+mo6vbvK8JxoqJy79UbjONaKKP5sk/iem3i8
         Yj4si367nalMxeUlEReftDFyEF+MiF5YqWJPxOOzkjQxK002qWxD2LTlzsG1cMzbncBL
         V/15bdZatMk/VHihrJnTceXsAP4zfxh+lNHzRQ4Fro1rUUKqUi7pCljyoH/+1GjRdpf3
         9LmjitaGowZuX5MrGdnpGupeubdavj9s47dxtUZnEhopxuy8oPi9xko+FYjyS4VZc/XS
         vR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0KdEbiynSy3UiWxTupG4zXX+ERXEfCNO0HgPeCNmcQ=;
        b=Q6Ik6pD1i6znkV5F46SCcxDy/1WJgGo5likj0h3XXl5ZEd/crSxnhvKNdtfkP0FShn
         D2IIBrOEsGq3kh7THYRbWHOR8eFk0auFqQjli5uwZp4DIBsneRuFHEjFy/sjpEAcRcfd
         9V5wvV8uPp9oqr7IbIVObwVP5bavXGkBLVZX8vbtqFG0pwcFe/1VHT9xMXpODzJp17Dr
         0RyUuJWWChL8cDQo1MPm0vM7Y3WvxIqgVBYu5E0hzvn4aoRn+5sEAprh8axC5WcAUBig
         Vb+u50jdhCx3GBK04MpKwUfSjQy7PMxGIOkIJBWOPZPZQGfuemn0pPHcmRInn/I2W424
         e+aA==
X-Gm-Message-State: AJIora8aVSTcFHup/keShULz2W7SpmYgqJ5Aa/5qCmyl6V62ODdX5grn
	huZi/wWSIYhpd/rlbe9cWv2cEiZ5d7WndjQPR3Mg
X-Google-Smtp-Source: AGRyM1t8yk+8taY+B/TVH2Z5UU4gYFK1wvUBxVy0PKD0NKAKcpREKJV7lHzMmmRUhrIhVy3FRiiW7Emjl4dZhJcbhTE=
X-Received: by 2002:a05:6512:3088:b0:47f:77df:45be with SMTP id
 z8-20020a056512308800b0047f77df45bemr10721828lfd.134.1656701857195; Fri, 01
 Jul 2022 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org> <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
 <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
 <B0A01DE7-1B50-479A-92DF-DAFAB3F06E0F@oracle.com> <878rpgpvfj.fsf@gnu.org>
 <Yr638aOIaaEBPICy@worktop.programming.kicks-ass.net> <CAGG=3QWbW-Dang49Jx3fyNExWtL8syuMkMJmcPHA7J25cHQ0zw@mail.gmail.com>
 <Yr7fMre18pUMz9rA@worktop.programming.kicks-ass.net>
In-Reply-To: <Yr7fMre18pUMz9rA@worktop.programming.kicks-ass.net>
From: Bill Wendling <morbo@google.com>
Date: Fri, 1 Jul 2022 11:57:25 -0700
Message-ID: <CAGG=3QUA8BnhN9QaJao6nH6EyNks0yWO+cWWyvE0pJbOUm+cMw@mail.gmail.com>
Subject: Re: plumbers session on profiling?
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, Ruud van der Pas <ruud.vanderpas@oracle.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Vladimir Mezentsev <vladimir.mezentsev@oracle.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, 
	Hongtao Yu <hoy@fb.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>, elena.zannoni@oracle.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 1, 2022 at 4:49 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Fri, Jul 01, 2022 at 03:17:54AM -0700, Bill Wendling wrote:
> > On Fri, Jul 1, 2022 at 2:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Tue, Jun 28, 2022 at 07:08:48PM +0200, Jose E. Marchesi wrote:
> > > >
> > > > [Added linux-toolchains@vger in CC]
> > > >
> > > > It would be interesting to have some discussion in the Toolchains track
> > > > on building the kernel with PGO/FDO.  I have seen a raise on interest on
> > > > the topic in several companies, but it would make very little sense if
> > > > no kernel hacker is interested in participating... anybody?
> > >
> > > I know there's been a lot of work in this area, but none of it seems to
> > > have trickled down to be easy enough for me to use it.
> >
> > We use an instrumented kernel to collect the data we need. It gives us
> > the best payoff, because the profiling data is more fine-grained and
> > accurate. (PGO does much more than make inlining decisions.)
> >
> > If I recall correctly, you previously suggested using sampling data.
> > (Correct?) Is there a document or article that outlines that process?
>
> IIRC Google has LBR sample driven PGO somewhere as well. ISTR that being
> the whole motivation for that gruesome Zen3 BRS hack.
>
> Google got me this: https://research.google.com/pubs/archive/45290.pdf
>
Right. However, there's a chicken-and-egg issue with AutoFDO for the
production kernel. We can't release a kernel that hasn't been compiled
with PGO/FDO. We could only release it in a test environment, in which
case we could use AutoFDO. However, the document says that AutoFDO
only reaches ~90% of FDO. They list some reasons for this, but
nonetheless I suspect that the delta would be too severe for us to
release the kernel.

As for LBR, that will work with Intel/AMD, but I thought that LBR
doesn't exist for Arm processors (my knowledge could be out of date on
this).

What would make PGO (sample-based or instrumented) easy enough for you
to use? What're the key elements missing?

-bw
