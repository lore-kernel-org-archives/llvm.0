Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC72C8B
	for <llvm@lists.linux.dev>; Tue,  9 Nov 2021 22:15:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x27so1031934lfu.5
        for <llvm@lists.linux.dev>; Tue, 09 Nov 2021 14:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7QrN9bRgfv2t7Ph3CeDiEMr3mZQD8UAofqUlj1HpOcs=;
        b=GkgAIfu9ezIFiK4KZ+5DoTWP+7OhaAnP7ElKiVO2Z/tnmdBdyoXRmmmYTdh4yiHDqR
         FJ6aGaA2iwDDH6sL+8px318aC422k79jGfTn3n4PYhFiAP+oAr/1Kxy8MeW/VcDFh4NW
         /Q//TxdB9X7Ph0xtkVBJF2vLL8i7AdpiwCkE9pt3eVjNCKEIFCk7dcDYTMLwj7OeUe8w
         cIaA6IKl8OxrlAXoWD7ZQ/Zr9kgtAV6VVqEdm1dle4gya5wpvRv/To2QVunetDSQVxac
         ezVtKn1IeW0CGzq16WeLa7xaw3mlFJlNjBhQKO27nFafielOOp/PvY5LK7DXLQo99T6S
         IxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QrN9bRgfv2t7Ph3CeDiEMr3mZQD8UAofqUlj1HpOcs=;
        b=EMf+Bz3PB01s5FklrOVJwOP1Kq9e2NxFzsFzISrTnVCuTsd7dWX3cHc5p8F6OiBj4a
         zFueK0k1MJDyvG3v9lYRvzCzctOua8j2670lvQsNbr4fPfeXoJ1zuLGuP9cCK2uZk8c1
         sxgMKsGPRZ4GeHg9SMkygfZzPqbCTR7wh9/uCk2AWFStCe/2b//eU9nbW5hYVoB2gjpV
         7L5b3FVUrTmJlA4Tl8vkc0t0neNz+QldbZ14NIbXKozBrwzv6+bTMOIwYyf9ifr9xqb+
         jYTt9JNwJc26OF0ZRZ5n7r27v7QRsURDBtgAIIOQ6CnHSsl+0EhYzAI3VJVDsgcSQ3IM
         OsXA==
X-Gm-Message-State: AOAM530Bgc6CWbJ5zH0T3yXlvTcH3ziipLb+Sn9yH2vu3eIds5MZFT+8
	n1lDW+ZKJJQPUb3cHRg5ZgY0VFylMRfUEfcao92FZQ==
X-Google-Smtp-Source: ABdhPJyh9ZFIMBC81wDRKs3l76rwu0iRTc8risc0IesJYz4dhXsjV5yYquNPiHQZ+xkcm63yiBOZm34LDtXc6OPtlGI=
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr613329lfv.523.1636496150443;
 Tue, 09 Nov 2021 14:15:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105171023.989862879@infradead.org> <20211105171821.654356149@infradead.org>
 <20211108164711.mr2cqdcvedin2lvx@treble> <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net>
 <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com>
 <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net> <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <CAGG=3QVecQroYbJ05AGk2f0pe=QOtWuZHyQowzG0i7os8E9fdg@mail.gmail.com>
 <20211109212116.GW174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=3wFr=juT7hXPowHBvOTVPTW7LuB6XwHzURGd=GXkK1Q@mail.gmail.com> <20211109221130.GA174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211109221130.GA174703@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 9 Nov 2021 14:15:38 -0800
Message-ID: <CAKwvOdns1WPE21F3zVO++ceTjwZ071rDKQ1hd4w==1DEWjdCrg@mail.gmail.com>
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
To: Peter Zijlstra <peterz@infradead.org>, Bill Wendling <morbo@google.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, dvyukov@google.com, seanjc@google.com, 
	pbonzini@redhat.com, mbenes@suse.cz, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 2:11 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 09, 2021 at 01:25:47PM -0800, Nick Desaulniers wrote:
> > On Tue, Nov 9, 2021 at 1:21 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Tue, Nov 09, 2021 at 12:59:12PM -0800, Bill Wendling wrote:
> > > >
> > > > Adding attributes to labels shouldn't be difficult, as you mention. In
> > > > the case of cold/hot, it's adjusting some of the metadata that already
> > > > exists on some basic blocks. It might be enough to allow the normal
> > > > block placement algorithms to move the hot and cold blocks around for
> > > > us. The question becomes how many attributes does GCC allow on labels?
> > >
> > > I'm aware of 3: unused, hot, cold. Also:
> > >
> > >   https://gcc.gnu.org/onlinedocs/gcc/Label-Attributes.html
> >
> > Re: unused:
> > Being able to selectively disable -Wunused-label via
> > __attribute__((unused)); seems useful, too.
>
> kernel/sched/fair.c:done: __maybe_unused;
>
> Yes it is ;-)

Ah, that's already supported: https://godbolt.org/z/aa76aexnv, so it's
just hot/cold that could be implemented next.
-- 
Thanks,
~Nick Desaulniers
