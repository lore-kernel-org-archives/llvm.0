Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB022797B8
	for <llvm@lists.linux.dev>; Sat, 20 Sep 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758363844; cv=none; b=DOQJ9nKw7R65366Mh4NJcMi7IzCmmlYkKolHaSlhCXPTAneSPkbacQaTD6NGNT9725kxU6MWMdfrg7xy0aoAIKzo5Vk+i9wZD99aPFbNu0psmylzTirGeAoSx/goanTRsYB3A/WZDseIgVWPX3E9j6J04AalVhRL/0hN6DCMOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758363844; c=relaxed/simple;
	bh=8iXqxhSdAkakZE+dXKkGUnoGkkyheEh1y2QTTcyyR7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBsjLozmqBp/DDxGQH03yKi/OMtAKkuPgSuv8rgNLNkDMpOy4KMD6mn7q7JqCbt0VaaPxOkI4Or+GXlHOLqJicvgUZYEDS0k3tmBrerPSVvxu+CRSvDPpre9skFbUq8IlPvY2rc4vZOU3vO9vnk5U+nFg1Q4uUlK0mI2kR97S88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ojxw00XH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ojxw00XH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77e543e41e9so1327291b3a.1
        for <llvm@lists.linux.dev>; Sat, 20 Sep 2025 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758363841; x=1758968641; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hZhQHzO6iaBCv+wcIWwJCdyKEWcJ4Nfwc3KoJ0ZPEA=;
        b=Ojxw00XH1yM0duZQwbyMs/DaxTByEgH5R+BUihLwStpSLI9RQsQ1PmomZxOjcitRUL
         rndtPjNglg1/9M0JIf2yyeqTBmVpTF7oVbYYM+WTMY6ieNWtFp4pTZlWl6DO344WQi4+
         l6NdDZG4k6gvxJdZlET/rVpy87u/kPCFtIeVHL8t+3eTtRboFHmCvtlkkbA4V4HgaeK/
         K1XfjTtOjpCAaRNx1Qi9p4bBbZbM0n1+Kn674pfR2HIYcCC2EzMDOr2pAu3PtuPxam4e
         HmFagtaBibbGQE/iPtUNS2oGI86qbMiX8C6BrdO0Sz7geFr9o3biTzHRPjDOcZDZvByp
         C2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758363841; x=1758968641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hZhQHzO6iaBCv+wcIWwJCdyKEWcJ4Nfwc3KoJ0ZPEA=;
        b=i6oB1cC69dCwC7HKrGhwJCfxl1rP+L2ysE+AJzkNY/6dH2Lme5K0DME7VSB6inWDUK
         UwDhLcrL1rbfzky5KimfXKHVTtyEiiRD0v4leIA04o3OuCPTRzFDk6R6jHVYPS7hxUbB
         oO1Zplv2zg/fijTz2qbJ5o+2j+5ShvsxA9hQwPaAQAmWqmH0ewldL6pG1/yY62anDL9i
         ad254pLGiJLLx6bjyil/WvC3dj10nHAaIwaoPu1SMdnqH7kFcxVsYUz8OTJULYOSeRa1
         8QRHG6pdQAvSVHb8iVL0Tt+UhSWn9UjYk8KowSmsD2assgqxJn6e11ggX7tt71wrWsfQ
         7c+w==
X-Forwarded-Encrypted: i=1; AJvYcCX/sB6gT0SmyZ1ob0iw464kVgBeNM9uSmXSLL8DM4PhQxz5vLwJtFBdodzZuKxwqPLa745a@lists.linux.dev
X-Gm-Message-State: AOJu0YwML2cbOowpO26ng/KUnxR74RDWAowjJ3hBKRTBCX2ySEwVQuGo
	85FdLEclKLpiCkzrPwHkczvxrQwWl18x/88/N1xhJurgpzx5oSCjagT3tJ/rzlY85yPKuLAJLyV
	LTUtCDEFW+9W1+ru0QL+ljbYdgqJ1Y8Fw7wuWyHlX
X-Gm-Gg: ASbGncv47pt5xN2pwP10FyP/vfileUiOMAsX94KUOWc2eI2Aaj2jFo/seq+sWqJo4GK
	b66FujuGx37wMv81mmVg8UfzvHWxxzy8G1Fp1LuuL4Ip47mg6TozhKYV4E5OWKekL7JBKd9J9Uz
	Cu5MTRXaIrZTWYwOWoHoPlqc3cAfyWwdoDaMQyeyxL7iu0ihqwdNPJodg5PTTbKU2L3jvnNNKsh
	o3sD+VcvR5YwN+GpuNv2a9ve5zla/Sz4BzZow==
X-Google-Smtp-Source: AGHT+IF1hPc3B6dX8ioPYAwTkyAHDxIYYc2DoRTSnEgCHR4nACV75/Lf01kjKhlKCzTUMHiS0p59fc36fJvtYjO83jE=
X-Received: by 2002:a05:6a20:914d:b0:27b:dcba:a8f3 with SMTP id
 adf61e73a8af0-2925f76be25mr8434118637.15.1758363841077; Sat, 20 Sep 2025
 03:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de>
 <20250918174555.GA3366400@ax162> <20250919140803.GA23745@lst.de>
In-Reply-To: <20250919140803.GA23745@lst.de>
From: Marco Elver <elver@google.com>
Date: Sat, 20 Sep 2025 12:23:24 +0200
X-Gm-Features: AS18NWAyC50-QQYD_wTUETPBlkphWLV8M7F-miEs8DZ-lOTnj5WEfB5uYr0Ax6s
Message-ID: <CANpmjNO2b_3Q56kFLN3fAwxj0=pQo0K4CjwMJ9_gHj4c3bVVsg@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 16:08, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Sep 18, 2025 at 10:45:55AM -0700, Nathan Chancellor wrote:
> > On Thu, Sep 18, 2025 at 04:15:11PM +0200, Christoph Hellwig wrote:
> > > On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > > > A Clang version that supports `-Wthread-safety-pointer` and the new
> > > > alias-analysis of capability pointers is required (from this version
> > > > onwards):
> > > >
> > > >   https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
> > >
> > > There's no chance to make say x86 pre-built binaries for that available?
> >
> > I can use my existing kernel.org LLVM [1] build infrastructure to
> > generate prebuilt x86 binaries. Just give me a bit to build and upload
> > them. You may not be the only developer or maintainer who may want to
> > play with this.
>
> That did work, thanks.
>
> I started to play around with that.  For the nvme code adding the
> annotations was very simply, and I also started adding trivial
> __guarded_by which instantly found issues.
>
> For XFS it was a lot more work and I still see tons of compiler
> warnings, which I'm not entirely sure how to address.  Right now I
> see three major classes:
>
> 1) locks held over loop iterations like:
>
> fs/xfs/xfs_extent_busy.c:573:26: warning: expecting spinlock 'xfs_group_hold(busyp->group)..xg_busy_extents->eb_lock' to be held at start of each loop [-Wthread-safety-analysis]
>   573 |                 struct xfs_group        *xg = xfs_group_hold(busyp->group);
>       |                                               ^
> fs/xfs/xfs_extent_busy.c:577:3: note: spinlock acquired here
>   577 |                 spin_lock(&eb->eb_lock);
>       |                 ^
>
> This is perfectly find code and needs some annotations, but I can't find
> any good example.

This is an interesting one, and might be a bug in the alias analysis I
recently implemented in Clang. I'll try to figure out a fix.
